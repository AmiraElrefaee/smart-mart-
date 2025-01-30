import 'package:flutter/cupertino.dart';

class CustomSideText extends StatelessWidget {
  const CustomSideText({
    super.key, required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: MediaQuery.of(context).size.height*.017,
      ),
    );
  }
}

