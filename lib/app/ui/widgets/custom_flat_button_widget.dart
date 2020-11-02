import 'package:flutter/material.dart';

class CustomFlatButtonWidget extends StatelessWidget {
  final String title;
  final void Function() onTap;
  final bool isLoading;

  const CustomFlatButtonWidget({
    @required this.title,
    @required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      elevation: 10,
      child: InkWell(
          onTap: onTap,
          child: SizedBox(
            height: 60,
            child: Align(
              child: Visibility(
                visible: !isLoading,
                replacement: SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    backgroundColor: Theme.of(context).accentColor,
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                ),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
