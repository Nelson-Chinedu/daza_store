import 'package:daza_store_commerce/features/profile/profile_viewmodel.dart';
import 'package:daza_store_commerce/shared/widgets/button/button_view.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: BoxBorder.all(color: Colors.grey),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Icon(Icons.arrow_back_ios_sharp, size: 20),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'Complete Your Profile',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 1),
                          Text(
                            'Don\'t worry, only you can see your personal',
                            style: TextStyle(
                              color: Color(0xFF242424),
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            'data. No one else will be able to see it.',
                            style: TextStyle(
                              color: Color(0xFF242424),
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 50),
                          Stack(
                            children: [
                              Container(
                                width: 145,
                                height: 145,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.shade100,
                                ),
                                child: Icon(Icons.person_2_outlined, size: 60),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF401900),
                                  ),
                                  child: Icon(
                                    Icons.edit_outlined,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Firstname'),
                              const SizedBox(height: 5),
                              TextField(
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  hintText: 'john',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Lastname'),
                              const SizedBox(height: 5),
                              TextField(
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  hintText: 'doe',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Phone Number'),
                              const SizedBox(height: 5),
                              InternationalPhoneNumberInput(
                                countries: const ['NG'],
                                onInputChanged: (_) {},
                                keyboardType: TextInputType.phone,
                                inputDecoration: InputDecoration(
                                  hintText: 'Phone number',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Colors.deepPurple,
                                      width: 2,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 16,
                                  ),
                                ),
                                ignoreBlank: false,
                                selectorConfig: const SelectorConfig(
                                  // showFlags: true,
                                  useEmoji: false,
                                  trailingSpace: true,
                                  setSelectorButtonAsPrefixIcon: true,
                                  leadingPadding: 14,
                                  selectorType:
                                      PhoneInputSelectorType.BOTTOM_SHEET,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Gender'),
                              DropdownMenu<String>(
                                width: double.infinity,
                                hintText: 'Select',
                                inputDecorationTheme: InputDecorationTheme(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                dropdownMenuEntries: const [
                                  DropdownMenuEntry(
                                    value: 'Male',
                                    label: 'Male',
                                  ),
                                  DropdownMenuEntry(
                                    value: 'Female',
                                    label: 'Female',
                                  ),
                                  DropdownMenuEntry(
                                    value: 'Other',
                                    label: 'Other',
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: double.infinity,
                            child: Button(
                              label: 'Complete Profile',
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
