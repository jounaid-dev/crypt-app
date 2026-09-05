class Conversation {
  final String id;

  final String username;

  final String publicSigningKey;

  final String publicEncryptionKey;

  final DateTime createdAt;

  final DateTime lastMessageAt;

  final String lastMessage;

  final int unreadCount;

  final bool verified;

  const Conversation({
    required this.id,
    required this.username,
    required this.publicSigningKey,
    required this.publicEncryptionKey,
    required this.createdAt,
    required this.lastMessageAt,
    required this.lastMessage,
    required this.unreadCount,
    required this.verified,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "username": username,
      "publicSigningKey": publicSigningKey,
      "publicEncryptionKey": publicEncryptionKey,
      "createdAt": createdAt.toIso8601String(),
      "lastMessageAt":
          lastMessageAt.toIso8601String(),
      "lastMessage": lastMessage,
      "unreadCount": unreadCount,
      "verified": verified,
    };
  }

  factory Conversation.fromJson(
    Map<String, dynamic> json,
  ) {
    return Conversation(
      id: json["id"],
      username: json["username"],
      publicSigningKey:
          json["publicSigningKey"],
      publicEncryptionKey:
          json["publicEncryptionKey"],
      createdAt: DateTime.parse(
        json["createdAt"],
      ),
      lastMessageAt: DateTime.parse(
        json["lastMessageAt"],
      ),
      lastMessage:
          json["lastMessage"] ?? "",
      unreadCount:
          json["unreadCount"] ?? 0,
      verified:
          json["verified"] ?? false,
    );
  }

  Conversation copyWith({
    String? id,
    String? username,
    String? publicSigningKey,
    String? publicEncryptionKey,
    DateTime? createdAt,
    DateTime? lastMessageAt,
    String? lastMessage,
    int? unreadCount,
    bool? verified,
  }) {
    return Conversation(
      id: id ?? this.id,
      username: username ?? this.username,
      publicSigningKey:
          publicSigningKey ??
              this.publicSigningKey,
      publicEncryptionKey:
          publicEncryptionKey ??
              this.publicEncryptionKey,
      createdAt:
          createdAt ?? this.createdAt,
      lastMessageAt:
          lastMessageAt ??
              this.lastMessageAt,
      lastMessage:
          lastMessage ??
              this.lastMessage,
      unreadCount:
          unreadCount ??
              this.unreadCount,
      verified:
          verified ??
              this.verified,
    );
  }
}