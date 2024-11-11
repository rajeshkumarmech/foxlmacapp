import 'package:macfoxl/Strategical_data_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Bottom_Navigation.dart';

class SavingChit extends StatefulWidget {
  const SavingChit({super.key});

  @override
  State<SavingChit> createState() => _SavingChitState();
}

class _SavingChitState extends State<SavingChit> {
  List<bool> isExpanded = [false, false, false];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const ImageIcon(
              AssetImage("assets/cross.png"),
              color: Colors.white,
              size: 24,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Bottomnavbar()),
              );
            },
          ),
          title: Text(
            "Strategical Investment",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: size.width * 0.07,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: IconButton(
                icon: const ImageIcon(
                  AssetImage("assets/Notification.png"),
                  color: Colors.white,
                  size: 24,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              typesOfChit(context, "F-PRIME 001", size, 0),
              typesOfChit(context, "F-PRIME 002", size, 1),
              typesOfChit(context, "F3-PRIME", size, 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget typesOfChit(BuildContext context, String name, Size size, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded[index] = !isExpanded[index];
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: size.width * 0.05,
                        color: const Color(0xff2514A6),
                      ),
                    ),
                    Icon(
                      isExpanded[index]
                          ? Icons.arrow_drop_up_sharp
                          : Icons.arrow_drop_down_sharp,
                      color: const Color(0xff2514A6),
                      size: 35,
                    ),
                  ],
                ),
                if (isExpanded[index])
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        chitDetailText(
                            'Capital required           : 1 Lakh', size),
                        chitDetailText(
                            'Expected ROI               : 21-27%', size),
                        chitDetailText('Assured Fixed return  : 21%+', size),
                        chitDetailText(
                            'Start date                     : 01/09/2022',
                            size),
                        chitDetailText(
                            'End date                       : 31/08/2023',
                            size),
                        chitDetailText('Benefits & Risk factors:', size),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            "Description of benefits and risks.",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: size.width * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => StrategicalDataPage(
                                        amount: 50,
                                        contributionamount: 250,
                                        due: 5,
                                        due_amount: 1250,
                                        end_Date: "04/09/2024",
                                        lakhamount: 50000,
                                        month: "March",
                                        start_Date: "04/05/2024",
                                        total_Months: 24,
                                      )));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff0067FF),
                              foregroundColor: Colors.white,
                              textStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: size.width * 0.04,
                              ),
                            ),
                            child: const Text("Check Chit"),
                          ),
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget chitDetailText(String text, Size size) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          fontSize: size.width * 0.04,
          color: Colors.black,
        ),
      ),
    );
  }
}
