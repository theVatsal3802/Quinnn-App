import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lgbtq_social_media/utils/assets_manager.dart';
import 'package:lgbtq_social_media/utils/color_manager.dart';

class AboutTheTeamScreen extends StatelessWidget {
  static const routeName = "/about-team";
  const AboutTheTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "About the team",
          textScaleFactor: 1,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            TeamMemberWidget(
              name: "Vatsal Adhiya",
              description: "Flutter Developer",
              image: "https://avatars.githubusercontent.com/u/77258481?v=4",
              github: "https://github.com/theVatsal3802",
              linkedin: "https://www.linkedin.com/in/vatsal-adhiya-206479202/",
              instagram: "https://www.instagram.com/thevatsal3802/",
              twitter: "https://twitter.com/adhiya_vatsal_3?s=09",
            ),
            TeamMemberWidget(
              name: "Ankur Agarwal",
              description: "Backend Developer",
              image: "https://avatars.githubusercontent.com/u/74523865?v=4",
              linkedin: "https://www.linkedin.com/in/ankur-8/",
              github: "https://github.com/Ankur6702",
              instagram: "https://www.instagram.com/ankur_agarwal_246/",
              twitter: "https://twitter.com/_Ankur_Agarwal_",
            ),
            TeamMemberWidget(
              name: "Rajat Singh",
              description: "Frontend Web Developer",
              image:
                  "https://media.licdn.com/dms/image/C4D03AQHwtLC2Bn6dHA/profile-displayphoto-shrink_200_200/0/1659535317966?e=1684972800&v=beta&t=QXKrAO_6hndGzlRhJT6uYqCmN79wq2_6XrjSNKLiFEc",
              linkedin: "https://www.linkedin.com/in/rajat1064/",
              github: "https://github.com/con-artist",
              instagram: "",
              twitter: "",
            ),
            TeamMemberWidget(
              name: "Abhinav Jain",
              description: "Frontend Web Developer",
              image: "https://avatars.githubusercontent.com/u/86119205?v=4",
              linkedin: "https://www.linkedin.com/in/jaintle/",
              github: "https://github.com/AbhinavJaintle",
              instagram: "",
              twitter: "https://twitter.com/jaintle",
            ),
          ],
        ),
      ),
    );
  }
}

class TeamMemberWidget extends StatelessWidget {
  final String name;
  final String? instagram;
  final String? linkedin;
  final String? twitter;
  final String? github;
  final String description;
  final String image;
  const TeamMemberWidget({
    Key? key,
    required this.name,
    this.instagram,
    this.linkedin,
    this.twitter,
    this.github,
    required this.description,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorManager.baseGreyColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          if (image.isEmpty)
            Image.asset(
              AssetManager.profile,
              height: MediaQuery.of(context).size.width * 0.3,
              width: MediaQuery.of(context).size.width * 0.3,
            ),
          if (image.isNotEmpty)
            Image.network(
              image,
              height: MediaQuery.of(context).size.width * 0.3,
              width: MediaQuery.of(context).size.width * 0.3,
            ),
          ListTile(
            title: Text(
              name,
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            subtitle: Text(
              description,
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (github != null && github!.isNotEmpty)
                IconButton(
                  onPressed: () {
                    final url = Uri.parse(github!);
                    launchUrl(
                      url,
                      mode: LaunchMode.platformDefault,
                    );
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.github,
                  ),
                ),
              if (linkedin != null && linkedin!.isNotEmpty)
                IconButton(
                  onPressed: () {
                    final url = Uri.parse(linkedin!);
                    launchUrl(
                      url,
                      mode: LaunchMode.platformDefault,
                    );
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.linkedinIn,
                    color: Color(0xff0a66c2),
                  ),
                ),
              if (twitter != null && twitter!.isNotEmpty)
                IconButton(
                  onPressed: () {
                    final url = Uri.parse(twitter!);
                    launchUrl(
                      url,
                      mode: LaunchMode.platformDefault,
                    );
                  },
                  icon: const FaIcon(FontAwesomeIcons.twitter,
                      color: ColorManager.baseBlueColor),
                ),
              if (instagram != null && instagram!.isNotEmpty)
                IconButton(
                  onPressed: () {
                    final url = Uri.parse(instagram!);
                    launchUrl(
                      url,
                      mode: LaunchMode.platformDefault,
                    );
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.instagram,
                    color: Colors.pink,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
