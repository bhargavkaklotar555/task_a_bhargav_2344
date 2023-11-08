import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';

class Check_Network_Page extends StatelessWidget {
  Check_Network_Page({super.key});

  Connectivity connectivity = Connectivity();

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      body: StreamBuilder(
        stream: connectivity.onConnectivityChanged,
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            ConnectivityResult res = snapShot.data!;
            print(
                "=================================${res}===============================");
            switch (res) {
              case ConnectivityResult.mobile:
                return Center(
                  child: HomePage(),
                );
              case ConnectivityResult.wifi:
                return Center(
                  child: HomePage(),
                );
              case ConnectivityResult.vpn:
                return Center(
                  child: HomePage(),
                );
              case ConnectivityResult.other:
                return Center(
                  child: HomePage(),
                );
              case ConnectivityResult.ethernet:
                return Center(
                  child: HomePage(),
                );
              case ConnectivityResult.none:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 250,
                        width: 250,
                        child: Image.asset(
                          "assets/images/no_internet .gif",
                        ),
                      ),
                      SizedBox(
                        height: s.height * 0.03,
                      ),
                      const Text(
                        "NO INTERNET CONNECTION",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: s.height * 0.02,
                      ),
                      const Text("Check your internet connection"),
                      const Text("and try again"),
                    ],
                  ),
                );
              case ConnectivityResult.bluetooth:
                return Center(
                  child: HomePage(),
                );
              default:
                return const Center(
                  child: CircularProgressIndicator(),
                );
            }
          } else if (snapShot.hasError) {
            return Center(
              child: Text(
                snapShot.error.toString(),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
