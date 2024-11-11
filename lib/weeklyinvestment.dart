// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:macfoxl/New_chit.dart';
import 'package:flutter/material.dart';

import 'package:macfoxl/Week_chits.dart';
import 'package:http/http.dart' as http;
import 'package:fl_chart/fl_chart.dart';

class Weeklyinvestment extends StatefulWidget {
  final accountbal;
  List<String> months;
  List<String> monthPaid;
  List<String> availableChit;
  Weeklyinvestment({
    Key? key,
    required this.months,
    required this.monthPaid,
    required this.availableChit,
    this.accountbal,
  }) : super(key: key);

  @override
  State<Weeklyinvestment> createState() => _WeeklyinvestmentState();
}

class _WeeklyinvestmentState extends State<Weeklyinvestment> {
  // List<ChitAmount> users = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int weeks_val = 10;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'CHITS',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            fontSize: 27,
            height: 37 / 27,
            color: Colors.white,
          ),
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
        child: ListView(
          children: [
            const SizedBox(
              height: 15,
            ),
            Container(
              height: size.height / 1.8,
              width: size.width,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: size.width * 0.020,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      Text(
                        'Account Balance',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          fontSize: size.width * 0.05,
                          height: 37 / 27,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.width * 0.03,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      Icon(
                        Icons.currency_rupee_outlined,
                        size: size.width * 0.06,
                        color: Colors.black,
                      ),
                      Text(
                        widget.accountbal,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          fontSize: size.width * 0.06,
                          height: 37 / 27,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.width * 0.03,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      Text(
                        'Last $weeks_val weeks',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          fontSize: size.width * 0.03,
                          height: 37 / 27,
                          color: Colors.grey.shade600,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: LineChartWidget(
                      height: size.height,
                      width: size.width,
                      month: widget.months,
                      monthPaid: widget.monthPaid,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Investment Details',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  fontSize: 23,
                  height: 34 / 23,
                  color: Colors.white,
                ),
              ),
            ),
            investment(size, '${widget.availableChit[0]}K Investment', () {
              _Investmenttypefor1lakh(context);
            }),
            const SizedBox(
              height: 5,
            ),
            investment(size, '${widget.availableChit[1]}K Investment', () {
              _Investmenttypefor2lakh(context);
            }),
            const SizedBox(
              height: 5,
            ),
            investment(size, '${widget.availableChit[2]}K Investment', () {
              _Investmenttypefor5lakh(context);
            }),
          ],
        ),
      ),
    );
  }

  GestureDetector investment(Size size, String text, Function() function) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: size.height / 14,
        width: size.width,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                fontSize: 18,
                height: 22 / 15,
                color: Color(0Xff2514A6),
              ),
            ),
            const Icon(
              Icons.play_arrow_rounded,
              size: 30,
              color: Color(0Xff2514A6),
            )
          ],
        ),
      ),
    );
  }

  void _Investmenttypefor1lakh(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const Investmenttypefor50thousand(),
    );
  }

  void _Investmenttypefor2lakh(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const Investmenttypefor75thousand(),
    );
  }

  void _Investmenttypefor5lakh(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const Investmenttypefor80thousand(),
    );
  }
}

