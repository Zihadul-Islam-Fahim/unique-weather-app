import 'package:flutter/material.dart';

Column apiCallErrorContainer() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset('assets/windspeed.png'),
      const Text(
        "Sent too many Request.\nTry again After Some Time.... ",
        style:
            TextStyle(fontSize: 22, color: Colors.red, fontFamily: 'poppins'),
      )
    ],
  );
}
