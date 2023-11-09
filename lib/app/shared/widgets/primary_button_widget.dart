import 'package:flutter/material.dart';
import 'package:prova/app/shared/utils/responsiveness.dart';

const _defaultDuration = Duration(milliseconds: 100);

class PrimaryButtonWidget extends StatelessWidget {
  const PrimaryButtonWidget({
    super.key,
    required this.label,
    this.enabled = true,
    this.onTap,
    this.loading = false,
    this.buttonColor = Colors.green,
  });

  final bool enabled;
  final VoidCallback? onTap;
  final bool loading;
  final String label;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: enabled ? buttonColor : Colors.grey,
          ),
          child: InkWell(
            onTap: enabled && !loading ? onTap : null,
            borderRadius: BorderRadius.circular(20),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 32,
                maxHeight: 48,
              ),
              child: AnimatedContainer(
                duration: _defaultDuration,
                height: 48.h,
                width: 150.w,
                alignment: Alignment.center,
                child: loading
                    ? SizedBox(
                        height: 30.h,
                        width: 30.h,
                        child: const CircularProgressIndicator(
                          strokeWidth: 3,
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        label,
                        style: enabled
                            ? const TextStyle(fontSize: 16)
                            : TextStyle(
                                fontSize: 16,
                                color: Colors.white.withOpacity(.6),
                              ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
