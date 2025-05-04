import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SectionIdentify extends StatelessWidget {
  const SectionIdentify({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: CircleAvatar(
            radius: MediaQuery.of(context).size.width*.055,
            child: Icon(Icons.person_rounded),
          ),
        ),
        Column(

          children: [
            Text('Amira Hamed',
                style: TextStyle(
                  // fontFamily: 'Urbanist',
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                )),

            Text('@amira_hamed',
                style: TextStyle(
                    color: Color(0xff989797),
                    // fontFamily: 'Urbanist',
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                )),

          ],
        ),
      ],
    );
  }
}


