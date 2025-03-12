import 'package:company_project/screen/login/cubit/auth_cubit.dart';
import 'package:company_project/screen/widgets/buttons/button_custom.dart';
import 'package:company_project/utils/color_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

TextEditingController? textFieldController = TextEditingController(
  text: "501231209",
);

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                if (state is SuccessLoginState) {
                  // context.pushScreen(screen: OTPScreen(), canPop: true);
                  context.goNamed('/otp');
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 48),
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset('logo.png', fit: BoxFit.fitHeight),
                  ),
                  SizedBox(height: 48),
                  Text(
                    "Welcome in mandob system",
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
                      if (state is LoadingLoginState) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: ColorStyle.primary,
                          ),
                        );
                      }
                      return Column(
                        children: [
                          Center(
                            child: SizedBox(
                              width: 250,
                              child: InternationalPhoneNumberInput(
                                isEnabled: true,
                                initialValue: PhoneNumber(
                                  isoCode: PhoneNumber.getISO2CodeByPrefix(
                                    '966',
                                  ),
                                ),
                                textFieldController: textFieldController,
                                selectorConfig: SelectorConfig(
                                  trailingSpace: false,
                                  setSelectorButtonAsPrefixIcon: true,
                                  leadingPadding: 20,
                                  selectorType:
                                      PhoneInputSelectorType.BOTTOM_SHEET,
                                ),
                                formatInput: true,
                                keyboardType: TextInputType.number,
                                countrySelectorScrollControlled: true,
                                spaceBetweenSelectorAndTextField: 16,
                                inputDecoration: InputDecoration(
                                  hintText: '5XXXXXXXX',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: ColorStyle.primary,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: ColorStyle.primary,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: ColorStyle.primary,
                                      width: 2,
                                    ),
                                  ),
                                  constraints: BoxConstraints(maxWidth: 250),
                                ),

                                inputBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ColorStyle.primary,
                                  ),
                                ),

                                onInputChanged: (PhoneNumber value) {
                                  cubit.mobile = value.phoneNumber!;
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 32),
                          ButtonCustom(
                            onPressed: () async {
                              await cubit.login();
                            },
                          ),
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
