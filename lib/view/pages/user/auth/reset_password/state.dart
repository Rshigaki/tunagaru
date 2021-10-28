import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState({
    @Default(false) bool isLoading,
    @Default(false) bool isValidated,
    @Default(false) bool isMailSent,
    @Default('') String email,
  }) = _ResetPasswordState;

  const ResetPasswordState._();
}
