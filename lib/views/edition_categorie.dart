import 'package:bibliotheca/models/categorie.dart';
import 'package:bibliotheca/models/database/dao.dart';
import 'package:flutter/material.dart';

class EditionCategorie extends StatefulWidget {
  final Categorie? categorie;
  const EditionCategorie({this.categorie, Key? key}) : super(key: key);

  @override
  State<EditionCategorie> createState() => _EditionCategorieState();
}

class _EditionCategorieState extends State<EditionCategorie> {
  var libelle = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.categorie != null) {
      libelle.text = widget.categorie!.libelle!;
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Edition de catégorie"),
        ),
        body: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              TextFormField(
                controller: libelle,
                decoration: const InputDecoration(labelText: "Nom catégorie*"),
                validator: (e) => e!.isEmpty ? "Champ obligatoire" : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async => submit(),
                child: const Text("Enregistrer"),
              ),
            ],
          ),
        ),
      );

  Future<void> submit() async {
    if (formKey.currentState!.validate()) {
      if (widget.categorie == null) {
        Categorie categorie = Categorie();
        categorie.libelle = libelle.text;
        await Dao.createCategorie(categorie);
      } else {
        Categorie categorie = widget.categorie!;
        categorie.libelle = libelle.text;
        await Dao.updateCategorie(categorie);
      }
      if (mounted) {
        Navigator.pop(context);
      }
    }
  }
}
