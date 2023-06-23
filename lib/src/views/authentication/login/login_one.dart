import 'package:auto_route/auto_route.dart';
import 'package:admin_dashboard/proy/providers/auth_provider.dart';
import 'package:admin_dashboard/proy/providers/login_form_provider.dart';
import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/constant/icons.dart';
import 'package:admin_dashboard/src/constant/image.dart';
import 'package:admin_dashboard/src/constant/theme.dart';
import 'package:admin_dashboard/src/utils/responsive.dart';
import 'package:admin_dashboard/src/views/authentication/constant_auth.dart';
import 'package:admin_dashboard/src/constant/custom_text.dart';
import 'package:admin_dashboard/src/widget/custom_text_field.dart';
import 'package:admin_dashboard/src/constant/string.dart';
import 'package:admin_dashboard/src/utils/hover.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterx/flutterx.dart';
import 'package:provider/provider.dart';

@RoutePage()
class LoginOne extends StatefulWidget {
  const LoginOne({Key? key}) : super(key: key);

  @override
  State<LoginOne> createState() => _LoginOneState();
}

class _LoginOneState extends State<LoginOne> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return ChangeNotifierProvider(
      create: (_) => LoginFormProvider(),
      child: Builder(builder: (context) {
        final loginFormProvider =
            Provider.of<LoginFormProvider>(context, listen: false);

        return Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
                SelectionArea(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        Images.authBG,
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          FxBox.h20,
                          Center(
                            child: Container(
                              constraints: const BoxConstraints(
                                maxWidth: 460,
                              ),
                              padding: Responsive.isMobile(context)
                                  ? const EdgeInsets.all(32)
                                  : const EdgeInsets.all(40),
                              decoration: BoxDecoration(
                                color: isDark
                                    ? ColorConst.cardDark
                                    : ColorConst.white,
                                border: Border.all(
                                  color: isDark
                                      ? ColorConst.cardDark
                                      : ColorConst.white,
                                ),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Column(
                                children: [
                                  _logoView(),
                                  FxBox.h16,
                                  ConstantAuth.headerView(
                                      "Bienvenido de nuevo!",
                                      'Inicie sesión en su cuenta para continuar',
                                      context),
                                  _bottomView(authProvider, loginFormProvider),
                                ],
                              ),
                            ),
                          ),
                          FxBox.h20,
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _logoView() {
    return SvgPicture.asset(IconlyBroken.adminKit);
  }

  Widget _bottomView(
      AuthProvider authProvider, LoginFormProvider loginFormProvider) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: loginFormProvider.formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxBox.h28,
          ConstantAuth.labelView("Correo electrónico"),
          FxBox.h8,
          _usernameTextBoxWidget(loginFormProvider),
          FxBox.h16,
          ConstantAuth.labelView("Contraseña"),
          FxBox.h8,
          _passwordTextBoxWidget(loginFormProvider),
          FxBox.h16,
          _loginButton(authProvider, loginFormProvider),
          FxBox.h20,
          _serviceText(),
        ],
      ),
    );
  }

  Widget _serviceText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomText(
          title: "Privacidad",
          fontSize: 14,
          fontWeight: FontWeight.w600,
          textColor: isDark ? ColorConst.white : ColorConst.black,
        ),
        CustomText(
          title: "Términos",
          fontSize: 14,
          fontWeight: FontWeight.w600,
          textColor: isDark ? ColorConst.white : ColorConst.black,
        ),
        CustomText(
          title: Strings.sarvadhi2022,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          textColor: isDark ? ColorConst.white : ColorConst.black,
        ),
      ],
    );
  }

  Widget _usernameTextBoxWidget(LoginFormProvider loginFormProvider) {
    return CustomTextField(
      hintText: 'Introduce el correo electrónico',
      validator: (value) {
        value = value!.trim();
        if (!EmailValidator.validate(value)) {
          return 'Correo electrónico no válido';
        }
        return null;
      },
      onChanged: (value) => loginFormProvider.email = value.trim(),
      textCapitalization: TextCapitalization.none,
      textInputAction: TextInputAction.done,
      controller: _usernameController,
    );
  }

  Widget _passwordTextBoxWidget(LoginFormProvider loginFormProvider) {
    return CustomTextField(
      obsecureText: _obscureText,
      hintText: 'Introduce la contraseña',
      onChanged: (value) => loginFormProvider.password = value,
      validator: (value) {
        if (value == null || value.isEmpty || value.length < 6) {
          return 'Ingrese su contraseña';
        }
        return null;
      },
      textCapitalization: TextCapitalization.none,
      textInputAction: TextInputAction.done,
      controller: _passwordController,
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility : Icons.visibility_off,
        ),
        onPressed: _togglePasswordVisibility,
      ),
    );
  }

  Widget _loginButton(
      AuthProvider authProvider, LoginFormProvider loginFormProvider) {
    return FxButton(
      onPressed: () {
        final isValid = loginFormProvider.validateForm();
        if (isValid) {
          authProvider.login(
              loginFormProvider.email.trim(), loginFormProvider.password);
        }
      },
      text: 'Iniciar Sesión',
      borderRadius: 8.0,
      height: 40,
      minWidth: MediaQuery.of(context).size.width,
      color: Theme.of(context).colorScheme.primary,
    );
  }
}
