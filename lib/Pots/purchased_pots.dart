import 'package:macfoxl/Module/PurchasedPotmodule.dart';
import 'package:macfoxl/Pots/chitpot_name.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PurchasedPotPage extends StatelessWidget {
  List<String> chitPotName;
  List<int> target;
  PurchasedPotPage({
    Key? key,
    required this.chitPotName,
    required this.target,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future<void> getfunction(String chitpotname, String amount) async {
      print(chitpotname.toString());
      print(amount.toString());
      try {
        final response = await http.post(
          Uri.parse('https://chitsoft.in/wapp/api/mobile3/purches_chit_13.php'),
          body: {
            "cid": "11",
            "type": "55",
            "chit_pot_name": chitpotname.toString(),
            "amount": amount.toString(),
          },
        );

        if (response.statusCode == 200) {
          final Map<String, dynamic> data = json.decode(response.body);
          if (data['error'] == false && data.containsKey('available_chits')) {
            List<dynamic> availableChits = data['available_chits'];
            for (var chit in availableChits) {
              if (chit is Map<String, dynamic>) {
                String chitPotName = chit['Chit_pot_name'] ?? 'Unknown Chit';
                int amount = chit['Amount'] ?? 0;
                int contributionamount = chit['Contribution_amount'] ?? 0;
                int totalamount = chit['Total_amount'] ?? 0;
                int total_month = chit['Total_month'] ?? 0;
                int due = chit['Due'] ?? 0;
                print('Chit Pot Name: $chitPotName');
                print('Chit Pot Name: $amount');
                print('Chit Pot Name: $total_month');
                print('Chit Pot Name: $contributionamount');
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChitpotName_Page(
                          contributionamount: contributionamount,
                          totalamount: totalamount,
                          amount: amount,
                          chitPotName: chitPotName,
                          due: due,
                          total_month: total_month,
                        )));
              }
            }
          } else {
            print('Error in response or no available chits.');
          }
        } else {
          print('Failed to get data. Status code: ${response.statusCode}');
        }
      } catch (e) {
        print('Error: $e');
      }
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Container(),
        title: const Text(
          'Purchased Pots',
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 27,
              height: 37 / 27,
              color: Colors.white),
        ),
        centerTitle: true,
        actions: const [
          Icon(
            Icons.notifications_sharp,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(children: [
          for (int i = 0; i < chitPotName.length; i++)
            colliectionofchit(size, chitPotName[i], target[i].toString(), () {
              getfunction(chitPotName[i], target[i].toString());
            }),
        ]),
      ),
    );
  }

  GestureDetector colliectionofchit(
      Size size, String monthname, String investors, Function() function) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: size.height / 8,
        width: size.width,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$monthname Chit',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.065,
                      height: 33 / 22,
                      color: const Color(0Xff0D0140)),
                ),
                Row(
                  children: [
                    Text(
                      'Target : ',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: size.width * 0.045,
                          height: 22 / 15,
                          color: const Color(0Xff0039DB)),
                    ),
                    Text(
                      investors,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          fontSize: size.width * 0.05,
                          height: 31 / 21,
                          color: const Color(0Xff0039DB)),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
