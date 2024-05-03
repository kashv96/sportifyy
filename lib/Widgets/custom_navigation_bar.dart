import 'package:flutter/material.dart';

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
  void _onItemTapped(int index) {
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(5, (index) {
      bool isSelected = widget.selectedIndex == index;
      IconData iconData;
      switch (index) {
        case 0:
          iconData = Icons.home;
          break;
        case 1:
          iconData = Icons.search;
          break;
        case 2:
          iconData = Icons.add;
          break;
        case 3:
          iconData = Icons.notifications;
          break;
        case 4:
          iconData = Icons.person;
          break;
        default:
          iconData = Icons.home;
      }
      return Expanded(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: isSelected ? 60 : 50,
          child: IconButton(
            icon: Icon(iconData,
                size: isSelected ? 30 : 24,
                color: isSelected ? Colors.black : Colors.grey),
            onPressed: () => _onItemTapped(index),
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
