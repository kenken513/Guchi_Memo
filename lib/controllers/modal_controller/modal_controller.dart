import 'package:flutter_guchi_memo/model/modal_state/modal_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final modalProvider = StateNotifierProvider<ModalController, ModalState>(
  (ref) => ModalController(),
);

class ModalController extends StateNotifier<ModalState> {
  ModalController() : super(const ModalState());

  Future<void> changeModalStateTrue() async {
    state = state.copyWith(isOpen: true);
  }

  Future<void> changeModalStateFlase() async {
    state = state.copyWith(isOpen: false);
  }
}
