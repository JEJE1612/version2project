import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/Mangment/AdminBloc.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/widgets/Catroies/widgets/BuildConsulat.dart';

class ListViewCatroisBuild extends StatelessWidget {
  ListViewCatroisBuild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
         return    BuildConsulat(i:index);
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 15,
              ),
          itemCount: AdminBloc.get(context).dataconsult.length),
    );
  }
}
