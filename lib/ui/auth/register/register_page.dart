import 'package:base_project_getx/utils/dart_extension/dart_utils.dart';
import 'package:base_project_getx/utils/flutter/extension.dart';
import 'package:base_project_getx/utils/routes/routes.dart';

import './register.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // ----------------- Controller -----------------
  final _authController = Get.find<AuthController>();

  // ----------------- Global Keys -----------------
  final _registerFormKey = GlobalKey<FormState>();

  // ----------------- Input Fields -----------------
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  // ----------------- Variables -----------------
  bool passwordVisible = false;

  // ----------------- Methods -----------------
  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  void registerRequested() async {
    if (_registerFormKey.currentState!.validate()) {
      if (passwordController.text == passwordConfirmationController.text) {
        // await _authController.register(emailController.text, passwordController.text).then((value) {
        //   Get.offAllNamed(Routes.HOME);
        // });
        Get.offAllNamed(Routes.HOME);
      } else {
        CustomSnackBar.openErrorSnackBar(
            context: context, errorText: Strings.passwordNotMatch);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: ConstrainedBox(
        constraints: const BoxConstraints(),
        child: Center(
          child: SafeArea(
            child: ConstrainedBox(
              constraints:
                  const BoxConstraints(maxWidth: Dimens.mobileScreenSize),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Strings.registerHeading,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        20.szh(),
                        const Divider()
                      ],
                    ),
                    10.szh(),
                    Form(
                      key: _registerFormKey,
                      child: Column(
                        children: [
                          EmailTextField(inputController: emailController),
                          14.szh(),
                          PasswordInputField(
                            textEditingController: passwordController,
                          ),
                          14.szh(),
                          PasswordInputField(
                            hintText: Strings.passwordConfirmationHint,
                            textEditingController:
                                passwordConfirmationController,
                            errorText: Strings.confirmPassword,
                          ),
                        ],
                      ),
                    ),
                    48.szh(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const CustomCheckbox(),
                        12.szh(),
                        Flexible(
                          child: Text(Strings.termsandcond,
                              style: Theme.of(context).textTheme.bodyText2),
                        ),
                      ],
                    ),
                    32.szh(),
                    CustomPrimaryButton(
                      buttonColor: AppColors.darkBlue,
                      textValue: Strings.registerLabel,
                      textColor: Colors.white,
                      onClick: registerRequested,
                    ),
                    50.szh(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Strings.alreadyHaveAnAccount,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(color: AppColors.grey),
                        ),
                        Text(
                          Strings.loginLabel,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(color: AppColors.darkBlue),
                        ).onTap(() {
                          Navigator.pushNamed(context, '/login');
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            ).fromLTRB(24, 40.0, 24.0, 0),
          ),
        ),
      ),
    );
  }
}
