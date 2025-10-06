import 'package:flutter/material.dart';
import 'package:store_app/core/themes/colors/app_colors.dart';
import 'package:store_app/core/themes/styles/styles.dart';
import 'package:store_app/core/util/validators.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/custom_switch.dart';
import '../widgets/header_back_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  bool remember = false;
  bool obscure = true;

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      // context.read<AuthCubit>().signUp(
      //       username: "${_firstName.text.trim()} ${_lastName.text.trim()}",
      //       email: _email.text.trim(),
      //       password: _password.text,
      //       remember: remember,
      //     );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomBarHeight = 72.0;

    return Scaffold(
      body: SafeArea(
        // child: BlocListener<AuthCubit, AuthState>(
        //   listener: (context, state) {
        //     if (state is AuthSuccess) {
        //       ScaffoldMessenger.of(context).showSnackBar(
        //         const SnackBar(content: Text('Sign up succeeded (UI demo)')),
        //       );
        //     } else if (state is AuthFailure) {
        //       ScaffoldMessenger.of(context).showSnackBar(
        //         SnackBar(content: Text(state.message)),
        //       );
        //     }
        //   },
          child: Column(
            children: [
              // Header with back button and title
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 8),
                child: Row(
                  children:  [
                    HeaderBackButton(),
                    SizedBox(width: 12),
                    Expanded(
                      child: Center(
                        child: Text('Sign Up', style: AppTextStyles.heading),
                      ),
                    ),
                    SizedBox(width: 40),
                  ],
                ),
              ),

              // Centered form
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            label: 'First Name',
                            controller: _firstName,
                            hint: 'Enter your first name',
                            validator: Validators.notEmpty,
                          ),
                          const SizedBox(height: 14),
                          CustomTextField(
                            label: 'Last Name',
                            controller: _lastName,
                            hint: 'Enter your last name',
                            validator: Validators.notEmpty,
                          ),
                          const SizedBox(height: 14),
                          CustomTextField(
                            label: 'Email Address',
                            controller: _email,
                            hint: 'example@email.com',
                            keyboardType: TextInputType.emailAddress,
                            validator: Validators.email,
                          ),
                          const SizedBox(height: 14),
                          CustomTextField(
                            label: 'Password',
                            controller: _password,
                            hint: 'Enter your password',
                            obscureText: obscure,
                            suffix: IconButton(
                              icon: Icon(
                                obscure ? Icons.visibility_off : Icons.visibility,
                                color: AppColors.muted,
                              ),
                              onPressed: () => setState(() => obscure = !obscure),
                            ),
                            validator: Validators.password,
                          ),
                          const SizedBox(height: 22),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Remember me',
                                style: TextStyle(fontSize: 14),
                              ),
                              CustomSwitch(
                                value: remember,
                                onChanged: (v) => setState(() => remember = v),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Text(
                            'By creating an account you agree to our Terms and Conditions',
                            style: AppTextStyles.label.copyWith(fontSize: 11),
                            textAlign: TextAlign.center,
                          ),
                           SizedBox(height: bottomBarHeight + 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Bottom button bar
              Container(
                width: double.infinity,
                height: bottomBarHeight,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
                ),
                child: SafeArea(
                  top: false,
                  child: CustomButton(
                    text: 'Sign Up',
                    onPressed: _submit,
                    enabled: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
