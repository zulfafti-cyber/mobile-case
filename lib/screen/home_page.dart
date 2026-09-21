import 'package:flutter/material.dart';

import '../user_model.dart';
import 'profile.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Beranda'), centerTitle: true),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0x9940E0D0), width: 1),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: const Color(0xFF40E0D0),
                  foregroundColor: Colors.white,
                  child: Icon(user.icon),
                ),
                title: Text(user.name),
                subtitle: const Text('Ketuk untuk lihat profil'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileDetailPage(user: user),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}