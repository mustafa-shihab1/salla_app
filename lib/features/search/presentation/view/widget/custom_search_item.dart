import 'package:flutter/material.dart';
import 'package:home_service_application/core/resources/manager_colors.dart';
import 'package:home_service_application/core/resources/manager_fonts.dart';

class CustomSearchItem extends StatelessWidget {
  final String? name;
  final String? image;

  const CustomSearchItem({
    super.key,
    required this.name,
    required this.image,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
        child: Row(
          children: [
            Container(
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(image!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10,),
            Flexible(
              child: Text(
               '$name',
                style: TextStyle(
                  fontSize: ManagerFontSize.s16,
                  fontWeight: ManagerFontWeight.medium,
                  overflow: TextOverflow.ellipsis,
                  color: ManagerColors.black,
                ),


              ),
            ),
          ],
        ),
      ),
    );
  }
}