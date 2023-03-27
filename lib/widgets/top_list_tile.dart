import 'package:flutter/material.dart';
import 'package:lgbtq_social_media/models/user_model.dart';
import 'package:lgbtq_social_media/screens/profile/profile_screen.dart';
import 'package:lgbtq_social_media/utils/assets_manager.dart';
import 'package:lgbtq_social_media/utils/color_manager.dart';

class TopListTile extends StatelessWidget {
  final UserModel user;
  const TopListTile({
    required this.user,
    super.key,
  });

  static void showMoreOptionsForPostBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          height: 150,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text(
                  "Edit Post",
                  textScaleFactor: 1,
                ),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                iconColor: Colors.red,
                leading: const Icon(Icons.delete),
                title: const Text(
                  "Delete Post",
                  textScaleFactor: 1,
                ),
                textColor: Colors.red,
                onTap: () {},
              ),
              const Divider(),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed(
          ProfileScreen.routeName,
          arguments: user,
        );
      },
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
      title: Text(
        user.username,
        textScaleFactor: 1,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 16,
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
          showMoreOptionsForPostBottomSheet(context);
        },
        icon: const Icon(
          Icons.more_vert,
          color: ColorManager.baseBlueColor,
        ),
      ),
    );
  }
}
