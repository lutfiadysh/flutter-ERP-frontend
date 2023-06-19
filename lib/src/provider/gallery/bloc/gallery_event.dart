part of 'gallery_bloc.dart';

@freezed
class GalleryEvent with _$GalleryEvent {
  const factory GalleryEvent.next(int index) = _Next;
  const factory GalleryEvent.previous(int index) = _Previous;
}
