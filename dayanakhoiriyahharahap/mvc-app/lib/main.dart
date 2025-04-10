// import 'package:flutter/material.dart';
// import 'controllers/task.dart';
// // import 'encrypted/env.dart';
// import 'views/task_list.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   runApp(TaskListApp());
// }

// class TaskListApp extends StatelessWidget {
//   final TaskListController controller = TaskListController();

//   TaskListApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(controller.tasks.isNotEmpty
//               ? "${controller.tasks.length} tasks"
//               : "No tasks"),
//         ),
//         body: TaskListView(controller: controller),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testing/firebase_options.dart';
import 'package:testing/views/cart/cart_view.dart';
import 'views/auth/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MvcApp());
}

class MvcApp extends StatelessWidget {
  MvcApp({super.key});
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVC App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.blue,              
          selectionColor: Color(0xFFBBDEFB),      
          selectionHandleColor: Colors.blue,     
        ),
        inputDecorationTheme: const InputDecorationTheme(
          floatingLabelStyle: TextStyle(
            color: Colors.blue, 
            fontWeight: FontWeight.w600,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),
      home: user != null ? CartView() : LoginView(),
    );
  }
}
