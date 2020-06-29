import 'package:flutter/material.dart';

class SilverGridWidget extends StatelessWidget {
  const SilverGridWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverSafeArea(
        sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        color: Colors.amber,
                        height: 48.0,
                        width: 48.0,
                        image: AssetImage('assets/images/icons/rainy-3-2.png'),
                      ),
                      Divider(),
                      Text('Grid ${index + 1}'),
                    ],
                  ),
                );
              },
              childCount: 6,
            ),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3)));
  }
}


