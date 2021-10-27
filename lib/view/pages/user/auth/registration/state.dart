import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class RegistrationState with _$RegistrationState {
  const factory RegistrationState({
    @Default(false) bool isLoading,
    @Default(false) bool isValidated,
    @Default('') String email,
    @Default('') String password,
  }) = _RegistrationState;

  const RegistrationState._();
}
