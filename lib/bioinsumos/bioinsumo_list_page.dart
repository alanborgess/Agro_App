import 'package:agroapp/bioinsumos/bioinsumo_details_page.dart';
import 'package:flutter/material.dart';

class BioinsumoListPage extends StatelessWidget {
  final List<Bioinsumo> bioinsumos;

  BioinsumoListPage({required this.bioinsumos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bioinsumos'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: bioinsumos.length,
        itemBuilder: (context, index) {
          final bioinsumo = bioinsumos[index];

          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            color: Colors.green.shade50,
            child: ListTile(
              title: Text(bioinsumo.tipoFertilizante),
              subtitle: Text(
                bioinsumo.razaoSocial,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BioinsumoDetailsPage(bioinsumo: bioinsumo),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
