import 'package:cloud_firestore/cloud_firestore.dart';

import 'auth_repo.dart';

class TodoRepo {
  CollectionReference todoCollection =
      FirebaseFirestore.instance.collection('todos');
  AuthRepository authRepo = AuthRepository();
  Stream<QuerySnapshot<Object?>> getUserTodos(String status) {
    bool isCompleted = status != "Pending";
    return todoCollection
        .where('userId', isEqualTo: authRepo.getCurrentUserEmail())
        .where("completed", isEqualTo: isCompleted)
        .snapshots();
  }

  Stream<QuerySnapshot<Object?>> getAllUserTodos() {
    return todoCollection
        .where('userId', isEqualTo: authRepo.getCurrentUserEmail())
        .snapshots();
  }
}
