import 'package:flutter_web/material.dart';
import 'package:quick_quote/widgets/lob_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CapInsurance',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.phone),
            padding: EdgeInsets.only(right: 20),
            onPressed: () {},
            tooltip: 'Menu',
          ),
          
        ],
      ),
      body: Column(
        children: <Widget>[
          // Container(
          //   height: 65,
          //   width: double.infinity,
          //   color: Colors.blue,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: <Widget>[
          //       Padding(
          //         padding: const EdgeInsets.only(left: 20),
          //         child: Icon(
          //           Icons.menu,
          //           color: Colors.white,
          //         ),
          //       ),
          //       Text(
          //         'CapInsurance',
          //         style: TextStyle(
          //           fontSize: 30,
          //           fontWeight: FontWeight.bold,
          //           color: Colors.white,
          //         ),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.only(right: 20),
          //         child: InkWell(
          //           onTap: () => PinValidationScreen(),
          //           child: Icon(
          //             Icons.phone,
          //             size: 30,
          //             color: Colors.white,
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          SizedBox(
            height: 200,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              LOBCard('images/pet.jpg'),
              LOBCard('images/travel.jpg'),
            ],
          ),
        ],
      ),
    );
  }
}
