import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hiasb_app/core/constant/svg_const.dart';

import '../../../../core/constant/color_const.dart';
import '../../../auth/presentation/logout/cubit/logout_cubit.dart';
import '../../../auth/presentation/logout/state/logout_state.dart';
import '../../../auth/presentation/view/auth_screen.dart';
import '../cubit/profile_cubit.dart';
import '../state/profile_state.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    context.read<ProfileCubit>().getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: SvgPicture.asset(SvgConst.logo),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('hiasb'.tr()),
            Text(
              "financial project management".tr(),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: ColorConst.neutral,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
      body: BlocListener<LogoutCubit, LogoutState>(
        listener: (context, state) {
          if (state is LogoutSuccessState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AuthScreen()),
            );
          }
          if (state is LogoutErrorState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoadingState) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is ProfileLoadedState) {
              return Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: size.width * 0.8,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFFFFFFF),
                      ),
                      child: Row(
                        spacing: 20,
                        children: [
                          Container(
                            width: size.width * 0.1,
                            height: size.height * 0.05,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorConst.surfaceLight,
                            ),
                            child: Icon(Icons.tag_outlined, size: 30),
                          ),
                          Expanded(
                            child: Column(
                              spacing: 7,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('id'.tr()),
                                Text(
                                  state.user.id,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: ColorConst.textDark,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Container(
                      width: size.width * 0.8,
                      height: size.height * 0.1,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFFFFFFF),
                      ),
                      child: Row(
                        spacing: 20,
                        children: [
                          Container(
                            width: size.width * 0.1,
                            height: size.height * 0.05,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorConst.surfaceLight,
                            ),
                            child: Icon(Icons.badge_outlined, size: 30),
                          ),
                          Column(
                            spacing: 7,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('name'.tr()),
                              Text(
                                state.user.displayName,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: ColorConst.textDark,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Container(
                      width: size.width * 0.8,
                      height: size.height * 0.1,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFFFFFFF),
                      ),
                      child: Row(
                        spacing: 20,
                        children: [
                          Container(
                            width: size.width * 0.1,
                            height: size.height * 0.05,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorConst.surfaceLight,
                            ),
                            child: Icon(Icons.email_outlined, size: 30),
                          ),
                          Column(
                            spacing: 7,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('email'.tr()),
                              Text(
                                state.user.email,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: ColorConst.textDark,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConst.negative,
                      ),
                      onPressed: () {
                        context.read<LogoutCubit>().logout();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'logout'.tr(),
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: ColorConst.error,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          SizedBox(width: size.width * 0.02),
                          Icon(Icons.logout_outlined, color: ColorConst.error),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is ProfileErrorState) {
              return Center(child: Text(state.message));
            } else {
              return Center(child: Text('no data'));
            }
          },
        ),
      ),
    );
  }
}
