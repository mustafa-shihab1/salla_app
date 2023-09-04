import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../../core/resources/manager_colors.dart';
import '../../../../../core/resources/manager_fonts.dart';
import '../../../../../core/resources/manager_sizes.dart';
import '../../../../../core/resources/manager_styles.dart';

class CustomDescription extends StatelessWidget {
  final void Function(double) onRatingUpdate;
  final String name;
  final double price;
  final String description;

  const CustomDescription({
    Key? key,
    required this.onRatingUpdate,
    required this.price,
    required this.name,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                name,
                style: getBoldTextStyle(
                  fontSize: ManagerFontSize.s14,
                  color: ManagerColors.black,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              width: ManagerWidth.w10,
            ),
            Column(
              children: [
                RatingBar.builder(
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: ManagerIconSize.s24,
                  itemBuilder: (context, i) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  unratedColor: ManagerColors.lightGrey,
                  onRatingUpdate: onRatingUpdate,
                ),
                SizedBox(
                  height: ManagerHeight.h6,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '${price.toString()} \$',
                    style: getBoldTextStyle(
                      fontSize: ManagerFontSize.s16,
                      color: ManagerColors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: ManagerHeight.h20,
        ),
        Text(
          description,
          style: getBoldTextStyle(
            fontSize: ManagerFontSize.s16,
            color: ManagerColors.boldGrey,
          ),
        )
      ],
    );
  }
}
