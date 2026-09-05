class UserIdentity {
  final String uid;
  final String username;
  final String publicEncryptionKey;
  final String publicSigningKey;
  final DateTime createdAt;

  const UserIdentity({
    required this.uid,
    required this.username,
    required this.publicEncryptionKey,
    required this.publicSigningKey,
    required this.createdAt,
  });

  // Convert UserIdentity instance into a JSON Map
  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "username": username,
      "publicEncryptionKey": publicEncryptionKey,
      "publicSigningKey": publicSigningKey,
      "createdAt": createdAt.toIso8601String(),
    };
  }

  // Safely parse JSON into a UserIdentity instance
  factory UserIdentity.fromJson(Map<String, dynamic> json) {
    return UserIdentity(
      uid: json["uid"] ?? "", // Fallback to empty string if uid is null
      username: json["username"] ?? "Unknown",
      publicEncryptionKey: json["publicEncryptionKey"] ?? "",
      publicSigningKey: json["publicSigningKey"] ?? "",
      createdAt: json["createdAt"] != null 
          ? DateTime.parse(json["createdAt"]) 
          : DateTime.now(), // Fallback to current time if missing
    );
  }

  // Create a copy of the identity with optional updated fields
  UserIdentity copyWith({
    String? uid,
    String? username,
    String? publicEncryptionKey,
    String? publicSigningKey,
    DateTime? createdAt,
  }) {
    return UserIdentity(
      uid: uid ?? this.uid,
      username: username ?? this.username,
      publicEncryptionKey: publicEncryptionKey ?? this.publicEncryptionKey,
      publicSigningKey: publicSigningKey ?? this.publicSigningKey,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
