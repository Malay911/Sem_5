import 'utils/import_export.dart';

class RxListFavouriteController extends GetxController {
  final items = <RxListFavouriteModal>[
    RxListFavouriteModal(name: 'Item 1'),
    RxListFavouriteModal(name: 'Item 2'),
    RxListFavouriteModal(name: 'Item 3'),
    RxListFavouriteModal(name: 'Item 4'),
    RxListFavouriteModal(name: 'Item 5'),
  ].obs;

  void toggleFavourite(int index) {
    items[index].toggleFavourite();
    items.refresh();
  }
}
