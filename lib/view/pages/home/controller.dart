import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tunagaru/view/pages/home/state.dart';

final homeProvider = StateNotifierProvider<HomeController, HomeState>(
  (ref) => HomeController(ref.read),
);

class HomeController extends StateNotifier<HomeState> {
  HomeController(
    this._read,
  ) : super(const HomeState());

  final Reader _read;
}
