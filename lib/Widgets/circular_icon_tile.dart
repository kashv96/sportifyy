import 'package:flutter/material.dart';

class CircularIconTile extends StatelessWidget {
  final String title;
  final ImageProvider? image;
  final IconData? icon;
  final double size;

  const CircularIconTile({
    Key? key,
    required this.title,
    this.image,
    this.icon,
    this.size = 75.0, // Default size of the circle
  })  : assert(image != null || icon != null,
            'An image or an icon must be provided.'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: image != null
                  ? DecorationImage(image: image!, fit: BoxFit.cover)
                  : null,
              color: image == null
                  ? Colors.grey
                  : null, // Fallback color if no image
            ),
            child: image == null ? Icon(icon, color: Colors.white) : null,
          ),
          SizedBox(height: 15),
          Text(title, style: TextStyle(fontSize: 10, color: Colors.black54)),
        ],
      ),
    );
  }
}
