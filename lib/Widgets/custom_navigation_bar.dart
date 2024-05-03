import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  void _onItemTapped(int index, String iconRoute) {
    widget.onItemSelected(index);
    Navigator.of(context).pushNamed(iconRoute);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(5, (index) {
      bool isSelected = widget.selectedIndex == index;
      IconData iconData;
      String iconRoute = '/home';
      switch (index) {
        case 0:
          iconData = FontAwesomeIcons.houseChimney;
          iconRoute = '/home';
          break;
        case 1:
          iconData = FontAwesomeIcons.locationArrow;
          iconRoute = '/home';
          break;
        case 2:
          iconData = FontAwesomeIcons.solidSquarePlus;
          iconRoute = '/create-game-event';
          break;
        case 3:
          iconData = FontAwesomeIcons.solidComments;
          iconRoute = '/home';
          break;
        case 4:
          iconData = FontAwesomeIcons.solidUser;
          iconRoute = '/home';
          break;
        default:
          iconData = FontAwesomeIcons.houseChimney;
          iconRoute = '/home';
      }
      return Expanded(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: isSelected ? 60 : 50,
          child: IconButton(
            icon: Icon(iconData,
                size: isSelected ? 30 : 24,
                color: isSelected ? Colors.black : Colors.grey),
            onPressed: () => _onItemTapped(index, iconRoute),
          ),
        ),
      );
    });

    return Container(
      decoration: BoxDecoration(
        color: Colors.white54, // Semi-transparent white
        boxShadow: [
          BoxShadow(
            color:
                Colors.black.withOpacity(0.1), // Light shadow for subtle effect
            spreadRadius: 0,
            blurRadius: 10, // Soften the shadow
            offset: const Offset(0, -5), // Vertical offset for shadow direction
          )
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
    );
  }
}
