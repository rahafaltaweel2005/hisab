import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hiasb_app/core/constant/color_const.dart';
import 'package:hiasb_app/core/constant/svg_const.dart';
import 'package:hiasb_app/features/auth/presentation/register/cubit/register_cubit.dart';
import 'package:hiasb_app/features/auth/presentation/register/state/register_state.dart';
import '../../../../../core/textfield/hisab_text_field.dart';
import '../../../../core/constant/app_spacing.dart';
import '../../../home/presentation/view/home_screen.dart';
import '../login/cubit/login_cubit.dart';
import '../login/state/login_state.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController displayNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  int currentPage = 1;
  bool isPasswordHidden = true;

  @override
  void dispose() {

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
  Widget _buildRegisterForm() {

    return   BlocConsumer<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HisabTextField(
              controller: displayNameController,
              title: 'full name'.tr(),
              hint: 'Mohammad'.tr(),
              prefixIcon: Icon(
                Icons.person_2_outlined,
                color: ColorConst.neutral,
                size: 20,
              ),
              obscureText: false,
            ),
            const SizedBox(height: AppSpacing.md),
            HisabTextField(
              controller: emailController,
              title: 'email'.tr(),
              hint: 'name@company.com'.tr(),
              prefixIcon: Icon(
                Icons.email_outlined,
                color: ColorConst.neutral,
                size: 20,
              ),
              obscureText: false,
            ),
            const SizedBox(height: AppSpacing.md),
            HisabTextField(
              controller: passwordController,
              title: 'password'.tr(),
              hint: '••••••••',
              prefixIcon: const Icon(
                Icons.lock_outline,
                color: ColorConst.neutral,
                size: 20,
              ),
              suffixIcon: IconButton(
                onPressed: togglePassword,
                icon: Icon(
                  isPasswordHidden
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
              ),
              obscureText: isPasswordHidden,
            ),
            const SizedBox(height: AppSpacing.lg),
            ElevatedButton(
              onPressed: () {
                context.read<RegisterCubit>().register(
                  displayName: displayNameController.text
                      .trim(),
                  email: emailController.text.trim(),
                  password: passwordController.text,
                );
              },
              child: Row(
                spacing: AppSpacing.sm,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('create account'.tr()),
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
              HomeScreen(),));
        }
      },
    );
  }

  Widget _buildLoginForm() {

    return BlocConsumer<LoginCubit, LoginState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HisabTextField(
              controller: emailController,
              title: 'email'.tr(),
              hint: 'name@company.com'.tr(),
              prefixIcon: Icon(
                Icons.email_outlined,
                color: ColorConst.neutral,
                size: 20,
              ),
              obscureText: false,
            ),
           const SizedBox(height: AppSpacing.md),
            HisabTextField(
              controller: passwordController,
              title: 'password'.tr(),
              hint: '••••••••',
              prefixIcon: const Icon(
                Icons.lock_outline,
                color: ColorConst.neutral,
                size: 20,
              ),
              suffixIcon: IconButton(
                onPressed: togglePassword,
                icon: Icon(
                  isPasswordHidden
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
              ),
              obscureText: isPasswordHidden,
            ),
            const SizedBox(height: AppSpacing.lg),
            ElevatedButton(
              onPressed: () {
                context.read<LoginCubit>().login(
                  email: emailController.text.trim(),
                  password: passwordController.text,
                );
              },
              child: Row(
                spacing: AppSpacing.sm,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('login'.tr()),
                  Icon(Icons.login_outlined),

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
              HomeScreen(),));
        }
      },
    );
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
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.xxl,
          ),
          child: Column(

            children: [
              SizedBox(
                  height: 72,
                  width: 72,
                  child: SvgPicture.asset(SvgConst.logo)
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                "hisab".tr(),
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: ColorConst.textDark,
                  decoration: TextDecoration.none,
                ),
              ),
              Text(
                "financial project management".tr(),
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: ColorConst.neutral,
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
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
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              currentPage = 0;
                            });

                          },
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            padding: EdgeInsets.all(15),
                            backgroundColor: currentPage == 0
                                ? Color(0xFFFFFFFF)
                                : ColorConst.surfaceLight,
                          ),
                          child: Text(
                            "register".tr(),
                            style: TextStyle(
                              color: ColorConst.textDark,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              currentPage = 1;
                            });

                          },
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            padding: EdgeInsets.all(15),
                            backgroundColor: currentPage == 1
                                ? Color(0xFFFFFFFF)
                                : ColorConst.surfaceLight,
                          ),
                          child: Text(
                            "login".tr(),
                            style: TextStyle(
                              color: ColorConst.textDark,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Container(
                width: size.width * 0.9,
                padding: EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFFFFFFF),
                ),
                child: currentPage == 0 ? _buildRegisterForm() : _buildLoginForm(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
