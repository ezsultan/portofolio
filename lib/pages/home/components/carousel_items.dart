import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myporto/models/carousel_item_model.dart';
import 'package:myporto/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

List<CarouselItemModel> carouselItems = List.generate(
  5,
  (index) => CarouselItemModel(
    image: SizedBox(
      child: Image.asset(
        "assets/images/avatar.png",
        fit: BoxFit.contain,
      ),
    ),
    text: SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "FULLSTACK MOBILE DEVELOPER",
            style: GoogleFonts.jetBrainsMono(
              color: kPrimaryColor,
              fontWeight: FontWeight.w900,
              fontSize: 16.0,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            "SULTAN\nSETIAWAN",
            style: GoogleFonts.jetBrainsMono(
              color: Colors.white,
              fontSize: 40.0,
              fontWeight: FontWeight.w900,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Full-stack mobile developer based in Jakarta, Indonesia.",
            style: GoogleFonts.jetBrainsMono(
              color: kCaptionColor,
              fontSize: 15.0,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 15),
          const SizedBox(height: 20.0),
          Text(
            "Connect with me",
            style: GoogleFonts.jetBrainsMono(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 35,
                child: GestureDetector(
                  onTap: () async {
                    final Uri _url = Uri.parse('https://github.com/ezsultan');

                    if (await launchUrl(_url)) {
                      // await launchUrl(_url);
                    } else {
                      throw 'Could not launch $_url';
                    }
                  },
                  child: const Icon(
                    MaterialCommunityIcons.github,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              SizedBox(
                height: 35,
                child: GestureDetector(
                  onTap: () async {
                    final Uri _url =
                        Uri.parse('https://www.linkedin.com/in/ezsultan/');
                    if (await launchUrl(_url)) {
                      // await launchUrl(_url);
                    } else {
                      throw 'Could not launch $_url';
                    }
                  },
                  child: const Icon(
                    MaterialCommunityIcons.linkedin,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  ),
);
