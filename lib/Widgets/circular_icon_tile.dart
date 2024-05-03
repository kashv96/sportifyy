import 'package:flutter/material.dart';

class CircularIconTile extends StatefulWidget {
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
  _CircularIconTileState createState() => _CircularIconTileState();
}

class _CircularIconTileState extends State<CircularIconTile> {
  bool _isSelected = false; // Track selection state

  void _toggleSelection() {
    setState(() {
      _isSelected = !_isSelected; // Toggle the selection state
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _toggleSelection,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: _isSelected
                    ? Border.all(color: Colors.blueGrey, width: 5)
                    : null, // Conditional border
                image: widget.image != null
                    ? DecorationImage(image: widget.image!, fit: BoxFit.cover)
                    : null,
                color: widget.image == null
                    ? Colors.grey
                    : null, // Fallback color if no image
              ),
              child: widget.image == null
                  ? Icon(widget.icon, color: Colors.white)
                  : null,
            ),
            SizedBox(height: 15),
            Text(widget.title,
                style: TextStyle(fontSize: 10, color: Colors.black54)),
          ],
        ),
      ),
    );
  }
}
