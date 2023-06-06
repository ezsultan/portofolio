import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../models/education.dart';
import '../../../utils/constants.dart';
import '../../../utils/screen_helper.dart';

final List<Education> educationList = [
  Education(
    description:
        "I was chosen as one of only 20 students out of over 13,000 applicants to receive the prestigious Jabar Coding Camp (JCC) scholarship sponsored by the West Java Government. During the program, I focused on learning Flutter, specifically state management and slicing techniques. This incredible opportunity has equipped me with valuable skills and knowledge to excel in Flutter app development.",
    linkName: "Flutter Developer",
    period: "August 2021 - April 2022 | Jabar Coding Camp (JCC)",
  ),
  Education(
    description:
        "I studied software engineering, focusing on C++, Java, and PHP programming languages. Additionally, I learned computer basics and explored various applications. These experiences have shaped my passion for software engineering and provided a strong foundation for tackling technical challenges.",
    linkName: "Rekayasa Perangkat Lunak",
    period: "June 2017 - June 2020 | SMK YASPIM",
  )
];

class EducationSection extends StatelessWidget {
  const EducationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(kDesktopMaxWidth),
      tablet: _buildUi(kTabletMaxWidth),
      mobile: _buildUi(getMobileMaxWidth(context)),
    );
  }

  Widget _buildUi(double width) {
    return Container(
      alignment: Alignment.center,
      child: ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        defaultScale: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "EDUCATION",
              style: GoogleFonts.oswald(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 30.0,
                height: 1.3,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                return Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: educationList
                      .map(
                        (education) => SizedBox(
                          width: constraints.maxWidth / 2.0 - 20.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                education.period!,
                                style: GoogleFonts.oswald(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20.0,
                                ),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    education.linkName!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                education.description!,
                                maxLines: 10,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: kCaptionColor,
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
