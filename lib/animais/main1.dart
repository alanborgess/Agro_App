import 'package:agroapp/animais/widgets/card_animal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';


import '../home_page.dart';
import 'model/animal_model.dart';
import 'sreens/animal_page.dart';

const url = 'https://enjoyed-minnow-75.hasura.app/v1/graphql';
const key = 'MpJiuhcFJtcvwnkvEEpG293POyZD5qFT4bhG7gYj2m1CwuMR5M4g6DDB6UgnKmQQ';

final HasuraConnect hasuraConnect = HasuraConnect(
  url,
  headers: {'x-hasura-admin-secret': key},
);

void main() {
  runApp(const MyApp1());
}

class MyApp1 extends StatelessWidget {
  const MyApp1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green, // Define a cor padrão como verde
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
      routes: {
        "animal_page": (context) {
          var result = ModalRoute.of(context)?.settings.arguments;
          Animal? animal = result == null ? null : result as Animal;
          return AnimalPage(
            animal: animal,
          );
        },
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String queryAnimal = """
    query MyQuery {
      animal(order_by: {id: asc})  {
        id
        name
        description
        quantidade
      }
    }
  """;

  Future<AnimalModel> getAllAnimal() async {
    var result = await hasuraConnect.query(queryAnimal);
    return AnimalModel.fromJson(result);
  }

  Future<bool> delete(int id) async {
    String document = """
      mutation MyMutation {
        delete_animal(where: {id: {_eq: $id }}) {
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

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Animais Por Rebanho"),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          size: 30,
        ),
        onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Homepage()),
              );
            },
      ),
    ),
      body: FutureBuilder<AnimalModel>(
          future: getAllAnimal(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemCount: snapshot.data!.data!.animal!.length,
              itemBuilder: (context, i) {
                var animal = snapshot.data!.data!.animal!.elementAt(i);
                return CardAnimal(
                  name: animal.name!,
                  onEdit: () async {
                    await Navigator.pushNamed(
                      context,
                      "animal_page",
                      arguments: animal,
                    );
                    setState(() {});
                  },
                  onDelete: () async {
                    await delete(animal.id!);
                    setState(() {});
                  },
                  description: animal.description!,
                  quantidade: animal.quantidade!,
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Adicinar"),
        icon: const Icon(CupertinoIcons.add),
        onPressed: () async {
          var isSend = await Navigator.pushNamed(context, "animal_page");
          if (isSend != null) {
            setState(() {});
          }
        },
      ),
    );
  }
}