part of 'coming_soon_bloc_bloc.dart';

@freezed
class ComingSoonBlocEvent with _$ComingSoonBlocEvent {
  const factory ComingSoonBlocEvent.started(int seconds) = _Started;
}
