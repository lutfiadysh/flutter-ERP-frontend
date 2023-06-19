part of 'form_elements_bloc.dart';

@freezed
class FormElementsState with _$FormElementsState {
  const factory FormElementsState.initial() = _Initial;
  const factory FormElementsState.incrementSuccess(int value) =
      _IncrementSuccess;
  const factory FormElementsState.decrementSuccess(int value) =
      _DecrementSuccess;
  const factory FormElementsState.datepickerSuccess(String dateAndtime) =
      _DatepickerSuccess;
  const factory FormElementsState.colorpickerSuccess(Color color) =
      _ColorpickerSuccess;
  const factory FormElementsState.dropDownSuccess(String value) =
      _DropDownSuccess;
}
