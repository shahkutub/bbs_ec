/*
	 * Created by Aqib
	 * Created on Wed Sep 27 2023
	 *
	 * Updated by 
	 * Updated on 
	 *
	 * Reviewed by 
	 * Reviewed on 
	 *
	 * Widget Name: custom_button.dart
	 * Description:  
	 *
	 * Copyright (c) 2023 a2i
 */

import 'package:flutter/material.dart';
import '../../utils/dimensions.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.isEnable,
      this.icon,
      required this.title,
      this.onTap,
      this.isLoading = false,
      this.borderRadius,
      this.width});

  final bool isEnable;
  final bool isLoading;
  final Widget? icon;
  final String title;
  final double? borderRadius;
  final VoidCallback? onTap;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnable
          ? !isLoading
              ? onTap
              : null
          : null,
      child: ClipRRect(
        borderRadius: BorderRadius.all(
            Radius.circular(borderRadius ?? Dimensions.RADIUS_SMALL)),
        child: Container(
          height: 56,
          width: width ?? MediaQuery.of(context).size.width,
          color: isEnable
              ? Theme.of(context).primaryColor
              : const Color(0xFF7DAEB0),
          child: Center(
            child: isLoading
                ? SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.5,
                      color: Theme.of(context).cardColor,
                    ))
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      icon != null
                          ? Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: icon)
                          : const SizedBox.shrink(),
                      Text(
                        title,
                        style: TextStyle(
                            fontFamily: 'NotoSanB',
                            fontSize: Dimensions.fontSizeLarge,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).cardColor),
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
