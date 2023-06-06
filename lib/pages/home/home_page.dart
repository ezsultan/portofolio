import 'package:flutter/material.dart';
import 'package:myporto/pages/home/components/experience_section.dart';
import 'package:myporto/pages/home/components/footer.dart';
import 'package:myporto/pages/home/components/ios_app_ad.dart';
import 'package:myporto/utils/globals.dart';

import 'components/carousel.dart';
import 'components/header.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      body: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Header(),
              Carousel(),
              const SizedBox(height: 20),
              // const EducationSection(),
              // const SizedBox(height: 20),
              const ExperienceSection(),
              const SizedBox(height: 50),
              const IosAppAd(),
              const SizedBox(height: 20),
              const Footer()
            ],
          ),
        ),
      ),
    );
  }
}
