import 'dart:convert';
import 'package:macfoxl/Chits/purchase_chits.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PurchasedChitsScreen extends StatelessWidget {
  final List<String> chitNames;
  final List<int> targetAmounts;

  const PurchasedChitsScreen({
    Key? key,
    required this.chitNames,
    required this.targetAmounts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> getfunction(String month, String amount) async {
      // print('Month: $month');
      // print('Amount: $amount');

      try {
        final response = await http.post(
          Uri.parse('https://chitsoft.in/wapp/api/mobile3/purches_chit_15.php'),
          body: {
            "cid": "11",
            "type": "55",
            "month": month,
            "amount": amount,
          },
        );

        if (response.statusCode == 200) {
          final Map<String, dynamic> data = json.decode(response.body);
          print('Response Data: $data');
          if (data['error'] == false &&
              data.containsKey('available_chits') &&
              data['available_chits'] is List) {
            List<dynamic> availableChits = data['available_chits'];

            for (var chit in availableChits) {
              if (chit is Map<String, dynamic>) {
                String month = chit['Month'] ?? 'Unknown';
                String months = chit['Months'] ?? 'Unknown';
                int amount = chit['Amount'] ?? 0;
                int lakh = chit['Lakh'] ?? 0;
                int totalinvestor = chit['Totainvestor'] ?? 0;
                String startDate = chit['Start_Date'] ?? 'N/A';
                String endDate = chit['End_Date'] ?? 'N/A';
                int brokage = chit['Brokage'] ?? 0;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SelectedChit(
                      amount: amount,
                      endDate: endDate,
                      total_month: 2,
                      chitPotName: "name",
                      contributionamount: 50,
                      due: 5,
                      totalamount: 5000,
                      startDate: startDate,
                    ),
                  ),
                );
                print('Month: $month');
                print('Months: $months');
                print('Amount: $amount');
                print('Start Date: $startDate');
                print('End Date: $endDate');
                print('End Date: $totalinvestor');
                print('Brokage: $brokage');
                print('lakh: $lakh');
              }
            }
          } else {
            print('Error in response or no available chits.');
          }
        } else {
          print('Failed to get data. Status code: ${response.statusCode}');
        }
      } catch (err) {
        print('Error: $err');
      }
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Purchased Chits',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            fontSize: 27,
            height: 37 / 27,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: const [
          Icon(
            Icons.notifications_sharp,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            for (int i = 0; i < chitNames.length; i++)
              colliectionofchit(
                size,
                chitNames[i],
                targetAmounts[i].toString(),
                () {
                  getfunction(
                    chitNames[i].toString(),
                    targetAmounts[i].toString(),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }

  GestureDetector colliectionofchit(
    Size size,
    String monthname,
    String investors,
    Function() function,
  ) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: size.height / 8,
        width: size.width,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
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
                    color: const Color(0Xff0D0140),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      investors,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: size.width * 0.05,
                        height: 31 / 21,
                        color: const Color(0Xff0039DB),
                      ),
                    ),
                    Text(
                      ' Lakh chit',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: size.width * 0.045,
                        height: 22 / 15,
                        color: const Color(0Xff0039DB),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
