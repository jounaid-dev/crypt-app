class Identity {
  final String username;
  final String publicSigningKey;
  final String privateSigningKey;
  final String publicEncryptionKey;
  final String privateEncryptionKey;

  Identity({
    required this.username,
    required this.publicSigningKey,
    required this.privateSigningKey,
    required this.publicEncryptionKey,
    required this.privateEncryptionKey,
  });

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "publicSigningKey": publicSigningKey,
      "privateSigningKey": privateSigningKey,
      "publicEncryptionKey": publicEncryptionKey,
      "privateEncryptionKey": privateEncryptionKey,
    };
  }

  factory Identity.fromJson(Map<String, dynamic> json) {
    return Identity(
      username: json["username"],
      publicSigningKey: json["publicSigningKey"],
      privateSigningKey: json["privateSigningKey"],
      publicEncryptionKey: json["publicEncryptionKey"],
      privateEncryptionKey: json["privateEncryptionKey"],
    );
  }
}
