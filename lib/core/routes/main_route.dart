import 'package:app/features/chart_of_accounts/chart_of_accounts.dart';
import 'package:app/features/chart_of_accounts/view/item.dart';
import 'package:app/features/chart_of_accounts/view/update.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class AppPages {
  static var route = [
    GetPage(name: '/coa', page: () => ChartOfAccountsPage()),
    GetPage(name: '/coa/item', page: () => SingleContent()),
    GetPage(name: '/coa/update', page: () => COAUpdate()),
    // ...VLRouter.route
  ];
}
