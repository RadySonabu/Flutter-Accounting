import 'package:app/features/chart_of_accounts/chart_of_accounts.dart';
import 'package:app/features/chart_of_accounts/view/category/create.dart';
import 'package:app/features/chart_of_accounts/view/category/item.dart';
import 'package:app/features/chart_of_accounts/view/category/list.dart';
import 'package:app/features/chart_of_accounts/view/category/update.dart';
import 'package:app/features/chart_of_accounts/view/title/create.dart';
import 'package:app/features/chart_of_accounts/view/title/item.dart';
import 'package:app/features/chart_of_accounts/view/title/list.dart';
import 'package:app/features/chart_of_accounts/view/title/update.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class AppPages {
  static var route = [
    GetPage(name: '/coa', page: () => ChartOfAccountsPage()),
    GetPage(name: '/coa-category', page: () => ChartContent()),
    GetPage(name: '/coa-category/item', page: () => SingleContent()),
    GetPage(name: '/coa-category/create', page: () => COACategoryCreate()),
    GetPage(name: '/coa-category/update', page: () => COAUpdate()),
    GetPage(name: '/coa-title', page: () => COATitlePage()),
    GetPage(name: '/coa-title/item', page: () => COATitleItem()),
    GetPage(name: '/coa-title/create', page: () => COATitleCreate()),
    GetPage(name: '/coa-title/update', page: () => COATitleUpdate()),
    // ...VLRouter.route
  ];
}
