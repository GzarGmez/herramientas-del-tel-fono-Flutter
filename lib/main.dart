import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/geolocator_screen.dart';
import 'screens/codigoqr_screen.dart';
import 'screens/flash_sensor_screen.dart';
import 'screens/text_spech.dart';
import 'screens/text_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Herramientas del teléfono',
      theme: ThemeData(
        primaryColor: Colors.cyan,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black, // Fondo oscuro
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black, // Fondo del AppBar
          foregroundColor: Colors.cyan, // Color del texto del AppBar
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black, // Fondo de la barra de navegación
          selectedItemColor: Colors.cyan, // Color del ítem seleccionado
          unselectedItemColor: Colors.white, // Color de los ítems no seleccionados
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Colors.black, // Fondo del drawer
        ),
textTheme: const TextTheme(
  bodyLarge: TextStyle(color: Colors.white, fontFamily: 'Roboto', fontWeight: FontWeight.w300),
  bodyMedium: TextStyle(color: Colors.white, fontFamily: 'Roboto', fontWeight: FontWeight.w300),
  titleLarge: TextStyle(color: Colors.cyan, fontFamily: 'Roboto', fontWeight: FontWeight.w500), // Cambiado de headline6 a titleLarge
),

        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.cyan, // Color de los botones
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))), // Botones redondeados
        ),
      ),
      initialRoute: '/home',
      routes: {
        '/': (context) => const MainScreen(),
        '/home': (context) => const HomeScreen(),
        '/geo_locator': (context) => const GeoLocatorScreen(),
        '/qrscanner': (context) => const QRScannerScreen(),
        '/flash_sensor': (context) => const SensorScreen(),
        '/text_speech': (context) => const TextToSpeechScreen(),
        '/text_to_text': (context) => const SpeechToTextScreen(),
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const GeoLocatorScreen(),
    const QRScannerScreen(),
    const SensorScreen(),
    const TextToSpeechScreen(),
    const SpeechToTextScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Herramientas del teléfono'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.cyan, // Color del encabezado del drawer
              ),
              child: Text(
                'Universidad Politécnica de Chiapas',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.cyan),
              title: const Text('HomeScreen',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 0;
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_on, color: Colors.cyan),
              title: const Text('Geolocator',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 1;
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.qr_code, color: Colors.cyan),
              title: const Text('QR Scanner',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushNamed(context, '/qrscanner');
              },
            ),
            ListTile(
              leading: const Icon(Icons.flash_on, color: Colors.cyan),
              title: const Text('Light Sensor',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushNamed(context, '/flash_sensor');
              },
            ),
            ListTile(
              leading: const Icon(Icons.speaker_notes, color: Colors.cyan),
              title: const Text('Text to Speech',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushNamed(context, '/text_speech');
              },
            ),
            ListTile(
              leading: const Icon(Icons.mic, color: Colors.cyan),
              title: const Text('Speech to Text',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushNamed(context, '/text_to_text');
              },
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'HomeScreen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Geolocator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'QR Scanner',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flash_on),
            label: 'Light Sensor',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.speaker_notes),
            label: 'Text to Speech',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mic),
            label: 'Speech to Text',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.cyan, // Color del ítem seleccionado
        unselectedItemColor: Colors.white, // Color de los ítems no seleccionados
        backgroundColor: Colors.black, // Fondo oscuro
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
        ),
        onTap: _onItemTapped,
      ),
    );
  }
}
