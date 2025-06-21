import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/hotel.dart';

class HotelService {
  final _col = FirebaseFirestore.instance.collection('hotels');

  Future<List<Hotel>> fetchHotels() async {
    final snap = await _col.get();
    return snap.docs.map((d) => Hotel.fromMap(d.id, d.data())).toList();
  }

  Future<Hotel> fetchHotelById(String id) async {
    final doc = await _col.doc(id).get();
    return Hotel.fromMap(doc.id, doc.data()!);
  }

  Future<void> bookRoom({
    required String hotelId,
    required String userId,
    required DateTime checkIn,
    required DateTime checkOut,
  }) async {
    await FirebaseFirestore.instance.collection('bookings').add({
      'hotel_id': hotelId,
      'user_id': userId,
      'check_in': checkIn.toIso8601String(),
      'check_out': checkOut.toIso8601String(),
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
