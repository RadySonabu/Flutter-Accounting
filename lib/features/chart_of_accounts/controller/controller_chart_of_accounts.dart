import 'dart:developer';

import 'package:get/get.dart';

class ChartOfAccountsController extends GetxController {
  var number_of_players =
      0.obs; // to trigger the app that something has changed

  void updateNumber() {
    log('$number_of_players');

    number_of_players.value = 1;
    log('$number_of_players');
  }
}
