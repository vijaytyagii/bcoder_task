import 'package:vijay_test1/api_provider/api_provider.dart';
import 'package:vijay_test1/body/login_data.dart';
import 'package:vijay_test1/models/grid_model.dart';
import 'package:vijay_test1/models/list_model.dart';
import 'package:vijay_test1/models/login_model.dart';

class Repo {
  Repo._internal();
  static final Repo _instance = Repo._internal();
  factory Repo() {
    return _instance;
  }

ApiProvider _apiProvider = ApiProvider();

Future<LoginModel> login(LoginData loginData)
{
  return _apiProvider.login(loginData);
}

Future<List<GridModel>> getGridData()
{
  return _apiProvider.getGridData();
}

Future<ListModel> getListData(var pageSize, var pageNo)
{
  return _apiProvider.getListData(pageSize, pageNo);
}

}