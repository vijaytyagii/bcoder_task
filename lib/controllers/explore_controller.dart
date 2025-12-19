import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vijay_test1/repositories/repo.dart';

import '../const/error_snack.dart';
import '../models/list_model.dart';

class ExploreController extends GetxController
{

final listData = <Products>[].obs;
final isFirstLoading =false.obs;
final isLoading = false.obs;
final pageSize = 10.obs;
final pageNo = 1.obs;


Repo _repo = Repo();

Future<void> getListData(BuildContext context)
async {
try{
  isLoading.value = true;
  print('pageNo $pageNo');
  final response = await _repo.getListData(pageSize, pageNo);
  listData.value.addAll(response.products!);
  pageNo.value++;
  isFirstLoading.value = false;
  isLoading.value = false;
}
on DioException catch (e)
  {
    isFirstLoading.value = false;
    isLoading.value = false;
    ErrorSnack.errorSnackBar(
      context,
      e.error?.toString() ?? 'Something went wrong',
    );
  }
}
}