import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/views/screens/page_switcher.dart';
import 'package:project/views/widgets/modals/modify_profile_modal.dart';
import '../../views/utils/AppColor.dart';
import '../../views/widgets/user_info_tile.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/modals/login_modal.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        elevation: 0,
        centerTitle: true,
        title: Text('My Profile',
            style: TextStyle(
                fontFamily: 'inter',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: AppColor.whiteSoft)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                isScrollControlled: true,
                builder: (context) {
                  return ModifyProfileModal();
                },
              );
            },
            child: Text(
              'Edit',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
            style: TextButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100))),
          ),
        ],
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
          // Section 1 - Profile Picture Wrapper
          Container(
            color: AppColor.primary,
            padding: EdgeInsets.symmetric(vertical: 18),
            child: GestureDetector(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(100),
                      // Profile Picture
                      image: DecorationImage(
                          image: AssetImage('assets/images/pp.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Change Profile Picture',
                          style: TextStyle(
                              fontFamily: 'inter',
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                      SizedBox(width: 8),
                      SvgPicture.asset('assets/icons/camera.svg',
                          color: Colors.white),
                    ],
                  )
                ],
              ),
            ),
          ),
          // Section 2 - User Info Wrapper
          Container(
            margin: EdgeInsets.only(top: 14),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserInfoTile(
                  margin: EdgeInsets.only(bottom: 16),
                  label: 'Email',
                  value: 'The.Sam.Nolan1998@gmail.com',
                ),
                UserInfoTile(
                  margin: EdgeInsets.only(bottom: 16),
                  label: 'Full Name',
                  value: 'Sam',
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 5,
                      child: UserInfoTile(
                        margin: EdgeInsets.only(bottom: 16),
                        label: 'Height',
                        value: '176 cm',
                      ),
                    ),
                    SizedBox(width: 8),
                    Flexible(
                      flex: 5,
                      child: UserInfoTile(
                        margin: EdgeInsets.only(bottom: 16),
                        label: 'Weight',
                        value: '80 kg',
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 5,
                      child: UserInfoTile(
                        margin: EdgeInsets.only(bottom: 16),
                        label: 'Age',
                        value: '26',
                      ),
                    ),
                    SizedBox(width: 8),
                    Flexible(
                      flex: 5,
                      child: UserInfoTile(
                        margin: EdgeInsets.only(bottom: 16),
                        label: 'Allergies',
                        value: 'None',
                      ),
                    ),
                  ],
                ),
                UserInfoTile(
                  margin: EdgeInsets.only(bottom: 16),
                  label: 'Your BMI result',
                  value: 'Over Weight',
                  valueBackground: Colors.redAccent.shade200,
                ),
                UserInfoTile(
                  margin: EdgeInsets.only(bottom: 16),
                  label: 'Your Daily plan with doctor',
                  value: 'Vegan daily, DR.Wencke Nottmeyer',
                ),
                UserInfoTile(
                  margin: EdgeInsets.only(bottom: 16),
                  label: 'Subscription Type',
                  value: 'Premium Subscription',
                  valueBackground: AppColor.secondary,
                ),
                UserInfoTile(
                  margin: EdgeInsets.only(bottom: 16),
                  label: 'Subscription Time',
                  value: 'Until 30 Oct 2024',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
