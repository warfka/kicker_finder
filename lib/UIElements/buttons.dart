import 'package:flutter/material.dart';
import '../pages/battlePage.dart';

bool typeCheck(VoidCallback? check){

  return false;
}

Widget squareButton({required Widget toPage,
                    //required VoidCallback? onPressed, это нужно для будующего функционала
                    required size,
                    required String buttonText,
                    required BuildContext context}) =>
    Container(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: size,
          width: size,
          color: Colors.red,
          child: OutlinedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => toPage
                  ));
            },
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
