import 'utils/import_export.dart';

void main() {
  runApp(const MaterialApp(home: FavouriteView()));
}

class FavouriteView extends StatefulWidget {
  const FavouriteView({super.key});

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {
  final FavouriteController _controller = FavouriteController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Fruits'),
      ),
      body: ListView.builder(
        itemCount: _controller.items.length,
        itemBuilder: (context, index) {
          final item = _controller.items[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(item['name']),
              subtitle: Text(item['description']),
              trailing: IconButton(
                icon: Icon(
                  _controller.isFavourite(index)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: _controller.isFavourite(index) ? Colors.red : null,
                ),
                onPressed: () {
                  setState(() {
                    _controller.toggleFavourite(index);
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
