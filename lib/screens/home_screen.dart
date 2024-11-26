import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _launchGitHubUrl() async {
    const url = 'https://github.com/GzarGmez/herramientas-del-tel-fono-Flutter.git';
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  // Method to make a phone call
  Future<void> _makePhoneCall() async {
    const telUrl = 'tel:+52 963 171 8235';
    final Uri telUri = Uri.parse(telUrl);
    if (!await launchUrl(telUri, mode: LaunchMode.externalApplication)) {
      throw 'Could not initiate the call: $telUrl';
    }
  }

  // Method to send a text message
  Future<void> _sendMessage() async {
    const smsUrl = 'sms:+52 963 171 8235';
    final Uri smsUri = Uri.parse(smsUrl);
    if (!await launchUrl(smsUri, mode: LaunchMode.externalApplication)) {
      throw 'Could not send the message: $smsUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperación corte 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/Andres.jpg'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Universidad Politécnica de Chiapas',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Nombre: Andrés Guízar Gómez',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              'Matrícula: 213360',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              'Grado y Grupo: 9B',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _launchGitHubUrl,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan, // Change background color
                foregroundColor: Colors.white, // Change text color
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Adjust padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Rounded corners
                ),
              ),
              child: const Text('Visita mi GitHub'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _makePhoneCall,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Change background color
                foregroundColor: Colors.white, // Change text color
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Adjust padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Rounded corners
                ),
              ),
              child: const Text('Número telefónico'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _sendMessage,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent, // Change background color
                foregroundColor: Colors.white, // Change text color
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Adjust padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Rounded corners
                ),
              ),
              child: const Text('Enviar Mensaje'),
            ),
          ],
        ),
      ),
    );
  }
}
