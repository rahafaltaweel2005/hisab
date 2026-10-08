import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

import '../../features/projects/domain/entity/project_entity.dart';

class ExcelHelper {
  Future<void> createExcelFile(List<ProjectEntity> projects) async {
    final Workbook workbook = Workbook();
    final Worksheet sheet = workbook.worksheets[0];
    sheet.getRangeByName('A1').setText('Project Number');
    sheet.getRangeByName('B1').setText('Description');
    sheet.getRangeByName('C1').setText('Paid Amount');
    sheet.getRangeByName('D1').setText('Received Amount');
    sheet.getRangeByName('E1').setText('Wallet Amount');
    sheet.getRangeByName('F1').setText('Balance');
    sheet.getRangeByName('G1').setText('Remaining Amount');
    for (int i = 0; i < projects.length; i++) {
      final ProjectEntity project = projects[i];
      sheet.getRangeByName('A${i + 2}').setNumber(project.projectNumber.toDouble());
      sheet.getRangeByName('B${i + 2}').setText(project.description);
      sheet.getRangeByName('C${i + 2}').setNumber(project.paidAmount);
      sheet.getRangeByName('D${i + 2}').setNumber(project.receivedAmount);
      sheet.getRangeByName('E${i + 2}').setNumber(project.walletAmount);
      sheet.getRangeByName('F${i + 2}').setNumber(project.balance);
      sheet.getRangeByName('G${i + 2}').setNumber(project.remainingAmount);
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
