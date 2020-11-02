import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.receipt,
            color: Colors.grey[600],
            size: MediaQuery.of(context).size.height * 0.10,
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'Nenhum cadastro encontrado!',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          )
        ],
      ),
    );
  }
}
