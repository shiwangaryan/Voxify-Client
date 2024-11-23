import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voxify_client/services/bloc/auth_popup/auth_popup_bloc.dart';

class GestStartedButton extends StatefulWidget {
  const GestStartedButton({
    super.key,
  });

  @override
  State<GestStartedButton> createState() => _GestStartedButtonState();
}

class _GestStartedButtonState extends State<GestStartedButton> {
  bool buttonTapped = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          buttonTapped = true;
        });
        Future.delayed(const Duration(milliseconds: 170), () {
          setState(() {
            buttonTapped = false;
          });
        });
        Future.delayed(
          const Duration(milliseconds: 170),
          () {
            context.read<AuthPopupBloc>().add(AuthPopupChangedTo(1));
          },
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: 170,
        height: 50,
        decoration: BoxDecoration(
          color: buttonTapped
              ? Colors.teal.withOpacity(0.7)
              : Colors.teal.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              offset:
                  buttonTapped ? const Offset(0, 0) : const Offset(6.4, 6.4),
              color: const Color.fromARGB(255, 0, 88, 78),
              blurRadius: 1,
            )
          ],
        ),
        transform: buttonTapped
            ? Matrix4.translationValues(4.4, 4.4, 0)
            : Matrix4.translationValues(0, 0, 0),
        child: const Center(
          child: Text(
            'Get Started',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
