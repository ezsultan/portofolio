import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../models/education.dart';
import '../../../utils/constants.dart';
import '../../../utils/screen_helper.dart';

final List<Education> educationList = [
  Education(
    description:
        "Experienced backend developer skilled in NestJS, RabbitMQ, MinIO, MongoDB, and PM2. Implemented pioneering microservice architecture, ensuring modularity and scalability. Collaborated closely with frontend teams, contributed to Agile Scrum processes, and provided technical guidance. Proficient in MongoDB for data storage and retrieval, and PM2 for process management. Committed to delivering quality software and driving innovation.",
    linkName: "Back End Developer (Nest JS)",
    period: "February 2023 - Present | ThinksPedia",
  ),
  Education(
    description:
        "Backend developer experienced in NestJS and AWS S3. Built scalable applications with NestJS and leveraged AWS S3 for object storage. Collaborated cross-functionally to ensure seamless integration. Proficient in agile methodologies. Committed to delivering efficient backend systems with high code quality.",
    linkName: "Back End Developer (Nest JS)",
    period: "June 2022 - February 2023 | PT. Nitoza Indonesia Mandiri",
  ),
  Education(
    description:
        "As a Flutter development intern, I implemented designs into code and built applications using the BloC pattern. I also actively contributed to bug fixing, ensuring the smooth functionality of the applications.",
    linkName: "Flutter Developer",
    period: "March 2022 - June 2022 | PT. Nitoza Indonesia Mandiri",
  ),
];

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({Key? key}) : super(key: key);

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
              "EXPERIENCE",
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
