
import 'package:e_commerce/screens/FirestScreen/signin.dart';
import 'package:e_commerce/screens/Home/HomeScreen.dart';
import 'package:e_commerce/screens/constans.dart';
import 'package:e_commerce/screens/product_viewed_screen/product_viewed.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: kprimaryColor,
            ),
            child: Center(
              child: Text(
                'Welcome ,sir',
                style: TextStyle(color: kprimaryColor),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              color: kprimaryColor,
            ),
            title: const Text(
              'Home',
              
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
 ListTile(
            leading: const Icon(
              Icons.history,
              color: kprimaryColor,
            ),
            title: const Text(
              'History',
              
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const ViewedProductsScreen()));
            },
          ),


          ListTile(
            leading: const Icon(
              Icons.logout,
              color: kprimaryColor,
            ),
            title: const Text(
              'Logout',
            ),
            onTap: () async {
                GoogleSignIn googleSignIn = GoogleSignIn();
                googleSignIn.disconnect();
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Signin()));
              },
             
            
          ),
        ],
      ),
    );
  }
}