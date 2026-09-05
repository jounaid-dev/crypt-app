enum MessageStatus {
  sending,
  pending,
  sent,
  delivered,
  read,
}

enum MessageType {
  text,
  image,
  file,
}

class Message {
  final String id;
  final String conversationId;
  final String sender; 
  final String receiver; 
  final String encryptedText;
  final String signature;              
  final String senderSigningPublicKey; 
  final DateTime timestamp;
  final bool outgoing;
  final MessageType type;
  final MessageStatus status;

  const Message({
    required this.id,
    required this.conversationId,
    required this.sender,
    required this.receiver,
    required this.encryptedText,
    required this.signature,
    required this.senderSigningPublicKey,
    required this.timestamp,
    required this.outgoing,
    required this.type,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "conversationId": conversationId,
      "sender": sender,
      "receiver": receiver,
      "encryptedText": encryptedText,
      "signature": signature,
      "senderSigningPublicKey": senderSigningPublicKey,
      "timestamp": timestamp.toIso8601String(),
      "outgoing": outgoing,
      "type": type.name,
      "status": status.name,
    };
  }

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json["id"] ?? "",
      conversationId: json["conversationId"] ?? "",
      sender: json["sender"] ?? "",
      receiver: json["receiver"] ?? "",
      encryptedText: json["encryptedText"] ?? "",
      signature: json["signature"] ?? "",
      senderSigningPublicKey: json["senderSigningPublicKey"] ?? "",
      timestamp: DateTime.tryParse(json["timestamp"] ?? "") ?? DateTime.now(),
      outgoing: json["outgoing"] ?? false,
      type: MessageType.values.firstWhere(
        (e) => e.name == json["type"],
        orElse: () => MessageType.text,
      ),
      status: MessageStatus.values.firstWhere(
        (e) => e.name == json["status"],
        orElse: () => MessageStatus.sent,
      ),
    );
  }

  Message copyWith({
    String? id,
    String? conversationId,
    String? sender,
    String? receiver,
    String? encryptedText,
    String? signature,
    String? senderSigningPublicKey,
    DateTime? timestamp,
    bool? outgoing,
    MessageType? type,
    MessageStatus? status,
  }) {
    return Message(
      id: id ?? this.id,
      conversationId: conversationId ?? this.conversationId,
      sender: sender ?? this.sender,
      receiver: receiver ?? this.receiver,
      encryptedText: encryptedText ?? this.encryptedText,
      signature: signature ?? this.signature,
      senderSigningPublicKey: senderSigningPublicKey ?? this.senderSigningPublicKey,
      timestamp: timestamp ?? this.timestamp,
      outgoing: outgoing ?? this.outgoing,
      type: type ?? this.type,
      status: status ?? this.status,
    );
  }
}
