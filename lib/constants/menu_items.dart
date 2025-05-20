/// The list of top-level menu entries used everywhere.
class MenuItemModel {
  final String title;
  final String route;
  const MenuItemModel({ required this.title, required this.route });
}

const List<MenuItemModel> kAppMenuItems = [
  MenuItemModel(title: 'Games', route: '/games'),
  MenuItemModel(title: 'About', route: '/about'),
];