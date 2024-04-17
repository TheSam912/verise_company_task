import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/AppColor.dart';

// ignore: must_be_immutable
class CustomBottomNavigationBar extends StatefulWidget {
  int selectedIndex;
  var onItemTapped;

  CustomBottomNavigationBar(
      {required this.selectedIndex, required this.onItemTapped});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.selectedIndex,
      onTap: widget.onItemTapped,
      backgroundColor: AppColor.primary,
      type: BottomNavigationBarType.fixed,
      items: [
        (widget.selectedIndex == 0)
            ? BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/home-filled.svg',
                  color: AppColor.whiteSoft,
                ),
                label: "")
            : BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/home.svg',
                  color: Colors.grey[600],
                ),
                label: ''),
        (widget.selectedIndex == 1)
            ? BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/discover-filled.svg',
                  color: AppColor.whiteSoft,
                ),
                label: '')
            : BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/discover.svg',
                  color: Colors.grey[600],
                ),
                label: ''),
        (widget.selectedIndex == 2)
            ? BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/bookmark-filled.svg',
                  color: AppColor.whiteSoft,
                ),
                label: '')
            : BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/bookmark.svg',
                  color: Colors.grey[600],
                ),
                label: ''),
      ],
    );
  }
}
