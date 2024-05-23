import 'package:flutter/material.dart';

class RoudButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final Color color, textColor;
  final bool loading;
  const RoudButton({
    super.key,
    required this.title,
    this.color = Colors.blue,
    this.textColor = Colors.grey,
    this.loading = false,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: loading ? null : onPress,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: 55,
          width: double.infinity,
          decoration: BoxDecoration(
            color: color,
          ),
          child: loading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
