import 'package:flutter/material.dart'; 
import 'package:flutter_application_1/core/common/di.dart';
import 'package:flutter_application_1/shared/widgets/one_app.dart'; 
  
// Головна функція, яка викликається при запуску додатка.
Future<void> main() async {
  await reinitApi(); // Очікуємо завершення ініціалізації API.
  runApp(OneApp()); // Запускаємо додаток, передаючи йому основний віджет.
}
