import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/constants.dart';
import '../../../utils/screen_helper.dart';

class AndroidAppAd extends StatelessWidget {
  const AndroidAppAd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(kDesktopMaxWidth),
      tablet: _buildUi(kTabletMaxWidth),
      mobile: _buildUi(getMobileMaxWidth(context)),
    );
  }

  Widget _buildUi(double width) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            defaultScale: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flex(
                  direction: constraints.maxWidth > 720
                      ? Axis.horizontal
                      : Axis.vertical,
                  children: [
                    // Disable expanded on smaller screen to avoid Render errors by setting flex to 0
                    Expanded(
                      flex: constraints.maxWidth > 720.0 ? 1 : 0,
                      child: Image.asset(
                        "assets/kmp.png",
                        // Set width for image on smaller screen
                        width: constraints.maxWidth > 720.0 ? null : 350.0,
                      ),
                    ),
                    Expanded(
                      flex: constraints.maxWidth > 720.0 ? 1 : 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "KMP",
                            style: GoogleFonts.oswald(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              height: 1.3,
                              fontSize: 35.0,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Text(
                            "I had the opportunity to work as a Flutter developer on the KMP (Kampung Merah Putih) app, which aimed to create a modern, transparent, and informative village arrangement in Indonesia. My role primarily involved fixing bugs and improving the overall functionality of the app. KMP focused on leveraging information technology through a Super Mobile Application to empower Indonesian villages. It was an exciting project that allowed me to contribute to the advancement of village development using technology.",
                            style: TextStyle(
                              color: kCaptionColor,
                              height: 1.5,
                              fontSize: 15.0,
                            ),
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          Row(
                            children: [
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  height: 48.0,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 28.0,
                                  ),
                                  child: TextButton(
                                    onPressed: () async {
                                      final Uri _url = Uri.parse(
                                          'https://play.google.com/store/apps/details?id=nitoza.kmp_pengurus_app');
                                      if (await launchUrl(_url)) {
                                        // await launchUrl(_url);
                                      } else {
                                        throw 'Could not launch $_url';
                                      }
                                    },
                                    child: const Center(
                                      child: Text(
                                        "EXPLORE MORE",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
