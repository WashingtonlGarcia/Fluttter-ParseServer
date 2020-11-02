import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final void Function() onTap;
  final bool isLoading;

  const ButtonWidget({
    @required this.title,
    @required this.onTap,
    @required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: Theme.of(context).primaryColor,
      child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: SizedBox(
            height: 60,
            child: Align(
              child: isLoading
                  ? SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                        backgroundColor: Theme.of(context).accentColor,
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                    )
                  : Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
            ),
          )),
    );
  }
}
