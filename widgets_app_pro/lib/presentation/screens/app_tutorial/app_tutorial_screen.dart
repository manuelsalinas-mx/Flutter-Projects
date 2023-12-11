import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
      'Busca la comida',
      'Ipsum reprehenderit duis ullamco Lorem cillum velit ea voluptate quis labore esse. Eu excepteur pariatur sint in consequat velit ullamco do. Sit dolore anim laboris non proident excepteur incididunt laboris non cillum pariatur quis commodo. Magna et consequat sint exercitation cupidatat dolor magna laborum amet incididunt aute proident et. Voluptate exercitation veniam nostrud commodo enim aliquip labore do adipisicing fugiat. Eiusmod esse pariatur amet officia. Tempor incididunt proident tempor do aute nulla.',
      'assets/images/1.png'),
  SlideInfo(
      'Entrega rápida',
      'Deserunt cillum in esse do pariatur consequat veniam cillum ullamco fugiat reprehenderit irure est aliqua. Magna nisi magna cillum sint. Dolor minim Lorem qui exercitation nostrud dolore est Lorem duis ea. Nulla do dolor deserunt aute nostrud do dolore non commodo elit. Amet sint ea cupidatat adipisicing. Duis deserunt eiusmod ea dolore proident.',
      'assets/images/2.png'),
  SlideInfo(
      'Disfruta la comida',
      'Ipsum Lorem velit ad dolore pariatur esse ea Lorem in quis tempor. Incididunt id veniam velit consequat dolore nisi aliquip excepteur consequat consequat. Cupidatat laborum reprehenderit eiusmod et. Magna ut eiusmod nostrud aliqua amet et est et veniam ut cupidatat commodo. Magna pariatur id officia nulla nostrud. Pariatur aliqua esse adipisicing eiusmod quis proident tempor amet.',
      'assets/images/3.png')
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';
  const AppTutorialScreen({super.key});

// Se ha convertido a un StatefulWidget porque vamos a usar un controller para saber en que pagina estamos
  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageController = PageController();
  bool lastPage = false;

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      final page = pageController.page ?? 0;

      if (lastPage && page <= (slides.length - 1.5)) {
        setState(() {
          lastPage = false;
        });
      }

      if (!lastPage && page >= (slides.length - 1.5)) {
        setState(() {
          lastPage = true;
        });
      }
      // print('${pageController.page}');
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
              controller: pageController,
              physics: const BouncingScrollPhysics(),
              children: slides
                  .map((info) => _SlideView(
                      title: info.title,
                      caption: info.caption,
                      imageUrl: info.imageUrl))
                  .toList()),
          Positioned(
              right: 20,
              top: 30,
              child: TextButton(
                child: const Text('Salir',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onPressed: () {
                  context.pop();
                },
              )),
          lastPage
              ? Positioned(
                  bottom: 15,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(milliseconds: 500),
                    child: FilledButton(
                        onPressed: () {}, child: const Text('Comenzar')),
                  ))
              : const SizedBox()
        ],
      ),
    );
  }
}

class _SlideView extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _SlideView(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodyMedium;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageUrl),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 10),
            Text(caption, style: captionStyle)
          ],
        ),
      ),
    );
  }
}
