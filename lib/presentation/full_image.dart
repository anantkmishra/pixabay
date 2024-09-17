import 'package:flutter/material.dart';

class FullImagePage extends StatelessWidget {
  const FullImagePage({super.key, required this.img});

  final String img ;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(
          img,
        errorBuilder: (ctx, obj, _){
            return const Text('Something went wrong !!!');
        },
      ),
    );
  }
}
