import 'package:get/get.dart';
import 'package:lab/Lab_11_MADF/A3/getx_rest_api_search_model.dart';
import 'package:lab/Lab_11_MADF/A3/utils/getx_rest_api_service.dart';

class GetxRestApiController extends GetxController {
  var allDataList = <GetxRestApiModel>[].obs;
  var dataList = <GetxRestApiModel>[].obs;
  var searchText = ''.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDataFromApi();
  }

  void fetchDataFromApi() async {
    isLoading.value = true;
    final data = await GetxRestApiService().fetchData();
    allDataList.value = data;
    dataList.value = data;
    isLoading.value = false;
  }

  void filterData(String query) {
    if (query.isEmpty) {
      dataList.value = allDataList;
    } else {
      final lowerQuery = query.toLowerCase();
      dataList.value = allDataList.where((item) {
        final name = item.name?.toLowerCase() ?? '';
        final desc = item.description?.toLowerCase() ?? '';
        return name.contains(lowerQuery) || desc.contains(lowerQuery);
      }).toList();
    }
  }
}
