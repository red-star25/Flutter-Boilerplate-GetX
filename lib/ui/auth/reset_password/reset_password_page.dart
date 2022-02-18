import 'package:base_project_getx/ui/auth/register/register.dart';
import 'package:base_project_getx/utils/dart_extension/dart_utils.dart';
import 'package:base_project_getx/utils/flutter/extension.dart';

class ResetPasswordPage extends StatelessWidget {
  ResetPasswordPage({Key? key}) : super(key: key);

  // ------------ Controller ------------
  final _authController = Get.find<AuthController>();

  // ------------ Input Controller ---------------
  final _oldPasswordCtlr = TextEditingController();
  final _newPasswordCtlr = TextEditingController();

  // ------------ Global Keys ------------
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Center(
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
                      Strings.resetPasswordLabel,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    20.szh(),
                    const Divider()
                  ],
                ),
                10.szh(),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      PasswordInputField(
                        textEditingController: _oldPasswordCtlr,
                        hintText: Strings.oldPasswordHint,
                      ),
                      20.szh(),
                      PasswordInputField(
                        textEditingController: _newPasswordCtlr,
                        hintText: Strings.newPasswordHint,
                      ),
                    ],
                  ),
                ),
                20.szh(),
                CustomPrimaryButton(
                  buttonColor: AppColors.darkBlue,
                  textValue: Strings.reset,
                  textColor: AppColors.white,
                  onClick: () {
                    if (_formKey.currentState!.validate()) {
                      _authController.resetPassword(
                        newPassword: _newPasswordCtlr.text,
                        oldPassword: _oldPasswordCtlr.text,
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ).fromLTRB(24, 40.0, 24.0, 0),
      ),
    );
  }
}
