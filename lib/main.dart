import 'package:flutter/material.dart';
import 'package:hello/pages/Contacts.dart';
import 'package:hello/pages/home.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// void main(){
//   //runApp(MyApp());
//
//   runApp(
//       MaterialApp(
//         title: 'My app',
//         home: SafeArea(
//           child: Scaffold(
//             body: Container(
//               child: MyScaffold(),
//             ),
//           ),
//
//         ),
//
//         debugShowCheckedModeBanner: false,
//       ));
// }
//
// class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
//   final Widget title;
//   const MyAppBar({required this.title, Key? key}) : super(key: key);
//
//   Widget build(BuildContext context) {
//     return Container(
//       height: 56,
//       padding: const EdgeInsets.symmetric(horizontal: 8),
//       decoration: BoxDecoration(color: Colors.blue[500]),
//
//       child: Row(
//         children: [
//           const IconButton(
//             icon: Icon(Icons.menu),
//             tooltip: 'Navigation menu',
//             onPressed: null,
//           ),
//           Expanded(
//             child: title,
//           ),
//           const IconButton(
//             icon: Icon(Icons.search),
//             tooltip: 'Search',
//             onPressed: null,
//           )
//         ],
//       ),
//     );
//   }
//
//   @override
//   // TODO: implement preferredSize
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
//
//
// }

// class MyScaffold extends StatelessWidget {
//   static const descTextStyle = TextStyle(
//     color: Colors.blue,
//     fontFamily: 'Roboto',
//     letterSpacing: 0.5,
//     fontSize: 18,
//     height: 2,
//   );
//
//   const MyScaffold({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final iconList = DefaultTextStyle.merge(
//       style: descTextStyle,
//       child: Container(
//         padding: const EdgeInsets.all(20),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Column(
//               children: [
//                 Icon(Icons.phone, color: Colors.blue[500]),
//                 Container(
//                   child: const Text('Phone'),
//                 ),
//               ],
//             ),
//             Column(
//               children: [
//                 Icon(Icons.route_sharp, color: Colors.blue[500]),
//                 Container(
//                   child: const Text('Route'),
//                 ),
//               ],
//             ),
//             Column(
//               children: [
//                 Icon(Icons.share, color: Colors.blue[500]),
//                 Container(
//                   child: const Text('Share'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//
//     return Scaffold(
//       appBar: const MyAppBar(
//         title: Text('My App'),
//       ),
//       body: iconList,
//
//     );
//   }
// }

// class MyScaffold extends StatelessWidget {
//   static const descTextStyle = TextStyle(
//     color: Colors.blue,
//     fontFamily: 'Roboto',
//     letterSpacing: 0.5,
//     fontSize: 18,
//     height: 2,
//   );
//
//   const MyScaffold({Key? key});
// //icon BEN DUOI APP
//   @override
//   Widget build(BuildContext context) {
//     final iconList = DefaultTextStyle.merge(
//       style: descTextStyle,
//       child: Container(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end, // Di chuyển xuống cuối
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Column(
//                   children: [
//                     Icon(Icons.phone, color: Colors.blue[500]),
//                     Container(
//                       child: const Text('Phone'),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Icon(Icons.route_sharp, color: Colors.blue[500]),
//                     Container(
//                       child: const Text('Route'),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Icon(Icons.share, color: Colors.blue[500]),
//                     Container(
//                       child: const Text('Share'),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//
//     return Scaffold(
//       appBar: const MyAppBar(
//         title: Text('My App Title'),
//       ),
//       body: Expanded( // Sử dụng Expanded để giữ phần child Row ở dưới cùng
//         child: iconList,
//       ),
//     );
//   }
// }


//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Starter Template',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Home(),
//     );
//   }
// }


// void main (){
//   runApp(MaterialApp(
//     home:SafeArea(
//         child:Scaffold(
//           body: Center(child: MyWidget(true)),
//           // appBar: AppBar(
//           //   backgroundColor: Colors.red,
//           //   title: const Text('Tu hoc Flutter'),
//           //
//           // ),
//           // body: const Center(
//           //   child: Text('Hello world'),
//           //
//           // )
//         )
//     ),
//     debugShowCheckedModeBanner:false ,
//   ));
// }
//
// class MyWidget extends StatelessWidget {
//   final bool loading;
//
//   MyWidget(this.loading);
//
//   @override
//   Widget build(BuildContext context) {
//     return loading ? CircularProgressIndicator() : const Text('State');
//   }
// }

//
// void main() {
//   runApp(MyApp());
// }



