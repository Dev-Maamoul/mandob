import 'package:company_project/layer_data/init_class.dart';
import 'package:company_project/screen/home/home_screen.dart';
import 'package:company_project/screen/login/cubit/auth_cubit.dart';
import 'package:company_project/screen/login/login_screen.dart';
import 'package:company_project/screen/widgets/buttons/back_button_custom.dart';
import 'package:company_project/utils/color_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pinput/pinput.dart';

final TextEditingController otpCont = TextEditingController(text: "185637");

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        body: Builder(
          builder: (context) {
            final cubit = context.read<AuthCubit>();
            return BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is SuccessVerifyState) {
                  context.pushScreen(screen: HomeScreen());
                }
                if (state is ErrorState) {
                  ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                    SnackBar(
                      content: Text(state.text),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: BackButtonCustom(),
                  ),
                  SizedBox(height: 48),
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset('logo.png', fit: BoxFit.fitHeight),
                  ),
                  SizedBox(height: 48),
                  Text(
                    "Enter your otp sended in \n+${GetIt.I.get<InitClass>().loginData?.mobile}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorStyle.primary,
                      fontWeight: FontWeight.bold,

                      shadows: kElevationToShadow[6],
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 48),
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      if (state is LoadingOTPState) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: ColorStyle.primary,
                          ),
                        );
                      }
                      return Column(
                        children: [
                          Center(
                            child: Pinput(
                              length: 6,
                              controller: otpCont,
                              defaultPinTheme: PinTheme(
                                width: 56,
                                height: 56,
                                textStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter
                                    .digitsOnly, // Only allows digits (0-9)
                              ],
                              onCompleted: (pin) async {
                                if (pin.length == 6) {
                                  cubit.otp = pin;

                                  await cubit.verifyOTP();
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 32),
                        ],
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
