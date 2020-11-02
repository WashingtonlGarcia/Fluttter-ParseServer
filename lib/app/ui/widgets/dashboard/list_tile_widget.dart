import 'package:flutter/material.dart';
import '../../../data/models/user.dart';
import 'rich_text_widget.dart';

class ListTileWidget extends StatelessWidget {
  final User user;

  const ListTileWidget({
    @required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichTextWidget(title: 'Nome: ', subtitle: user.name),
          const SizedBox(height: 8),
          RichTextWidget(title: 'E-mail: ', subtitle: user.email),
          const SizedBox(height: 8),
          RichTextWidget(title: 'Tipo: ', subtitle: user.userType.formatInString),
          const SizedBox(height: 8),
          RichTextWidget(title: 'Instituicao: ', subtitle: user.institution),
        ],
      ),
    );
  }
}
