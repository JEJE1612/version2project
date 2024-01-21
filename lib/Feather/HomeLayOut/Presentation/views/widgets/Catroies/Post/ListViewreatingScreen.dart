import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/widgets/Catroies/Post/Addreviw.dart';

class ListViewreatingScreen extends StatelessWidget {
  const ListViewreatingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          height: 10,
        ),
        itemBuilder: (context, index) => buildRewiItems(context),
        itemCount: 10,
      ),
    );
  }
}
