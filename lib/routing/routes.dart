// ignore_for_file: constant_identifier_names

const RootRoute = "/";

const DashboardPageDisplayName = 'Dashboard';
const DashboardPageRoute = '/dashboard';

const OrdersPageDisplayName = 'Orders';
const OrdersPageRoute = '/order';

const OrdersDetailsPageDisplayName = 'Order Details';
const OrdersDetailsPageRoute = '/order details';

const CustomersPageDisplayName = 'Customers';
const CustomersPageRoute = '/customers';

const BitesPageDisplayName = 'Bites';
const BitesPageRoute = '/bites';

const BiteBagPageDisplayName = 'Bite Bag';
const BiteBagPageRoute = '/bite bag';

const BiteHubPageDisplayName = 'Bite Hub';
const BiteHubPageRoute = '/bite hub';

const ZeroHeroPageDisplayName = 'Zero Hero';
const ZeroHeroPageRoute = '/zero hero';

// const CharityPageDisplayName = 'Charity';
// const CharityPageRoute = '/charity';

const CouponsPageDisplayName = 'Coupon';
const CouponsPageRoute = '/coupon';

const ReviewsPageDisplayName = 'Review';
const ReviewsPageRoute = '/review';

const AccountsPageDisplayName = 'My Account';
const AccountsPageRoute = '/account';

// const MailsPageDisplayName = 'Mail';
// const MailsPageRoute = '/mail';

const NotificationsPageDisplayName = 'Push Notifications';
const NotificationsPageRoute = '/notification';

// const PaymentsPageDisplayName = 'Payment';
// const PaymentsPageRoute = '/payment';

const ReportsPageDisplayName = 'Report';
const ReportsPageRoute = '/report';

const AuthenticationDisplayName = 'Log Out';
const AuthenticationPageRoute = '/auth';

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List<MenuItem> sideMenuItems = [
  MenuItem(DashboardPageDisplayName, DashboardPageRoute),
  MenuItem(OrdersPageDisplayName, OrdersPageRoute),
  MenuItem(CustomersPageDisplayName, CustomersPageRoute),
  MenuItem(BitesPageDisplayName, BitesPageRoute),
  MenuItem(BiteBagPageDisplayName, BiteBagPageRoute),
  MenuItem(BiteHubPageDisplayName, BiteHubPageRoute),
  MenuItem(ZeroHeroPageDisplayName, ZeroHeroPageRoute),
  // MenuItem(CharityPageDisplayName, CharityPageRoute),
  MenuItem(CouponsPageDisplayName, CouponsPageRoute),
  MenuItem(ReviewsPageDisplayName, ReviewsPageRoute),
  MenuItem(AccountsPageDisplayName, AccountsPageRoute),
  // MenuItem(MailsPageDisplayName, MailsPageRoute),
  // MenuItem(NotificationsPageDisplayName, NotificationsPageRoute),
  // MenuItem(PaymentsPageDisplayName, PaymentsPageRoute),
  MenuItem(ReportsPageDisplayName, ReportsPageRoute),
  MenuItem(AuthenticationDisplayName, AuthenticationPageRoute),
];
