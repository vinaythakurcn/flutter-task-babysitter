import 'package:flutter/material.dart';

import 'package:babysitter/components/app_button.dart';
import 'package:babysitter/components/app_text.dart';
import 'package:babysitter/models/profile.dart';

class ProfileCard extends StatelessWidget {
  final Profile profile;
  const ProfileCard({Key? key, required this.profile}) : super(key: key);

  static const height16 = SizedBox(height: 16);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: (height * 0.65),
          child: Stack(
            children: [
              buildImageSection(width, height * 0.35),
              buildProfileInfoSection(width, height * 0.3),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildImageSection(double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(profile.imagePath),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
    );
  }

  Widget buildProfileInfoSection(double width, double height) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: AppText(
                text: profile.name,
                textAlign: TextAlign.center,
                size: 30,
              ),
            ),
            iconTextRow('images/location.png', 'בן גוריון 124, כפר סבא'),
            height16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                iconTextRow('images/calendar.png', '21.10.21'),
                const AppText(text: 'לשעה ₪4'),
              ],
            ),
            height16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                iconTextRow('images/clock.png', '20:00 - 23:00'),
                const AppText(text: 'תיאור נוסף', underline: true),
              ],
            ),
            height16,
            AppButton(text: 'שליחת פניה', onTap: () {})
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(color: Color(0xFFf1f1f1), blurRadius: 10.0)
          ],
        ),
      ),
    );
  }

  Widget iconTextRow(String icon, String text) {
    return Row(
      children: [
        Image.asset(icon),
        const SizedBox(width: 8),
        AppText(text: text),
      ],
    );
  }
}
