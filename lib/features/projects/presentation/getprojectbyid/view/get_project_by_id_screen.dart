import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constant/app_const.dart';
import '../../../../../core/constant/color_const.dart';
import '../../../domain/usecase/update_project_use_case.dart';
import '../../deleteproject/cubit/delete_project_cubit.dart';
import '../../deleteproject/state/delete_project_state.dart';
import '../../getprojects/cubit/get_projects_cubit.dart';
import '../../updateproject/cubit/update_project_cubit.dart';
import '../../updateproject/view/update_project_screen.dart';
import '../cubit/get_project_by_id_cubit.dart';
import '../state/get_project_by_id_state.dart';

class GetProjectByIdScreen extends StatefulWidget {
  final int projectId;

  const GetProjectByIdScreen({super.key, required this.projectId});

  @override
  State<GetProjectByIdScreen> createState() => _GetProjectByIdScreenState();
}

class _GetProjectByIdScreenState extends State<GetProjectByIdScreen> {
  @override
  void initState() {
    context.read<GetProjectByIdCubit>().getProjectById(
      projectId: widget.projectId,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('project details'.tr())),
      body: BlocListener<DeleteProjectCubit, DeleteProjectState>(
        listener: (context, state) {
          if (state is DeleteProjectSuccessState) {
            Navigator.pop(context);
            Navigator.pop(context, true);
          }
          if (state is DeleteProjectErrorState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: BlocBuilder<GetProjectByIdCubit, GetProjectByIdState>(
          builder: (context, state) {
            if (state is GetProjectByIdLoadingState) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is GetProjectByIdErrorState) {
              return Center(child: Text(state.message));
            }
            if (state is GetProjectByIdLoadedState) {
              return SingleChildScrollView(
                padding: EdgeInsets.all(10),
                child: Column(
                  spacing: 20,
                  children: [
                    Container(
                      width: size.width,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: ColorConst.textDark),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "# ${state.project.projectNumber}",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 40,
                              color: ColorConst.textDark,
                            ),
                          ),
                          Text('description'.tr()),
                          Text(
                            state.project.description,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 20,
                              color: ColorConst.textDark,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        Container(
                          width: size.width * 0.45,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "paid".tr(),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: ColorConst.textDark,
                                ),
                              ),
                              Text(
                                "${state.project.paidAmount} JD",
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: ColorConst.textDark,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: size.width * 0.45,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "received".tr(),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: ColorConst.textDark,
                                ),
                              ),
                              Text(
                                "${state.project.receivedAmount} JD",
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: ColorConst.textDark,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
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
                            "balance".tr(),
                            style: TextStyle(
                              fontSize: 20,
                              color: ColorConst.textDark,
                            ),
                          ),
                          Text(
                            state.project.balance.toString(),
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 20,
                              color: ColorConst.textDark,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                            "wallet".tr(),
                            style: TextStyle(
                              fontSize: 20,
                              color: ColorConst.textDark,
                            ),
                          ),
                          Text(
                            state.project.walletAmount.toString(),
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 20,
                              color: ColorConst.textDark,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                            "remaining balance".tr(),
                            style: TextStyle(
                              fontSize: 20,
                              color: ColorConst.textDark,
                            ),
                          ),
                          Text(
                            state.project.remainingAmount.toString(),
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 20,
                              color: ColorConst.textDark,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: size.width,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.calendar_today, size: 15),
                              SizedBox(width: 10),
                              Text(
                                "creation date".tr(),
                                style: TextStyle(color: ColorConst.textDark),
                              ),
                              Spacer(),
                              Text(
                                DateFormat.yMMMd().format(
                                  state.project.createdAt,
                                ),
                                style: TextStyle(color: ColorConst.textDark),
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Icon(Icons.update, size: 15),
                              SizedBox(width: 10),
                              Text(
                                "last update date".tr(),
                                style: TextStyle(color: ColorConst.textDark),
                              ),
                              Spacer(),
                              Text(
                                DateFormat.yMMMd().format(
                                  state.project.updatedAt,
                                ),
                                style: TextStyle(color: ColorConst.textDark),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              final project = state.project;

                              final updated = await Navigator.push<bool>(
                                context,
                                MaterialPageRoute(
                                  builder: (routeContext) => BlocProvider(
                                    create: (_) => UpdateProjectCubit(
                                      updateProjectUseCase: routeContext.read<UpdateProjectUseCase>(),
                                    ),
                                    child: UpdateProjectScreen(
                                      projectId: project.projectId,
                                      project: project,
                                    ),
                                  ),
                                ),
                              );

                              if (updated == true && context.mounted) {
                                context.read<GetProjectByIdCubit>().getProjectById(
                                  projectId: project.projectId,
                                );
                                context.read<GetProjectsCubit>().getProjects(
                                  pageNumber: AppConst.defaultPageNumber,
                                  pageSize: AppConst.defaultPageSize,
                                );
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.edit_outlined),
                                Text('edit'.tr()),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                  builder: (_) {
                                  return AlertDialog(
                                    title: Text('delete project'.tr()),
                                    content: Text(
                                      'are you sure you want to delete this project?'
                                          .tr(),
                                    ),
                                    actions: [
                                      Row(
                                        spacing: 10,
                                        children: [
                                          Expanded(
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('cancel'.tr()),
                                            ),
                                          ),
                                          Expanded(
                                            child: ElevatedButton(
                                              onPressed: () {
                                                context
                                                    .read<DeleteProjectCubit>()
                                                    .deleteProject(
                                                      projectId: widget.projectId,
                                                    );
                                              },
                                              style: ButtonStyle(
                                                backgroundColor: WidgetStateProperty.all(
                                                  Colors.white,
                                                ),
                                                iconColor: WidgetStateProperty.all(
                                                  ColorConst.error,
                                                ),
                                                side: WidgetStateProperty.all(
                                                  BorderSide(color: ColorConst.error, width: 1),
                                                ),
                                              ),
                                              child: Text('delete'.tr() , style:  TextStyle(color: ColorConst.error),),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                Colors.white,
                              ),
                              iconColor: WidgetStateProperty.all(
                                ColorConst.error,
                              ),
                              side: WidgetStateProperty.all(
                                BorderSide(color: ColorConst.error, width: 1),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                Icon(
                                  Icons.delete_outline,
                                  color: ColorConst.error,
                                ),
                                Text(
                                  'delete'.tr(),
                                  style: TextStyle(color: ColorConst.error),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
            return const Center(child: Text('Something went wrong'));
          },
        ),
      ),
    );
  }
}
