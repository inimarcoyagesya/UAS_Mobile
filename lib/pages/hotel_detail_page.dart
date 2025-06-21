import 'package:flutter/material.dart';
import '../services/hotel_service.dart';
import '../models/hotel.dart';
import '../routes.dart';

class HotelDetailPage extends StatelessWidget {
  const HotelDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final hotelId = ModalRoute.of(context)!.settings.arguments as String;
    return FutureBuilder<Hotel>(
      future: HotelService().fetchHotelById(hotelId),
      builder: (ctx, snap) {
        if (!snap.hasData) return const Scaffold(body: Center(child: CircularProgressIndicator()));
        final h = snap.data!;
        return Scaffold(
          appBar: AppBar(title: Text(h.name)),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 200,
                child: PageView(
                  children: h.imageUrls.map((url) => Image.network(url, fit: BoxFit.cover)).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(h.location),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text('Rp${h.pricePerNight.toStringAsFixed(0)} / malam'),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(
                      context, Routes.booking, arguments: h.id),
                  child: const Text('Pesan Sekarang'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
