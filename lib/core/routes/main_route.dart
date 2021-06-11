import 'package:app/features/chart_of_accounts/chart_of_accounts.dart';
import 'package:app/features/chart_of_accounts/view/category/create.dart';
import 'package:app/features/chart_of_accounts/view/category/item.dart';
import 'package:app/features/chart_of_accounts/view/category/list.dart';
import 'package:app/features/chart_of_accounts/view/category/update.dart';
import 'package:app/features/chart_of_accounts/view/title/create.dart';
import 'package:app/features/chart_of_accounts/view/title/item.dart';
import 'package:app/features/chart_of_accounts/view/title/list.dart';
import 'package:app/features/chart_of_accounts/view/title/update.dart';
import 'package:app/features/deduction/view/deduction/create.dart';
import 'package:app/features/deduction/view/deduction/item.dart';
import 'package:app/features/deduction/view/deduction/list.dart';
import 'package:app/features/deduction/view/deduction/update.dart';

import 'package:app/features/deduction/view/deduction_type/create.dart';
import 'package:app/features/deduction/view/deduction_type/item.dart';
import 'package:app/features/deduction/view/deduction_type/list.dart';
import 'package:app/features/deduction/view/deduction_type/update.dart';
import 'package:app/features/deduction/view/employee_deduction/create.dart';
import 'package:app/features/deduction/view/employee_deduction/item.dart';
import 'package:app/features/deduction/view/employee_deduction/list.dart';
import 'package:app/features/deduction/view/employee_deduction/update.dart';
import 'package:app/features/journal_entry/model/transaction_type.dart';
import 'package:app/features/journal_entry/view/detail/list.dart';
import 'package:app/features/journal_entry/view/entry/list.dart';
import 'package:app/features/journal_entry/view/transaction_type/list.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class AppPages {
  static var route = [
    // category
    GetPage(name: '/coa', page: () => ChartOfAccountsPage()),
    GetPage(name: '/coa-category', page: () => ChartContent()),
    GetPage(name: '/coa-category/item', page: () => SingleContent()),
    GetPage(name: '/coa-category/create', page: () => COACategoryCreate()),
    GetPage(name: '/coa-category/update', page: () => COAUpdate()),
    //tittle
    GetPage(name: '/coa-title', page: () => COATitlePage()),
    GetPage(name: '/coa-title/item', page: () => COATitleItem()),
    GetPage(name: '/coa-title/create', page: () => COATitleCreate()),
    GetPage(name: '/coa-title/update', page: () => COATitleUpdate()),

    //deduction
    GetPage(name: '/deduction', page: () => DeductionListPage()),
    GetPage(name: '/deduction/item', page: () => DeductionItemPage()),
    GetPage(name: '/deduction/create', page: () => DeductionCreatePage()),
    GetPage(name: '/deduction/update', page: () => DeductionUpdatePage()),

    //deduction
    GetPage(
        name: '/deduction-type', page: () => CollectionOfDeductionListPage()),
    GetPage(name: '/deduction-type/item', page: () => DeductionTypeItemPage()),
    GetPage(
        name: '/deduction-type/create',
        page: () => DeductionCollectionCreatePage()),
    GetPage(
        name: '/deduction-type/update', page: () => DeductionTypeUpdatePage()),

    //deduction
    GetPage(
        name: '/deduction-employee', page: () => EmployeeDeductionListPage()),
    GetPage(
        name: '/deduction-employee/item',
        page: () => EmployeeDeductionItemPage()),
    GetPage(
        name: '/deduction-employee/create',
        page: () => EmployeeDeductionCreatePage()),
    GetPage(
        name: '/deduction-employee/update',
        page: () => EmployeeDeductionUpdatePage()),

    GetPage(name: '/journal-detail', page: () => JournalDetailListPage()),
    // GetPage(name: '/deduction/item', page: () => COATitleItem()),
    // GetPage(name: '/deduction/create', page: () => COATitleCreate()),
    // GetPage(name: '/deduction/update', page: () => COATitleUpdate()),

    GetPage(name: '/journal-entry', page: () => JournalEntryListPage()),
    // GetPage(name: '/deduction/item', page: () => COATitleItem()),
    // GetPage(name: '/deduction/create', page: () => COATitleCreate()),
    // GetPage(name: '/deduction/update', page: () => COATitleUpdate()),

    GetPage(
        name: '/journal-transaction-type',
        page: () => JournalTransactionTypeListPage()),
    // GetPage(name: '/deduction/item', page: () => COATitleItem()),
    // GetPage(name: '/deduction/create', page: () => COATitleCreate()),
    // GetPage(name: '/deduction/update', page: () => COATitleUpdate()),

    // ...VLRouter.route
  ];
}
