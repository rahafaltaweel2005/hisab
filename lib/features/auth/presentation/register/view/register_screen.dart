import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hiasb_app/core/constant/color_const.dart';
import 'package:hiasb_app/core/constant/svg_const.dart';
import 'package:hiasb_app/features/auth/presentation/register/cubit/register_cubit.dart';
import 'package:hiasb_app/features/auth/presentation/register/state/register_state.dart';
import '../../../../../core/textfield/hiasb_text_field.dart';
import '../../../../profile/presentation/view/profile_screen.dart';
import '../../login/cubit/login_cubit.dart';
import '../../login/state/login_state.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final PageController controller = PageController();
  final TextEditingController displayNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  int currentPage = 0;
  bool isPasswordHidden = true;

  @override
  void dispose() {
    controller.dispose();
    displayNameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void togglePassword() {
    setState(() {
      isPasswordHidden = !isPasswordHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: size.height * 0.1),
          child: Column(

            children: [
              Container(
                height: size.height * 0.1,
                width: size.width * 0.2,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: SvgPicture.asset(SvgConst.logo),
              ),
              Text(
                "Hiasb".tr(),
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: ColorConst.textDark,
                  decoration: TextDecoration.none,
                ),
              ),
              Text(
                "Financial Project Management".tr(),
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: ColorConst.neutral,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Center(
                child: Container(
                  width: size.width * 0.9,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorConst.surfaceLight,
                  ),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            currentPage = 0;
                          });
                          controller.animateToPage(
                            0,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          padding: EdgeInsets.all(15),
                          minimumSize: Size(172, 30),
                          backgroundColor: currentPage == 0
                              ? Color(0xFFFFFFFF)
                              : ColorConst.surfaceLight,
                        ),
                        child: Text(
                          "Register".tr(),
                          style: TextStyle(
                            color: ColorConst.textDark,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            currentPage = 1;
                          });
                          controller.animateToPage(
                            1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          padding: EdgeInsets.all(15),
                          minimumSize: Size(172, 30),
                          backgroundColor: currentPage == 1
                              ? Color(0xFFFFFFFF)
                              : ColorConst.surfaceLight,
                        ),
                        child: Text(
                          "Login".tr(),
                          style: TextStyle(
                            color: ColorConst.textDark,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Container(
                width: size.width * 0.9,
                height: size.height * 0.45,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFFFFFFF),
                ),
                child: PageView(
                  controller: controller,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  children: [
                    BlocConsumer<RegisterCubit, RegisterState>(
                      builder: (context, state) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            HiasbTextField(
                              controller: displayNameController,
                              title: 'Full Name'.tr(),
                              hint: 'Mohammad'.tr(),
                              prefixIcon: Icon(
                                Icons.person_2_outlined,
                                color: ColorConst.neutral,
                                size: 20,
                              ),
                              obscureText: false,
                            ),
                            SizedBox(height: size.height * 0.01),
                            HiasbTextField(
                              controller: emailController,
                              title: 'Email'.tr(),
                              hint: 'name@company.com'.tr(),
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: ColorConst.neutral,
                                size: 20,
                              ),
                              obscureText: false,
                            ),
                            SizedBox(height: size.height * 0.01),
                            HiasbTextField(
                              controller: passwordController,
                              title: 'Password'.tr(),
                              hint: '.....',
                              prefixIcon: TextButton(
                                onPressed: () {
                                  togglePassword();
                                },
                                child: isPasswordHidden
                                    ? const Icon(
                                  Icons.visibility_off_outlined,
                                  color: ColorConst.primary,
                                )
                                    : const Icon(
                                  Icons.visibility_outlined,
                                  color: ColorConst.primary,
                                ),
                              ),
                              obscureText: isPasswordHidden,
                            ),
                            SizedBox(height: size.height * 0.02),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorConst.positive,
                              ),
                              onPressed: () {
                                context.read<RegisterCubit>().register(
                                  displayName: displayNameController.text
                                      .trim(),
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Create account'.tr()),
                                  SizedBox(width: size.width * 0.01),
                                  Icon(Icons.check_circle_outlined),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                      listener: (context, state) {
                        if (state is RegisterErrorState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.message)),
                          );
                        }
                        if (state is RegisterSuccessState) {
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) =>
                              ProfileScreen(),));
                        }
                      },
                    ),
                    BlocConsumer<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            HiasbTextField(
                              controller: emailController,
                              title: 'Email'.tr(),
                              hint: 'name@company.com'.tr(),
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: ColorConst.neutral,
                                size: 20,
                              ),
                              obscureText: false,
                            ),
                            SizedBox(height: size.height * 0.01),
                            HiasbTextField(
                              controller: passwordController,
                              title: 'Password'.tr(),
                              hint: '.....',
                              prefixIcon: TextButton(
                                onPressed: () {
                                  togglePassword();
                                },
                                child: isPasswordHidden
                                    ? const Icon(
                                  Icons.visibility_off_outlined,
                                  color: ColorConst.primary,
                                )
                                    : const Icon(
                                  Icons.visibility_outlined,
                                  color: ColorConst.primary,
                                ),
                              ),
                              obscureText: isPasswordHidden,
                            ),
                            SizedBox(height: size.height * 0.02),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorConst.textDark,
                              ),
                              onPressed: () {
                                context.read<LoginCubit>().login(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('login'.tr()),
                                  Icon(Icons.keyboard_double_arrow_left),
                                  SizedBox(width: size.width * 0.01),

                                ],
                              ),
                            ),
                          ],
                        );
                      },
                      listener: (context, state) {
                        if (state is LoginErrorState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.message)),
                          );
                        }
                        if (state is LoginSuccessState) {
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) =>
                              ProfileScreen(),));
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
