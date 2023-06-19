part of 'form_elements_bloc.dart';

@freezed
class FormElementsEvent with _$FormElementsEvent {
  const factory FormElementsEvent.increment(int value) = _Increment;
  const factory FormElementsEvent.decrement(int value) = _Decrement;
  const factory FormElementsEvent.datePicker(String dateAndtime) = _DatePicker;
  const factory FormElementsEvent.colorPicker(Color color) = _ColorPicker;
  const factory FormElementsEvent.dropDown(String value) = _DropDown;
}
