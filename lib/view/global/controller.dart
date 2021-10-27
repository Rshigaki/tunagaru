import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tunagaru/view/global/state.dart';

final globalProvider = StateNotifierProvider<GlobalController, GlobalState>(
  (ref) => GlobalController(ref.read),
);

class GlobalController extends StateNotifier<GlobalState> {
  GlobalController(
    this._read,
  ) : super(const GlobalState());

  final Reader _read;
}
