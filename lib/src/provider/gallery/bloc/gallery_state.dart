part of 'gallery_bloc.dart';

@freezed
class GalleryState with _$GalleryState {
  const factory GalleryState.initial() = _Initial;
  const factory GalleryState.nextSuccess(int index) = _NextSuccess;
  const factory GalleryState.previousSuccess(int index) = _PreviousSuccess;
}
