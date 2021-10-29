import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tunagaru/view/pages/user/state.dart';

final userProvider = StateNotifierProvider<UserController, UserState>(
    (ref) => UserController(ref.read));

class UserController extends StateNotifier<UserState> {
  UserController(
    this._read,
  ) : super(const UserState());

  final Reader _read;

  void addLoginStateListener() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        print(user);
        state = state.copyWith(currentUser: user);
      }
    });
  }
}
