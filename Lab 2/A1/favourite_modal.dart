//WAP to create list with favourite and unfavourite options using static list.
//WAP to design signup form with [Name,Email,Phone Number,Password,Confirm Password].
//WAP to validate signup form with above details.
//WAP to create a profile card with available widgets in Flutter.
//WAP to create design like e-commerce(Amazon,Flipkart) application dashboard.

class FavouriteModel {
  static final List<Map<String, dynamic>> favouriteList = [
    {
      "name": "Apple",
      "description": "A sweet red fruit",
      "isFavourite": false,
    },
    {
      "name": "Banana",
      "description": "A long yellow fruit",
      "isFavourite": false,
    },
    {
      "name": "Cherry",
      "description": "A small red fruit",
      "isFavourite": false,
    },
    {
      "name": "Date",
      "description": "A sweet brown fruit",
      "isFavourite": false,
    },
  ];

  void toggleFavourite(int index) {
    favouriteList[index]['isFavourite'] = !favouriteList[index]['isFavourite'];
  }
}
