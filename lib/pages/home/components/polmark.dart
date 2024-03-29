import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/constants.dart';
import '../../../utils/screen_helper.dart';

class Polmark extends StatelessWidget {
  const Polmark({Key? key}) : super(key: key);

  // We can use same idea as ios_app_ad.dart and swap children order, let's copy code
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
                      child: constraints.maxWidth > 720.0
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 50),
                                Text(
                                  "POLMARK INDONESIA",
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
                                  "Developed website called Polmark Indonesia, an Indonesian Political Survey Institute. As a backend developer, I played a crucial role in building the backend infrastructure of the website. This involved designing and implementing the necessary backend functionalities, such as database management, API development, and integration with the frontend. The goal was to create a secure, scalable, and efficient backend system that supported data retrieval, storage, and analysis for political surveys and information sharing on the Polmark Indonesia platform.",
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
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        height: 48.0,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 28.0,
                                        ),
                                        child: TextButton(
                                          onPressed: () async {
                                            final Uri _url = Uri.parse(
                                                '');
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
                                ),
                              ],
                            )
                          : Expanded(
                              flex: constraints.maxWidth > 720.0 ? 1 : 0,
                              child: Image.asset(
                                "assets/polmark.png",
                                // Set width for image on smaller screen
                                width:
                                    constraints.maxWidth > 720.0 ? null : 350.0,
                              ),
                            ),
                    ),
                    const SizedBox(
                      width: 25.0,
                    ),
                    Expanded(
                      flex: constraints.maxWidth > 720.0 ? 1 : 0,
                      child: constraints.maxWidth > 720.0
                          ? Image.asset(
                              "assets/polmark.png",
                              // Set width for image on smaller screen
                              width:
                                  constraints.maxWidth > 720.0 ? null : 350.0,
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "POLMARK INDONESIA",
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
                                  "Developed website called Polmark Indonesia, an Indonesian Political Survey Institute. As a backend developer, I played a crucial role in building the backend infrastructure of the website. This involved designing and implementing the necessary backend functionalities, such as database management, API development, and integration with the frontend. The goal was to create a secure, scalable, and efficient backend system that supported data retrieval, storage, and analysis for political surveys and information sharing on the Polmark Indonesia platform.",
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
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        height: 48.0,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 28.0,
                                        ),
                                        child: TextButton(
                                          onPressed: () async {
                                            final Uri _url = Uri.parse(
                                                'http://stg-polmark.thinkspedia.id/dashboard');
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
                                ),
                              ],
                            ),
                    ),
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
