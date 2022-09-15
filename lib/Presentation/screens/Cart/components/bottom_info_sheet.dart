import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kingyonas/Presentation/screens/Cart/components/bottom_choose_payment.dart';
import 'package:kingyonas/constants.dart';

class BottomUserInformationSheet {
  static Future<dynamic> show(BuildContext context, Size size) {
    return showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(kRadius),
              topRight: Radius.circular(kRadius)),
        ),
        backgroundColor: Colors.white,
        context: context,
        builder: (context) {
          return InfoBody(
            size: size,
          );
        });
  }
}

class InfoBody extends StatefulWidget {
  InfoBody({
    Key? key,
    required this.size,
  }) : super(key: key);
  final Size size;

  @override
  State<InfoBody> createState() => _InfoBodyState();
}

class _InfoBodyState extends State<InfoBody> {
  TextEditingController countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SizedBox(
        height: widget.size.height / 1.7,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const Align(
                    alignment: Alignment.center,
                    child: Text("User Information")),
                const SizedBox(
                  height: 20,
                ),
                const Divider(),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kRadius),
                      color: kwhite,
                      boxShadow: [boxShadow]),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Your Full name',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kRadius),
                      color: kwhite,
                      boxShadow: [boxShadow]),
                  child: const TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Your PhoneNumber',
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    coutryPicker(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kRadius),
                        color: kwhite,
                        boxShadow: [boxShadow]),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: countryController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Your Location',
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              coutryPicker(context);
                            },
                            icon: const Icon(Icons.arrow_downward_rounded))
                      ],
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(kRadius)),
                    backgroundColor: kprimary,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    BottomChoosePayment.show(context, widget.size);
                  },
                  child: const Center(
                      child: Text(
                    "Next",
                    style: TextStyle(color: kwhite),
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void coutryPicker(BuildContext context) {
    return showCountryPicker(
      context: context,
      //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
      exclude: <String>['KN', 'MF'],
      favorite: <String>['ET'],
      //Optional. Shows phone code before the country name.
      showPhoneCode: false,
      onSelect: (Country country) {
        setState(() {
          countryController.text = country.name;
          print('Select country: ${country.name}');
        });
      },
      // Optional. Sets the theme for the country list picker.
      countryListTheme: CountryListThemeData(
        // Optional. Sets the border radius for the bottomsheet.
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(kRadius),
          topRight: Radius.circular(kRadius),
        ),
        // Optional. Styles the search field.
        inputDecoration: InputDecoration(
          hintText: 'Search Your Location',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color(0xFF8C98A8).withOpacity(0.2),
            ),
          ),
        ),
      ),
    );
  }
}
