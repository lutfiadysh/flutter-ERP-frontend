part of 'carousel_bloc.dart';

@freezed
class CarouselEvent with _$CarouselEvent {
  const factory CarouselEvent.pageChange(
    int slideOnlyindex,
    int controlsIndex,
    int indicatorIndex,
    int captionIndex,
  ) = _PageChange;
}
