import 'package:flutter/material.dart';

class ErrorLoading extends StatelessWidget {
  final Error error;

  ErrorLoading(this.error);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error.toString())
    );
  }
}