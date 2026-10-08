import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiasb_app/core/constant/color_const.dart';
import 'package:hiasb_app/features/projects/presentation/addproject/view/add_project_screen.dart';
import 'package:hiasb_app/features/projects/presentation/getprojectbyid/view/get_project_by_id_screen.dart';

import '../../../../../core/textfield/hisab_text_field.dart';
import '../../../../../core/utils/currency_formatter.dart';
import '../../../../../core/utils/excel_helper.dart';
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
    context.read<GetProjectsCubit>().getProjects();
    super.initState();
  }

  String _formatAmount(num value) {
    return '${NumberFormat('#,##0.##').format(value)} JD';
  }

  Widget _summaryItem(String label, num value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 13, color: Colors.white70),
        ),
        const SizedBox(height: 4),
        Text(
          CurrencyFormatter.format(value),
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _cardStat(String label, num value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 12, color: ColorConst.neutral)),
        const SizedBox(height: 2),
        Text(
          CurrencyFormatter.format(value),
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: value < 0 ? ColorConst.error : ColorConst.textDark,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<GetProjectsCubit, GetProjectsState>(
      builder: (context, state) {
        if (state is GetProjectsLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is GetProjectsErrorState) {
          return Center(child: Text(state.message));
        }
        if (state is GetProjectsLoadedState) {
          return state.projects.projects.length == 0
              ? Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 96,
                          height: 96,
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).colorScheme.primary.withValues(alpha: 0.08),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.folder_open_rounded,
                            size: 44,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'add your first project'.tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: ColorConst.textDark,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 280),
                          child: Text(
                            'empty projects subtitle'.tr(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              height: 1.6,
                              color: ColorConst.neutral,
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: () async {
                              final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddProjectScreen(),
                                ),
                              );
                              if (!context.mounted) return;
                              if (result == true) {
                                context.read<GetProjectsCubit>().getProjects();
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add),
                                Text('add project'.tr()),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Stack(
            fit: StackFit.expand,
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          spacing: 20,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: HisabTextField(
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
                                ),
                                IconButton(
                                  icon: Icon(Icons.description_outlined),
                                  onPressed: () async{
                                    await ExcelHelper().createExcelFile(state.projects.projects);
                                  },
                                )
                              ],
                            ),
                            if (state.projects.projects.isEmpty)
                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.search_off_rounded,
                                      size: 44,
                                      color: ColorConst.neutral,
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      'no results'.tr(),
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: ColorConst.neutral,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            else ...[
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
                                    'totalBalance'.tr(),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white70,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    _formatAmount(state.projects.totalBalance),
                                    style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  const Divider(
                                    color: Colors.white24,
                                    height: 1,
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: _summaryItem(
                                          'totalPaidAmount'.tr(),
                                          state.projects.totalPaidAmount,
                                        ),
                                      ),
                                      Expanded(
                                        child: _summaryItem(
                                          'totalReceivedAmount'.tr(),
                                          state.projects.totalReceivedAmount,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),


                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: state.projects.projects.length,
                              itemBuilder: (context, index) {
                                final project = state.projects.projects[index];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: Material(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(20),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                GetProjectByIdScreen(
                                                  projectId: project.projectId,
                                                ),
                                          ),
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    project.description,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      height: 1.4,
                                                      color:
                                                          ColorConst.textDark,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 12),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 4,
                                                      ),
                                                  decoration: BoxDecoration(
                                                    color: ColorConst.positive
                                                        .withValues(alpha: 0.1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          20,
                                                        ),
                                                  ),
                                                  child: Text(
                                                    '#${project.projectNumber}',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color:
                                                          ColorConst.positive,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 16),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: _cardStat(
                                                    'paid'.tr(),
                                                    project.paidAmount,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: _cardStat(
                                                    'received'.tr(),
                                                    project.receivedAmount,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 12),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: _cardStat(
                                                    'balance'.tr(),
                                                    project.balance,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: _cardStat(
                                                    'wallet'.tr(),
                                                    project.walletAmount,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 16),
                                            Container(
                                              width: double.infinity,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 12,
                                                    vertical: 10,
                                                  ),
                                              decoration: BoxDecoration(
                                                color: ColorConst.neutral
                                                    .withValues(alpha: 0.08),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'remaining balance'.tr(),
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      color: ColorConst.neutral,
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                    CurrencyFormatter.format(
                                                      project.remainingAmount,
                                                    ),
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 16,

                                                      color:
                                                          project.remainingAmount <
                                                              0
                                                          ? ColorConst.error
                                                          : ColorConst.textDark,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              padding: const EdgeInsets.only(bottom: 10),
                            ),
                            ],
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 80),
                    PositionedDirectional(
                      bottom: 16,
                      end: 16,

                      child: FloatingActionButton(
                        shape: CircleBorder(),
                        child: Icon(Icons.add),
                        onPressed: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddProjectScreen(),
                            ),
                          );
                          if (result == true) {
                            context.read<GetProjectsCubit>().getProjects(
                              pageSize: AppConst.defaultPageSize,
                              pageNumber: AppConst.defaultPageNumber,
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
