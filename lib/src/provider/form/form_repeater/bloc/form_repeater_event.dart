part of 'form_repeater_bloc.dart';

@freezed
class FormRepeaterEvent with _$FormRepeaterEvent {
  const factory FormRepeaterEvent.add(
    String fileName,
    TextEditingController nameController,
    TextEditingController emailController,
    TextEditingController subjectController,
    TextEditingController messageController,
  ) = _Add;
  const factory FormRepeaterEvent.delete(int index) = _Delete;
  const factory FormRepeaterEvent.addFile(String fileName, int index) =
      _AddFile;
  const factory FormRepeaterEvent.addPhone(
      TextEditingController phoneController) = _AddPhone;
  const factory FormRepeaterEvent.deletePhone(int index) = _DeletePhone;
  const factory FormRepeaterEvent.radioSelect(String value) = _RadioSelect;
}
