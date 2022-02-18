import 'package:base_project_getx/utils/routes/routes.dart';

import './login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // --------------------- Controller ---------------------
  final _authController = Get.find<AuthController>();

  // --------------------- Global Keys ---------------------
  final _loginFormKey = GlobalKey<FormState>();

  // --------------------- Input Fields ---------------------
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // --------------------- Variables ---------------------
  bool passwordVisible = false;

  // --------------------- Functions ---------------------
  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  void _loginRequested() async {
    if (_loginFormKey.currentState!.validate()) {
      // await _authController
      //     .login(emailController.text, passwordController.text)
      //     .then((value) {
      //   Get.offAllNamed(Routes.HOME);
      // });
      Get.offAllNamed(Routes.HOME);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 40.0, 24.0, 0),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height,
                maxWidth: Dimens.mobileScreenSize,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Strings.loginHeading,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider()
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Form(
                      key: _loginFormKey,
                      child: Column(
                        children: [
                          EmailTextField(
                            inputController: emailController,
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          PasswordInputField(
                            textEditingController: passwordController,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const CustomCheckbox(),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(Strings.rememberMe,
                            style: Theme.of(context).textTheme.bodyText2),
                      ],
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    CustomPrimaryButton(
                      buttonColor: AppColors.darkBlue,
                      textValue: Strings.loginLabel,
                      textColor: Colors.white,
                      onClick: () {
                        _loginRequested();
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Center(
                      child: Text(
                        'OR',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: AppColors.grey),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    // Google Sign In
                    CustomPrimaryButton(
                      buttonColor: AppColors.lightGrey,
                      textValue: Strings.loginWithGoogle,
                      textColor: AppColors.black,
                      onClick: () {},
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Strings.dontHaveAccount,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(color: AppColors.grey),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: Text(
                            Strings.registerLabel,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(color: AppColors.darkBlue),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/forgot-password');
                      },
                      child: Text(
                        Strings.forgotPassword,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: AppColors.darkBlue, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
