import 'package:autocam/models/benefit/benefit.dart';
import 'package:autocam/pages/benefits/widgets/benefits_card.dart';
import 'package:autocam/utils/exports/app_design.dart';
import 'package:flutter/material.dart';

final List<Benefit> benefitsExample = [
  Benefit(
      imageURL: AppImages.Cineplanet,
      title: "2 x 1 en Cine",
      description:
          "Por realizar compras en el Grupo Alese podrás adquirir este beneficio en todos los Cineplanet del país."),
  Benefit(
      imageURL: AppImages.Wong,
      title: "50% de Descuento en Wong",
      description: "En todas las compras realizadas en distintas de Wong."),
];

class BenefitsOthers extends StatelessWidget {
  const BenefitsOthers({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Center(
        child: ListView.builder(
          itemCount: benefitsExample.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) return SizedBox(height: 30);
            return BenefitsCard(benefit: benefitsExample[index - 1]);
          },
        ),
      ),
    );
  }
}