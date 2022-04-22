import 'package:aorl_apps_bloc/dio/screens/dio_screen.dart';
import 'package:flutter/material.dart';

import 'components/nav_button.dart';
import 'counter/screens/counter_page.dart';
import 'package:dio/dio.dart';

import 'map/screens/map_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aorl Apps with BLoC'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const NavButton(
                label: 'Go To Counter',
                destination: CounterPage(),
              ),
              const NavButton(
                label: 'Go To Google Map',
                destination: MapPage(),
              ),
              const NavButton(
                label: 'Go To DIO Demo',
                destination: DioScreen(),
              ),
              ElevatedButton(
                onPressed: () {
                  // getHttp();
                  print('It Works');
                },
                child: const Text('Test DIO'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void getHttp() async {
    try {
      var response = await Dio().get('http://www.google.com');
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
