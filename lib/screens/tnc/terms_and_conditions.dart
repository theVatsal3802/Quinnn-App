import 'package:flutter/material.dart';
import 'package:lgbtq_social_media/widgets/custom_drawer.dart';

class TermsAndConditionsScrren extends StatelessWidget {
  static const routeName = "/tnc";
  const TermsAndConditionsScrren({super.key});

  @override
  Widget build(BuildContext context) {
    bool data = ModalRoute.of(context)!.settings.arguments as bool;
    return Scaffold(
      drawer: data ? const CustomDrawer() : null,
      appBar: AppBar(
        title: const Text(
          "Terms and Conditions",
          textScaleFactor: 1,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Welcome to our LGBTQ+ social media app! Before you start using our app, please read the following terms and conditions carefully. By using our app, you agree to be bound by these terms and conditions.",
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Acceptance of Terms",
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              "By using our app, you agree to be bound by these terms and conditions, which may be updated from time to time without notice to you. If you do not agree to these terms and conditions, please do not use our app.",
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "User Conduct",
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              "Our app is intended for use by members of the LGBTQ+ community and their allies. We do not tolerate hate speech, discrimination, or harassment of any kind on our app. You must respect the rights of other users and behave in a respectful and lawful manner at all times.",
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "User Content",
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              "You are solely responsible for any content you post on our app, including but not limited to photos, videos, comments, and messages. You must ensure that your content does not violate any laws or infringe on the rights of others. We reserve the right to remove any content that we deem inappropriate or offensive.",
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Privacy",
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              "We take your privacy seriously and will only collect, use, and disclose your personal information in accordance with our privacy policy, which can be found on our app",
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Intellectual Property",
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              "Our app and its content, including but not limited to text, graphics, logos, icons, and images, are protected by intellectual property laws and may not be reproduced, modified, or distributed without our written consent.",
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Termination",
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              "We reserve the right to terminate your use of our app at any time and for any reason, without notice to you.",
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Limitation of Liability",
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              "We are not liable for any damages, including but not limited to direct, indirect, incidental, consequential, or punitive damages, arising out of or in connection with your use of our app.",
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Indemnification",
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              "You agree to indemnify and hold us harmless from any claims, damages, and expenses, including but not limited to legal fees, arising out of or in connection with your use of our app.",
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Governing Law",
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              "These terms and conditions shall be governed by and construed in accordance with the laws of the jurisdiction in which we operate.",
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Entire Agreement",
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              "These terms and conditions constitute the entire agreement between you and us with respect to your use of our app and supersede all prior agreements and understandings, whether written or oral.",
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "If you have any questions or concerns about these terms and conditions, please contact us at 2020kucp1096@iiitkota.ac.in.",
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
