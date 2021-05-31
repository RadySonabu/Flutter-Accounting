import 'dart:developer';

import 'package:app/features/chart_of_accounts/controller/controller_chart_of_accounts.dart';
import 'package:app/features/chart_of_accounts/view/item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChartContent extends StatelessWidget {
  ChartContent({Key key}) : super(key: key);
  final ChartOfAccountsController controller =
      Get.put(ChartOfAccountsController());
  @override
  Widget build(BuildContext context) {
    var editingController;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    log('$value');
                  },
                  controller: editingController,
                  decoration: InputDecoration(
                      labelText: "Search",
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0)))),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Obx(
            () => ListView.separated(
              separatorBuilder: (BuildContext context, int index) => Divider(
                thickness: 2,
              ),
              itemCount: controller.list.length,
              itemBuilder: (context, index) {
                if (controller.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListTile(
                    title: Text(
                        'VEHICLE ID: ${controller.list[index].id.toString()}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'OWNER: ${controller.list[index].name.toString()} '),
                        Text(
                            'ORIGIN: ${controller.list[index].name.toString()} '),
                      ],
                    ),
                    trailing: Icon(Icons.menu),
                    onTap: () {
                      // itemSelectedCallback(controller.list[index]);
                      var id = controller.list[index].id;
                      Get.to(() => SingleContent(), arguments: [id]);
                      log('pressed ${controller.list[index].id}');
                    },
                    // selected: selectedItem == controller.list[index],
                  );
                }
              },
            ),
          ),
        ),
        // Expanded(
        //     child:
        //         Center(child: Text('this is the ${controller.item.value.id}'))),
      ],
    );
  }
}
