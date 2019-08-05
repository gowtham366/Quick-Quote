import 'package:flutter_web/material.dart';
import 'package:quick_quote/dataLists/GlobalConstants.dart';
import 'package:quick_quote/screens/zip_validation.dart';

class LOBCard extends StatelessWidget {
  final Map<String, Object> lineDetails;
  LOBCard(this.lineDetails);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          GlobalConstants.lobName = lineDetails['lobName'];
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ZipValidationScreen(),
            ),
          );
        },
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 150,
                width: 125,
                child: Image.asset(lineDetails['imageDir']),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
