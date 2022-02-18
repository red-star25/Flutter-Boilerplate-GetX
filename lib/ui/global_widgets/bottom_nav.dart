import 'package:base_project_getx/ui/auth/register/register.dart';
import 'package:base_project_getx/utils/flutter/extension.dart';

enum BottomNavBarItem { home, search, cart, profile }

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  BottomNavBarItem currentSelectedItem = BottomNavBarItem.home;

  onBottomNavItemPress(BottomNavBarItem selectedItem) {
    setState(() {
      currentSelectedItem = selectedItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: SizedBox(
        height: 56.h,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconBottomBar(
              text: "Home",
              icon: Icons.home,
              selected:
                  currentSelectedItem == BottomNavBarItem.home ? true : false,
              onPressed: () {
                onBottomNavItemPress(BottomNavBarItem.home);
              },
            ),
            IconBottomBar(
              text: "Search",
              icon: Icons.search_outlined,
              selected:
                  currentSelectedItem == BottomNavBarItem.search ? true : false,
              onPressed: () {
                onBottomNavItemPress(BottomNavBarItem.search);
              },
            ),
            IconBottomBar(
              text: "Cart",
              icon: Icons.local_grocery_store_outlined,
              selected:
                  currentSelectedItem == BottomNavBarItem.cart ? true : false,
              onPressed: () {
                onBottomNavItemPress(BottomNavBarItem.cart);
              },
            ),
            IconBottomBar(
              text: "Profile",
              icon: Icons.person,
              selected: currentSelectedItem == BottomNavBarItem.profile
                  ? true
                  : false,
              onPressed: () {
                onBottomNavItemPress(BottomNavBarItem.profile);
              },
            )
          ],
        ).px24,
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  final primaryColor = const Color(0xff4338CA);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 25,
            color: selected ? primaryColor : Colors.black54,
          ),
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 10,
              height: .1,
              color: selected ? primaryColor : Colors.grey.withOpacity(.75)),
        )
      ],
    );
  }
}
