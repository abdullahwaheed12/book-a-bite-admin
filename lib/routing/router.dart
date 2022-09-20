import 'package:admin_bite/pages/bitebag/bitebagPage.dart';
import 'package:admin_bite/pages/bitehub/bitehubpage.dart';
import 'package:admin_bite/pages/orders/orderDetails.dart';
import 'package:admin_bite/pages/zeroHero/zeroPage.dart';
import 'package:admin_bite/routing/routes.dart';
import 'package:flutter/material.dart';

import '../pages/Coupons/coupons.dart';
import '../pages/bites/bitespage.dart';
import '../pages/customers/customers.dart';
import '../pages/myAccount/myAccount.dart';
import '../pages/orders/orders.dart';
import '../pages/overview/overview.dart';
import '../pages/pushNotifications/notifications.dart';
import '../pages/reports/reports.dart';
import '../pages/reviews/reviews.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DashboardPageRoute:
      return _getPageRoute(const OverviewPage());
    case OrdersPageRoute:
      return _getPageRoute(const OrderPage());
    case OrdersDetailsPageRoute:
      return _getPageRoute(const OrderDetailsPage());
    case CustomersPageRoute:
      return _getPageRoute(const CustomersPage());
    case BitesPageRoute:
      return _getPageRoute(const BitesPage());
    case BiteBagPageRoute:
      return _getPageRoute(const BiteBagPage());
    case BiteHubPageRoute:
      return _getPageRoute(BiteHubPage());
    case ZeroHeroPageRoute:
      return _getPageRoute(ZeroHeroPage());
    // case CharityPageRoute:
    //   return _getPageRoute(CharityPage());
    case CouponsPageRoute:
      return _getPageRoute(CouponsPage());
    case ReviewsPageRoute:
      return _getPageRoute(ReviewsPage());
    case AccountsPageRoute:
      return _getPageRoute(const AccountsPage());
    // case MailsPageRoute:
    //   return _getPageRoute(MailsPage());
    case NotificationsPageRoute:
      return _getPageRoute(const NotificationsPage());
    // case PaymentsPageRoute:
    //   return _getPageRoute(PaymentsPage());
    case ReportsPageRoute:
      return _getPageRoute(const ReportsPage());

    default:
      return _getPageRoute(const OverviewPage());
  }
}

Route<dynamic>? _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
