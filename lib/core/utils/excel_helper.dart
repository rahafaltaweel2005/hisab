import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

import '../../features/projects/domain/entity/project_entity.dart';

class ExcelHelper {
  Future<void> createExcelFile(List<ProjectEntity> projects) async {
    final Workbook workbook = Workbook();
    final Worksheet sheet = workbook.worksheets[0];
    sheet.getRangeByName('A1').setText('project number'.tr());
    sheet.getRangeByName('B1').setText('description'.tr());
    sheet.getRangeByName('C1').setText('paid amount'.tr());
    sheet.getRangeByName('D1').setText('received amount'.tr());
    sheet.getRangeByName('E1').setText('wallet balance'.tr());
    sheet.getRangeByName('F1').setText('balance'.tr());
    sheet.getRangeByName('G1').setText('remaining balance'.tr());
    Style style = workbook.styles.add('style');
    style.bold = true;
    style.fontSize = 13;
    style.fontColor = '#374151';
    style.backColor = '#E5E7EB';
    style.borders.all.color = '#D1D5DB';
    style.hAlign = HAlignType.center;
    style.vAlign = VAlignType.center;
    sheet
        .getRangeByName('A1:G1')
        .cellStyle = style;
    for (int i = 1; i < 8; i++) {
      sheet.autoFitColumn(i);
    }
    sheet
        .getRangeByName('B1')
        .columnWidth = 35;
    for (int i = 0; i < projects.length; i++) {
      final ProjectEntity project = projects[i];
      sheet
          .getRangeByName('A${i + 2}')
          .setNumber(project.projectNumber.toDouble());
      sheet
          .getRangeByName('A${i + 2}')
          .cellStyle
          .hAlign = HAlignType.center;

      sheet
          .getRangeByName('A${i + 2}')
          .cellStyle
          .vAlign = VAlignType.center;
      sheet.getRangeByName('B${i + 2}').setText(project.description);
      sheet.getRangeByName('C${i + 2}').setNumber(project.paidAmount);
      sheet
          .getRangeByName('C${i + 2}')
          .cellStyle
          .hAlign = HAlignType.center;

      sheet
          .getRangeByName('C${i + 2}')
          .cellStyle
          .vAlign = VAlignType.center;
      sheet.getRangeByName('D${i + 2}').setNumber(project.receivedAmount);
      sheet
          .getRangeByName('D${i + 2}')
          .cellStyle
          .hAlign = HAlignType.center;

      sheet
          .getRangeByName('D${i + 2}')
          .cellStyle
          .vAlign = VAlignType.center;
      sheet.getRangeByName('E${i + 2}').setNumber(project.walletAmount);
      sheet
          .getRangeByName('E${i + 2}')
          .cellStyle
          .hAlign = HAlignType.center;

      sheet
          .getRangeByName('E${i + 2}')
          .cellStyle
          .vAlign = VAlignType.center;
      sheet.getRangeByName('F${i + 2}').setNumber(project.balance);
      sheet
          .getRangeByName('F${i + 2}')
          .cellStyle
          .hAlign = HAlignType.center;

      sheet
          .getRangeByName('F${i + 2}')
          .cellStyle
          .vAlign = VAlignType.center;
      sheet.getRangeByName('G${i + 2}').setNumber(project.remainingAmount);
      sheet
          .getRangeByName('G${i + 2}')
          .cellStyle
          .hAlign = HAlignType.center;

      sheet
          .getRangeByName('G${i + 2}')
          .cellStyle
          .vAlign = VAlignType.center;
    }
    final List<int> bytes = workbook.saveAsStream();

    workbook.dispose();

    final Directory directory = await getApplicationDocumentsDirectory();
    final String path = '${directory.path}/projects.xlsx';

    final File file = File(path);
    await file.writeAsBytes(bytes, flush: true);

    await OpenFile.open(path);
  }
}
