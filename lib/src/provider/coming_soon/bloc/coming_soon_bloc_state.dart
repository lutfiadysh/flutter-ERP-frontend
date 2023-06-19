part of 'coming_soon_bloc_bloc.dart';

@freezed
class ComingSoonBlocState with _$ComingSoonBlocState {
  const factory ComingSoonBlocState.initial() = _Initial;
  const factory ComingSoonBlocState.startSuccess(int seconds) = _StartSuccess;
}
