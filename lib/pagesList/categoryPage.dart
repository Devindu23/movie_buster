import 'package:flutter/material.dart';
import '../UtilitiesList/CustomNavigation.dart';

class categoryPage extends StatelessWidget {
  const categoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigation(),
    );
  }
}
