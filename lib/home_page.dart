import 'package:agroapp/animais/main1.dart';
import 'package:agroapp/loja/loja.dart';
import 'package:agroapp/profile.dart';
import 'package:flutter/material.dart';

import 'bioinsumos/bioinsumos.dart';
import 'dicas/dicas.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: AppDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.lightGreen),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Image.asset("assets/images/Logo.png"),
        title: Text('Página Inicial'), // Changed the title to "Página Inicial"
      ),
body: Column(
  children: <Widget>[
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Pagina inicial',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.8, // Defina um valor maior do que 1 para tornar os cards mais estreitos
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp1()),
                );
              },
              child: Card(
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Image.asset(
                          'assets/images/animaisa.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Rebanho de Animais',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BioinsumosPage()),
                );
              },
              child: Card(
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Image.asset(
                          'assets/images/insum.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Bioinsumos Agrícolas',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AgriculturalTipsPage()),
                );
              },
              child: Card(
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Image.asset(
                          'assets/images/dica.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Dicas do Agro',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LojaPage()),
                );
              },
              child: Card(
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Image.asset(
                          'assets/images/loja.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Visite lojas de produtos Agricolas',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ],
),

      persistentFooterButtons: [
        Row(
          // Image.asset('assets/images/profile.jpg')
        ),
      ],
      bottomNavigationBar: new Container(
        color: Colors.white,
        height: 50.0,
        alignment: Alignment.center,
        child: new BottomAppBar(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new IconButton(
                icon: Icon(
                  Icons.home,
                  color: Colors.green,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Homepage()),
                  );
                },
              ),
              new IconButton(
                icon: Icon(
                  Icons.pets,
                  color: Colors.green,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp1()),
                  );
                },
              ),
              new IconButton(
                icon: Icon(
                  Icons.newspaper,
                  color: Colors.green,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AgriculturalTipsPage()),
                  );
                },
              ),
              new IconButton(
                icon: Icon(
                  Icons.account_circle_rounded,
                  color: Colors.green,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfile()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromARGB(255, 186, 227, 227), // Altera a cor de fundo
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Alan Borges"),
              accountEmail: Text("Desenvolvedor do Aplicativo"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/alan.jpg"),
               ),
              decoration: BoxDecoration(
             color: Color.fromARGB(255, 40, 116, 117), // Define a cor de fundo personalizada
            ),
            ),
            ListTile(
              title: Text("Sobre o Desenvolvedor"),
              subtitle: Text("Analista de Sistemas, Senior na Microsoft"),
            ),
            ListTile(
              title: Text("Email"),
              subtitle: Text("alanborges942@gmail.com"),
            ),
            ListTile(
              leading: Icon(Icons.facebook, size: 40),
              title: Text("Facebook"),
              onTap: () {
                // Adicione a lógica para abrir o perfil do Instagram
              },
            ),
            ListTile(
              leading: Icon(Icons.flutter_dash, size: 40),
              title: Text("GitHub"),
              onTap: () {
                // Adicione a lógica para abrir o perfil do GitHub
              },
            ),
          ],
        ),
      ),
    );
  }
}



void main() {
  runApp(Homepage());
}
