import 'dart:convert';
import 'package:flutter/material.dart';
import 'skill_card.dart';
import 'package:http/http.dart'as http;

class SkillsScreen extends StatefulWidget {
  const SkillsScreen({super.key});

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  final String jsonData = '''
  [
   
  {"name": "Dribbling", "level": "Basic", "image": "https://images.unsplash.com/photo-1605296867304-46d5465a13f1?w=400&h=300&fit=crop"},
  {"name": "Passing", "level": "Basic", "image": "https://images.unsplash.com/photo-1526406915894-6a7d83c3b74f?w=400&h=300&fit=crop"},
  {"name": "Shooting", "level": "Basic", "image": "https://images.unsplash.com/photo-1594737625785-c930b4e7f09f?w=400&h=300&fit=crop"},
  {"name": "Footwork", "level": "Basic", "image": "https://images.unsplash.com/photo-1601572607151-7a6f18e8a1a1?w=400&h=300&fit=crop"},
  {"name": "Positioning", "level": "Basic", "image": "https://images.unsplash.com/photo-1571019613914-85f342c394a2?w=400&h=300&fit=crop"},

  {"name": "Vault", "level": "Intermediate", "image": "https://images.unsplash.com/photo-1521412644187-c49fa049e84d?w=400&h=300&fit=crop"},
  {"name": "Defense", "level": "Intermediate", "image": "https://images.unsplash.com/photo-1521412644187-c49fa049e84d?w=400&h=300&fit=crop"},
  {"name": "Accuracy", "level": "Intermediate", "image": "https://images.unsplash.com/photo-1546519638-68e109498ffc?w=400&h=300&fit=crop"},
  {"name": "Ball Control", "level": "Intermediate", "image": "https://images.unsplash.com/photo-1599058917212-d750089bc07e?w=400&h=300&fit=crop"},
  {"name": "Coordination", "level": "Intermediate", "image": "https://images.unsplash.com/photo-1600508774582-2947dc4d43b7?w=400&h=300&fit=crop"},

  {"name": "Agility", "level": "Advanced", "image": "https://images.unsplash.com/photo-1556817411-31ae72fa3ea0?w=400&h=300&fit=crop"},
  {"name": "Teamwork", "level": "Advanced", "image": "https://images.unsplash.com/photo-1521412644187-c49fa049e84d?w=400&h=300&fit=crop"},
  {"name": "Speed", "level": "Advanced", "image": "https://images.unsplash.com/photo-1517649763962-0c623066013b?w=400&h=300&fit=crop"},
  {"name": "Endurance", "level": "Advanced", "image": "https://images.unsplash.com/photo-1594737625785-c930b4e7f09f?w=400&h=300&fit=crop"},
  {"name": "Leadership", "level": "Advanced", "image": "https://images.unsplash.com/photo-1517649763962-0c623066013b?w=400&h=300&fit=crop"}

    
    
  ]
  ''';

  late List<Map<String, dynamic>> skills;
  late List<Map<String, dynamic>> basicSkills;
  late List<Map<String, dynamic>> intermediateSkills;
  late List<Map<String, dynamic>> advancedSkills;

  @override
  void initState() {
    super.initState();
    skills = List<Map<String, dynamic>>.from(json.decode(jsonData));


    basicSkills = skills.where((s) => s['level'] == 'Basic').toList();
    intermediateSkills = skills.where((s) => s['level'] == 'Intermediate').toList();
    advancedSkills = skills.where((s) => s['level'] == 'Advanced').toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  const Text("Sports Skills",
        style: TextStyle(fontSize: 30,color: Colors.black,
            fontWeight: FontWeight.bold),)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSkillSection("Basic", basicSkills),
            buildSkillSection("Intermediate", intermediateSkills),
            buildSkillSection("Advanced", advancedSkills),
          ],
        ),
      ),
    );
  }

  Widget buildSkillSection(String title, List<Map<String, dynamic>> list) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(
            child: Text(
              title,
              style:  const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) {
              final skill = list[index];
              return Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(color: Colors.greenAccent.shade100,
                  width: MediaQuery.of(context).size.width*0.4,
                 // margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    clipBehavior: Clip.antiAlias,
                    elevation: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Image.network(skill['image'], fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) {
                            return  Image.network('https://images.unsplash.com/photo-1508609349937-5ec4ae374ebf?w=300&h=200&fit=crop', height: 100,  fit: BoxFit.fill);
                          },),
                        ),
                        const SizedBox(height: 20),
                        Center(child: Text(skill['name'], style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 20))),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}