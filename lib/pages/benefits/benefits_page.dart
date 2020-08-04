import 'package:autocam/pages/benefits/widgets/benefits_economics.dart';
import 'package:autocam/pages/benefits/widgets/benefits_other.dart';
import 'package:flutter/material.dart';

class BenefitsPage extends StatefulWidget {
  BenefitsPage({Key key}) : super(key: key);

  @override
  _BenefitsPageState createState() => _BenefitsPageState();
}

class _BenefitsPageState extends State<BenefitsPage> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        BenefitsEconomics(),
        BenefitsOthers(),
      ],
    );
  }
}
