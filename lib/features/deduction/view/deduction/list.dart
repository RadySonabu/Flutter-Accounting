import 'dart:developer';

import 'package:app/features/app.dart';
import 'package:app/features/deduction/controller/deduction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeductionListPage extends StatelessWidget {
  DeductionListPage({Key key}) : super(key: key);
  DeductionController controller = Get.put(DeductionController());
  @override
  Widget build(BuildContext context) {
    return BasePage(
      pagetitle: 'Deduction',
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
                    Get.toNamed('/deduction/create');
                  },
                  child: Text('+'),
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
                  print('it goes here');
                  if (controller.isLoading.value) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListTile(
                      title:
                          Text('ID: ${controller.list[index].id.toString()}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'NAME: ${controller.list[index].name.toString()} '),
                          Text(
                              'DESCRIPTION: ${controller.list[index].description.toString()} '),
                        ],
                      ),
                      trailing: Icon(Icons.menu),
                      onTap: () {
                        // itemSelectedCallback(controller.list[index]);
                        controller.setSelectedId(controller.list[index].id);
                        var id = controller.selectedId;
                        Get.toNamed('/deduction/item', arguments: [id]);
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
      ),
    );
  }
}
