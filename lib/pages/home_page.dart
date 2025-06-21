import 'package:flutter/material.dart';
import '../services/hotel_service.dart';
import '../models/hotel.dart';
import '../routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final svc = HotelService();
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Hotel')),
      body: FutureBuilder<List<Hotel>>(
        future: svc.fetchHotels(),
        builder: (ctx, snap) {
          if (!snap.hasData) return const Center(child: CircularProgressIndicator());
          final hotels = snap.data!;
          return ListView.builder(
            itemCount: hotels.length,
            itemBuilder: (ctx, i) {
              final h = hotels[i];
              return ListTile(
                leading: Image.network(h.imageUrls.first, width: 60, fit: BoxFit.cover),
                title: Text(h.name),
                subtitle: Text('${h.location} • ⭐ ${h.rating}'),
                trailing: Text('Rp${h.pricePerNight.toStringAsFixed(0)}'),
                onTap: () => Navigator.pushNamed(
                    context, Routes.hotelDetail, arguments: h.id),
              );
            },
          );
        },
      ),
    );
  }
}
