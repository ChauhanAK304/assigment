import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SkillCard extends StatelessWidget {
  final String name;
  final String imageUrl;

  const SkillCard({super.key, required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50),
      child: Container(color: Colors.greenAccent.shade100,
        width: 120,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(imageUrl, height: 100, width: 100,
                fit: BoxFit.cover,  errorBuilder: (context, error, stackTrace) {
                return  Image.network('https://images.unsplash.com/photo-1508609349937-5ec4ae374ebf?w=300&h=200&fit=crop', height: 100, width: 80, fit: BoxFit.cover);
              },),
              const SizedBox(height: 8),
              Text(name, style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}