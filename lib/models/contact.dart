class Contact {
  final String username;

  final String publicSigningKey;

  final String publicEncryptionKey;

  final String? nickname;

  Contact({
    required this.username,
    required this.publicSigningKey,
    required this.publicEncryptionKey,
    this.nickname,
  });

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "publicSigningKey": publicSigningKey,
      "publicEncryptionKey": publicEncryptionKey,
      "nickname": nickname,
    };
  }

  factory Contact.fromJson(
    Map<String, dynamic> json,
  ) {
    return Contact(
      username: json["username"],
      publicSigningKey: json["publicSigningKey"],
      publicEncryptionKey: json["publicEncryptionKey"],
      nickname: json["nickname"],
    );
  }

  Contact copyWith({
    String? username,
    String? publicSigningKey,
    String? publicEncryptionKey,
    String? nickname,
  }) {
    return Contact(
      username: username ?? this.username,
      publicSigningKey:
          publicSigningKey ?? this.publicSigningKey,
      publicEncryptionKey:
          publicEncryptionKey ??
              this.publicEncryptionKey,
      nickname: nickname ?? this.nickname,
    );
  }
}