import 'package:flutter/material.dart';

class CustomMenuButton extends StatelessWidget {
  const CustomMenuButton({
    super.key,
    this.isIPad,
    required this.btnWidth,
    required this.btnHeight,
    required this.title,
    required this.onTap,
    this.counter,
  });
  final bool? isIPad;
  final double btnWidth;
  final double btnHeight;
  final String title;
  final String? counter;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    double reduceHeight = (isIPad ?? false) ? 80 : 30;
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8),
      width: btnWidth,
      height: btnWidth * 1.6 - reduceHeight,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: btnWidth,
          height: btnHeight - reduceHeight,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor, width: 2),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: counter != null,
                child: Container(
                  margin: const EdgeInsets.only(top: 25),
                  height: (isIPad ?? false) ? 160 : 44,
                  width: (isIPad ?? false) ? 160 : 44,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    ),
                    borderRadius:
                        BorderRadius.circular((isIPad ?? false) ? 80 : 22),
                  ),
                  child: Center(
                    child: Text(
                      counter ?? '',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: (isIPad ?? false) ? 32 : 16),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 5),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Text(
                    title,
                    style: TextStyle(
                        fontFamily: 'Nikosh',
                        fontSize: (isIPad ?? false) ? 36 : 18,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
