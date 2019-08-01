import 'package:flutter_web/material.dart';
import 'package:quick_quote/screens/zip_validation.dart';

class LOBCard extends StatelessWidget {
  final String imgPath;
  LOBCard(this.imgPath);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: InkWell(
        onTap: () =>Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ZipValidationScreen(),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 150,
            width: 125,
            child: Image.asset(imgPath),
          ),
        ),
      ),
    );
  }
}