class LineChartWidget extends StatefulWidget {
  final double height;
  final double width;
  final List<String> monthPaid;
  final List<String> month;
  LineChartWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.monthPaid,
      required this.month});

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  List<String> month = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height * 0.4,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: widget.width * 1.5,
          child: LineChart(
            LineChartData(
              borderData: FlBorderData(show: false),
              gridData: const FlGridData(show: false),
              titlesData: FlTitlesData(
                show: true,
                leftTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: widget.width * 0.06,
                    getTitlesWidget: (value, meta) {
                      int index = value.toInt();
                      if (index >= 0 && index < month.length) {
                        return Text(
                          month[index],
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }
                      return const Text('');
                    },
                  ),
                ),
              ),
              maxX: 12,
              maxY: 10,
              minX: 0,
              minY: 0,
              lineBarsData: [
                LineChartBarData(
                  isCurved: true,
                  color: Colors.black,
                  barWidth: 3,
                  dotData: const FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: true,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  spots: [
                    for (int i = 0; i < widget.monthPaid.length; i++)
                      FlSpot(
                        i.toDouble(),
                        double.parse(widget.monthPaid[i]) / 1000,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Investmenttypefor50thousand extends StatefulWidget {
  const Investmenttypefor50thousand({super.key});

  @override
  State<Investmenttypefor50thousand> createState() =>
      _Investmenttypefor50thousand();
}

class _Investmenttypefor50thousand extends State<Investmenttypefor50thousand> {
  String groupValue = 'Total Amount';
  Future<void> getdata(String type, String month) async {
    print(type);
    print(month);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => NewChit()));
    // try {
    //   final response = await http.post(
    //       Uri.parse(
    //           'https://chitsoft.in/wapp/api/mobile3/active_chit_api1.php'),
    //       body: {
    //         "cid": "11",
    //         "type": type,
    //         "month": month,
    //       });
    //   if (response.statusCode == 200) {
    //     final Map<String, dynamic> data = json.decode(response.body);
    //     if (data.containsKey('Month') && data['Month'] is List) {
    //       List<dynamic> monthList = data['Month'];
    //       Navigator.of(context).pop();
    //       Navigator.of(context).push(MaterialPageRoute(
    //           builder: (context) => WeekChits(
    //               month: month, amount_val: 50, monthList: monthList)));
    //     }
    //   } else {
    //     print('Failed to get a data');
    //   }
    // } catch (e) {
    //   print('$e');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Weeks',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  height: 42 / 28,
                  color: Color(0Xff2514A6),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              numbers('24', () {
                getdata('50', '24');
              }),
              numbers('36', () {
                getdata('50', '36');
              }),
              numbers('48', () {
                getdata('50', '48');
              }),
            ],
          ),
        ],
      ),
    );
  }

  GestureDetector numbers(String number, Function() function) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 80,
        width: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0Xff161E67),
        ),
        child: Center(
          child: Text(
            number,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 33,
              height: 49 / 33,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class Investmenttypefor75thousand extends StatefulWidget {
  const Investmenttypefor75thousand({super.key});

  @override
  State<Investmenttypefor75thousand> createState() =>
      _Investmenttypefor75thousand();
}

class _Investmenttypefor75thousand extends State<Investmenttypefor75thousand> {
  String groupValue = 'Total Amount';
  Future<void> getdata(String type, String month) async {
    print(type);
    print(month);
    try {
      final response = await http.post(
          Uri.parse(
              'https://chitsoft.in/wapp/api/mobile3/active_chit_api1.php'),
          body: {
            "cid": "11",
            "type": type,
            "month": month,
          });
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data.containsKey('Month') && data['Month'] is List) {
          List<dynamic> monthList = data['Month'];
          Navigator.of(context).pop();
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => WeekChits(
                  month: month, amount_val: 70, monthList: monthList)));
        }
      } else {
        print('Failed to get a data');
      }
    } catch (e) {
      print('$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Weeks',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  height: 42 / 28,
                  color: Color(0Xff2514A6),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              numbers('24', () {
                getdata('70', '24');
              }),
              numbers('36', () {
                getdata('70', '36');
              }),
              numbers('48', () {
                getdata('70', '48');
              }),
            ],
          ),
        ],
      ),
    );
  }

  GestureDetector numbers(String number, Function() function) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 80,
        width: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0Xff161E67),
        ),
        child: Center(
          child: Text(
            number,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 33,
              height: 49 / 33,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class Investmenttypefor80thousand extends StatefulWidget {
  const Investmenttypefor80thousand({super.key});

  @override
  State<Investmenttypefor80thousand> createState() =>
      _Investmenttypefor80thousand();
}

class _Investmenttypefor80thousand extends State<Investmenttypefor80thousand> {
  String groupValue = 'Total Amount';
  Future<void> getdata(String type, String month) async {
    print(type);
    print(month);
    try {
      final response = await http.post(
          Uri.parse(
              'https://chitsoft.in/wapp/api/mobile3/active_chit_api1.php'),
          body: {
            "cid": "11",
            "type": type,
            "month": month,
          });
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data.containsKey('Month') && data['Month'] is List) {
          List<dynamic> monthList = data['Month'];
          Navigator.of(context).pop();
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => WeekChits(
                  month: month, amount_val: 90, monthList: monthList)));
        }
      } else {
        print('Failed to get a data');
      }
    } catch (e) {
      print('$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Weeks',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  height: 42 / 28,
                  color: Color(0Xff2514A6),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              numbers('24', () {
                getdata('90', '24');
              }),
              numbers('36', () {
                getdata('90', '36');
              }),
              numbers('48', () {
                getdata('90', '48');
              }),
            ],
          ),
        ],
      ),
    );
  }

  GestureDetector numbers(String number, Function() function) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 80,
        width: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0Xff161E67),
        ),
        child: Center(
          child: Text(
            number,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 33,
              height: 49 / 33,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
