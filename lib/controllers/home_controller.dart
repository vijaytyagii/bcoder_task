import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vijay_test1/models/grid_model.dart';
import 'package:vijay_test1/repositories/repo.dart';

import '../const/error_snack.dart';

class HomeController extends GetxController
{

  final gridData = <GridModel>[].obs;
  final isLoading = false.obs;

  Repo _repo = Repo();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // getGridData();
  }


  void getGridData(BuildContext context)
  async {
   try
       {
         isLoading.value = true;

         final response = await _repo.getGridData();
         gridData.value = response;
         isLoading.value = false;
       }
   on DioException catch (e)
    {
      isLoading.value = false;
      ErrorSnack.errorSnackBar(
        context,
        e.error?.toString() ?? 'Something went wrong',
      );
    }
  }
}