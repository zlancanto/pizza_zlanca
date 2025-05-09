import 'models/models.dart';

abstract class UserRepository {

  Stream<MyUser?> get myUser;
  Future<MyUser> signUp(MyUser myUser, String password);
  Future<void> signIn(String email, String password);
  Future<void> setUserData(MyUser myUser);
  Future<void> logOut();
}