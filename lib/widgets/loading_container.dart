import 'package:flutter/material.dart';

Container loadingContainer(Size size) {
  return Container(
    height: size.height,
    width: size.width,
    color: Colors.lightBlueAccent.withOpacity(0.7),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/get-started.png'),
          const CircularProgressIndicator(
            color: Colors.blue,
          ),
          const Text(
            "Fetching Data... ",
            style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 30,
                fontFamily: 'poppins'),
          )
        ],
      ),
    ),
  );
}
