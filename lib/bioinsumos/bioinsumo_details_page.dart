import 'package:agroapp/bioinsumos/cultura.dart';
import 'package:flutter/material.dart';

class BioinsumoDetailsPage extends StatelessWidget {
  final Bioinsumo bioinsumo;

  const BioinsumoDetailsPage({Key? key, required this.bioinsumo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Bioinsumo'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Card(
          color: Colors.lightGreen[100], // Definindo a cor de fundo verde levemente
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSubtitle('Tipo de Fertilizante'),
                _buildText(bioinsumo.tipoFertilizante),
                _buildSubtitle('Natureza Física'),
                _buildText(bioinsumo.naturezaFisica),
                _buildSubtitle('Espécie'),
                _buildText(bioinsumo.especie),
                _buildSubtitle('Razão Social'),
                _buildText(bioinsumo.razaoSocial),
                _buildSubtitle('UF'),
                _buildText(bioinsumo.uf),
                SizedBox(height: 16.0),
                _buildSubtitle('Culturas'),
                Column(
                  children: bioinsumo.culturas.map((cultura) => _buildText(cultura.nome)).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubtitle(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildText(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
    );
  }
}

class Bioinsumo {
  final String tipoFertilizante;
  final String naturezaFisica;
  final List<Cultura> culturas;
  final String especie;
  final String razaoSocial;
  final String uf;

  Bioinsumo({
    required this.tipoFertilizante,
    required this.naturezaFisica,
    required this.culturas,
    required this.especie,
    required this.razaoSocial,
    required this.uf,
  });
}
