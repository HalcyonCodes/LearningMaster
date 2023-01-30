import 'package:flutter/material.dart';
import 'package:learning_master/config/index.dart';

class StatusCard extends StatelessWidget {
  final String status;
  const StatusCard({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      height: 37,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          KShadow.shadow
        ],
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(status,
              style: KFont.loadStatusStyle,
              )
        ],
      ),
    );
  }
}
