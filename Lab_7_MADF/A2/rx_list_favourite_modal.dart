// WAP to display the favorite icon in it and change it based on changes on the RxListitem variable. 
class RxListFavouriteModal {
  final String name;
  bool isFavourite;

  RxListFavouriteModal({required this.name, this.isFavourite = false});

  void toggleFavourite() {
    isFavourite = !isFavourite;
  }
}