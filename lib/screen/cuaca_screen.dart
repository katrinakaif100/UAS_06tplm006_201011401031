import 'package:cuaca/provider/cuaca_provider.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CuacaProvider cuacaProvider = CuacaProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather"),
      ),
      body: Consumer<CuacaProvider>(
        builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: provider.cityNameText,
                  decoration: const InputDecoration(
                    hintText: "Masukkan Nama Kota",
                    labelText: "Harlem",
                  ),
                ),
                TextButton(
                  onPressed: () {
                    provider.showWeatherData();
                  },
                  child: const Text("Harlem"),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    provider.cuacaModel.name ?? "Friday,July 7,2023",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(provider.cuacaModel.weather?.first.main ?? "Cloudy"),
                SizedBox(
                  width: 200,
                  height: 200,
                  child: Image.network(
                    "https://openweathermap.org/img/w/04n.png",
                    fit: BoxFit.contain,
                  ),
                ),
                const Text("25 C / 28 Celcius"),
              ],
            ),
          );
        },
      ),
    );
  }
}
