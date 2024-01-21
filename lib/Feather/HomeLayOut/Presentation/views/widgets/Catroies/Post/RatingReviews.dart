import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/widgets/Catroies/Post/ListViewreatingScreen.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class RatingReviews extends StatelessWidget {
  const RatingReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Text(
              "RatingReviews",
              style: Styles.textStyle20,
            ),
            const SizedBox(
              height: 10,
            ),
            const ListViewreatingScreen(),
          ]),
        ),
      ),
      floatingActionButton: MyFloatingActionButton(),
    );
  }
}

class MyFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container();
          },
        );
      },
      child: Icon(Icons.add),
    );
  }
}
