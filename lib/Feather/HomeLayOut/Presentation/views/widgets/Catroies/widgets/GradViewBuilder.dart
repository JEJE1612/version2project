// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/widgets/Catroies/widgets/Allconslatme.dart';
// import 'package:flutter_application_1/core/utils/assets.dart';
// import 'package:flutter_application_1/core/utils/styles.dart';

// class GradViewBuilder extends StatelessWidget {
//   const GradViewBuilder({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => const AllConaltant(),
//             ));
//       },
//       child: Container(
//         decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
//         child: Column(
//           children: [
//             Card(
//               elevation: 20,
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 150,
//                     child: Image.asset(
//                       AssetsData.logo,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Text(
//                     "Theather",
//                     style: Styles.textStyle18,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/widgets/Catroies/widgets/Allconslatme.dart';
import 'package:flutter_application_1/core/utils/assets.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class GradViewBuilder extends StatelessWidget {
  const GradViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AllConaltant(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
            image: AssetImage(
              AssetsData.logo,
            ),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4,
              offset: Offset(4, 8), // Shadow position
            ),
          ],
        ),
        child: Align(
            alignment: Alignment.center,
            child: Text(
              "Teather ",
              style: Styles.textStyle18.copyWith(color: Colors.white),
            )),
      ),
    );
  }
}
