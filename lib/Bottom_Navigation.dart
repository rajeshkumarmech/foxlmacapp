import 'dart:convert';
import 'package:macfoxl/Module/PurchasedPotmodule.dart';
import 'package:macfoxl/Strategical_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:http/http.dart' as http;
import 'package:macfoxl/Chits/chits.dart';
import 'package:macfoxl/HomePage.dart';
import 'package:macfoxl/Pots/purchased_pots.dart';
import 'package:macfoxl/User_Profile.dart';

class Bottomnavbar extends StatefulWidget {
  const Bottomnavbar({super.key});

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  List<String> chitNames = [];
  List<String> chitPotNames = [];
  List<int> targetAmounts = [];
  List<int> targets = [];
  int index = 0;

  Future<void> getPurchasePots() async {
    try {
      final response = await http.post(
        Uri.parse('https://chitsoft.in/wapp/api/mobile3/purches_chit_12.php'),
        body: {
          "cid": "11",
          "type": "55",
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        // Parse JSON to ChitResponse model
        ChitResponse chitResponse = ChitResponse.fromJson(data);

        // Extract names and amounts using parsed model
        List<String> fetchedChitNames = [];
        List<int> fetchedTargetAmounts = [];

        for (var chit in chitResponse.availableChits) {
          fetchedChitNames.add(chit.chitPotName);
          fetchedTargetAmounts.add(chit.amount);
        }

        setState(() {
          chitPotNames = fetchedChitNames;
          targets = fetchedTargetAmounts;
        });
      } else {
        print('Failed to get data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  // Future<void> getpurchasePots() async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse('https://chitsoft.in/wapp/api/mobile3/purches_chit_12.php'),
  //       body: {
  //         "cid": "11",
  //         "type": "55",
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> data = json.decode(response.body);
  //         Map<String, dynamic> decodedJson = json.decode(jsonResponse);
  // ChitResponse chitResponse = ChitResponse.fromJson(decodedJson);
  //       if (data.containsKey('available_chits') &&
  //           data['available_chits'] is List) {
  //         List<dynamic> availableChits = data['available_chits'];
  //         List<String> fetchedChitNames = [];
  //         List<int> fetchedTargetAmounts = [];
  //         for (var chit in availableChits) {
  //           if (chit is Map<String, dynamic>) {
  //             String chitPotName = chit['Chit_pot_name'] ?? 'Unknown Chit';
  //             int target = chit['Amount'] ?? 0;
  //             fetchedChitNames.add(chitPotName);
  //             fetchedTargetAmounts.add(target);
  //           }
  //         }
  //         setState(() {
  //           chitPotNames = fetchedChitNames;
  //           targets = fetchedTargetAmounts;
  //         });
  //         // print('Chit Names: $chitPotNames');
  //         // print('Target Amounts: $targets');
  //       }
  //     } else {
  //       print('Failed to get data');
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }

  Future<void> getpurchasechit() async {
    try {
      final response = await http.post(
        Uri.parse('https://chitsoft.in/wapp/api/mobile3/purches_chit_new.php'),
        body: {
          "cid": "11",
          "type": "55",
        },
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data.containsKey('available_chits') &&
            data['available_chits'] is List) {
          List<dynamic> availableChits = data['available_chits'];
          List<String> fetchedChitNames = [];
          List<int> fetchedTargetAmounts = [];
          for (var chit in availableChits) {
            if (chit is Map<String, dynamic>) {
              String chitName = chit['chit_name'] ?? 'Unknown Chit';
              int targetAmount = chit['target_amount'] ?? 0;
              fetchedChitNames.add(chitName);
              fetchedTargetAmounts.add(targetAmount);
            }
          }
          setState(() {
            chitNames = fetchedChitNames;
            targetAmounts = fetchedTargetAmounts;
          });
          // print('Chit Names: $chitNames');
          // print('Target Amounts: $targetAmounts');
        }
      } else {
        print('Failed to get data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  List<Widget> getPages() {
    return [
      const Homepage(),
      PurchasedPotPage(
        chitPotName: chitPotNames,
        target: targets,
      ),
      PurchasedChitsScreen(
        chitNames: chitNames,
        targetAmounts: targetAmounts,
      ),
      StrategicalPage(
        chitNames: chitNames,
        targetAmounts: targetAmounts,
      ),
      UserProfile(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: Container(
        height: size.height * 0.08,
        width: size.width,
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.02,
          vertical: size.height * 0.01,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.width * 0.06),
          color: Colors.white,
        ),
        child: GNav(
          gap: size.width * 0.02,
          backgroundColor: Colors.white,
          color: const Color(0Xff9DB2CE),
          activeColor: Colors.white,
          tabBackgroundColor: const Color(0Xff161E67),
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05,
            vertical: size.height * 0.015,
          ),
          textStyle: TextStyle(
            color: Colors.white,
            fontFamily: 'SF Pro Text',
            fontSize: size.width * 0.035,
            fontWeight: FontWeight.w500,
            height: 1.2,
            letterSpacing: 0.08,
            textBaseline: TextBaseline.alphabetic,
          ),
          onTabChange: (val) {
            setState(() {
              index = val;
            });
            if (val == 1) {
              // Fetch purchase chits data when the "Chits" tab is selected
              getPurchasePots();
            }
            if (val == 2) {
              getpurchasechit();
            }
          },
          tabs: [
            GButton(
              icon: Icons.circle,
              leading: Image.asset(
                'assets/home.png',
                color: index == 0 ? Colors.white : const Color(0Xff9DB2CE),
              ),
              text: 'Home',
            ),
            GButton(
              icon: Icons.circle,
              leading: Image.asset(
                'assets/bottom2.png',
                color: index == 1 ? Colors.white : const Color(0Xff9DB2CE),
              ),
              text: 'Pots',
            ),
            GButton(
              icon: Icons.circle,
              leading: Image.asset(
                'assets/bottom3.png',
                color: index == 2 ? Colors.white : const Color(0Xff9DB2CE),
              ),
              text: 'Chits',
            ),
            GButton(
              icon: Icons.circle,
              leading: Image.asset(
                'assets/targeting.png',
                color: index == 3 ? Colors.white : const Color(0Xff9DB2CE),
                height: size.height * 0.03,
              ),
              text: 'Strategic',
            ),
            const GButton(
              icon: Icons.person_3_rounded,
              text: 'Profile',
            ),
          ],
        ),
      ),
      body: getPages()[index],
    );
  }
}
