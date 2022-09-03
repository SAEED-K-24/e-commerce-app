
// import 'package:e_commerce_app/view/layout_screen.dart';
// import 'package:e_commerce_app/view/screens/sign_in_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import '../helper/fire_auth_helper.dart';
// import '../helper/product_firestore_helper.dart';
// import '../helper/navigation_helper.dart';
// import '../model/user.dart';

// class AuthProvider extends ChangeNotifier {
//   Gender gender = Gender.Male;
//   changeGender(Gender gender) {
//     this.gender = gender;
//     notifyListeners();
//   }

//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController ageController = TextEditingController();
//   TextEditingController cityController = TextEditingController();
//   UserModel? loggedUser;

//   addNewUserToFirestore() async {
//     String? uiserId = await FireAuthHelper.fireAuthHelper
//         .register(emailController.text, passwordController.text);
//     if (uiserId != null) {
//       UserModel userModel = UserModel(
//           name: nameController.text,
//           age: num.parse(ageController.text),
//           city: cityController.text,
//           email: emailController.text,
//           gender: gender,
//           password: passwordController.text);
//       userModel.id = uiserId;
//       await FirestoreHelper.firestoreHelper.addNewUserToFirestore(userModel);
//       emailController.clear();
//       passwordController.clear();
//       cityController.clear();
//       ageController.clear();

//       NavigationHelper.navigationHelper
//           .navigateToWidgetWithReplacement(SignInScreen());
//     }
//   }

//   getOneUserFromFirestore() async {
//     String? id = await FireAuthHelper.fireAuthHelper
//         .login(emailController.text, passwordController.text);
//     if (id != null) {
//       UserModel userModel =
//           await FirestoreHelper.firestoreHelper.getUsersFromFirestore(id);
//       loggedUser = userModel;
//       notifyListeners();
      
//         NavigationHelper.navigationHelper
//             .navigateToWidgetWithReplacement(LayoutScreen());
      
      
//     }
//   }

//   updateUserFromFirestore() async {
//     UserModel userModel = UserModel(
//         name: nameController.text,
//         age: num.parse(ageController.text),
//         city: cityController.text,
//         email: loggedUser!.email!,
//         gender: gender,
//         password: '');
//     userModel.id = FirebaseAuth.instance.currentUser!.uid;
//     loggedUser = userModel;
//     notifyListeners();
//     await FirestoreHelper.firestoreHelper.updateUserInFirestore(userModel);
//   }
// }