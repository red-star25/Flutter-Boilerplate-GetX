import 'package:base_project_getx/constants/colors.dart';
import 'package:base_project_getx/constants/strings.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController inputController;
  final String? hintText;
  final String? errorText;
  const EmailTextField(
      {Key? key, required this.inputController, this.hintText, this.errorText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputController,
      style: const TextStyle(fontSize: 14, color: Colors.black),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText ?? Strings.emailHint,
        filled: true,
        fillColor: AppColors.accentTextInputColor,
        hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
        border: const OutlineInputBorder(
          borderSide:
              BorderSide(color: AppColors.primaryTextInputColor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: AppColors.secondaryTextInputColor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: AppColors.errorTextInputColor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: AppColors.primaryTextInputColor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
      validator: (val) {
        if (!EmailValidator.validate(val!)) {
          return 'Enter valid email';
        }
        return null;
      },
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController inputController;
  final String hintText;
  final String errorText;

  const CustomTextField({
    Key? key,
    required this.inputController,
    required this.hintText,
    required this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputController,
      style: const TextStyle(fontSize: 14, color: Colors.black),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: AppColors.accentTextInputColor,
        hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
        border: const OutlineInputBorder(
          borderSide:
              BorderSide(color: AppColors.primaryTextInputColor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: AppColors.secondaryTextInputColor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: AppColors.errorTextInputColor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: AppColors.primaryTextInputColor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
      validator: (val) {
        if (!EmailValidator.validate(val!)) {
          return 'Enter valid email';
        }
        return null;
      },
    );
  }
}

class RatingWidget extends StatefulWidget {
  const RatingWidget({Key? key}) : super(key: key);

  @override
  _RatingWidgetState createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  late List<bool> rating;
  @override
  void initState() {
    super.initState();
    rating = [false, false, false, false, false];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RatingStar(
            selected: rating[0],
            onPressed: () {
              setState(() {
                rating[0] = true;
                if (rating[0]) {
                  rating[1] = false;
                  rating[2] = false;
                  rating[3] = false;
                  rating[4] = false;
                }
              });
            }),
        RatingStar(
            selected: rating[1],
            onPressed: () {
              setState(() {
                rating[0] = true;
                rating[1] = true;
                if (rating[1]) {
                  rating[2] = false;
                  rating[3] = false;
                  rating[4] = false;
                }
              });
            }),
        RatingStar(
            selected: rating[2],
            onPressed: () {
              setState(() {
                rating[0] = true;
                rating[1] = true;
                rating[2] = true;
                if (rating[2]) {
                  rating[3] = false;
                  rating[4] = false;
                }
              });
            }),
        RatingStar(
            selected: rating[3],
            onPressed: () {
              setState(() {
                rating[0] = true;
                rating[1] = true;
                rating[2] = true;
                rating[3] = true;
                if (rating[3]) {
                  rating[4] = false;
                }
              });
            }),
        RatingStar(
            selected: rating[4],
            onPressed: () {
              setState(() {
                rating[0] = true;
                rating[1] = true;
                rating[2] = true;
                rating[3] = true;
                rating[4] = true;
              });
            }),
      ],
    );
  }
}

class RatingStar extends StatelessWidget {
  final bool selected;
  final Function() onPressed;

  const RatingStar({required this.selected, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Image.network(selected
          ? "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/Star%20(1).png?alt=media&token=8fcd6d83-829c-4f1a-b4c4-780e44ee0a04"
          : "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/Star.png?alt=media&token=60006252-d156-45d0-9ce4-aad6ceee7429"),
    );
  }
}

class PasswordInputField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String? hintText;
  final String? errorText;

  const PasswordInputField(
      {required this.textEditingController,
      Key? key,
      this.hintText,
      this.errorText})
      : super(key: key);

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool pwdVisibility = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      obscureText: !pwdVisibility,
      style: const TextStyle(fontSize: 14, color: Colors.black),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: widget.hintText ?? Strings.passwordHint,
        filled: true,
        fillColor: AppColors.accentTextInputColor,
        hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
        border: const OutlineInputBorder(
          borderSide:
              BorderSide(color: AppColors.primaryTextInputColor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: AppColors.secondaryTextInputColor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: AppColors.errorTextInputColor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: AppColors.primaryTextInputColor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        suffixIcon: InkWell(
          onTap: () => setState(
            () => pwdVisibility = !pwdVisibility,
          ),
          child: Icon(
            pwdVisibility
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: Colors.grey.shade400,
            size: 18,
          ),
        ),
      ),
      validator: (val) {
        if (val!.length <= 5) {
          return widget.errorText ?? 'Enter valid password';
        }
        return null;
      },
    );
  }
}
