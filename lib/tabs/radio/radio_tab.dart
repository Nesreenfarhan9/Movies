import 'package:flutter/material.dart';
import 'package:islaami/api/api_manager.dart';
import 'package:islaami/app_theme.dart';
import 'package:islaami/model/radio_response_model.dart';
import 'package:islaami/model/reciters_response_model.dart';
import 'package:islaami/tabs/radio/radio_item.dart';

class RadioTab extends StatefulWidget {
  RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xb3202020)),
                child: TabBar(
                    labelStyle: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: AppTheme.black),
                    dividerHeight: 0,
                    indicatorSize: TabBarIndicatorSize.tab,
                    unselectedLabelStyle:
                        Theme.of(context).textTheme.titleLarge,
                    indicator: BoxDecoration(
                        color: AppTheme.primary,
                        borderRadius: BorderRadius.circular(12)),
                    tabs: [
                      Tab(
                        text: ('Radio'),
                      ),
                      Tab(
                        text: ('Reciters'),
                      ),
                    ]),
              ),
              Expanded(
                  child: TabBarView(children: [
                FutureBuilder<RadioResponseModel>(
                    future: ApiManager.getRadioData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Something went wrong!"),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {}); // تحديث الـ FutureBuilder
                              },
                              child: const Text("Try Again"),
                            ),
                          ],
                        );
                      }

                      if (!snapshot.hasData || snapshot.data!.radios == null) {
                        return Center(child: Text("No data available"));
                      }

                      RadioResponseModel data = snapshot.data!;
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return RadioItem(
                            name: data.radios![index].name ?? '',
                            url: data.radios![index].url ?? '',
                          );
                        },
                        itemCount: data.radios!.length,
                      );
                    }),
                FutureBuilder<RecitersResponseModel>(
                    future: ApiManager.getreciterData(),
                    builder: (context, snapshots) {
                      if (snapshots.connectionState ==
                          ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: AppTheme.primary,
                          ),
                        );
                      } else if (snapshots.hasError) {
                        return Center(
                          child: Column(
                            children: [
                              Text('Something went wrong'),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {}); // تحديث الـ FutureBuilder
                                  },
                                  child: Text('Try Again'))
                            ],
                          ),
                        );
                      }

                      if (!snapshots.hasData ||
                          snapshots.data!.reciters == null) {
                        return Center(child: Text("No data available"));
                      }

                      RecitersResponseModel data = snapshots.data!;
                      return ListView.builder(
                          itemBuilder: (context, index) {
                            return RadioItem(
                                name: data.reciters![index].name ?? '',
                                url:
                                    "${data.reciters![index].moshaf![0].server}122.mp3");
                          },
                          itemCount: data.reciters!.length);
                    })
              ]))
            ],
          ),
        ));
  }
}
