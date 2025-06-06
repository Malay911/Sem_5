import 'utils/import_export.dart';

class FavouriteController {
  final FavouriteModel _model = FavouriteModel();

  List<Map<String, dynamic>> get items => FavouriteModel.favouriteList;

  void toggleFavourite(int index) {
    _model.toggleFavourite(index);
  }

  bool isFavourite(int index) {
    return FavouriteModel.favouriteList[index]['isFavourite'];
  }
}
