import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RampCounter extends StatefulWidget {
  const RampCounter({super.key});

  @override
  State<RampCounter> createState() => _RampCounterState();
}

class _RampCounterState extends State<RampCounter> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('rampas').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.connectionState == ConnectionState.done &&
              !snapshot.hasData) {
            return const Center(
              child: Text('Nenhuma rampa cadastrada.'),
            );
          }

          return Positioned(
              bottom: 50,
              left: 50,
              child: Card(
                  elevation: 4,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Rampas",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 30),
                          ),
                          Text(snapshot.data!.docs.length.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 80)),
                        ],
                      ),
                    ),
                  )));
        });
    ;
  }
}
