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

  String _formatAmount(num value) {
    return '${NumberFormat('#,##0.##').format(value)} JD';
  }


  Widget _cardStat(String label, num value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 12, color: ColorConst.neutral)),
        const SizedBox(height: 2),
        Text(
          _formatAmount(value),
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: value < 0 ? ColorConst.error : ColorConst.textDark,
          ),
        ),
      ],
    );
  }

  Widget _dateRow(IconData icon, String label, DateTime date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          Icon(icon, size: 18, color: ColorConst.neutral),
          const SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(fontSize: 14, color: ColorConst.neutral),
          ),
          const Spacer(),
          Text(
            DateFormat.yMMMd(context.locale.toString()).format(date),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: ColorConst.textDark,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('project details'.tr())),
      body: BlocListener<DeleteProjectCubit, DeleteProjectState>(
        listener: (context, state) {
          if (state is DeleteProjectSuccessState) {
            context.read<GetProjectsCubit>().getProjects(
              pageNumber: AppConst.defaultPageNumber,
              pageSize: AppConst.defaultPageSize,
            );

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
                padding: EdgeInsets.all(20),
                child: Column(
                  spacing: 20,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: ColorConst.positive.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "#${state.project.projectNumber}",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: ColorConst.positive,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            state.project.description,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              height: 1.5,
                              color: ColorConst.textDark,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "remaining balance".tr(),
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            _formatAmount(state.project.remainingAmount),
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: state.project.remainingAmount < 0
                                  ? Colors.red.shade200
                                  : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: _cardStat(
                                  'paid'.tr(),
                                  state.project.paidAmount,
                                ),
                              ),
                              Expanded(
                                child: _cardStat(
                                  'received'.tr(),
                                  state.project.receivedAmount,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: _cardStat(
                                  'balance'.tr(),
                                  state.project.balance,
                                ),
                              ),
                              Expanded(
                                child: _cardStat(
                                  'wallet'.tr(),
                                  state.project.walletAmount,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _dateRow(
                            Icons.calendar_today,
                            "creation date".tr(),
                            state.project.createdAt,
                          ),
                          const Divider(height: 1),
                          _dateRow(
                            Icons.update,
                            "last update date".tr(),
                            state.project.updatedAt,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      spacing: 12,
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
                                      updateProjectUseCase: routeContext
                                          .read<UpdateProjectUseCase>(),
                                    ),
                                    child: UpdateProjectScreen(
                                      projectId: project.projectId,
                                      project: project,
                                    ),
                                  ),
                                ),
                              );

                              if (updated == true && context.mounted) {
                                context
                                    .read<GetProjectByIdCubit>()
                                    .getProjectById(
                                      projectId: project.projectId,
                                    );
                                context.read<GetProjectsCubit>().getProjects(
                                  pageNumber: AppConst.defaultPageNumber,
                                  pageSize: AppConst.defaultPageSize,
                                );
                              }
                            },
                            child: Row(
                              spacing: 5,
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