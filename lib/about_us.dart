import 'package:macfoxl/Bottom_Navigation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
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
            leading: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Bottomnavbar()));
              },
              child: const ImageIcon(
                AssetImage("assets/cross.png"),
                color: Colors.white,
                size: 24,
              ),
            ),
            title: Text(
              "ABOUT US",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 23.66,
                color: Colors.white,
              )),
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
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                    child: Text(
                  "OTHER INVESTMENT",
                  style: GoogleFonts.poppins(
                      decoration: TextDecoration.underline,
                      decorationColor: const Color(0xffffffff),
                      textStyle: const TextStyle(
                        fontSize: 19.66,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffffffff),
                      )),
                )),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    "Big Investment Chart!!",
                    style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 5),
                Center(
                  child: Text(
                    "Earn Now!!",
                    style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color: Colors.white)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "by FitPerson on Jan 05 2023",
                    style: GoogleFonts.cabin(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 45, right: 45),
                  child: Text(
                    "Integer volutpat, leo ut feugiat vulputate, ipsum mauris condimentum felis, nec suscipit tortor arcu eu augue. Mauris iaculis, tellus nec suscipit consequat, orci quam elementum neque, volutpat tempor dui sem non erat. Maecenas iaculis tortor id mi pretium commodo. Praesent est est, facilisis eu tristique ut, cursus eu felis. ",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cabin(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.white)),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 45, right: 45),
                  child: Image(image: AssetImage("assets/plan.jpeg")),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                      height: 60,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xff0D0140),
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff0D0140),
                            foregroundColor: const Color(0xffffffff),
                            textStyle: GoogleFonts.raleway(
                                fontSize: 16, fontWeight: FontWeight.w700)),
                        child: const Text("Give Review"),
                      )),
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Text(
                    "Lower Body",
                    style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                            decoration: TextDecoration.underline,
                            decorationThickness: 4,
                            decorationColor: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color: Colors.white)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 45, right: 45, top: 25),
                  child: Text(
                    "Cras gravida tortor at euismod posuere. Praesent mattis enim pharetra turpis aliquet, in venenatis dui rutrum. Donec tristique sapien scelerisque, ornare tortor in, ultricies erat. Suspendisse quis vehicula urna. Fusce sollicitudin aliquam massa eget tincidunt. Nam eget turpis eget sapien mattis molestie. Morbi hendrerit diam est, dictum pulvinar eros commodo ac.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cabin(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.white)),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Center(
                    child: Image(
                        image: AssetImage("assets/12552790_5005499 1.png"))),
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: Container(
                    height: 70,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xff0D0140),
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff0D0140),
                          foregroundColor: Colors.white,
                          textStyle: GoogleFonts.cabin(
                              textStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500))),
                      child: const Text("Grow with us"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(
                  thickness: 8,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 50,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Divider(
                    thickness: 5,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                    "Donec mollis vehicula turpis, ut imperdiet nulla fringilla sit amet. Praesent mattis enim pharetra turpis aliquet, in venenatis dui rutrum.",
                    style: GoogleFonts.cabin(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.white)),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    "Headquarters",
                    style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    "124 Conch St.,",
                    style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    "Bikini Bottom, Pacific Ocean",
                    style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    "Other Links",
                    style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    "Shop",
                    style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    "Blog",
                    style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    "News",
                    style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    "Guides",
                    style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    "Help & Support",
                    style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Text(
                    "Social",
                    style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Image(
                        image: AssetImage("assets/facebook-messenger.png"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child:
                          Image(image: AssetImage("assets/instagram-alt.png")),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Image(image: AssetImage('assets/vk.png')),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Image(image: AssetImage("assets/twitter.png")),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child:
                          Image(image: AssetImage("assets/tumblr-square.png")),
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Text(
                    "Subscribe",
                    style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                        labelText: "Your Email",
                        labelStyle: GoogleFonts.cabin(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Color(0xffC4C4C4)))),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 80, right: 80),
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(0xffC4C4C4),
                              textStyle: GoogleFonts.cabin(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                          onPressed: () {},
                          child: const Text(("Join Us"))),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Center(
                    child: Image(image: AssetImage("assets/Vector 2.png"))),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    "© FitFastCheap, LLC. All Rights Reserved",
                    style: GoogleFonts.cabin(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.white)),
                  ),
                ),
                const SizedBox(
                  height: 030,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
