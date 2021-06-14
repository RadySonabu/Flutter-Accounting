import 'dart:developer';

import 'package:app/core/widgets/search_bar.dart';
import 'package:app/features/app.dart';
import 'package:app/features/deduction/controller/deduction_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CollectionOfDeductionListPage extends StatelessWidget {
  CollectionOfDeductionListPage({Key key}) : super(key: key);
  DeductionListController controller = Get.put(DeductionListController());
  @override
  Widget build(BuildContext context) {
    return BasePage(
      pagetitle: 'Deduction Type',
      content: Column(
        children: [
          SearchBar(
            route: '/deduction-type/create',
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
                        Get.toNamed('/deduction-type/item', arguments: [id]);
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
