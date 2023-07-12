import 'package:flutter/material.dart';

class CustomProfileHeader extends StatelessWidget {
  const CustomProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 130,
          width: double.infinity,
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            image:  DecorationImage(
              image: NetworkImage("https://www.meshcc.com/wp-content/uploads/2022/02/Alex-Foord-e1644436249973.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 80,
          child: Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                  width: 4,
                  color: Colors.white
              ),
              image: const DecorationImage(
                image: NetworkImage("https://www.meshcc.com/wp-content/uploads/2022/02/Alex-Foord-e1644436249973.jpg"),
                fit: BoxFit.cover,
              ),
            ),

          ),
        ),
      ],
    );
  }
}
