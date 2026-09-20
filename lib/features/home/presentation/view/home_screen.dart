import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hiasb_app/features/profile/presentation/view/profile_screen.dart';

import '../../../../core/constant/color_const.dart';
import '../../../../core/constant/svg_const.dart';
import '../../../projects/presentation/getprojects/view/get_projects_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
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
      body: IndexedStack(
        index: currentPage,
        children: [const GetProjectsScreen(), const ProfileScreen()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: ColorConst.primary,
        unselectedItemColor: ColorConst.neutral,
        currentIndex: currentPage,
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet_outlined),
            label: 'Projects',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
