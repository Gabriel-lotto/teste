import 'package:flutter/material.dart';
import 'package:prova/app/shared/services/url_launch_service.dart';
import 'package:prova/app/shared/utils/responsiveness.dart';

class BodyWidget extends StatelessWidget {
  final bool isSplashScreen;
  final Widget? child;

  const BodyWidget({super.key, this.child, this.isSplashScreen = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(27, 77, 100, 1),
                    Color.fromRGBO(47, 146, 145, 1),
                    Color.fromRGBO(111, 176, 174, 1)
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    child ?? Container(),
                    Visibility(
                      visible: !isSplashScreen,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          height: 70.h,
                          child: GestureDetector(
                            onTap: () => UrlLauncherService.launchString("https://www.google.com.br/"),
                            child: const Text("Política de Privacidade"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
