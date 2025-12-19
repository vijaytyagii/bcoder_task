import 'package:dio/dio.dart';
import 'package:vijay_test1/body/login_data.dart';
import 'package:vijay_test1/models/grid_model.dart';

import '../models/list_model.dart';
import '../models/login_model.dart';
import 'dio_client.dart';

class ApiProvider {
  ApiProvider._internal();

  static final ApiProvider _instance = ApiProvider._internal();

  factory ApiProvider() {
    return _instance;
  }

  static String loginApi = 'https://reqres.in/api/login';


  /* Note -- Headers and base URL can be set globally, but since different APIs
 require different headers, I’ve configured them separately for better flexibility a
 nd clarity. */


  Future<LoginModel> login(LoginData loginData) async {
    final response = await DioClient.dio.post(
        loginApi,
        data: loginData.toJson(),
        options: Options(
            headers: {
              'Content-Type': 'application/json',
              'x-api-key': 'pub_3ac1c0461b3f900c7d4eaf48ee856f498a6b140488c2dc729b68df01fedc9417'
            }
        )
    );

    return LoginModel.fromJson(response.data);
  }


  Future<List<GridModel>> getGridData() async {
    final response = await DioClient.dio.get('https://picsum.photos/v2/list?page=5&limit=10');
    List<dynamic> data = response.data;
    return data.map((e) => GridModel.fromJson(e),).toList();
  }



  Future<ListModel> getListData(var pageSize, var pageNo) async {
    final response = await DioClient.dio.get('https://dummyjson.com/products/category/smartphones?limit=$pageSize&skip=$pageNo');
    return ListModel.fromJson(response.data);
  }


  

}