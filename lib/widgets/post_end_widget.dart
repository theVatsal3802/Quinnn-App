import 'package:flutter/material.dart';
import 'package:lgbtq_social_media/utils/assets_manager.dart';
import 'package:lgbtq_social_media/utils/color_manager.dart';

class PostEndWidget extends StatelessWidget {
  const PostEndWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      padding: const EdgeInsets.only(
        top: 30,
        right: 30,
        left: 30,
        bottom: 30,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: ColorManager.baseGreyColor,
        ),
        borderRadius: BorderRadius.circular(20),
        color: ColorManager.baseWhiteColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AssetManager.end,
            height: MediaQuery.of(context).size.width * 0.15,
            width: MediaQuery.of(context).size.width * 0.15,
          ),
          const SizedBox(height: 20),
          Text(
            "You have visited all the latest posts in your network",
            textScaleFactor: 1,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
