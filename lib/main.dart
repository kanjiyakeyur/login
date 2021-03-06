import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/helpers/iconprovider.dart';
import 'package:login/helpers/imageprovider.dart';
import 'package:login/helpers/roomimageprovider.dart';
import 'package:login/helpers/tabiconprovider.dart';
import 'package:login/screens/addproject.dart';
import 'package:login/widgets/datepick.dart';
import 'package:login/screens/detailsscreen.dart';
import 'package:login/screens/loginscreen.dart';
import 'package:login/screens/ownprofile.dart';
import 'package:login/screens/pickroom.dart';
import 'package:login/screens/projectDetails.dart';
import 'package:login/screens/roomdetails.dart';
import 'package:login/screens/searchmember.dart';
import 'package:login/screens/whatscreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: IconProvider()),
        ChangeNotifierProvider.value(value: ImagesProvider()),
        ChangeNotifierProvider.value(value: TabIconProvider()),
        ChangeNotifierProvider.value(value: RoomImageProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            canvasColor: Colors.transparent),
        home: LoginScreen(),
        routes: {
          '/date': (context) => DatePick(),
          '/details': (context) => DetailsScreen(),
          '/what': (context) => WhatScreen(),
          '/pickroom': (context) => PickRoom(),
          '/room-details': (context) => RoomDetails(),
          '/add-project': (context) => AddProject(),
          '/project-details': (context) => ProjectDetails(),
          '/search-member': (context) => SearchMember(),
          '/own-profile': (context) => OwnProfile(),
        },
      ),
    );
  }
}
