import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class LocalizacionScreen extends StatefulWidget {
  const LocalizacionScreen({super.key});

  @override
  State<LocalizacionScreen> createState() => LocalizacionScreenState();
}

class LocalizacionScreenState extends State<LocalizacionScreen> {
  String ubicacionActual = 'Ubicación no disponible';

  Future<void> obtenerGps() async {
    try {
      // Verificar si el servicio de ubicación está habilitado
      bool bGpsHabilitado = await Geolocator.isLocationServiceEnabled();
      if (!bGpsHabilitado) {
        setState(() {
          ubicacionActual = 'Por favor habilite el servicio de ubicación.';
        });
        return;
      }

      // Verificar y solicitar permisos de ubicación
      LocationPermission bGpsPermiso = await Geolocator.checkPermission();
      if (bGpsPermiso == LocationPermission.denied) {
        bGpsPermiso = await Geolocator.requestPermission();
        if (bGpsPermiso == LocationPermission.denied) {
          setState(() {
            ubicacionActual = 'Permiso denegado.';
          });
          return;
        }
      }
      if (bGpsPermiso == LocationPermission.deniedForever) {
        setState(() {
          ubicacionActual = 'Permiso denegado permanentemente.';
        });
        return;
      }

      // Obtener la posición GPS actual
      Position posicion = await Geolocator.getCurrentPosition();
      setState(() {
        ubicacionActual = 'Latitud: ${posicion.latitude}, Longitud: ${posicion.longitude}';
      });
    } catch (e) {
      setState(() {
        ubicacionActual = 'Error al obtener la ubicación: $e';
      });
    }
  }

  Future<void> abrirUrl(final String sUrl) async {
    final Uri oUri = Uri.parse(sUrl);
    try {
      await launchUrl(
        oUri, // Ej: http://www.google.com/maps/place/6.2502089,-75.5706711
        mode: LaunchMode.externalApplication,
      );
    } catch (oError) {
      setState(() {
        ubicacionActual = 'No fue posible abrir la url: $sUrl.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Localización'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              ubicacionActual,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: obtenerGps,
             child: const Text('Ver ubicación')
             ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => abrirUrl('http://www.google.com/maps/place/6.2502089,-75.5706711'),
              child: const Text('abrir url')
            )
          ],
        ),
        ),
    );
  }
}
      
         