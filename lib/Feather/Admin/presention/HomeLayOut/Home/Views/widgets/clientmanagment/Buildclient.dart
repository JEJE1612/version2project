import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/Mangment/AdminBloc.dart';
import 'package:flutter_application_1/Feather/Admin/Mangment/AdminBlocState.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/widgets/Catroies/widgets/Reating.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/widgets/Catroies/widgets/consltantProfail.dart';
import 'package:flutter_application_1/core/utils/assets.dart';
import 'package:flutter_application_1/core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildClient extends StatelessWidget {
 final int? i;

  const BuildClient({
  required this.i,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminBloc, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ConsltantProfail(),
                ));
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[300]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image:  DecorationImage(
                        image: AssetImage(
                         AdminBloc.get(context).dataclient[i!]['image'],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AdminBloc.get(context).dataclient[i!]['name'],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.textStyle16.copyWith(
                            color: Color.fromARGB(255, 57, 68, 90),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                        AdminBloc.get(context).dataclient[i!]['bio'],
                          style: Styles.textStyle14.copyWith(
                            color: Theme.of(context).colorScheme.brightness ==
                                    Brightness.dark
                                ? Colors.white
                                : Colors.black45,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                 
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
