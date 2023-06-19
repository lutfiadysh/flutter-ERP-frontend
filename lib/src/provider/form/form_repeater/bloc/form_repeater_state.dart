part of 'form_repeater_bloc.dart';

@freezed
class FormRepeaterState with _$FormRepeaterState {
  const factory FormRepeaterState.initial() = _Initial;
  const factory FormRepeaterState.addSuceess(
    String fileName,
    TextEditingController nameController,
    TextEditingController emailController,
    TextEditingController subjectController,
    TextEditingController messageController,
  ) = _AddSuccess;
  const factory FormRepeaterState.deleteSuceess(int index) = _DeleteSuccess;
  const factory FormRepeaterState.addFileSuceess(String fileName, int index) =
      _AddFileSuccess;
  const factory FormRepeaterState.addPhoneSuceess(
    TextEditingController phoneController,
  ) = _AddPhoneSuccess;
  const factory FormRepeaterState.deletePhoneSuceess(
    int index,
  ) = _DeletePhoneSuccess;
  const factory FormRepeaterState.radioSelectSuceess(
    String value,
  ) = _RadioSelectSuceess;
}
