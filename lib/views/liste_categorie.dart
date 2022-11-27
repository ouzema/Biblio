import 'package:bibliotheca/models/categorie.dart';
import 'package:bibliotheca/models/database/dao.dart';
import 'package:bibliotheca/views/edition_categorie.dart';
import 'package:flutter/material.dart';

class ListeCategorie extends StatefulWidget {
  const ListeCategorie({Key? key}) : super(key: key);

  @override
  State<ListeCategorie> createState() => _ListeCategorieState();
}

class _ListeCategorieState extends State<ListeCategorie> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Liste des catégories"),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => ouvrirEdition(),
        ),
        body: FutureBuilder<List<Categorie>>(
            future: Dao.listeCategorie(),
            initialData: const [],
            builder: (context, snapshot) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, i) {
                    var cat = snapshot.data![i];
                    return ListTile(
                      leading: const Icon(Icons.book),
                      title: Text(cat.libelle!),
                      onTap: () => ouvrirEdition(categorie: cat),
                    );
                  });
            }),
      );

  ouvrirEdition({Categorie? categorie}) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EditionCategorie(
          categorie: categorie,
        ),
      ),
    );
    setState(() {});
  }
}
