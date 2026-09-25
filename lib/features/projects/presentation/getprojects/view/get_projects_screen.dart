import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiasb_app/core/constant/color_const.dart';
import 'package:hiasb_app/features/projects/presentation/addproject/view/add_project_screen.dart';
import 'package:hiasb_app/features/projects/presentation/getprojectbyid/view/get_project_by_id_screen.dart';

import '../../../../../core/textfield/hiasb_text_field.dart';
import '../cubit/get_projects_cubit.dart';
import '../state/get_projects_state.dart';

class GetProjectsScreen extends StatefulWidget {
  const GetProjectsScreen({super.key});

  @override
  State<GetProjectsScreen> createState() => _GetProjectsScreenState();
}

class _GetProjectsScreenState extends State<GetProjectsScreen> {
  final TextEditingController searchController = TextEditingController();
  final TextEditingController pageSizeController = TextEditingController();
  final TextEditingController pageNumbController = TextEditingController();

  @override
  void initState() {
    context.read<GetProjectsCubit>().getProjects(pageSize: 10, pageNumber: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<GetProjectsCubit, GetProjectsState>(
      builder: (context, state) {
        if (state is GetProjectsLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is GetProjectsErrorState) {
          return Center(child: Text(state.message));
        }
        if (state is GetProjectsLoadedState) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    spacing: 20,
                    children: [
                      HiasbTextField(
                        controller: searchController,
                        hint: 'search'.tr(),
                        onChange: (value) {
                          context.read<GetProjectsCubit>().searchProjects(
                            value,
                          );
                        },
                        prefixIcon: Icon(
                          Icons.search,
                          color: ColorConst.neutral,
                          size: 20,
                        ),
                        obscureText: false,
                      ),
                      Row(
                        spacing: 5,
                        children: [
                          Expanded(
                            child: Container(
                              height: 100,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'totalPaidAmount'.tr(),
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Spacer(),

                                  Text(
                                    "${state.projects.totalPaidAmount} JD",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color: state.projects.totalPaidAmount > 0
                                          ? ColorConst.textDark
                                          : ColorConst.error,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 100,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'totalReceivedAmount'.tr(),
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Spacer(),

                                  Text(
                                    "${state.projects.totalReceivedAmount} JD",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color:
                                          state.projects.totalReceivedAmount > 0
                                          ? ColorConst.positive
                                          : ColorConst.error,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 100,
                        width: size.width,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'totalBalance'.tr(),
                              style: TextStyle(fontSize: 20),
                            ),
                            Spacer(),

                            Text(
                              "${state.projects.totalBalance} JD",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: state.projects.totalBalance > 0
                                    ? ColorConst.textDark
                                    : ColorConst.error,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.projects.projects.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GetProjectByIdScreen(
                                    projectId: state
                                        .projects
                                        .projects[index]
                                        .projectId,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    spacing: 5,
                                    children: [
                                      Icon(
                                        Icons.tag_outlined,
                                        color: ColorConst.positive,
                                        size: 20,
                                      ),
                                      Text(
                                        state
                                            .projects
                                            .projects[index]
                                            .projectNumber
                                            .toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: ColorConst.positive,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    state.projects.projects[index].description,
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: ColorConst.textDark,
                                    ),
                                  ),
                                  Divider(),
                                  Row(
                                    spacing: 10,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'paid'.tr(),
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            Text(
                                              '${state.projects.projects[index].paidAmount} JD',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
                                                color:
                                                    state
                                                            .projects
                                                            .projects[index]
                                                            .paidAmount >
                                                        0
                                                    ? ColorConst.textDark
                                                    : ColorConst.error,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'received'.tr(),
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            Text(
                                              '${state.projects.projects[index].receivedAmount} JD',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
                                                color:
                                                    state
                                                            .projects
                                                            .projects[index]
                                                            .receivedAmount >
                                                        0
                                                    ? ColorConst.textDark
                                                    : ColorConst.error,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    spacing: 10,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'balance'.tr(),
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            Text(
                                              '${state.projects.projects[index].balance} JD',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
                                                color:
                                                    state
                                                            .projects
                                                            .projects[index]
                                                            .balance >
                                                        0
                                                    ? ColorConst.textDark
                                                    : ColorConst.error,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'wallet'.tr(),
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            Text(
                                              '${state.projects.projects[index].walletAmount} JD',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
                                                color:
                                                    state
                                                            .projects
                                                            .projects[index]
                                                            .walletAmount >
                                                        0
                                                    ? ColorConst.textDark
                                                    : ColorConst.error,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    children: [
                                      Text(
                                        'remaining balance'.tr(),
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Spacer(),
                                      Text(
                                        '${state.projects.projects[index].remainingAmount} JD',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                          color:
                                              state
                                                      .projects
                                                      .projects[index]
                                                      .remainingAmount >
                                                  0
                                              ? ColorConst.textDark
                                              : ColorConst.error,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,

                child: FloatingActionButton(
                  shape: CircleBorder(),
                  child: Icon(Icons.add),
                  onPressed: () {
                    final result = Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddProjectScreen(),
                      ),
                    );
                    if (result == true) {
                      context.read<GetProjectsCubit>().getProjects(
                        pageSize: 10,
                        pageNumber: 1,
                      );
                    }
                  },
                ),
              ),
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
