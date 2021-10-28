import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tunagaru/repository/auth.dart';
import 'package:tunagaru/view/pages/user/auth/registration/state.dart';

final registrationProvider =
    StateNotifierProvider<RegistrationController, RegistrationState>(
  (ref) => RegistrationController(ref.read),
);

class RegistrationController extends StateNotifier<RegistrationState> {
  RegistrationController(
    this._read,
  ) : super(const RegistrationState());

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

  void toggleShowPassword() {
    state = state.copyWith(showPassword: !state.showPassword);
  }

  Future<bool> register() async {
    state = state.copyWith(isLoading: true);
    try {
      await AuthRepository.register(
          email: state.email, password: state.password);
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      Fluttertoast.showToast(msg: '会員登録に失敗しました');
      print(e);
      state = state.copyWith(isLoading: false);
      return false;
    }
  }
}
