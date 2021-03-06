import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class GlobalState with _$GlobalState {
  const factory GlobalState({
    @Default(false) bool isLoading,
  }) = _GlobalState;

  const GlobalState._();
}
