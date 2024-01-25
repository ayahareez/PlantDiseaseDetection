import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/db_helper.dart';
import '../../model/user.dart';


abstract class UsersDBModel {
  ///add user data to [FireStore]
  ///
  /// throw an error
  Future<void> addUser(UserModel userModel);

  ///get user from  [FireStore]
  ///
  /// throw an error
  Future<List<UserModel>> getUsers();
}

const collectionName = 'users';

class UserDBModelImp implements UsersDBModel {
  final RemoteDBHelper dbHelper;

  UserDBModelImp({required this.dbHelper});

  @override
  Future<void> addUser(UserModel userModel) {
    final User? user = FirebaseAuth.instance.currentUser;
    final String userId = user != null ? user.uid : '';
    final String nameDocumentId = '$userId';
    print(userId);
    return dbHelper.add(collectionName, userModel.toMap(),
        documentId: nameDocumentId);
  }

  @override
  Future<List<UserModel>> getUsers() async => List<UserModel>.from(
      await dbHelper.get(collectionName, UserModel.fromDoc));
}
