import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/constant/string.dart';
import 'package:admin_dashboard/src/provider/form/form_repeater/bloc/form_repeater_bloc.dart';
import 'package:admin_dashboard/src/utils/responsive.dart';
import 'package:admin_dashboard/src/widget/textformfield.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterx/flutterx.dart';

class RepeaterForm extends StatefulWidget {
  const RepeaterForm({Key? key}) : super(key: key);

  @override
  State<RepeaterForm> createState() => _RepeaterFormState();
}

class _RepeaterFormState extends State<RepeaterForm> {
  final FormRepeaterBloc _formRepeaterBloc = FormRepeaterBloc();

  FilePickerResult? _file;
  final List<String> _fileNameList = ['No chosen file'];
  final List<TextEditingController> _messageControllerList = [
    TextEditingController()
  ];
  final List<TextEditingController> _nameControllerList = [
    TextEditingController()
  ];
  final List<TextEditingController> _emailControllerList = [
    TextEditingController()
  ];
  final List<TextEditingController> _subjectControllerList = [
    TextEditingController()
  ];

  final List<TextEditingController> _phoneControllerList = [
    TextEditingController()
  ];

  String _isSelected = '';

  @override
  Widget build(BuildContext context) {
    BuildContext mainContext = context;
    return BlocProvider(
      create: (context) => _formRepeaterBloc,
      child: Column(
        children: [
          _exampleForm(mainContext),
          FxBox.h20,
          _nestedForm(mainContext),
        ],
      ),
    );
  }

