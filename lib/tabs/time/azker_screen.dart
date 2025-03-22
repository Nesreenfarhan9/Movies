import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islaami/model/azker_model.dart';

class AzkarScreen extends StatefulWidget {
  static const String routename = '/azkar';
  final String azkarType;

  const AzkarScreen({super.key, required this.azkarType});

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  late Future<List<AzkerModel>> azkarList;
  List<int> counts = [];
  List<int> progress = [];

  @override
  void initState() {
    super.initState();
    azkarList = AzkerModel.loadAzkarModel(widget.azkarType);
    azkarList.then((value) {
      setState(() {
        counts = List<int>.generate(
            value.length, (index) => int.tryParse(value[index].count) ?? 1);
        progress = List<int>.filled(value.length, 0);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          widget.azkarType == 'أذكار المساء'
              ? 'Evening Azkar'
              : 'Morning Azkar',
          style: const TextStyle(color: Colors.amber),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.amber),
      ),
      body: FutureBuilder<List<AzkerModel>>(
        future: azkarList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(color: Colors.amber));
          } else if (snapshot.hasError) {
            return const Center(
                child: Text('Error loading Azkar',
                    style: TextStyle(color: Colors.red)));
          }

          List<AzkerModel> azkar = snapshot.data ?? [];

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: azkar.length,
            itemBuilder: (context, index) {
              AzkerModel azkarItem = azkar[index];

              return Card(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(color: Colors.amber, width: 2),
                ),
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        azkarItem.content,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          if (progress[index] < counts[index]) {
                            setState(() {
                              progress[index]++;
                            });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 20),
                          decoration: BoxDecoration(
                            color: progress[index] >= counts[index]
                                ? Colors.green
                                : Colors.amber,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Text(
                            "${progress[index]}/${counts[index]}",
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
