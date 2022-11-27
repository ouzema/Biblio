import 'package:bibliotheca/models/auteur.dart';
import 'package:bibliotheca/models/database/dao.dart';
import 'package:flutter/material.dart';

class EditionAuteur extends StatefulWidget {
  final Auteur? auteur;
  const EditionAuteur({this.auteur, Key? key}) : super(key: key);

  @override
  State<EditionAuteur> createState() => _EditionAuteurState();
}

class _EditionAuteurState extends State<EditionAuteur> {
  var nom = TextEditingController();
  var prenoms = TextEditingController();
  var email = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.auteur != null) {
      nom.text = widget.auteur!.nom!;
      prenoms.text = widget.auteur!.prenoms!;
      email.text = widget.auteur!.email!;
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Edition d'auteur"),
        ),
        body: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              TextFormField(
                controller: nom,
                decoration: const InputDecoration(labelText: "Nom"),
                validator: (e) => e!.isEmpty ? "Champ obligatoire" : null,
              ),
              TextFormField(
                controller: prenoms,
                decoration: const InputDecoration(labelText: "Prénoms"),
                validator: (e) => e!.isEmpty ? "Champ obligatoire" : null,
              ),
              TextFormField(
                controller: email,
                decoration: const InputDecoration(labelText: "Email"),
                validator: (e) => e!.isEmpty ? "Champ obligatoire" : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => submit(),
                child: const Text("Enregistrer"),
              ),
            ],
          ),
        ),
      );

  Future<void> submit() async {
    if (formKey.currentState!.validate()) {
      if (widget.auteur == null) {
        Auteur auteur = Auteur();
        auteur.nom = nom.text;
        auteur.prenoms = prenoms.text;
        auteur.email = email.text;
        await Dao.createAuteur(auteur);
      } else {
        Auteur auteur = widget.auteur!;
        auteur.nom = nom.text;
        auteur.prenoms = prenoms.text;
        auteur.email = email.text;
        await Dao.updateAuteur(auteur);
      }
      if (mounted) {
        Navigator.pop(context);
      }
    }
  }
}
