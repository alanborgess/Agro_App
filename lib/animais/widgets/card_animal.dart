import 'package:flutter/material.dart';

class CardAnimal extends StatelessWidget {
  final String name;
  final String description;
  final String quantidade;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const CardAnimal({
    required this.name,
    required this.description,
    required this.quantidade,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Raça Animal: ',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: name,
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Color.fromARGB(255, 41, 113, 45),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Descrição:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Define a cor verde para o subtítulo 'Descrição'
                ),
              ),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 41, 113, 45), // Define a cor verde para o conteúdo da descrição
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Quantidade:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Define a cor verde para o subtítulo 'Quantidade'
                ),
              ),
              Text(
                quantidade.toString(),
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 41, 113, 45), // Define a cor verde para o conteúdo da quantidade
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: onEdit,
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: onDelete,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
