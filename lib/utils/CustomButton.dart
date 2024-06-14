import 'package:flutter/material.dart';
import 'Style.dart';
class CustomButton extends StatefulWidget {
  String text;
  Color color;
  Color text_color;
  double height,width,radius;
  Function() ontap;
  CustomButton({
    required this.text,
    required this.height,
    required this.radius,
    required this.width,
    required this.color,
    required this.text_color,
    required this.ontap,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius)
      ),
      child: MaterialButton(
        elevation: 1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.radius)
        ),
        color: widget.color,
        onPressed: widget.ontap,
        child: Text(widget.text,style: button_style.copyWith(
          color: widget.text_color
        ),),
      ),
    );
  }
}
