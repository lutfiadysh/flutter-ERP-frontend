import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'carousel_event.dart';
part 'carousel_state.dart';
part 'carousel_bloc.freezed.dart';

class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {
  CarouselBloc() : super(const _Initial()) {
    on<CarouselEvent>((event, emit) {
      if (event is _PageChange) {
        emit(
          CarouselState.pageChangeSuccess(
            event.slideOnlyindex,
            event.controlsIndex,
            event.indicatorIndex,
            event.captionIndex,
          ),
        );
      }
    });
  }
}
