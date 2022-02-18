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
            child: Padding(
              padding: EdgeInsets.fromLTRB(24.w, 40.0.h, 24.0.w, 0.h),
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
                          SizedBox(
                            height: 20.h,
                          ),
                          const Divider()
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Form(
                        key: _registerFormKey,
                        child: Column(
                          children: [
                            EmailTextField(inputController: emailController),
                            SizedBox(
                              height: 14.h,
                            ),
                            PasswordInputField(
                              textEditingController: passwordController,
                            ),
                            SizedBox(
                              height: 14.h,
                            ),
                            PasswordInputField(
                              hintText: Strings.passwordConfirmationHint,
                              textEditingController:
                                  passwordConfirmationController,
                              errorText: Strings.confirmPassword,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 48.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const CustomCheckbox(),
                          SizedBox(
                            width: 12.w,
                          ),
                          Flexible(
                            child: Text(Strings.termsandcond,
                                style: Theme.of(context).textTheme.bodyText2),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      CustomPrimaryButton(
                        buttonColor: AppColors.darkBlue,
                        textValue: Strings.registerLabel,
                        textColor: Colors.white,
                        onClick: registerRequested,
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
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
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: Text(
                              Strings.loginLabel,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(color: AppColors.darkBlue),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