  Widget _exampleForm(BuildContext mainContext) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nested Form',
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            BlocConsumer<FormRepeaterBloc, FormRepeaterState>(
              listener: (context, state) {
                state.whenOrNull(
                  addSuceess: (fileName, nameController, emailController,
                      subjectController, messageController) {
                    _fileNameList.add(fileName);
                    _messageControllerList.add(messageController);
                    _nameControllerList.add(nameController);
                    _emailControllerList.add(emailController);
                    _subjectControllerList.add(subjectController);
                  },
                  deleteSuceess: (index) {
                    _fileNameList.removeAt(index);
                    _messageControllerList.removeAt(index);
                    _nameControllerList.removeAt(index);
                    _emailControllerList.removeAt(index);
                    _subjectControllerList.removeAt(index);
                  },
                  addFileSuceess: (fileName, index) {
                    _fileNameList[index] = fileName;
                  },
                );
              },
              builder: (context, state) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: _fileNameList.length,
                  itemBuilder: (context, index) {
                    if (Responsive.isWeb(mainContext)) {
                      return _exampleFormWeb(index);
                    } else {
                      return _exampleTabNmobile(index, mainContext);
                    }
                  },
                );
              },
            ),
            FxBox.h24,
            FxButton(
              height: 45,
              buttonType: ButtonType.success,
              borderRadius: 15.0,
              text: 'Add',
              onPressed: () {
                _formRepeaterBloc.add(FormRepeaterEvent.add(
                    'No chosen file',
                    TextEditingController(),
                    TextEditingController(),
                    TextEditingController(),
                    TextEditingController()));
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _exampleFormWeb(int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _exampleCommonView(
          _commonText('Name'),
          _commonTextField('Enter your name', _nameControllerList[index]),
        ),
        FxBox.w24,
        _exampleCommonView(
          _commonText('Email'),
          _commonTextField('Enter your email', _emailControllerList[index]),
        ),
        FxBox.w24,
        _exampleCommonView(
          _commonText('Subject'),
          _commonTextField('Enter your subject', _subjectControllerList[index]),
        ),
        FxBox.w24,
        _exampleCommonView(
          _commonText('Resume'),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                _pickFile(index);
              },
              child: _resumeTextField(_fileNameList[index]),
            ),
          ),
        ),
        FxBox.w24,
        _exampleCommonView(
          _commonText('Message'),
          _commonTextField('Type here...', _messageControllerList[index],
              maxLines: 2),
        ),
        FxBox.w24,
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 36.0),
            child: _exampleDeleteButton(index, false),
          ),
        ),
      ],
    );
  }

  Widget _exampleTabNmobile(int index, BuildContext mainContext) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _commonText('Name'),
        _commonTextField('Enter your name', _nameControllerList[index]),
        _commonText('Email'),
        _commonTextField('Enter your email', _emailControllerList[index]),
        _commonText('Subject'),
        _commonTextField('Enter your subject', _subjectControllerList[index]),
        _commonText('Resume'),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              _pickFile(index);
            },
            child: _resumeTextField(_fileNameList[index]),
          ),
        ),
        _commonText('Message'),
        Responsive.isTablet(mainContext)
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 7,
                    child: _commonTextField(
                        'Type here...', _messageControllerList[index],
                        maxLines: 2),
                  ),
                  FxBox.w24,
                  Expanded(
                    flex: 3,
                    child: _exampleDeleteButton(index, true),
                  ),
                ],
              )
            : Column(
                children: [
                  _commonTextField(
                      'Type here...', _messageControllerList[index],
                      maxLines: 2),
                  FxBox.h12,
                  _exampleDeleteButton(index, true),
                ],
              ),
      ],
    );
  }

  Widget _exampleDeleteButton(int index, bool fullWidth) {
    return FxButton(
      height: 45,
      fullWidth: fullWidth,
      borderRadius: 15.0,
      text: 'Remove',
      onPressed: () {
        FxAlert.showAlert(
          barrierDismissible: false,
          context: context,
          title: 'Delete',
          content: const Text(
            'Are you sure you want to delete this element?',
          ),
          actions: [
            FxButton(
                buttonType: ButtonType.secondary,
                text: 'Cancel',
                onPressed: () {
                  Navigator.pop(context);
                }),
            FxButton(
              text: 'Ok',
              onPressed: () {
                _formRepeaterBloc.add(FormRepeaterEvent.delete(index));
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  Widget _exampleCommonView(Widget title, Widget textField) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [title, textField],
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

  Widget _commonTextField(String hintText, TextEditingController controller,
      {int? maxLines = 1}) {
    return CustomTextField(
      maxLines: maxLines,
      controller: controller,
      border: const OutlineInputBorder(),
      hintText: hintText,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 12,
      ),
    );
  }

  Widget _resumeTextField(String fileName) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorConst.lightGrey.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(4.0),
      ),
      height: 39,
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: ColorConst.lightGrey.withOpacity(0.4),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(3.0),
                topLeft: Radius.circular(3.0),
              ),
            ),
            height: double.infinity,
            child: const Text('Choose file'),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              fileName,
              style: const TextStyle(overflow: TextOverflow.ellipsis),
            ),
          )),
        ],
      ),
    );
  }

  Future<void> _pickFile(int index) async {
    _file = await FilePicker.platform.pickFiles();
    if (_file == null) return;
    _formRepeaterBloc
        .add(FormRepeaterEvent.addFile(_file!.files[0].name, index));
  }

  Widget _nestedForm(BuildContext mainContext) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nested Field form',
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            _commonText('Name'),
            _commonTextField('Enter your Name...', TextEditingController()),
            _commonText('Email :'),
            _commonTextField('Enter your Email...', TextEditingController()),
            _commonText('Phone no :'),
            BlocConsumer<FormRepeaterBloc, FormRepeaterState>(
              listener: (context, state) {
                state.whenOrNull(
                  addPhoneSuceess: (phoneController) {
                    _phoneControllerList.add(phoneController);
                  },
                  deletePhoneSuceess: (index) {
                    _phoneControllerList.removeAt(index);
                  },
                );
              },
              builder: (context, state) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: _phoneControllerList.length,
                  itemBuilder: (context, index) {
                    if (Responsive.isWeb(mainContext) ||
                        Responsive.isTablet(mainContext)) {
                      return Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 8,
                                child: _commonTextField(
                                    'Enter your phone no...',
                                    _phoneControllerList[index]),
                              ),
                              FxBox.w24,
                              Expanded(
                                child: _addRemoveButton(index),
                              )
                              // Expanded(
                              //   flex: 2,
                              //   child: _nestedDeleteButton(false, index),
                              // )
                            ],
                          ),
                          _phoneControllerList.length > 1
                              ? FxBox.h16
                              : const SizedBox.shrink()
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          _commonTextField('Enter your phone no...',
                              _phoneControllerList[index]),
                          FxBox.h12,
                          _addRemoveButton(index),
                          //_nestedDeleteButton(true, index),
                          FxBox.h12,
                        ],
                      );
                    }
                  },
                );
              },
            ),
            //FxBox.h16,
            //_addPhoneButton(),
            FxBox.h24,
            _commonText('Gender :'),
            _radioButton(),
            FxBox.h16,
            _commonText('Message'),
            _commonTextField('Type text...', TextEditingController(),
                maxLines: 2),
            FxBox.h16,
            FxButton(
              height: 45,
              borderRadius: 4.0,
              text: Strings.submit,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

  Widget _addRemoveButton(int index) {
    return Row(
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                _formRepeaterBloc.add(
                  FormRepeaterEvent.addPhone(
                    TextEditingController(),
                  ),
                );
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: ColorConst.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.add,
                  color: ColorConst.white,
                ),
              ),
            ),
            FxBox.w20,
            if (_phoneControllerList.length >= 2) ...{
              InkWell(
                onTap: () {
                  _formRepeaterBloc.add(
                    FormRepeaterEvent.deletePhone(index),
                  );
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: ColorConst.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.remove,
                    color: ColorConst.white,
                  ),
                ),
              ),
            }
          ],
        ),
      ],
    );
  }

  Widget _radioButton() {
    return BlocBuilder<FormRepeaterBloc, FormRepeaterState>(
      builder: (context, state) {
        state.whenOrNull(
          radioSelectSuceess: (value) {
            _isSelected = value;
          },
        );
        return Row(
          children: [
            Radio(
              value: 'Male',
              groupValue: _isSelected,
              onChanged: (value) {
                _formRepeaterBloc
                    .add(FormRepeaterEvent.radioSelect(value.toString()));
              },
            ),
            const Text('Male'),
            Radio(
              value: 'Female',
              groupValue: _isSelected,
              onChanged: (value) {
                _formRepeaterBloc
                    .add(FormRepeaterEvent.radioSelect(value.toString()));
              },
            ),
            const Text('Female'),
          ],
        );
      },
    );
  }

  // Widget _nestedDeleteButton(bool fullWidth, int index) {
  //   return FxButton(
  //     height: 45,
  //     fullWidth: fullWidth,
  //     borderRadius: 16.0,
  //     text: 'Remove',
  //     onPressed: () {
  //       _formRepeaterBloc.add(FormRepeaterEvent.deletePhone(index));
  //     },
  //   );
  // }

  // Widget _addPhoneButton() {
  //   return FxButton(
  //     height: 45,
  //     buttonType: ButtonType.success,
  //     borderRadius: 15.0,
  //     text: Strings.addNumber,
  //     onPressed: () {
  //       _formRepeaterBloc
  //           .add(FormRepeaterEvent.addPhone(TextEditingController()));
  //     },
  //   );
  // }
}
