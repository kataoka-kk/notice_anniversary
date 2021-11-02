import 'package:flutter/material.dart';
import 'package:notice_anniversary/views/components/AnniversaryTile.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                AnniversaryTile(),
                // const ListTile(
                //   leading: Icon(Icons.album),
                //   title: Text('The Enchanted Nightingale'),
                //   subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: <Widget>[
                //     TextButton(
                //       child: const Text('BUY TICKETS'),
                //       onPressed: () {
                //         /* ... */
                //       },
                //     ),
                //     const SizedBox(width: 8),
                //     TextButton(
                //       child: const Text('LISTEN'),
                //       onPressed: () {
                //         /* ... */
                //       },
                //     ),
                //     const SizedBox(width: 8),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
