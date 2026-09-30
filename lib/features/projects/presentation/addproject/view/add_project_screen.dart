import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hiasb_app/core/constant/color_const.dart';
import 'package:hiasb_app/core/textfield/hisab_text_field.dart';
import 'package:hiasb_app/features/projects/presentation/addproject/cubit/add_project_cubit.dart';

import '../state/add_project_state.dart';

class AddProjectScreen extends StatefulWidget {
  const AddProjectScreen({super.key});

  @override
  State<AddProjectScreen> createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  TextEditingController numProjectController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController paidAmountController = TextEditingController();
  TextEditingController receivedAmountController = TextEditingController();
  TextEditingController walletBalanceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    numProjectController.dispose();
    descriptionController.dispose();
    paidAmountController.dispose();
    receivedAmountController.dispose();
    walletBalanceController.dispose();
    super.dispose();
  }

  String? _validateProjectNumber(String? value) {
    final text = _normalizeDigits(value ?? '');
    if (text.isEmpty) return 'required field'.tr();
    final number = int.tryParse(text);
    if (number == null || number <= 0) return 'enter a valid number'.tr();
    return null;
  }

  String _normalizeDigits(String input) {
    const arabicDigits = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    var result = input.trim();
    for (var i = 0; i < arabicDigits.length; i++) {
      result = result.replaceAll(arabicDigits[i], '$i');
    }
    return result.replaceAll('٫', '.');
  }

  String? _validateAmount(String? value) {
    final text = _normalizeDigits(value ?? '');
    if (text.isEmpty) return 'required field'.tr();
    final amount = double.tryParse(text);
    if (amount == null) return 'enter a valid amount'.tr();
    if (amount < 0) return 'amount cannot be negative'.tr();
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('addProject'.tr())),
      body: BlocConsumer<AddProjectCubit, AddProjectState>(
        listener: (context, state) {
          if (state is AddProjectSuccessState) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (dialogContext) {
                return AlertDialog(
                  title: Text(
                    "project added successfully".tr(),
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
          if (state is AddProjectErrorState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },

        builder: (context, state) {
          if (state is AddProjectLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            child: Center(
              child: Form(
                key: _formKey,
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
                          HisabTextField(
                            title: "project number".tr(),

                            controller: numProjectController,
                            hint: "1003",
                            obscureText: false,
                            validator: _validateProjectNumber,
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "description".tr(),
                            style: TextStyle(
                              color: ColorConst.textDark,
                              fontSize: 14,
                            ),
                          ),
                          TextFormField(
                            controller: descriptionController,
                            validator: (value) {
                              if ((value ?? '').trim().isEmpty)
                                return 'required field'.tr();
                              return null;
                            },
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: ColorConst.textDark,
                            ),
                            decoration: InputDecoration(
                              hintText:
                                  "enter project details and scope of work..."
                                      .tr(),
                              hintStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: ColorConst.neutral.withValues(
                                  alpha: 0.55,
                                ),
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
                          HisabTextField(
                            title: "paid amount".tr(),
                            controller: paidAmountController,
                            hint: "0.0 JD",
                            obscureText: false,
                            validator: _validateAmount,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                          ),
                          SizedBox(height: 10),
                          HisabTextField(
                            title: "received amount".tr(),
                            controller: receivedAmountController,
                            hint: "0.0 JD",
                            obscureText: false,
                            validator: _validateAmount,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                          ),
                          SizedBox(height: 10),
                          HisabTextField(
                            title: "wallet balance".tr(),
                            controller: walletBalanceController,
                            hint: "0.0 JD",
                            obscureText: false,
                            validator: _validateAmount,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
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
                                if (!_formKey.currentState!.validate()) return;
                                context.read<AddProjectCubit>().addProject(
                                  projectNumber: int.parse(
                                    _normalizeDigits(numProjectController.text),
                                  ),
                                  description: descriptionController.text,
                                  paidAmount: double.parse(
                                    _normalizeDigits(paidAmountController.text),
                                  ),
                                  receivedAmount: double.parse(
                                    _normalizeDigits(
                                      receivedAmountController.text,
                                    ),
                                  ),
                                  walletAmount: double.parse(
                                    _normalizeDigits(
                                      walletBalanceController.text,
                                    ),
                                  ),
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
            ),
          );
        },
      ),
    );
  }
}
