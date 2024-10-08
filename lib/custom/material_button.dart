import 'package:flutter/material.dart';

import '../common/color.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final bool? sufficIconValue;
  final bool? prefixIconValue;
  final bool? removeBackValue;
  final bool? miniButton;
  final bool? freeHandButton;

  final Image? image;

  CustomButton(
      {required this.text,
      required this.onPressed,
      this.color,
      this.textColor,
      this.sufficIconValue = false,
      this.prefixIconValue = false,
      this.removeBackValue = false,
      this.miniButton = false,
      this.freeHandButton = false,
      this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: removeBackValue == false ? 30 : 10),
      child: GestureDetector(
          onTap: onPressed,
          child: removeBackValue == false
              ? Container(
              height: MediaQuery.of(context).size.height * 0.055,
              width: freeHandButton == true
                  ? MediaQuery.of(context).size.width * 0.92
                  : MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: appMainColor),
                borderRadius: BorderRadius.circular(5),
                color: sufficIconValue == false
                    ? color ?? appTextAllColor
                    : Colors.white,
              ),
              child: sufficIconValue == false
                  ? Center(
                  child: Text(
                    text,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize:
                        MediaQuery.of(context).size.height *
                            0.020,
                        fontWeight: FontWeight.bold,
                        fontFamily: "semiBold"),
                  ))
                  : Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceEvenly,
                children: [
                  image ??
                      Icon(
                        Icons.sports_soccer,
                        color: Colors.white,
                      ),
                  Text(
                    text,
                    style: TextStyle(
                        color: sufficIconValue == true
                            ? appColor
                            : Colors.white,
                        fontSize: 18,
                        fontFamily: "semiBold"),
                  ),
                  Text('')
                ],
              ))
              : Container(
              height: MediaQuery.of(context).size.height * 0.055,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: appContainerBackColor,
              ),
              child: sufficIconValue == false
                  ? Center(
                  child: Text(
                    text,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "semiBold"),
                  ))
                  : Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceEvenly,
                children: [
                  image ??
                      Icon(
                        Icons.sports_soccer,
                        color: Colors.white,
                      ),
                  Text(
                    text,
                    style: TextStyle(
                        color: sufficIconValue == true
                            ? appColor
                            : Colors.white,
                        fontSize: 18,
                        fontFamily: "semiBold"),
                  ),
                  Text('')
                ],
              ))),
    );
  }
}
