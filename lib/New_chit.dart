import 'package:macfoxl/Bottom_Navigation.dart';
import 'package:macfoxl/weekly_chit_section.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewChit extends StatefulWidget {
  const NewChit({super.key});

  @override
  State<NewChit> createState() => _NewChitState();
}

class _NewChitState extends State<NewChit> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      constraints: const BoxConstraints.expand(),
      child: DecoratedBox(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.jpeg"),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
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
            title: Text(
              "New Chit Pot",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                fontSize: size.width * 0.07,
                height: 37 / 27,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: ImageIcon(
                  AssetImage("assets/Notification.png"),
                  color: Colors.white,
                  size: 24,
                ),
              )
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 25),
                        child: Text(
                          "Name your Chit Pot",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: size.width * 0.04,
                            height: 37 / 27,
                            color: Color(0xff263238),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 45, right: 20, top: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: const Color(0xff263238)
                                        .withOpacity(0.4),
                                    width: 1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              labelText: "chit name",
                              labelStyle: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff263238)
                                          .withOpacity(0.4)))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 15),
                        child: Text(
                          "Target Amount",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: size.width * 0.04,
                            height: 37 / 27,
                            color: Color(0xff263238),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 45, right: 20, top: 10),
                        child: DropdownButtonWidget(
                          dropDownItem: ['50 K', '75 K', '90 K'],
                          selectedItem: '50 K',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 15),
                        child: Text(
                          "Total weeks",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: size.width * 0.04,
                            height: 37 / 27,
                            color: Color(0xff263238),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 45, right: 20, top: 10),
                        child: DropdownButtonWidget(
                          dropDownItem: ['24', '36', '48'],
                          selectedItem: '36',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 15),
                        child: Text(
                          "Weekly Minimum Contribution",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: size.width * 0.04,
                            height: 37 / 27,
                            color: Color(0xff263238),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 50),
                        child: Text(
                          "250",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: size.width * 0.04,
                            height: 37 / 27,
                            color: Color(0xff263238),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 55),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xff0067FF),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => WeeklyChitSection(
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
                                  textStyle: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: size.width * 0.05,
                                    height: 37 / 27,
                                  ),
                                )),
                            child: const Text("Create Chit"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DropdownButtonWidget extends StatefulWidget {
  final List<String> dropDownItem;
  final String selectedItem;
  const DropdownButtonWidget(
      {super.key, required this.dropDownItem, required this.selectedItem});
  @override
  State<DropdownButtonWidget> createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  late String selectedItem;
  @override
  void initState() {
    super.initState();
    selectedItem = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: DropdownButtonFormField<String>(
        value: selectedItem,
        dropdownColor: Colors.white,
        isExpanded: true,
        menuMaxHeight: 120,
        borderRadius: BorderRadius.circular(15),
        items: widget.dropDownItem.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          );
        }).toList(),
        onChanged: (String? val) {
          setState(() {
            selectedItem = val!;
          });
        },
        icon: const Icon(Icons.arrow_drop_down),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
                color: const Color(0xff263238).withOpacity(0.4), width: 1),
          ),
          labelStyle: TextStyle(color: Color(0xff263238).withOpacity(0.4)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
                color: const Color(0xff263238).withOpacity(0.4), width: 1),
          ),
        ),
      ),
    );
  }
}
