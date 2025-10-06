import 'dart:async';
import 'package:flutter/material.dart';
import 'package:store_app/core/themes/colors/app_colors.dart';
import 'package:store_app/core/themes/styles/styles.dart';
import '../../../../core/widgets/otp_text_field.dart';
import '../../../../core/widgets/custom_button.dart';
import '../widgets/resend_timer.dart';
import '../widgets/header_back_button.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  Timer? _timer;
  int _seconds = 60;

  bool get _canResend => _seconds == 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var c in _controllers) {
      c.dispose();
    }
    for (var f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _startTimer() {
    _seconds = 60;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds == 0) {
        timer.cancel();
      } else {
        setState(() => _seconds--);
      }
    });
  }

  void _onChanged(String value, int index) {
    if (value.length == 1 && index < 5) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  String get _otp => _controllers.map((c) => c.text).join();

  void _verify() {
    if (_otp.length == 6) {
      //context.read<AuthCubit>().verifyCode(_otp);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter all 6 digits')),
      );
    }
  }

  void _resendCode() {
    if (_canResend) {
    //  context.read<AuthCubit>().resendCode();
      _startTimer();
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
        //         const SnackBar(content: Text('Verification successful!')),
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
                        child: Text('Verification', style: AppTextStyles.heading),
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
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Image.asset('assets/images/lock.png'),
                        const SizedBox(height: 8),
                        Text(
                          'Please enter the 6-digit code sent to your email',
                          style: AppTextStyles.label.copyWith(fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 32),

                        // ✅ OTP Fields (refactored)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(6, (index) {
                            return OtpTextField(
                              controller: _controllers[index],
                              focusNode: _focusNodes[index],
                              onChanged: (value) => _onChanged(value, index),
                            );
                          }),
                        ),

                        const SizedBox(height: 32),

                        // ✅ Resend Timer (refactored)
                        ResendTimer(
                          seconds: _seconds,
                          onResend: _resendCode,
                        ),

                        const SizedBox(height: bottomBarHeight + 10),
                      ],
                    ),
                  ),
                ),
              ),

              // Bottom Button with ripple
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
                    text: 'Verify Code',
                    onPressed: _verify,
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
