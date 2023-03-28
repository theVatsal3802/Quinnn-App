import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lgbtq_social_media/functions/auth_functions.dart';
import 'package:lgbtq_social_media/screens/dashboard/home_screen.dart';
import 'package:lgbtq_social_media/utils/assets_manager.dart';
import 'package:lgbtq_social_media/utils/color_manager.dart';
import 'package:country_picker/country_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:lgbtq_social_media/utils/parse_functions.dart';
import 'package:lgbtq_social_media/widgets/custom_drawer.dart';

class ProfileSetupScreen extends StatefulWidget {
  static const routeName = "/profile-setup";
  final bool isUpdate;
  const ProfileSetupScreen({
    super.key,
    required this.isUpdate,
  });

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final bioController = TextEditingController();
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  String country = "";
  String flag = "";
  String profileImageUrl = "";
  String coverImageUrl = "";
  bool isProfilePrivate = false;
  String dob = "";
  String token = "";
  bool isLoading = false;

  void selectCountry() {
    showCountryPicker(
      searchAutofocus: false,
      context: context,
      showPhoneCode: false,
      onSelect: (Country country) {
        setState(() {
          this.country = country.name;
          flag = country.flagEmoji;
        });
      },
    );
  }

  Future<void> selectDOB() async {
    await showDatePicker(
      context: context,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      currentDate: DateTime.now(),
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then(
      (value) {
        if (value != null) {
          String month = ParseFunctions.getMonthNameFromNumber(value.month);
          setState(() {
            dob = "${value.day} $month, ${value.year}";
          });
        }
      },
    );
  }

  Future<void> setupProfile() async {
    setState(() {
      isLoading = true;
    });
    await AuthFunctions.completeProfileSetup(
      token: token,
      bio: bioController.text.isNotEmpty ? bioController.text : null,
      country: country.isNotEmpty ? country : null,
      coverImageUrl: coverImageUrl.isNotEmpty ? coverImageUrl : null,
      isPrivate: isProfilePrivate,
      name: nameController.text.isNotEmpty ? nameController.text : null,
      profileImageUrl: profileImageUrl.isNotEmpty ? profileImageUrl : null,
      username:
          usernameController.text.isNotEmpty ? usernameController.text : null,
      dob: dob.isNotEmpty ? dob : null,
    ).then(
      (value) {
        setState(() {
          isLoading = false;
        });
        if (value) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            HomeScreen.routeName,
            (route) => false,
          );
        } else {
          ParseFunctions.showSnackbar(
            context: context,
            text: "Profile Update failed, try again",
          );
        }
      },
    );
  }

  Future<void> pickProfileImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    await picker.pickImage(source: ImageSource.gallery).then(
      (value) async {
        File image = File(value!.path);
        final ext = image.path.split('.').last;
        final reference = FirebaseStorage.instance;
        final ref = reference.ref().child("images/$token-profile.$ext");
        await ref.putFile(
          image,
          SettableMetadata(
            contentType: "image/$ext",
          ),
        );
        profileImageUrl = await ref.getDownloadURL();
      },
    );
  }

  Future<void> pickProfileImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    await picker.pickImage(source: ImageSource.camera).then(
      (value) async {
        File image = File(value!.path);
        final ext = image.path.split('.').last;
        final reference = FirebaseStorage.instance;
        final ref = reference.ref().child("images/$token-profile.$ext");
        await ref.putFile(
          image,
          SettableMetadata(
            contentType: "image/$ext",
          ),
        );
        profileImageUrl = await ref.getDownloadURL();
      },
    );
  }

  Future<void> pickCoverImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    await picker.pickImage(source: ImageSource.gallery).then(
      (value) async {
        File image = File(value!.path);
        final ext = image.path.split('.').last;
        final reference = FirebaseStorage.instance;
        final ref = reference.ref().child("images/$token-cover.$ext");
        await ref.putFile(
          image,
          SettableMetadata(
            contentType: "image/$ext",
          ),
        );
        coverImageUrl = await ref.getDownloadURL();
      },
    );
  }

  Future<void> pickCoverImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    await picker.pickImage(source: ImageSource.camera).then(
      (value) async {
        File image = File(value!.path);
        final ext = image.path.split('.').last;
        final reference = FirebaseStorage.instance;
        final ref = reference.ref().child("images/$token-cover.$ext");
        await ref.putFile(
          image,
          SettableMetadata(
            contentType: "image/$ext",
          ),
        );
        coverImageUrl = await ref.getDownloadURL();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as String;
    setState(() {
      token = data;
    });

    return Scaffold(
      drawer: widget.isUpdate ? const CustomDrawer() : null,
      appBar: AppBar(
        title: Text(
          widget.isUpdate
              ? "Edit Profile"
              : "Lets complete setting up your profile",
          textScaleFactor: 1,
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (widget.isUpdate)
                  TextField(
                    keyboardType: TextInputType.name,
                    enableSuggestions: true,
                    controller: nameController,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                      labelText: "Name",
                    ),
                  ),
                const SizedBox(
                  height: 10,
                ),
                if (widget.isUpdate)
                  TextField(
                    keyboardType: TextInputType.name,
                    enableSuggestions: true,
                    controller: usernameController,
                    textCapitalization: TextCapitalization.none,
                    decoration: const InputDecoration(
                      labelText: "Username",
                    ),
                  ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorManager.baseGreyColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Set your personal profile pic",
                        textScaleFactor: 1,
                        style: Theme.of(context).textTheme.titleLarge!,
                      ),
                      Center(
                        child: CircleAvatar(
                          radius: 70,
                          backgroundColor: ColorManager.baseGreyColor,
                          backgroundImage: profileImageUrl.isEmpty
                              ? null
                              : NetworkImage(profileImageUrl),
                          child: profileImageUrl.isEmpty
                              ? Image.asset(AssetManager.profile)
                              : null,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          OutlinedButton.icon(
                            onPressed: () async {
                              await pickProfileImageFromCamera();
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: ColorManager.baseDarkGreyColor,
                              ),
                            ),
                            icon: const Icon(Icons.camera),
                            label: const Text(
                              "From Camera",
                              textScaleFactor: 1,
                            ),
                          ),
                          OutlinedButton.icon(
                            onPressed: () async {
                              await pickProfileImageFromGallery();
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: ColorManager.baseDarkGreyColor,
                              ),
                            ),
                            icon: const Icon(Icons.image),
                            label: const Text(
                              "From Gallery",
                              textScaleFactor: 1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 250,
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: ColorManager.baseGreyColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Set your cover image",
                        textScaleFactor: 1,
                        style: Theme.of(context).textTheme.titleLarge!,
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            image: coverImageUrl.isEmpty
                                ? const DecorationImage(
                                    image: AssetImage(AssetManager.cover),
                                    fit: BoxFit.contain,
                                  )
                                : DecorationImage(
                                    image: NetworkImage(coverImageUrl),
                                    fit: BoxFit.fill,
                                  ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          OutlinedButton.icon(
                            onPressed: () async {
                              await pickCoverImageFromCamera();
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: ColorManager.baseDarkGreyColor,
                              ),
                            ),
                            icon: const Icon(Icons.camera),
                            label: const Text(
                              "From Camera",
                              textScaleFactor: 1,
                            ),
                          ),
                          OutlinedButton.icon(
                            onPressed: () async {
                              await pickCoverImageFromGallery();
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: ColorManager.baseDarkGreyColor,
                              ),
                            ),
                            icon: const Icon(Icons.image),
                            label: const Text(
                              "From Gallery",
                              textScaleFactor: 1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    key: const ValueKey('bio'),
                    controller: bioController,
                    autocorrect: true,
                    enableSuggestions: true,
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      labelText: 'Bio',
                      prefixIcon: Icon(Icons.description),
                    ),
                  ),
                ),
                if (!widget.isUpdate)
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    tileColor: ColorManager.baseGreyColor,
                    leading: const Icon(Icons.location_on),
                    onTap: selectCountry,
                    title: Text(
                      country.isEmpty ? "Select Country" : "$flag $country",
                      textScaleFactor: 1,
                    ),
                  ),
                if (!widget.isUpdate)
                  const SizedBox(
                    height: 10,
                  ),
                if (!widget.isUpdate)
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    tileColor: ColorManager.baseGreyColor,
                    leading: const Icon(Icons.calendar_month),
                    onTap: selectDOB,
                    title: Text(
                      dob.isEmpty ? "Select Date of Birth" : "Birthday: $dob",
                      textScaleFactor: 1,
                    ),
                  ),
                if (!widget.isUpdate)
                  const SizedBox(
                    height: 10,
                  ),
                SwitchListTile(
                  title: const Text(
                    "Make Profile Private",
                    textScaleFactor: 1,
                  ),
                  value: isProfilePrivate,
                  onChanged: (value) {
                    setState(() {
                      isProfilePrivate = value;
                    });
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  tileColor: ColorManager.baseGreyColor,
                ),
                const SizedBox(
                  height: 20,
                ),
                if (!isLoading)
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      widget.isUpdate ? "Save changes" : "Save my info",
                      textScaleFactor: 1,
                    ),
                  ),
                if (isLoading)
                  const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
