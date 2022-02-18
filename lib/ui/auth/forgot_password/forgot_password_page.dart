import 'package:base_project_getx/ui/auth/register/register.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  // ------------ Controller ------------
  final _authController = Get.find<AuthController>();

  // ------------ Input Controller ---------------
  final _forgotPasswordController = TextEditingController();

  // ------------ Global Keys -----------------
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Center(
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
                          Strings.forgotPasswordLabel,
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
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            inputController: _forgotPasswordController,
                            hintText: "Enter you email id",
                            errorText: "Please enter your email id",
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomPrimaryButton(
                      buttonColor: AppColors.darkBlue,
                      textValue: "Submit",
                      textColor: AppColors.white,
                      onClick: () {
                        if (_formKey.currentState!.validate()) {
                          _authController.forgotPassword(
                            email: _forgotPasswordController.text,
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
