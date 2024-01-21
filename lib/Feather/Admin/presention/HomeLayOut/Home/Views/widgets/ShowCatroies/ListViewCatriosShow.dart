import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/Mangment/AdminBloc.dart';
import 'package:flutter_application_1/Feather/Admin/Mangment/AdminBlocState.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/ShowCatroies/ItemsListViewCatroiesShow.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewCatriosShow extends StatelessWidget {
  ListViewCatriosShow({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminBloc, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
        var bloc = AdminBloc.get(context);
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: bloc.catroiesnum.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            childAspectRatio: 0.999,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (BuildContext context, int index) {
            return ItemsListViewCatroiesShow(
               bloc.catroies[index],
              );
          },
        );
      },
    );
  }
}
