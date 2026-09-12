// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:crypt_messenger/l10n/app_localizations.dart';

import '../models/contact.dart';
import '../models/conversation.dart';
import '../services/contact_service.dart';
import '../services/conversation_service.dart';
import '../services/conversation_id_service.dart';
import '../services/account_service.dart';

import 'chat_page.dart';
import 'my_identity_page.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final ContactService contactService = ContactService();
  final ConversationService conversationService = ConversationService();
  final AccountService accountService = AccountService();

  List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();
    loadContacts();
  }

  Future<void> loadContacts() async {
    final fetchedContacts = await contactService.getContacts();

    if (!mounted) return;

    setState(() {
      contacts = fetchedContacts;
    });
  }

  String initials(String username) {
    if (username.isEmpty) return "?";
    return username[0].toUpperCase();
  }

  Future<void> openConversation(Contact contact) async {
    final l10n = AppLocalizations.of(context)!;

    // --------------------------------------------------
    // FIND EXISTING CONVERSATION
    // --------------------------------------------------

    final localConversations =
        await conversationService.getConversations();

    Conversation? targetConversation;

    for (final conversation in localConversations) {
      if (conversation.username.toLowerCase() ==
          contact.username.toLowerCase()) {
        targetConversation = conversation;
        break;
      }
    }

    // --------------------------------------------------
    // CREATE CONVERSATION IF IT DOESN'T EXIST
    // --------------------------------------------------

    if (targetConversation == null) {
      final myPublicEncryptionKey =
          await accountService.getPublicEncryptionKey();

      if (myPublicEncryptionKey == null ||
          myPublicEncryptionKey.isEmpty) {
        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.publicEncryptionKeyMissing),
          ),
        );

        return;
      }

      final peerPublicEncryptionKey =
          contact.publicEncryptionKey;

      if (peerPublicEncryptionKey.isEmpty) {
        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.contactEncryptionKeyMissing),
          ),
        );

        return;
      }

      // --------------------------------------------------
      // GENERATE DETERMINISTIC CONVERSATION ID
      // --------------------------------------------------

      final conversationId =
          ConversationIdService.generate(
        myPublicEncryptionKey: myPublicEncryptionKey,
        peerPublicEncryptionKey: peerPublicEncryptionKey,
      );

      // --------------------------------------------------
      // CREATE LOCAL CONVERSATION
      // --------------------------------------------------

      final newConversation = Conversation(
        id: conversationId,
        username: contact.username,
        publicEncryptionKey: peerPublicEncryptionKey,
        publicSigningKey: contact.publicSigningKey,
        createdAt: DateTime.now(),
        lastMessageAt: DateTime.now(),
        lastMessage: "",
        unreadCount: 0,
        verified: true,
      );

      await conversationService.addConversation(
        newConversation,
      );

      targetConversation = newConversation;
    }

    // --------------------------------------------------
    // OPEN CHAT
    // --------------------------------------------------

    if (!mounted) return;

    final conversationToOpen = targetConversation;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ChatPage(
          conversation: conversationToOpen,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.contacts),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const MyIdentityPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),

      body: SafeArea(
        child: contacts.isEmpty
            ? Center(
                child: Text(
                  l10n.noContactsYet,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.only(
                  bottom: 24.0,
                ),
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  final contact = contacts[index];

                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        initials(contact.username),
                      ),
                    ),

                    title: Text(
                      contact.nickname ??
                          contact.username,
                    ),

                    subtitle: Text(
                      contact.username,
                    ),

                    trailing: const Icon(
                      Icons.chevron_right,
                    ),

                    onTap: () => openConversation(contact),
                  );
                },
              ),
      ),
    );
  }
}