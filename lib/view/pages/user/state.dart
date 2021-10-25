import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(false) bool isLoading,
    @Default(null) User? currentUser,
  }) = _UserState;

  const UserState._();
}
