import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myporto/models/header_item.dart';
import 'package:myporto/utils/constants.dart';
import 'package:myporto/utils/globals.dart';
import 'package:myporto/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

List<HeaderItem> headerItems = [
  HeaderItem(
    title: 'HOME',
    onTap: () {},
    isButton: false,
  ),
  HeaderItem(
    title: 'MY INTRO',
    onTap: () {},
    isButton: false,
  ),
  HeaderItem(
    title: 'SERVICES',
    onTap: () {},
    isButton: false,
  ),
  HeaderItem(
    title: 'PORTOFOLIO',
    onTap: () {},
    isButton: false,
  ),
  HeaderItem(
    title: 'HIRE ME',
    onTap: () {},
    isButton: true,
  ),
];

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {},
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "EZ",
                  style: GoogleFonts.oswald(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: ".",
                  style: GoogleFonts.oswald(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderRow extends StatelessWidget {
  const HeaderRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
      visible: false,
      visibleWhen: const [
        Condition.largerThan(name: MOBILE),
      ],
      child: Row(
        children: headerItems
            .map(
              (item) => item.isButton
                  ? MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        decoration: BoxDecoration(
                            color: kDangerColor,
                            borderRadius: BorderRadius.circular(8.0)),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 5,
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            item.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  : MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        margin: const EdgeInsets.only(right: 30.0),
                        child: GestureDetector(
                          onTap: item.onTap,
                          child: Text(
                            item.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
            )
            .toList(),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ScreenHelper(
        desktop: Padding(
          padding: const EdgeInsets.all(8.0),
          child: buildHeader(),
        ),
        mobile: mobileHeader(),
        tablet: buildHeader(),
      ),
    );
  }
}

//! Mobile header
Widget mobileHeader() {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const HeaderLogo(),
          GestureDetector(
            onTap: () {
              // Open drawer with globalkey
              Globals.scaffoldKey.currentState!.openEndDrawer();
            },
            child: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          )
        ],
      ),
    ),
  );
}

//! Mobile and smaller width screen
Widget buildHeader() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        HeaderLogo(),
        HeaderRow(),
      ],
    ),
  );
}
