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
                                  Text('totalPaidAmount'.tr()),
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
                                  Text('totalReceivedAmount'.tr()),
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
                            Text('totalBalance'.tr()),
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
                      Container(
                        width: size.width,
                        height: size.height * 0.49,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: DataTable(
                                    columns: [
                                      DataColumn(label: Text('number'.tr())),
                                      DataColumn(
                                        label: Text('description'.tr()),
                                      ),
                                      DataColumn(label: Text('paid'.tr())),
                                      DataColumn(label: Text('received'.tr())),
                                      DataColumn(label: Text('balance'.tr())),
                                      DataColumn(
                                        label: Text('walletAmount'.tr()),
                                      ),
                                      DataColumn(
                                        label: Text('remainingAmount'.tr()),
                                      ),
                                    ],
                                    rows: [
                                      ...state.projects.projects.map((project) {
                                        return DataRow(
                                          onSelectChanged: (selected) async {
                                            if (selected == true) {
                                           final result =  await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      GetProjectByIdScreen(
                                                        projectId:
                                                            project.projectId,
                                                      ),
                                                ),
                                              );
                                           if(result == true){
                                             context.read<GetProjectsCubit>().getProjects(
                                               pageSize: 10,
                                               pageNumber: 1,
                                             );

                                           }
                                            }
                                          },
                                          cells: [
                                            DataCell(
                                              Text(
                                                project.projectNumber
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),

                                            DataCell(
                                              Text(
                                                project.description,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15,
                                                  color: ColorConst.textDark,
                                                ),
                                              ),
                                            ),

                                            DataCell(
                                              Text(
                                                project.paidAmount.toString(),
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15,
                                                  color: project.paidAmount > 0
                                                      ? ColorConst.textDark
                                                      : ColorConst.error,
                                                ),
                                              ),
                                            ),

                                            DataCell(
                                              Text(
                                                project.receivedAmount
                                                    .toString(),
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15,
                                                  color:
                                                      project.receivedAmount > 0
                                                      ? ColorConst.textDark
                                                      : ColorConst.error,
                                                ),
                                              ),
                                            ),

                                            DataCell(
                                              Text(
                                                project.balance.toString(),
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15,
                                                  color: project.balance > 0
                                                      ? ColorConst.positive
                                                      : ColorConst.error,
                                                ),
                                              ),
                                            ),

                                            DataCell(
                                              Text(
                                                project.walletAmount.toString(),
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15,
                                                  color:
                                                      project.walletAmount > 0
                                                      ? ColorConst.textDark
                                                      : ColorConst.error,
                                                ),
                                              ),
                                            ),

                                            DataCell(
                                              Text(
                                                project.remainingAmount
                                                    .toString(),
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15,
                                                  color:
                                                      project.remainingAmount >
                                                          0
                                                      ? ColorConst.positive
                                                      : ColorConst.error,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      }),

                                      DataRow(
                                        cells: [
                                          const DataCell(
                                            Text(
                                              'Σ',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),

                                          DataCell(
                                            Text(
                                              'total'.tr(),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),

                                          DataCell(
                                            Text(
                                              state.projects.totalPaidAmount
                                                  .toString(),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),

                                          DataCell(
                                            Text(
                                              state.projects.totalReceivedAmount
                                                  .toString(),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),

                                          DataCell(
                                            Text(
                                              state.projects.totalBalance
                                                  .toString(),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),

                                          DataCell(
                                            Text(
                                              state.projects.totalWalletAmount
                                                  .toString(),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),

                                          DataCell(
                                            Text(
                                              state
                                                  .projects
                                                  .totalRemainingAmount
                                                  .toString(),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
