import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../services/hotel_service.dart';
import '../services/auth_service.dart';
import '../routes.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  DateTime? _checkIn, _checkOut;

  @override
  Widget build(BuildContext context) {
    final hotelId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Pesanan')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              title: const Text('Check‑In'),
              subtitle: Text(_checkIn == null ? 'Pilih tanggal' : DateFormat.yMMMd().format(_checkIn!)),
              onTap: () async {
                final d = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );
                if (d != null) setState(() => _checkIn = d);
              },
            ),
            ListTile(
              title: const Text('Check‑Out'),
              subtitle: Text(_checkOut == null ? 'Pilih tanggal' : DateFormat.yMMMd().format(_checkOut!)),
              onTap: () async {
                final d = await showDatePicker(
                  context: context,
                  initialDate: _checkIn ?? DateTime.now(),
                  firstDate: _checkIn ?? DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );
                if (d != null) setState(() => _checkOut = d);
              },
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: (_checkIn != null && _checkOut != null)
                  ? () async {
                await HotelService().bookRoom(
                  hotelId: hotelId,
                  userId: AuthService.currentUser!.uid,
                  checkIn: _checkIn!,
                  checkOut: _checkOut!,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Booking berhasil!')),
                );
                Navigator.popUntil(context, ModalRoute.withName(Routes.home));
              }
                  : null,
              child: const Text('Konfirmasi Booking'),
            ),
          ],
        ),
      ),
    );
  }
}
