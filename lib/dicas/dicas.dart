import 'package:flutter/material.dart';

class AgriculturalTipsPage extends StatelessWidget {
  final List<String> imageUrls = [
    'assets/images/dica1.jpg',
    'assets/images/dica2.jpg',
    'assets/images/dica3.jpg',
    'assets/images/dica4.jpg',
    'assets/images/dica5.jpg',
    'assets/images/dica6.jpg',
    'assets/images/dica7.jpg',
    'assets/images/dica8.jpg',
    'assets/images/dica9.jpg',
    'assets/images/dica10.jpg',
    'assets/images/dica11.jpg',
    'assets/images/dica12.jpg',
    'assets/images/dica13.jpg',
    'assets/images/dica14.jpg',
    // Adicione mais imagens conforme necessário
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dicas Agrícolas'),
        backgroundColor: Colors.green,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0 / 1.0, // Proporção desejada para os cards
        ),
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FullScreenImagePage(imageUrl: imageUrls[index]),
                  fullscreenDialog: true,
                ),
              );
            },
            child: Hero(
              tag: imageUrls[index],
              child: Card(
                child: AspectRatio(
                  aspectRatio: 1 / 1.5, // Proporção desejada para a imagem dentro do card
                  child: Image.asset(
                    imageUrls[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class FullScreenImagePage extends StatelessWidget {
  final String imageUrl;

  const FullScreenImagePage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: imageUrl,
            child: Image.asset(
              imageUrl,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AgriculturalTipsPage(),
  ));
}
