import 'package:flutter/material.dart';
import 'package:lgbtq_social_media/utils/assets_manager.dart';
import 'package:lgbtq_social_media/utils/color_manager.dart';
import 'package:country_picker/country_picker.dart';
import 'package:lgbtq_social_media/utils/parse_functions.dart';

class ProfileSetupScreen extends StatefulWidget {
  static const routeName = "/profile-setup";
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final bioController = TextEditingController();
  String country = "";
  String flag = "";
  String dob = "";

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.baseWhiteShadeColor,
        elevation: 0,
        title: const Text(
          "Lets complete setting up your profile",
          textScaleFactor: 1,
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                            child: Image.asset(AssetManager.profile),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            OutlinedButton.icon(
                              onPressed: () {},
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
                              onPressed: () {},
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
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(AssetManager.cover),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            OutlinedButton.icon(
                              onPressed: () {},
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
                              onPressed: () {},
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
                    padding: const EdgeInsets.all(10),
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
                  const SizedBox(
                    height: 10,
                  ),
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
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Save my info",
                      textScaleFactor: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
