import 'utils/import_export.dart';

class GetxRestApiController extends GetxController {
  // var isLoading = true.obs;
  var dataList = <GetxRestApiModel>[].obs;

  @override
  void onInit() {
    fetchDataFromApi();
    super.onInit();
  }

  void fetchDataFromApi() async {
    var data = await GetxRestApiService().fetchData();
    dataList.value = data;
  }
}
