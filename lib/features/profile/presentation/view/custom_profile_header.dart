import 'package:flutter/material.dart';

class CustomProfileHeader extends StatelessWidget {
  final Color? coverColor;
  final String? profileImage;
  const CustomProfileHeader({
    required this.coverColor,
    required this.profileImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 85,
          width: double.infinity,
          color: coverColor,
        ),
        Positioned(
          top: 30,
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                  width: 4,
                  color: Colors.white
              ),
              image: DecorationImage(
                image: NetworkImage(profileImage!),
                fit: BoxFit.cover,
              ),
            ),

          ),
        ),
      ],
    );
  }
}
