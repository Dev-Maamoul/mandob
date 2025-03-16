import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardButton extends StatelessWidget {
  const CardButton({super.key, required this.title, this.onTap});
  final String title;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 100,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: kElevationToShadow[4],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(title),
            SizedBox(
              height: 50,
              width: 50,
              child: SvgPicture.asset(
                'assets/Group 38764.svg',
                semanticsLabel: 'Red dash paths',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
