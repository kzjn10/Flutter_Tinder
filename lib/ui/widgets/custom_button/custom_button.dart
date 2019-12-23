import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPress;
  final bool isSelected;

  CustomButton({@required this.iconData, this.isSelected = false, this.onPress}) : assert(iconData != null);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white, boxShadow: [
        BoxShadow(
          color: _theme.dividerColor.withOpacity(.5),
          blurRadius: 10.0,
          spreadRadius: 5.0,
          offset: Offset(
            2.0,
            2.0,
          ),
        )
      ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPress ?? null,
          borderRadius: BorderRadius.circular(50),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Icon(
              iconData,
              size: 20,
              color: isSelected ? _theme.primaryColor : _theme.disabledColor,
            ),
          ),
        ),
      ),
    );
  }
}
