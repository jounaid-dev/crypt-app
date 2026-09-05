import 'package:cloud_firestore/cloud_firestore.dart';


class UserService {


  final FirebaseFirestore firestore =
      FirebaseFirestore.instance;



  Future<void> registerUser(

    String username,

    String publicKey,

  ) async {


    await firestore
        .collection("users")
        .doc(username)
        .set({

      "username": username,

      "publicKey": publicKey,

      "createdAt":
          FieldValue.serverTimestamp(),

    });


  }



  Future<Map<String, dynamic>?> findUser(

    String username,

  ) async {


    final snapshot =
        await firestore
            .collection("users")
            .doc(username)
            .get();



    if (!snapshot.exists) {

      return null;

    }



    return snapshot.data();

  }


}