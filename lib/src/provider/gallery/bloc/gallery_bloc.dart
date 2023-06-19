import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';
part 'gallery_bloc.freezed.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  GalleryBloc() : super(const _Initial()) {
    on<GalleryEvent>((event, emit) {
      if (event is _Next) {
        emit(GalleryState.nextSuccess(event.index));
      } else if (event is _Previous) {
        emit(GalleryState.previousSuccess(event.index));
      }
    });
  }
}
