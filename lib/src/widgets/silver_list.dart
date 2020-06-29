import 'package:flutter/material.dart';

class SilverListWidget extends StatelessWidget {
  const SilverListWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SliverList(
      delegate: SliverChildListDelegate(List.generate(3, (int index) {
        return ListTile(
          leading: Image(image: AssetImage('assets/images/icons/thunder-2.png')),
          title: Text(
            '81° Clear ${index + 1}',
            style: TextStyle(color: Colors.black87),
          ),
          subtitle: Text(
            '4500 San Alpho Drive, Dallas, Tx United States ${index + 1}',
            style: TextStyle(color: Colors.grey),
          ),
        );
      })),
    );
  }
}
