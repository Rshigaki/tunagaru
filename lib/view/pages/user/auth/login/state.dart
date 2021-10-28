import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(false) bool isLoading,
    @Default(false) bool isValidated,
    @Default(false) bool showPassword,
    @Default('') String email,
    @Default('') String password,
  }) = _LoginState;

  const LoginState._();
}
