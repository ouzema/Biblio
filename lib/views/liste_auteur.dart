import 'package:bibliotheca/models/auteur.dart';
import 'package:bibliotheca/models/database/dao.dart';
import 'package:bibliotheca/views/edition_auteur.dart';
import 'package:flutter/material.dart';

class ListeAuteur extends StatefulWidget {
  const ListeAuteur({Key? key}) : super(key: key);

  @override
  State<ListeAuteur> createState() => _ListeAuteurState();
}

class _ListeAuteurState extends State<ListeAuteur> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Liste des auteurs"),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => ouvrirEdition(),
        ),
        body: FutureBuilder<List<Auteur>>(
            initialData: const [],
            future: Dao.listeAuteur(),
            builder: (context, snapshot) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, i) {
                  Auteur auteur = snapshot.data![i];
                  return ListTile(
                    leading: const Icon(Icons.book),
                    title: Text("${auteur.nom} ${auteur.prenoms}"),
                    subtitle: Text("${auteur.email}"),
                    onTap: () => ouvrirEdition(auteur: auteur),
                  );
                },
              );
            }),
      );

  ouvrirEdition({Auteur? auteur}) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EditionAuteur(
          auteur: auteur,
        ),
      ),
    );
    setState(() {});
  }
}
