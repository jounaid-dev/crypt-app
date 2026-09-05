import 'identity.dart';

class IdentityBundle {
  final Identity identity;
  final String encryptedIdentity;
  final String passwordSalt;

  const IdentityBundle({
    required this.identity,
    required this.encryptedIdentity,
    required this.passwordSalt,
  });
}