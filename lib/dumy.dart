// //  Function for user login
//   void login(BuildContext context) async {
//     setLoading(true);
//     try {
//       //logging user

//       final value = await auth.signInWithEmailAndPassword(
//           email: emailController.text.trim(),
//           password: passwordController.text.trim());

//       CollectionReference ref = FirebaseFirestore.instance.collection('User');
//       ref.doc(value.user!.uid.toString()).get().then((value) async {
//         setLoading(false);
//         await SessionController.saveUserInPreference(
//             value.data(), value['role']);
//         await SessionController.getUserFromPreference();
//         emailController.clear();
//         passwordController.clear();
//         // Navigator.pushNamed(context, RouteName.playerDashboardScreen);
//         if (value['role'] == 'coach') {
//           Navigator.pushNamed(context, RouteName.couchDashboardScreen);
//         } else if (value['role'] == 'superAdmin') {
//           Navigator.pushNamed(context, RouteName.superAdminDashboardScreen);
//         } else if (value['role'] == 'staff') {
//           Navigator.pushNamed(context, RouteName.staffDashboardScreen);
//         } else {
//           Navigator.pushNamed(context, RouteName.playerDashboardScreen);
//         }
//       });

//       // if (!value.user!.emailVerified) {
//       //   setLoading(false);
//       //   userEmailIsNotVerified(context, value);
//       // } else {
//       //   //getting user details
//       //
//       // }
//     } on FirebaseAuthException catch (e) {
//       setLoading(false);
//       if (e.code == 'email-already-in-use') {
//         Utils.flushBarErrorMessage(e.message.toString(), context);
//       } else if (e.code == 'missing-email') {
//         Utils.flushBarErrorMessage('Email address not found', context);
//       } else if (e.code == 'wrong-password') {
//         Utils.flushBarErrorMessage(e.message.toString(), context);
//       } else if (e.code == 'user-not-found') {
//         Utils.flushBarErrorMessage(e.message.toString(), context);
//       } else {
//         Utils.flushBarErrorMessage(e.message.toString(), context);
//       }
//     } catch (e) {
//       setLoading(false);
//       Utils.toastMessage(e.toString());
//     }
//   }