import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class TermsAndConditionsPage extends StatefulWidget {
  const TermsAndConditionsPage({super.key});

  @override
  State<TermsAndConditionsPage> createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
  bool _agreed = false;

  static const String _termsText = '''
CRYPT Terms & Conditions

Last updated: September 12, 2026

1. About CRYPT

CRYPT is a privacy-focused messaging application developed independently by its developer. CRYPT is designed to allow users to communicate directly with other users through private and encrypted connections.

CRYPT is an evolving application and may be improved, changed, or discontinued at any time.

By creating an account or using CRYPT, you agree to these Terms & Conditions.

2. Eligibility

You may use CRYPT only if you are legally permitted to use a messaging service in your country or region.

If applicable law requires parental or legal-guardian consent for your use of CRYPT, you must obtain that consent before using the application.

You are responsible for complying with the laws applicable to you.

3. Accounts

To use CRYPT, you may be required to create an account using the information requested by the application.

Your CRYPT ID and other account identifiers may be generated or assigned by the application.

You are responsible for protecting your account credentials and for activity performed through your account.

You must not intentionally attempt to access another person's account or impersonate another user.

4. Private Communication

CRYPT is designed with privacy as a fundamental principle.

CRYPT uses encryption and peer-to-peer technologies intended to allow users to communicate privately between their devices.

We do not read, monitor, or inspect your private messages. Your conversations are designed to remain private.

Connections between users may require signaling and other technical services to establish communication. These services are not intended to provide the developer with access to the plaintext contents of private conversations.

The developer cannot guarantee that every message will be successfully delivered, permanently preserved, or recoverable.

5. Connecting With Other Users

CRYPT does not operate as a general public directory of users.

Depending on the version of the application, users may need to exchange a CRYPT QR code or other supported contact information before establishing a conversation.

You are responsible for deciding who you connect with and communicate with.

6. User Content

You are responsible for the messages, files, images, links, and other content that you send through CRYPT.

CRYPT is a private communication tool and does not take responsibility for the opinions, statements, files, or other content exchanged between users.

You must not use CRYPT to intentionally harm, threaten, defraud, exploit, or attack other people or services.

You must not use CRYPT to distribute malware, conduct unauthorized attacks, compromise devices or accounts, or interfere with the operation of CRYPT.

You must not use CRYPT for unlawful activity.

7. Privacy and Security

CRYPT is designed to minimize unnecessary access to users' private communications.

However, no software, encryption system, network, device, or internet connection can be guaranteed to be completely secure.

You are responsible for keeping your device, operating system, passwords, and account credentials secure.

You understand that the security and availability of CRYPT can also depend on your device, operating system, network connection, WebRTC infrastructure, signaling services, hosting providers, and other third-party technologies.

8. Availability and Connectivity

CRYPT requires compatible devices, networks, and technical services to function.

Connections may fail because another user is offline, a network is unavailable, a firewall or NAT prevents a connection, a device is unavailable, a service is down, or for other technical reasons.

CRYPT does not guarantee uninterrupted availability, connection success, message delivery, or permanent access to the application.

9. Data and Message Loss

You understand that messages or other locally stored information may become unavailable because of device failure, application errors, deletion, account loss, operating-system changes, loss of credentials, or other circumstances.

You are responsible for maintaining any backups or recovery information that CRYPT provides or that you choose to maintain.

CRYPT does not guarantee recovery of lost messages, accounts, keys, or other data.

10. Free and Optional Features

The core messaging functionality of CRYPT is intended to remain accessible without requiring users to purchase a mandatory subscription.

CRYPT may introduce optional paid features, premium features, donations, or other forms of financial support in the future.

The availability, pricing, and features of any paid service may change over time.

No payment is required unless you voluntarily choose to use a paid feature or service.

11. Third-Party Services

CRYPT may rely on third-party technologies, infrastructure, hosting providers, app stores, networking services, or other services.

The developer is not responsible for failures, outages, changes, restrictions, or actions caused by third-party services.

Third-party services may have their own terms and privacy policies.

12. Prohibited Use

You agree not to:

• Attack or attempt to compromise CRYPT or its infrastructure.
• Intentionally disrupt CRYPT's operation.
• Attempt to bypass security mechanisms.
• Attempt to gain unauthorized access to another user's account or device.
• Distribute malware or malicious software.
• Use CRYPT to commit fraud or other unlawful activity.
• Intentionally threaten, harass, or harm other people.
• Impersonate another person or entity.
• Abuse technical vulnerabilities in CRYPT.

13. Changes to CRYPT

CRYPT is an evolving project.

The developer may modify, add, remove, suspend, or discontinue features at any time.

Technical architecture, supported devices, connection methods, pricing, premium features, and other aspects of CRYPT may change as the project develops.

14. Changes to These Terms

These Terms may be updated as CRYPT develops or as legal or technical requirements change.

When appropriate, users may be informed of significant changes through the application or another reasonable method.

Continued use of CRYPT after updated Terms become effective constitutes acceptance of the updated Terms, to the extent permitted by applicable law.

15. Suspension or Termination

The developer may suspend or terminate access to CRYPT where reasonably necessary, including where the service is discontinued, an account compromises the security of the service, or these Terms are violated.

You may stop using CRYPT at any time.

16. No Warranty

CRYPT is provided on an "as available" and "as is" basis to the extent permitted by applicable law.

The developer does not guarantee that CRYPT will always be available, error-free, secure, compatible with every device, or capable of establishing every requested connection.

17. Limitation of Liability

To the maximum extent permitted by applicable law, the developer will not be responsible for indirect, incidental, special, consequential, or other losses resulting from the use or inability to use CRYPT.

This includes, where legally permitted, losses resulting from connection failures, message loss, data loss, device problems, account loss, service interruptions, security incidents, or reliance on the application.

Nothing in these Terms excludes liability that cannot legally be excluded or limited.

18. Privacy

CRYPT is built around the principle that private communication should remain private.

The developer does not intend to sell users' private conversations or use the plaintext contents of private conversations for advertising.

CRYPT's privacy features are intended to minimize the developer's access to private communications rather than create a system in which the developer can routinely inspect them.

Information that is necessary for operating accounts, establishing connections, providing features, maintaining security, or operating the service may still be processed as described by CRYPT's applicable privacy information.

19. Acceptance

By selecting "I Agree" and continuing to use CRYPT, you confirm that you have read these Terms & Conditions and agree to comply with them.

If you do not agree to these Terms, you must not use CRYPT.

CRYPT — Private communication, built with privacy first.
''';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.termsAndConditions),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Text(
              _termsText,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            CheckboxListTile(
              value: _agreed,
              contentPadding: EdgeInsets.zero,
              isThreeLine: true,
              title: Text(l10n.agreeTerms),
              onChanged: (value) {
                setState(() {
                  _agreed = value ?? false;
                });
              },
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: _agreed
                  ? () => Navigator.pop(context, true)
                  : null,
              child: Text(
                l10n.agreeAndContinue,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}