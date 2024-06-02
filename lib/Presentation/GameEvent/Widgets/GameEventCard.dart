import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../Widgets/toast_helper.dart';

class GameEventCard extends StatelessWidget {
  final String uniqueIdentifier;
  final String availableSpots;
  final String gameDateTime;
  final String gameDuration;
  final String imagePath;

  GameEventCard({
    required this.uniqueIdentifier,
    required this.availableSpots,
    required this.gameDateTime,
    required this.gameDuration,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6),
              BlendMode.darken,
            ),
          ),
        ),
        height: 250,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          uniqueIdentifier,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        IconButton(
                          icon: const Icon(
                            FontAwesomeIcons.copy,
                            color: Colors.white,
                            size: 12,
                          ),
                          onPressed: () {
                            Clipboard.setData(
                                ClipboardData(text: uniqueIdentifier));
                            ToastHelper.show(
                                'Game event name copied to clipboard',
                                textColor: Colors.blueAccent);
                          },
                        ),
                      ],
                    ),
                  ),
                  PopupMenuButton<String>(
                    color: const Color.fromARGB(99, 0, 0, 0),
                    clipBehavior: Clip.antiAlias,
                    position: PopupMenuPosition.under,
                    onSelected: (String result) {
                      switch (result) {
                        case 'Edit':
                          // Implement edit functionality
                          break;
                        case 'Delete':
                          // Implement delete functionality
                          break;
                        case 'Share':
                          // Implement share functionality
                          break;
                      }
                    },
                    itemBuilder: (BuildContext context) => [
                      const PopupMenuItem<String>(
                        value: 'Edit',
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.penToSquare,
                                  color: Colors.white,
                                  size: 10,
                                ),
                                SizedBox(width: 13),
                                Text(
                                  'Edit',
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Divider(color: Colors.grey),
                          ],
                        ),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Delete',
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.trash,
                                  color: Colors.white,
                                  size: 10,
                                ),
                                SizedBox(width: 13),
                                Text(
                                  'Delete',
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Divider(color: Colors.grey),
                          ],
                        ),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Share',
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.shareNodes,
                                  color: Colors.white,
                                  size: 10,
                                ),
                                SizedBox(width: 13),
                                Text(
                                  'Share',
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                          ],
                        ),
                      ),
                    ],
                    icon: const Icon(Icons.more_vert, color: Colors.white),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                'Spots:  $availableSpots',
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                'Time:  $gameDateTime',
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                'Duration:  $gameDuration',
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 10),
              const Divider(color: Colors.white70),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton.icon(
                    icon: const Icon(
                      FontAwesomeIcons.eye,
                      color: Colors.white,
                      size: 12,
                    ),
                    label: const Text('View',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                    onPressed: () {
                      // Implement your view tap functionality here
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 1,
                    color: Colors.white70,
                  ),
                  TextButton.icon(
                    icon: const Icon(
                      FontAwesomeIcons.userPlus,
                      color: Colors.white,
                      size: 12,
                    ),
                    label: const Text('Join',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                    onPressed: () {
                      // Implement your join tap functionality here
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
