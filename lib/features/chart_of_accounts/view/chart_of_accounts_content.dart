import 'package:app/features/chart_of_accounts/controller/controller_chart_of_accounts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChartContent extends StatelessWidget {
  ChartContent({Key key}) : super(key: key);
  final ChartOfAccountsController controller =
      Get.put(ChartOfAccountsController());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Obx(() => Column(
              children: [
                Text(
                    'This is the content of charts ${controller.number_of_players}'),
                ElevatedButton(
                    onPressed: () {
                      controller.updateNumber();
                    },
                    child: Text('change to 1'))
              ],
            )),
      ),
    );
  }
}
