import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDevicesBox extends StatelessWidget {
  final bool ispowerOn;
  final String imagepath;
  final String text;
  final Color color;
  final void Function(bool)? onChanged;
  const SmartDevicesBox({
    super.key,
    required this.ispowerOn,
    required this.imagepath,
    required this.text,
    required this.color,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
        duration: const Duration(milliseconds: 1000),
        decoration: BoxDecoration(
            color: ispowerOn ? color : Colors.grey[200],
            borderRadius: BorderRadius.circular(20)),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Image.asset(
            imagepath,
            height: 65,
          ),
          Row(
            children: [
              Flexible(
                child: Text(
                  text,
                  style: TextStyle(
                      color: ispowerOn ? Colors.white : Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Transform.rotate(
                  angle: pi / 2,
                  child: CupertinoSwitch(
                      activeColor: Colors.white24,
                      value: ispowerOn,
                      onChanged: onChanged))
            ],
          )
        ]),
      ),
    );
  }
}
