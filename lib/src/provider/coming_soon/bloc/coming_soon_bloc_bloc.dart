import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coming_soon_bloc_event.dart';
part 'coming_soon_bloc_state.dart';
part 'coming_soon_bloc_bloc.freezed.dart';

class ComingSoonBlocBloc
    extends Bloc<ComingSoonBlocEvent, ComingSoonBlocState> {
  ComingSoonBlocBloc() : super(const _Initial()) {
    on<ComingSoonBlocEvent>((event, emit) {
      if (event is _Started) {
        emit(ComingSoonBlocState.startSuccess(event.seconds));
      }
    });
  }
}
