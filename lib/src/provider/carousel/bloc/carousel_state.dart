part of 'carousel_bloc.dart';

@freezed
class CarouselState with _$CarouselState {
  const factory CarouselState.initial() = _Initial;
  const factory CarouselState.pageChangeSuccess(
    int slideOnlyindex,
    int controlsIndex,
    int indicatorIndex,
    int captionIndex,
  ) = _PageChangeSuccess;
}
