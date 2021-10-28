import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tunagaru/repository/auth.dart';
import 'package:tunagaru/view/pages/user/auth/login/state.dart';
import 'package:tunagaru/view/pages/user/auth/registration/state.dart';
import 'package:tunagaru/view/pages/user/auth/reset_password/state.dart';

final resetPasswordProvider =
    StateNotifierProvider<ResetPasswordController, ResetPasswordState>(
  (ref) => ResetPasswordController(ref.read),
);

class ResetPasswordController extends StateNotifier<ResetPasswordState> {
  ResetPasswordController(
    this._read,
  ) : super(const ResetPasswordState());

  final Reader _read;

  void changeEmail(String value) {
    state = state.copyWith(email: value);
  }

  bool validate() {
    if (state.email.isEmpty) {
      state = state.copyWith(isValidated: true);
      return false;
    } else {
      return true;
    }
  }

  Future<bool> sendResetPasswordEmail() async {
    state = state.copyWith(isLoading: true);
    try {
      await AuthRepository.sendResetPasswordEmail(state.email);
      state = state.copyWith(
        isLoading: false,
        isMailSent: true,
      );
      return true;
    } catch (e) {
      Fluttertoast.showToast(msg: '再登録メールの送信に失敗しました');
      state = state.copyWith(isLoading: false);
      return false;
    }
  }
}
