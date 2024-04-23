import 'package:dowload_files/services/file_maneger_service.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  FileManagerService();

  runApp(const MyApp());
}
