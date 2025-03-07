import 'package:flutter/cupertino.dart';

class SectionTitleAppBar extends StatelessWidget {
  const SectionTitleAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: const Text('QR Code Scanner',
          style: TextStyle(
              fontFamily: 'Urbanis',
              fontWeight: FontWeight.w600,
              fontSize: 22
          )
      ),
    );
  }
}

class CustomLine extends StatelessWidget {
  const CustomLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.only(
          bottom: 15,
          top: 15
      ),
      width: MediaQuery.of(context).size.width*.35,
      height: 5,

      decoration: BoxDecoration(
        color: Color(0xffDADADA),
        borderRadius: BorderRadius.circular(20),

      ),

    );
  }
}

