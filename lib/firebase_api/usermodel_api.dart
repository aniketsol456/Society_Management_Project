import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:society_management_projecct/feature/Authentication/models/User_model.dart';

class Userapi {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const String collectionPath = 'users';

  Future<void> createUser(UserModel user) async {
    try {
      await _firestore.collection(collectionPath).add(user.toJson());
    } catch (e) {
      print('Error creating user: $e');
      throw Exception('Failed to create user');
    }
  }

  Future<void> UpdateUser(String userID, UserModel updateUser) async {
    try {
      await _firestore
          .collection(collectionPath)
          .doc(userID)
          .update(updateUser.toJson());
    } catch (e) {
      print('Error creating user: $e');
      throw Exception('Failed to create user');
    }
  }

  Future<void> deleteUser(String userId) async {
    try {
      await _firestore.collection(collectionPath).doc(userId).delete();
    } catch (e) {
      print('Error deleting user: $e');
      throw Exception('Failed to delete user');
    }
  }
}
