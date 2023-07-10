import 'package:agroapp/bioinsumos/bioinsumo_details_page.dart';
import 'package:agroapp/bioinsumos/bioinsumo_list_page.dart';
import 'package:agroapp/bioinsumos/cultura.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bioinsumos',
      theme: ThemeData(
        primarySwatch: Colors.green, // Altere a cor da AppBar para verde
      ),
      home: BioinsumosPage(),
    );
  }
}

class BioinsumosPage extends StatefulWidget {
  @override
  _BioinsumosPageState createState() => _BioinsumosPageState();
}

class _BioinsumosPageState extends State<BioinsumosPage> {
  List<Bioinsumo> bioinsumos = [];
  List<Cultura> culturas = [];

  @override
  void initState() {
    super.initState();
    fetchBioinsumosData();
  }

  Future<void> fetchBioinsumosData() async {
    String jsonContent = await rootBundle.loadString('assets/dados.json');
    var data = jsonDecode(jsonContent);
    var bioinsumosData = data['data'] as List<dynamic>;

    List<Bioinsumo> fetchedBioinsumos = [];
    List<Cultura> fetchedCulturas = [];

    bioinsumosData.forEach((item) {
      var culturasData = item['culturas'] as List<dynamic>;
      List<Cultura> culturas = culturasData.map<Cultura>((cultura) {
        return Cultura(
          nome: cultura['cultura'],
          nomeCientifico: cultura['nomeCientifico'],
        );
      }).toList();

      Bioinsumo bioinsumo = Bioinsumo(
        tipoFertilizante: item['tipoFertilizante'],
        naturezaFisica: item['naturezaFisica'],
        culturas: culturas,
        especie: item['especie'],
        razaoSocial: item['razaoSocial'],
        uf: item['uf'],
      );

      // Verifica se a cultura já existe na lista de culturas
      bool culturaExists = fetchedCulturas.any((c) => c.nome == culturas[0].nome);

      // Se a cultura ainda não existir, adiciona a cultura à lista
      if (!culturaExists) {
        fetchedCulturas.add(culturas[0]);
      }

      fetchedBioinsumos.add(bioinsumo);
    });

    setState(() {
      bioinsumos = fetchedBioinsumos;
      culturas = fetchedCulturas;
    });
  }

  List<Bioinsumo> getBioinsumosByCultura(String culturaNome) {
    return bioinsumos.where((bioinsumo) {
      return bioinsumo.culturas.any((cultura) => cultura.nome == culturaNome);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Culturas'),
        backgroundColor: Colors.green,
      ),
      body: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 23, // Espaçamento horizontal entre os cards
        mainAxisSpacing: 23, // Espaçamento vertical entre os cards
        padding: EdgeInsets.all(16),
        children: culturas.map((cultura) {
          return GestureDetector(
            onTap: () {
              List<Bioinsumo> bioinsumosCultura = getBioinsumosByCultura(cultura.nome);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BioinsumoListPage(bioinsumos: bioinsumosCultura),
                ),
              );
            },
            child: Card(
              elevation: 30,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                      child: Image.asset(
                        'assets/images/${cultura.nome.toLowerCase()}.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    cultura.nome,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 6, 99, 31),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
