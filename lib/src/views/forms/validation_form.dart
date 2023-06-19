import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/constant/string.dart';
import 'package:admin_dashboard/src/provider/form/form_validation/bloc/form_validation_bloc.dart';
import 'package:admin_dashboard/src/utils/responsive.dart';
import 'package:admin_dashboard/src/widget/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterx/flutterx.dart';

class ValidationForm extends StatefulWidget {
  const ValidationForm({
    Key? key,
  }) : super(key: key);

  @override
  State<ValidationForm> createState() => _ValidationFormState();
}

class _ValidationFormState extends State<ValidationForm> {
  //first form

  final FormValidationBloc _formValidationBloc1 = FormValidationBloc();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _zipController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  AutovalidateMode _firstValidateMode = AutovalidateMode.disabled;

  final List<String> _stateList = ['Gujarat', 'Assam', 'Bihar'];
  String? _dropDownValue;
  bool _isCheck = false;

  //second form
  final FormValidationBloc formValidationBloc2 = FormValidationBloc();
  AutovalidateMode _secondValidateMode = AutovalidateMode.disabled;
  final TextEditingController _requiredController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _rePasswordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _digitController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _alphaNumericController = TextEditingController();
  // final TextEditingController _textAreaController = TextEditingController();

  //Third form
  final FormValidationBloc formValidationBloc3 = FormValidationBloc();
  AutovalidateMode _thirdValidateMode = AutovalidateMode.disabled;
  // final TextEditingController _minLengthController = TextEditingController();
  // final TextEditingController _maxLengthController = TextEditingController();
  final TextEditingController _rangeLengthController = TextEditingController();
  final TextEditingController _minValueController = TextEditingController();
  final TextEditingController _maxValueController = TextEditingController();
  final TextEditingController _rangeValueController = TextEditingController();
  final TextEditingController _regularExpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocProvider(
          create: (context) => _formValidationBloc1,
          child: BlocBuilder<FormValidationBloc, FormValidationState>(
            builder: (context, state) {
              state.whenOrNull(
                formSubmitSuccess: () {
                  _firstValidateMode = AutovalidateMode.always;
                },
                checkBoxSuccess: (value) {
                  _isCheck = value;
                },
              );
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _formHeadingCommon('Validation Form'),
                      FxBox.h24,
                      Form(
                        autovalidateMode: _firstValidateMode,
                        child: Responsive.isWeb(context) ||
                                Responsive.isTablet(context)
                            ? _validationForm1()
                            : __validationForm1Mobile(),
                      ),
                      FxBox.h24,
                      _termNConditionField(),
                      _isCheck == false &&
                              _firstValidateMode == AutovalidateMode.always
                          ? _termNConditionErrorMsg()
                          : const SizedBox.shrink(),
                      FxBox.h24,
                      FxButton(
                        borderRadius: 4,
                        onPressed: () {
                          if (_firstValidateMode != AutovalidateMode.always) {
                            _formValidationBloc1
                                .add(const FormValidationEvent.submit());
                          }
                        },
                        text: 'Submit',
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        FxBox.h12,
        Responsive.isWeb(context) || Responsive.isTablet(context)
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _validationForm2()),
                  FxBox.w12,
                  Expanded(child: _validationForm3())
                ],
              )
            : Column(
                children: [_validationForm2(), FxBox.h12, _validationForm3()],
              ),
      ],
    );
  }

  Widget _formHeadingCommon(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
    );
  }

  Widget _termNConditionErrorMsg() {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, top: 8.0),
      child: Text(
        'You must agree before submitting.',
        style: TextStyle(fontSize: 13, color: ColorConst.error),
      ),
    );
  }

  Widget _termNConditionField() {
    return Row(
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Checkbox(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            value: _isCheck,
            onChanged: (value) {
              _formValidationBloc1.add(FormValidationEvent.checkBox(value!));
            },
          ),
        ),
        const Text(
          'Agree to terms and conditions',
          style: TextStyle(fontWeight: FontWeight.w600),
        )
      ],
    );
  }

  Widget _validationForm1() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            __validationWithIconCommon(
              _commonText('Full Name'),
              _firstNameTextField(),
            ),
            FxBox.w12,
            __validationWithIconCommon(
              _commonText('Username'),
              _userNameTextField(),
            ),
            FxBox.w12,
            __validationWithIconCommon(
              _commonText('Email ID'),
              _lastfirstNameTextField(),
            ),
          ],
        ),
        FxBox.h16,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            __validationWithIconCommon(
              _commonText('Moile No'),
              _cityTextField(),
            ),
            FxBox.w12,
            __validationWithIconCommon(
              _commonText('State'),
              _stateTextField(),
            ),
            FxBox.w12,
            __validationWithIconCommon(
              _commonText('Zip'),
              _zipTextField(),
            ),
          ],
        ),
      ],
    );
  }

  Widget __validationForm1Mobile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _commonText('Full Name'),
        _firstNameTextField(),
        _commonText('Username'),
        _userNameTextField(),
        _commonText('Email ID'),
        _lastfirstNameTextField(),
        _commonText('Mobile No'),
        _cityTextField(),
        _commonText('State'),
        _stateTextField(),
        _commonText('Zip'),
        _zipTextField(),
      ],
    );
  }

  Widget __validationWithIconCommon(Widget text, Widget textField) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [text, textField],
      ),
    );
  }

  Widget _commonText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _firstNameTextField() {
    return _textField(
      controller: _firstNameController,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return Strings.validName;
        }
        return null;
      },
      hintText: 'Jone',
    );
  }

  Widget _lastfirstNameTextField() {
    return _textField(
      controller: _lastNameController,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return Strings.validName;
        }
        return null;
      },
      hintText: 'jone@mail.com',
    );
  }

  Widget _userNameTextField() {
    return _textField(
      prefixIcon: const Icon(Icons.alternate_email_sharp),
      controller: _userNameController,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return Strings.chooseUser;
        }
        return null;
      },
    );
  }

  Widget _cityTextField() {
    return _textField(
      controller: _cityController,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return Strings.validCity;
        }
        return null;
      },
    );
  }

  Widget _stateTextField() {
    return BlocConsumer<FormValidationBloc, FormValidationState>(
      listener: (context, state) {
        state.whenOrNull(
          dropeDownSuccess: (value) {
            _dropDownValue = value;
            _stateController.text = value;
          },
        );
      },
      builder: (context, state) {
        return _textField(
          suffixIcon: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton(
                hint: const Text('Choose...'),
                borderRadius: BorderRadius.circular(4),
                elevation: 0,
                isExpanded: true,
                isDense: true,
                focusColor: ColorConst.transparent,
                value: _dropDownValue,
                items: _stateList.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (value) {
                  _formValidationBloc1
                      .add(FormValidationEvent.dropDown(value.toString()));
                },
              ),
            ),
          ),
          controller: _stateController,
          validator: (value) {
            if (value!.trim().isEmpty) {
              return Strings.chooseState;
            }
            return null;
          },
          readOnly: true,
        );
      },
    );
  }

  Widget _zipTextField() {
    return _textField(
      controller: _zipController,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return Strings.validZip;
        }
        return null;
      },
    );
  }

  Widget _validationForm2() {
    return BlocProvider(
      create: (context) => formValidationBloc2,
      child: BlocBuilder<FormValidationBloc, FormValidationState>(
        builder: (context, state) {
          state.whenOrNull(
            formSubmitSuccess: () {
              _secondValidateMode = AutovalidateMode.always;
            },
          );
          return Form(
            autovalidateMode: _secondValidateMode,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _formHeadingCommon('Input Type Validation'),
                    FxBox.h24,
                    _commonText('Required'),
                    _requiredTextField(),
                    _commonText('E-Mail'),
                    _emailTextField(),
                    _commonText('URL'),
                    _urlTextField(),
                    _commonText('Digits'),
                    _digitsTextField(),
                    _commonText('Number'),
                    _numberTextField(),
                    _commonText('Alphanumeric'),
                    _alphanumericTextField(),
                    // _commonText('Textarea'),
                    // _textAreaTextField(),
                    FxBox.h24,
                    Row(
                      children: [
                        FxButton(
                          borderRadius: 4,
                          onPressed: () {
                            if (_secondValidateMode !=
                                AutovalidateMode.always) {
                              formValidationBloc2
                                  .add(const FormValidationEvent.submit());
                            }
                          },
                          text: Strings.submit,
                        ),
                        // FxBox.w8,
                        // FxButton(
                        //   buttonType: ButtonType.secondary,
                        //   borderRadius: 4,
                        //   onPressed: () {
                        //     _requiredController.clear();
                        //     _passwordController.clear();
                        //     _rePasswordController.clear();
                        //     _emailController.clear();
                        //     _urlController.clear();
                        //     _digitController.clear();
                        //     _numberController.clear();
                        //     _alphaNumericController.clear();
                        //     _textAreaController.clear();
                        //   },
                        //   text: Strings.cancle,
                        // )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _requiredTextField() {
    return _textField(
      controller: _requiredController,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return "This field is required.";
        }
        return null;
      },
      hintText: 'Message',
    );
  }

  // Widget _passwordTextField() {
  //   return _textField(
  //     obscureText: true,
  //     controller: _passwordController,
  //     validator: (value) {
  //       if (value!.trim().isEmpty) {
  //         return "This field is required.";
  //       }
  //       return null;
  //     },
  //     hintText: 'Password',
  //   );
  // }

  // Widget _rePasswordTextField() {
  //   return _textField(
  //     obscureText: true,
  //     controller: _rePasswordController,
  //     validator: (value) {
  //       if (value!.trim().isEmpty) {
  //         return "This field is required.";
  //       } else if (value != _passwordController.text) {
  //         return "This value should be the same";
  //       }
  //       return null;
  //     },
  //     hintText: 'Re-Type Password',
  //   );
  // }

  Widget _emailTextField() {
    return _textField(
      controller: _emailController,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return "This field is required.";
        } else if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
            .hasMatch(value)) {
          return "This value should be a valid email.";
        }
        return null;
      },
      hintText: 'Enter an email',
    );
  }

  Widget _urlTextField() {
    return _textField(
      controller: _urlController,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return "This field is required.";
        } else if (!RegExp(
                r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)')
            .hasMatch(value)) {
          return "This value should be a valid url.";
        }
        return null;
      },
      hintText: 'URL',
    );
  }

  Widget _digitsTextField() {
    return _textField(
      controller: _digitController,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return "This field is required.";
        } else if (!RegExp(r'[0-9]+$').hasMatch(value)) {
          return "This value should be digits.";
        }
        return null;
      },
      hintText: 'Enter digits',
    );
  }

  Widget _numberTextField() {
    return _textField(
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      controller: _numberController,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return "This field is required.";
        } else if (!RegExp(r'^[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)$')
            .hasMatch(value)) {
          return "This value should be a valid number.";
        }
        return null;
      },
      hintText: 'Enter numbers',
    );
  }

  Widget _alphanumericTextField() {
    return _textField(
      controller: _alphaNumericController,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return "This field is required.";
        } else if (!RegExp("^[a-zA-Z0-9_]*\$").hasMatch(value)) {
          return "This value should be alphanumeric.";
        }
        return null;
      },
      hintText: 'Enter alphanumeric',
    );
  }

  // Widget _textAreaTextField() {
  //   return _textField(
  //     maxLines: 5,
  //     controller: _textAreaController,
  //     validator: (value) {
  //       if (value!.trim().isEmpty) {
  //         return "This field is required.";
  //       }
  //       return null;
  //     },
  //     hintText: 'Type here',
  //   );
  // }

  Widget _validationForm3() {
    return BlocProvider(
      create: (context) => formValidationBloc3,
      child: BlocBuilder<FormValidationBloc, FormValidationState>(
        builder: (context, state) {
          state.whenOrNull(
            formSubmitSuccess: () {
              _thirdValidateMode = AutovalidateMode.always;
            },
          );
          return Form(
            autovalidateMode: _thirdValidateMode,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _formHeadingCommon('Input Range Validation'),
                    FxBox.h24,
                    // _commonText('Min Length'),
                    // _minLengthTextField(),
                    // _commonText('Max Length'),
                    // _maxLengthTextField(),
                    _commonText('Range Length'),
                    _rangeLengthTextField(),
                    _commonText('Min Value'),
                    _minValueTextField(),
                    _commonText('Max Value'),
                    _maxValueTextField(),
                    _commonText('Range Value'),
                    _rangeValueTextField(),
                    _commonText('Regular Exp'),
                    _regularExpTextField(),
                    FxBox.h24,
                    Row(
                      children: [
                        FxButton(
                          borderRadius: 4,
                          onPressed: () {
                            if (_thirdValidateMode != AutovalidateMode.always) {
                              formValidationBloc3
                                  .add(const FormValidationEvent.submit());
                            }
                          },
                          text: Strings.submit,
                        ),
                        // FxBox.w8,
                        // FxButton(
                        //   buttonType: ButtonType.secondary,
                        //   borderRadius: 4,
                        //   onPressed: () {
                        //     _minLengthController.clear();
                        //     _maxLengthController.clear();
                        //     _rangeLengthController.clear();
                        //     _minValueController.clear();
                        //     _maxValueController.clear();
                        //     _rangeValueController.clear();
                        //     _regularExpController.clear();
                        //   },
                        //   text: Strings.cancle,
                        // )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Widget _minLengthTextField() {
  //   return _textField(
  //     controller: _minLengthController,
  //     validator: (value) {
  //       if (value!.trim().isEmpty) {
  //         return Strings.valueRequired;
  //       } else if (value.length < 6) {
  //         return "This value is too short. It should have 6 characters or more.";
  //       }
  //       return null;
  //     },
  //     hintText: 'Min 6 chars.',
  //   );
  // }

  // Widget _maxLengthTextField() {
  //   return _textField(
  //     controller: _maxLengthController,
  //     validator: (value) {
  //       if (value!.trim().isEmpty) {
  //         return Strings.valueRequired;
  //       } else if (value.length > 6) {
  //         return "This value is too long. It should have 6 characters or fewer.";
  //       }
  //       return null;
  //     },
  //     hintText: 'Max 6 chars.',
  //   );
  // }

  Widget _rangeLengthTextField() {
    return _textField(
      controller: _rangeLengthController,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return Strings.valueRequired;
        } else if (value.length < 5 || value.length > 10) {
          return "This value length is invalid. It should be between 5 and 10 characters long.";
        }
        return null;
      },
      hintText: 'Text Between 5 - 10 chars lenght',
    );
  }

  Widget _minValueTextField() {
    return _textField(
      controller: _minValueController,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return Strings.valueRequired;
        } else if (double.tryParse(value) == null ||
            double.tryParse(value)! < 6) {
          return "This value should be greater than or equal to 6.";
        }
        return null;
      },
      hintText: 'Min value is 6',
    );
  }

  Widget _maxValueTextField() {
    return _textField(
      controller: _maxValueController,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return Strings.valueRequired;
        } else if (double.tryParse(value) == null ||
            double.tryParse(value)! > 6) {
          return "This value should be lower than or equal to 6.";
        }
        return null;
      },
      hintText: 'Max value is 6',
    );
  }

  Widget _rangeValueTextField() {
    return _textField(
      controller: _rangeValueController,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return Strings.valueRequired;
        } else if (double.tryParse(value) == null ||
            double.tryParse(value)! < 6 ||
            double.tryParse(value)! > 100) {
          return "This value should be between 6 and 100.";
        }
        return null;
      },
      hintText: 'Number between  6 - 100',
    );
  }

  Widget _regularExpTextField() {
    return _textField(
      controller: _regularExpController,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return Strings.valueRequired;
        } else if (!RegExp("^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})\$")
            .hasMatch(value)) {
          return "This value seems to be invalid.";
        }
        return null;
      },
      hintText: 'Hex. Color',
    );
  }

  Widget _textField({
    String? Function(String?)? validator,
    TextEditingController? controller,
    String? hintText,
    TextInputType? keyboardType,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool? readOnly,
    bool? obscureText,
    int? maxLines,
  }) {
    return CustomTextField(
      maxLines: maxLines ?? 1,
      obscureText: obscureText ?? false,
      readOnly: readOnly ?? false,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      border: const OutlineInputBorder(),
      hintText: hintText,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 12,
      ),
    );
  }
}
