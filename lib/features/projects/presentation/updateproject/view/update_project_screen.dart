import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiasb_app/features/projects/domain/entity/project_entity.dart';

import '../../../../../core/constant/color_const.dart';
import '../../../../../core/textfield/hiasb_text_field.dart';
import '../../getprojectbyid/cubit/get_project_by_id_cubit.dart';
import '../cubit/update_project_cubit.dart';
import '../state/update_project_state.dart';

class UpdateProjectScreen extends StatefulWidget {
  final int projectId;
  final ProjectEntity project;

  const UpdateProjectScreen({
    super.key,
    required this.projectId,
    required this.project,
  });

  @override
  State<UpdateProjectScreen> createState() => _UpdateProjectScreenState();
}

class _UpdateProjectScreenState extends State<UpdateProjectScreen> {
  TextEditingController numProjectController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController paidAmountController = TextEditingController();
  TextEditingController receivedAmountController = TextEditingController();
  TextEditingController walletBalanceController = TextEditingController();

  @override
  void dispose() {
    numProjectController.dispose();
    descriptionController.dispose();
    paidAmountController.dispose();
    receivedAmountController.dispose();
    walletBalanceController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    context.read<GetProjectByIdCubit>().getProjectById(
      projectId: widget.projectId,
    );
    numProjectController.text = widget.project.projectNumber.toString();
    descriptionController.text = widget.project.description;
    paidAmountController.text = widget.project.paidAmount.toString();
    receivedAmountController.text = widget.project.receivedAmount.toString();
    walletBalanceController.text = widget.project.walletAmount.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('update project'.tr())),
      body: BlocConsumer<UpdateProjectCubit, UpdateProjectState>(
        listener: (context, state) {
          if (state is UpdateProjectSuccessState) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (dialogContext) {
                return AlertDialog(
                  title: Text(
                    "project update successfully".tr(),
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(dialogContext);
                        Navigator.pop(context, true);
                      },
                      child: Text('ok'.tr()),
                    ),
                  ],
                );
              },
            );
          }
        },
        builder: (context, state) {
          if (state is UpdateProjectLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: size.width * 0.9,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.all(10),
                    child: Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          spacing: 20,
                          children: [
                            Icon(
                              Icons.tag_outlined,
                              color: ColorConst.positive,
                            ),
                            Text(
                              "basic information".tr(),
                              style: TextStyle(
                                color: ColorConst.textDark,
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          "project number".tr(),
                          style: TextStyle(
                            color: ColorConst.textDark,
                            fontSize: 15,
                          ),
                        ),
                        HiasbTextField(
                          controller: numProjectController,
                          hint: "1003",
                          obscureText: false,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "description".tr(),
                          style: TextStyle(
                            color: ColorConst.textDark,
                            fontSize: 15,
                          ),
                        ),
                        TextField(
                          controller: descriptionController,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: ColorConst.textDark,
                          ),
                          decoration: InputDecoration(
                            hintText:
                                "enter project details and scope of work...",
                            hintStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: ColorConst.neutral.withValues(alpha: 0.55),
                            ),
                          ),
                          obscureText: false,
                          maxLines: 5,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width * 0.9,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.all(10),
                    child: Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          spacing: 20,
                          children: [
                            Icon(
                              Icons.payments_outlined,
                              color: ColorConst.positive,
                            ),
                            Text(
                              "restricted financials".tr(),
                              style: TextStyle(
                                color: ColorConst.textDark,
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          "paid amount".tr(),
                          style: TextStyle(
                            color: ColorConst.textDark,
                            fontSize: 15,
                          ),
                        ),
                        HiasbTextField(
                          controller: paidAmountController,
                          hint: "0.0 JD",
                          obscureText: false,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "received amount".tr(),
                          style: TextStyle(
                            color: ColorConst.textDark,
                            fontSize: 15,
                          ),
                        ),
                        HiasbTextField(
                          controller: receivedAmountController,
                          hint: "0.0 JD",
                          obscureText: false,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "wallet balance".tr(),
                          style: TextStyle(
                            color: ColorConst.textDark,
                            fontSize: 15,
                          ),
                        ),
                        HiasbTextField(
                          controller: walletBalanceController,
                          hint: "0.0 JD",
                          obscureText: false,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width * 0.9,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.all(10),
                    child: Row(
                      spacing: 10,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              context.read<UpdateProjectCubit>().updateProject(
                                projectNumber: int.parse(
                                  numProjectController.text,
                                ),
                                description: descriptionController.text,
                                paidAmount: double.parse(
                                  paidAmountController.text,
                                ),
                                receivedAmount: double.parse(
                                  receivedAmountController.text,
                                ),
                                walletAmount: double.parse(
                                  walletBalanceController.text,
                                ),
                                projectId: widget.projectId,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.save),
                                SizedBox(width: 5),
                                Text("save".tr()),
                              ],
                            ),
                          ),
                        ),

                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
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
                                Icon(Icons.close),
                                SizedBox(width: 5),
                                Text(
                                  "cancel".tr(),
                                  style: TextStyle(color: ColorConst.error),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
