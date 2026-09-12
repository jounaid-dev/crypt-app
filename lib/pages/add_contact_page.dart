import 'package:flutter/material.dart';
import 'package:crypt_messenger/l10n/app_localizations.dart';

import '../models/conversation.dart';
import '../services/conversation_service.dart';
import '../services/conversation_id_service.dart';
import '../services/account_service.dart';

class AddContactPage extends StatelessWidget {
  final String username;
  final String publicEncryptionKey;
  final String publicSigningKey;

  const AddContactPage({
    super.key,
    required this.username,
    required this.publicEncryptionKey,
    required this.publicSigningKey,
  });

  Future<void> addContact(BuildContext context) async {
    final accountService = AccountService();
    final myPublicEncryptionKey =
    await accountService.getPublicEncryptionKey();

    // 1. Guard Check first before performing any operations or ID generation
    if (myPublicEncryptionKey == null || myPublicEncryptionKey.isEmpty) {
      throw Exception("My public encryption key is missing.");
    }

    // 2. Generate symmetric ID
    final generatedId = ConversationIdService.generate(
      myPublicEncryptionKey: myPublicEncryptionKey,
      peerPublicEncryptionKey: publicEncryptionKey,
    );

    // 3. Construct the local conversation instance
    final conversation = Conversation(
      id: generatedId,
      username: username,
      publicEncryptionKey: publicEncryptionKey,
      publicSigningKey: publicSigningKey,
      createdAt: DateTime.now(),
      lastMessageAt: DateTime.now(),
      lastMessage: "",
      unreadCount: 0,
      verified: false,
    );

    // 5. Persist to database
    await ConversationService().addConversation(conversation);

    // 6. Context safety check before navigation popping
    if (!context.mounted) return;

    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.addContact),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 40,
              child: Icon(
                Icons.person,
                size: 40,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              username,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              l10n.addContactConfirmation,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => addContact(context),
                child: Text(l10n.addContact),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(l10n.cancel),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
