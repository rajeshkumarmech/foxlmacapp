// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Selected_chit_month.dart';

class lakhchits extends StatelessWidget {
  List<dynamic> monthList;
  final int amount_val;
  final String month;
  lakhchits({
    Key? key,
    required this.amount_val,
    required this.monthList,
    required this.month,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> selectedfunction(
        String month, String amount, String val) async {
      print(val);
      print(month);
      print(amount);
      try {
        final response = await http.post(
          Uri.parse(
              'https://chitsoft.in/wapp/api/mobile3/pay_lak_chit_api.php'),
          body: {
            "cid": "11",
            "type": amount,
            "month": val,
            "due_month": month,
          },
        );

        if (response.statusCode == 200) {
          print('Response body: ${response.body}');
          final Map<String, dynamic> data = json.decode(response.body);
          if (data.containsKey('Available Chits')) {
            Map<String, dynamic> availableChits = data['Available Chits'];
            String chitMonth = availableChits['Month'] ?? 'Unknown';
            int months = availableChits['Months'] ?? 0;
            int amount = availableChits['Amount'] ?? 0;
            int totalAmount = availableChits['Total Amount'] ?? 0;
            String startDate = availableChits['Start Date'] ?? 'Unknown';
            String endDate = availableChits['End Date'] ?? 'Unknown';
            int due = availableChits['Due'] ?? 0;
            int auction = availableChits['Auction'] ?? 0;
            int dueAmount = availableChits['Due Amount'] ?? 0;
            int contributionAmount = availableChits['Contribution Amount'] ?? 0;
            print('Chit Month: $chitMonth');
            print('Total Months: $months');
            print('Amount: $amount');
            print('Total Amount: $totalAmount');
            print('Start Date: $startDate');
            print('End Date: $endDate');
            print('Due: $due');
            print('Due Amount: $dueAmount');
            print('Contribution Amount: $contributionAmount');
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SelectedChitMonth(
                      amount: amount,
                      contributionamount: contributionAmount,
                      due: due,
                      due_amount: dueAmount,
                      end_Date: endDate,
                      month: chitMonth,
                      start_Date: startDate,
                      total_Months: months,
                      lakhamount: totalAmount,
                      auctionwin:
                          auction, // Assuming auctionwin is not in this response
                    )));
          } else {
            print('Available Chits key is missing in the response.');
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
        title: Text(
          '$amount_val Lakh CHITS',
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 27,
              height: 37 / 27,
              color: Colors.white),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.close_rounded,
            size: 35,
            color: Colors.white,
          ),
        ),
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
          for (var monthData in monthList)
            if (monthData is Map<String, dynamic>)
              colliectionofchit(
                size,
                monthData['month'] ?? 'Unknown Month',
                monthData['Investor Count'] ?? '0',
                () {
                  selectedfunction(
                      monthData['month'], amount_val.toString(), month);
                },
              ),
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
                      'Total Investors : ',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: size.width * 0.045,
                          height: 22 / 15,
                          color: const Color(0Xff0D0140)),
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 2,
                              color: Color.fromARGB(255, 128, 122, 122),
                            )
                          ]),
                      child: Center(
                        child: Image.asset('assets/arrow.png'),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
