import 'package:flutter/material.dart';

import '../../screens/page_switcher.dart';
import '../../utils/AppColor.dart';
import '../custom_text_field.dart';

class ModifyProfileModal extends StatelessWidget {
  const ModifyProfileModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 71 / 100,
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 32, top: 16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: ListView(
          shrinkWrap: true,
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          physics: BouncingScrollPhysics(),
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: MediaQuery.of(context).size.width * 35 / 100,
                margin: EdgeInsets.only(bottom: 20),
                height: 6,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            // header
            Container(
              margin: EdgeInsets.only(bottom: 24),
              child: Text(
                'Modify Profile',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'inter'),
              ),
            ),
            // Form
            CustomTextField(
                title: 'Email',
                hint: 'The.Sam.Nolan1998@gmail.com',
                enable: true),
            CustomTextField(
              title: 'Full Name',
              hint: 'Sam',
              margin: EdgeInsets.only(top: 16),
              enable: true,
            ),
            Row(
              children: [
                Flexible(
                  flex: 5,
                  child: CustomTextField(
                    title: 'Height',
                    hint: '176 cm',
                    margin: EdgeInsets.only(top: 16),
                    enable: true,
                  ),
                ),
                SizedBox(width: 8),
                Flexible(
                  flex: 5,
                  child: CustomTextField(
                    title: 'Weight',
                    hint: '80 kg',
                    margin: EdgeInsets.only(top: 16),
                    enable: true,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Flexible(
                  flex: 5,
                  child: CustomTextField(
                    title: 'Age',
                    hint: '26',
                    margin: EdgeInsets.only(top: 16),
                    enable: true,
                  ),
                ),
                SizedBox(width: 8),
                Flexible(
                  flex: 5,
                  child: CustomTextField(
                    title: 'Allergies',
                    hint: 'none',
                    margin: EdgeInsets.only(top: 16),
                    enable: true,
                  ),
                )
              ],
            ),
            // Register Button
            Container(
              margin: EdgeInsets.only(top: 32, bottom: 6),
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => PageSwitcher()));
                },
                child: Text('Save and continue',
                    style: TextStyle(
                        color: AppColor.whiteSoft,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'inter')),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: AppColor.primarySoft,
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
