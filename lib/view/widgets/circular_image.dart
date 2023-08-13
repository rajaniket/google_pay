import 'package:flutter/material.dart';

class CircularImageWithBorder extends StatelessWidget {
  const CircularImageWithBorder({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 1.2,
        ),
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Image.network(
          imageUrl,
        ),
      ),
    );
  }
}
