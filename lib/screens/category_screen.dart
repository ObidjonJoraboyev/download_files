import 'package:flutter/material.dart';
import 'package:dowload_files/data/models/file_data_model.dart';

import '../file_manager_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              CategoryFile.values.length,
              (index) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.grey),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FileManagerScreen(
                          categoryFile: CategoryFile.values[index],
                        ),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        CategoryFile.values[index].name.toUpperCase(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
