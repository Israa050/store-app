
import 'package:flutter/material.dart';
import 'package:store_app/core/themes/colors/app_colors.dart';
import 'package:store_app/core/themes/styles/styles.dart';
import 'package:store_app/core/util/validators.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/custom_switch.dart';
import '../widgets/header_back_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool obscure = true;
  bool remember = false;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      // context.read<AuthCubit>().signUp( // using signUp temporarily, you’ll replace with login()
      //       username: '',
      //       email: _email.text.trim(),
      //       password: _password.text,
      //       remember: remember,
      //     );
    }
  }

  @override
  Widget build(BuildContext context) {
    const bottomBarHeight = 72.0;

    return Scaffold(
      body: SafeArea(
        // child: BlocListener<AuthCubit, AuthState>(
        //   listener: (context, state) {
        //     if (state is AuthSuccess) {
        //       ScaffoldMessenger.of(context).showSnackBar(
        //         const SnackBar(content: Text('Login succeeded (UI demo)')),
        //       );
        //     } else if (state is AuthFailure) {
        //       ScaffoldMessenger.of(context).showSnackBar(
        //         SnackBar(content: Text(state.message)),
        //       );
        //     }
        //   },
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 8),
                child: Row(
                  children:  [
                    HeaderBackButton(),
                    SizedBox(width: 12),
                    Expanded(
                      child: Center(
                        child: Text('Welcome', style: AppTextStyles.heading),
                      ),
                    ),
                    SizedBox(width: 40),
                  ],
                ),
              ),

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
                          const SizedBox(height: 6),
                          Text(
                            'Please enter your data to continue',
                            style: AppTextStyles.label,
                          ),
                          const SizedBox(height: 24),

                          // Email Field
                          CustomTextField(
                            label: 'Email Address',
                            controller: _email,
                            hint: 'example@email.com',
                            keyboardType: TextInputType.emailAddress,
                            validator: Validators.email,
                          ),
                          const SizedBox(height: 14),

                          // Password Field
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

                          const SizedBox(height: 10),

                          // Forgot password row
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                // TODO: navigate to forgot password
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: const Size(0, 0),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                'Forgot password?',
                                style: AppTextStyles.label.copyWith(
                                  color: Colors.red,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),

                          // Remember me
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Remember me', style: TextStyle(fontSize: 14)),
                              CustomSwitch(
                                value: remember,
                                onChanged: (v) => setState(() => remember = v),
                              ),
                            ],
                          ),

                          const SizedBox(height: 40),
                          Text(
                            'By connecting your account, confirm that you agree with our Terms and Conditions',
                            style: AppTextStyles.label.copyWith(fontSize: 11),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: bottomBarHeight + 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Bottom Action Button
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
                    text: 'Login',
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
