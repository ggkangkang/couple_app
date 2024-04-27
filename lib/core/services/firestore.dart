import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  final CollectionReference events =
      FirebaseFirestore.instance.collection('events');

  //add
  Future<void> addEvent(String title) {
    return events.add({
      'title': title,
      'timeStamp': Timestamp.now(),
    });
  }

  //read
  Stream<QuerySnapshot> getEventsStream() {
    final eventsStream =
        events.orderBy('timestamp', descending: true).snapshots();
    return eventsStream;
  }

  //update
  Future<void> updateEvent(String docId, String newTitle) {
    return events
        .doc(docId)
        .update({'title': newTitle, 'timestamp': Timestamp.now()});
  }

  //delete
  Future<void> deleteEvent(String docId) {
    return events.doc(docId).delete();
  }
}
