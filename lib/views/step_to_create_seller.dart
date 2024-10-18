import 'package:flutter/material.dart';

class StepToCreateSeller extends StatelessWidget {
  const StepToCreateSeller({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vendre en ligne sur Mossosouk'),
      ),
      body:const Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Il est très facile de vendre en ligne sur Mossosouk.com. Il y'a juste 4 étapes.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              // Step 1
              Text(
                "1- Créer votre boutique et enregistrer vos produits",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Pour créer votre boutique, il vous suffit de remplir et de soumettre le formulaire ci-dessous. Après la soumission du formulaire, vous serez redirigé(e) vers votre tableau de bord. Vous pourrez alors enregistrer vos différents produits.",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 20),
              // Step 2
              Text(
                "2- Signer le protocole d'accord de vente",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Après avoir créé votre boutique, Mossosouk.com SARL reçoit les informations fournies via le formulaire ci-dessous pour vérification. Nous vous enverrons ensuite un protocole d'accord que vous devez lire, signer, et renvoyer à Mossosouk.com SARL par le même canal.",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 20),
              // Step 3
              Text(
                "3- Mossosouk.com SARL valide votre boutique",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Si vous avez accepté les termes du protocole d'accord, Mossosouk.com SARL valide votre boutique. Votre boutique et vos produits sont alors listés parmi les boutiques et les produits de la place de marché.\nNB: Votre boutique et vos produits ne seront pas visibles par les utilisateurs avant cette étape de validation.",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 20),
              // Step 4
              Text(
                "4- Recevez des commandes et vendez vos produits",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Depuis le confort de votre boutique physique ou de votre maison, recevez des commandes. Les produits commandés sont récupérés, emballés et livrés ou expédiés par Mossosouk.com SARL. Vous recevez votre argent après la vente et la déduction des charges, conformément aux termes du protocole d'accord.",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
