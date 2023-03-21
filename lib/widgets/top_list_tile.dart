import 'package:flutter/material.dart';
import 'package:lgbtq_social_media/functions/dashboard_functions.dart';
import 'package:lgbtq_social_media/models/user_model.dart';
import 'package:lgbtq_social_media/utils/assets_manager.dart';
import 'package:lgbtq_social_media/utils/color_manager.dart';

class TopListTile extends StatelessWidget {
  final UserModel user;
  const TopListTile({
    required this.user,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      leading: CircleAvatar(
        backgroundColor: ColorManager.baseGreyColor,
        backgroundImage: user.profileImageUrl != null
            ? NetworkImage(user.profileImageUrl!)
            : null,
        foregroundImage: user.profileImageUrl == null
            ? const AssetImage(AssetManager.profile)
            : null,
      ),
      title: GestureDetector(
        onTap: () {},
        child: Text(
          user.username,
          textScaleFactor: 1,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 16,
              ),
        ),
      ),
      subtitle: Text(
        user.name,
        textScaleFactor: 1,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: ColorManager.baseDarkGreyColor,
            ),
      ),
      trailing: IconButton(
        onPressed: () {
          DashBoardFunctions.showMoreOptionsForPostBottomSheet(context);
        },
        icon: const Icon(
          Icons.more_vert,
          color: ColorManager.baseBlueColor,
        ),
      ),
    );
  }
}
