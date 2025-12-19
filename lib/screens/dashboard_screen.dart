import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vijay_test1/const/text_style.dart';
import 'package:vijay_test1/controllers/dashboard_controller.dart';
import 'package:vijay_test1/controllers/home_controller.dart';

import 'explore_screen.dart';
import 'home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {


  DashboardController controller = Get.put(DashboardController());
  final List<Widget> _pages = [
    HomeScreen(),
    ExploreScreen(),
    const Center(child: Text('Calendar Page')),
    const Center(child: Text('Profile Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
          child: Obx(() =>
              Stack(
                children: [

                  /// 🔹 PAGE CONTENT
                  // bottom: 80,
                  _pages[controller.currentIndex.toInt()],

                  /// 🔹 CUSTOM BOTTOM BAR
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: _customBottomBar(),
                    ),
                  ),

                ],
              ))
      ),
    );
  }

  Widget _customBottomBar() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: const Color(0xFF474747),
        borderRadius: BorderRadius.circular(80),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            _navItem('assets/images/home_icon.svg', 'Home', 0),
            SizedBox(width: 4),
            _navItem('assets/images/explore_icon.svg', 'Search', 1),
            SizedBox(width: 4),
            _navItem('assets/images/calender_icon.svg', 'Calendar', 2),
            SizedBox(width: 4),
            _navItem('assets/images/text_icon.svg', 'Profile', 3),
          ],
        ),
      ),
    );
  }

  Widget _navItem(String image, String label, int index) {
    return Obx(() {
      final bool isSelected = controller.currentIndex.value == index;

      return GestureDetector(
        onTap: () {
          controller.changeTab(index);
        },
        child: AnimatedContainer(
          height: 50,
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(55),
            border: !isSelected
                ? Border.all(width: 1, color: Colors.grey)
                : null,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
            child: Row(
              children: [
                SvgPicture.asset(
                  image,
                  height: 24,
                  width: 24,
                  color: isSelected ? Colors.black : Colors.white,
                ),
                if (isSelected) ...[
                  const SizedBox(width: 6),
                  Text(
                    label,
                    style: AppTextStyle.semiBold.copyWith(fontSize: 11),
                  ),
                ]
              ],
            ),
          ),
        ),
      );
    });
  }
}
