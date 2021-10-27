import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tunagaru/repository/auth.dart';
import 'package:tunagaru/view/pages/user/auth/login/state.dart';
import 'package:tunagaru/view/pages/user/auth/registration/state.dart';

final loginProvider = StateNotifierProvider<LoginController, LoginState>(
  (ref) => LoginController(ref.read),
);

class LoginController extends StateNotifier<LoginState> {
  LoginController(
    this._read,
  ) : super(const LoginState());

  final Reader _read;

  void changeEmail(String value) {
    state = state.copyWith(email: value);
  }

  void changePassword(String value) {
    state = state.copyWith(password: value);
  }

  bool validate() {
    if (state.email.isEmpty || state.password.isEmpty) {
      state = state.copyWith(isValidated: true);
      return false;
    } else {
      return true;
    }
  }

  Future<bool> signIn() async {
    state = state.copyWith(isLoading: true);
    try {
      await AuthRepository.signIn(email: state.email, password: state.password);
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      Fluttertoast.showToast(msg: 'ログインに失敗しました');
      print(e);
      state = state.copyWith(isLoading: false);
      return false;
    }
  }
}
