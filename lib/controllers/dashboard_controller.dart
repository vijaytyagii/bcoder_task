import 'package:get/get.dart';

class DashboardController extends GetxController
{

  final currentIndex = 0.obs;


  changeTab(var index)
  {
    currentIndex.value = index;
  }

}