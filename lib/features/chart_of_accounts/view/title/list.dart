import 'dart:developer';

import 'package:app/features/app.dart';
import 'package:app/features/chart_of_accounts/controller/title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class COATitlePage extends StatelessWidget {
  COATitlePage({Key key}) : super(key: key);
  final COATitleController controller = Get.put(COATitleController());

  @override
  Widget build(BuildContext context) {
    return BasePage(
        pagetitle: 'Chart Title',
        content: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (value) {
                        log('$value');
                      },
                      // controller: editingController,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/coa-title/create');
                    },
                    child: Text('+'),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Obx(
                () => ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
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
                                'OWNER: ${controller.list[index].titles.toString()} '),
                            Text(
                                'ORIGIN: ${controller.list[index].accountCode.toString()} '),
                          ],
                        ),
                        trailing: Icon(Icons.menu),
                        onTap: () {
                          // itemSelectedCallback(controller.list[index]);
                          controller.setSelectedId(controller.list[index].id);
                          var id = controller.selectedId;
                          Get.toNamed('/coa-title/item', arguments: [id]);
                          log('pressed ${controller.list[index].id}');
                        },
                        // selected: selectedItem == controller.list[index],
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
