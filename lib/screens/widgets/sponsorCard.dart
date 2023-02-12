import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class sponsorCard extends StatelessWidget {
  const sponsorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 4),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 20.0,
            ),
          ],
        ),
        child: Center(
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(50),
                    child: Text("picture"),
                  ),
                  Container(
                    margin: EdgeInsets.all(50),
                    child: Text("data"),
                  )
                ],
              )),
        ));
  }
}




// Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 const ListTile(
//                   leading: Icon(Icons.album),
//                   title: Text('The Enchanted Nightingale'),
//                   subtitle:
//                       Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: <Widget>[
//                     TextButton(
//                       child: const Text('BUY TICKETS'),
//                       onPressed: () {/* ... */},
//                     ),
//                     const SizedBox(width: 8),
//                     TextButton(
//                       child: const Text('LISTEN'),
//                       onPressed: () {/* ... */},
//                     ),
//                     const SizedBox(width: 8),
//                   ],
//                 ),
//               ],
//             ),