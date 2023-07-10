import 'package:agroapp/animais/main1.dart';
import 'package:flutter/material.dart';
import '../model/animal_model.dart';

class AnimalPage extends StatefulWidget {
  final Animal? animal;
  const AnimalPage({Key? key, this.animal}) : super(key: key);

  @override
  State<AnimalPage> createState() => _AnimalPageState();
}

class _AnimalPageState extends State<AnimalPage> {
  var nameController = TextEditingController();
  var descricaoController = TextEditingController();
  var quantidadeController = TextEditingController();

  @override
  void initState() {
    _init();
    super.initState();
  }

  Future<void> _init() async {
    if (widget.animal != null) {
      nameController.text = widget.animal!.name!;
      descricaoController.text = widget.animal!.description!;
      quantidadeController.text = widget.animal!.quantidade!;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicione um Animal"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(30),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade200,
                hintText: "Raça Animal",
              ),
              style: TextStyle(fontSize: 16),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: TextField(
              controller: descricaoController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade200,
                hintText: "Descrição",
              ),
              style: TextStyle(fontSize: 16),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: TextField(
              controller: quantidadeController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade200,
                hintText: "Quantidade",
              ),
              style: TextStyle(fontSize: 16),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: SizedBox(
              height: 60,
              child: ElevatedButton.icon(
                onPressed: nameController.text == ""
                    ? null
                    : () async {
                        late bool isSend;
                        if (widget.animal != null) {
                          isSend = await update(
                            widget.animal!.id!,
                            nameController.text,
                            descricaoController.text,
                            quantidadeController.text,
                          );
                        } else {
                          isSend = await sendAnimal(
                            nameController.text,
                            descricaoController.text,
                            quantidadeController.text,
                          );
                        }
                        if (isSend) {
                          Navigator.pop(context, isSend);
                        }
                      },
                icon: const Icon(
                  Icons.save,
                ),
                label: const Text(
                  'Salvar Animal',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<bool> sendAnimal(
      String name, String description, String quantidade) async {
    String documentMutation = """
      mutation MyMutation {
        insert_animal(objects: {name: "$name", description: "$description", quantidade: "$quantidade" }) {
          affected_rows
        }
      }
    """;

    try {
      await hasuraConnect.mutation(documentMutation);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> update(
      int id, String name, String description, String quantidade) async {
    String document = """
      mutation MyMutation {
        update_animal(where: {id: {_eq: $id }}, _set: {name: "$name", description: "$description", quantidade: "$quantidade"}) {
          affected_rows
        }
      }  
    """;
    try {
      await hasuraConnect.mutation(document);
      return true;
    } catch (e) {
      return false;
    }
  }
}
