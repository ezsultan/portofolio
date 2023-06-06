import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/constants.dart';
import '../../../utils/screen_helper.dart';

class IosAppAd extends StatelessWidget {
  const IosAppAd({Key? key}) : super(key: key);

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
                Text(
                  "PORTOFOLIO",
                  style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 30.0,
                    height: 1.3,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Flex(
                  direction: constraints.maxWidth > 720
                      ? Axis.horizontal
                      : Axis.vertical,
                  children: [
                    // Disable expanded on smaller screen to avoid Render errors by setting flex to 0
                    Expanded(
                      flex: constraints.maxWidth > 720.0 ? 1 : 0,
                      child: Image.asset(
                        "assets/simrel.png",
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
                            "SIMREL",
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
                            "Simrel is a unique application that I had the privilege to work on as a backend developer. This application focuses on volunteer management in the political industry, enabling efficient coordination of volunteers while also incorporating voter management capabilities. It was a fascinating project that aimed to streamline the process of managing volunteers and engaging voters. My role involved developing the backend systems to support these functionalities, ensuring seamless integration and efficient performance.",
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
                                          'https://play.google.com/store/apps/details?id=id.digipol.volunteerpoint&pli=1');
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
