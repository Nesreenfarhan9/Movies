import 'package:flutter/material.dart';
import 'package:islaami/app_theme.dart';
import 'package:islaami/provider/radio_manager_provider.dart';
import 'package:provider/provider.dart';

class RadioItem extends StatefulWidget {
  String name;
  String url;
  RadioItem({required this.name, required this.url});

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  bool isVolumeup = true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Consumer<RadioManagerProvider>(
      builder: (context, RadioManagerProvider provider, child) {
        return Container(
          height: height * 0.15,
          margin: EdgeInsets.symmetric(vertical: 8),
          padding: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: AppTheme.primary,
            borderRadius: BorderRadius.circular(12),
            image: !provider.isPlaying
                ? DecorationImage(
                    image: AssetImage('assets/images/Mosque-02 2.png'),
                    fit: BoxFit.fill)
                : DecorationImage(
                    image: AssetImage('assets/images/soundWave.png'),
                    fit: BoxFit.fill),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.name,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: AppTheme.black),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        provider.play(widget.url);
                      },
                      icon: (provider.currentPlayingUrl == widget.url &&
                              provider.isPlaying)
                          ? Icon(
                              Icons.pause,
                              color: AppTheme.black,
                              size: 35,
                            )
                          : Icon(
                              Icons.play_arrow,
                              color: AppTheme.black,
                              size: 35,
                            )),
                  IconButton(
                      onPressed: () {
                        if (provider.currentPlayingUrl == widget.url) {
                          provider.stop();
                        }
                      },
                      icon: Icon(
                        Icons.stop,
                        color: AppTheme.black,
                        size: 35,
                      )),
                  IconButton(
                      onPressed: () {
                        provider.setVolume(isVolumeup ? 2.0 : 0.0);
                        isVolumeup = !isVolumeup;
                        setState(() {});
                      },
                      icon: isVolumeup
                          ? Icon(
                              Icons.volume_up,
                              color: AppTheme.black,
                              size: 35,
                            )
                          : Icon(
                              Icons.volume_off,
                              color: AppTheme.black,
                              size: 35,
                            ))
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
