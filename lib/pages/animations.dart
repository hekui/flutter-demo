import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'search.dart';

const String _loremIpsumParagraph =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod '
    'tempor incididunt ut labore et dolore magna aliqua. Vulputate dignissim '
    'suspendisse in est. Ut ornare lectus sit amet. Eget nunc lobortis mattis '
    'aliquam faucibus purus in. Hendrerit gravida rutrum quisque non tellus '
    'orci ac auctor. Mattis aliquam faucibus purus in massa. Tellus rutrum '
    'tellus pellentesque eu tincidunt tortor. Nunc eget lorem dolor sed. Nulla '
    'at volutpat diam ut venenatis tellus in metus. Tellus cras adipiscing enim '
    'eu turpis. Pretium fusce id velit ut tortor. Adipiscing enim eu turpis '
    'egestas pretium. Quis varius quam quisque id. Blandit aliquam etiam erat '
    'velit scelerisque. In nisl nisi scelerisque eu. Semper risus in hendrerit '
    'gravida rutrum quisque. Suspendisse in est ante in nibh mauris cursus '
    'mattis molestie. Adipiscing elit duis tristique sollicitudin nibh sit '
    'amet commodo nulla. Pretium viverra suspendisse potenti nullam ac tortor '
    'vitae.\n'
    '\n'
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod '
    'tempor incididunt ut labore et dolore magna aliqua. Vulputate dignissim '
    'suspendisse in est. Ut ornare lectus sit amet. Eget nunc lobortis mattis '
    'aliquam faucibus purus in. Hendrerit gravida rutrum quisque non tellus '
    'orci ac auctor. Mattis aliquam faucibus purus in massa. Tellus rutrum '
    'tellus pellentesque eu tincidunt tortor. Nunc eget lorem dolor sed. Nulla '
    'at volutpat diam ut venenatis tellus in metus. Tellus cras adipiscing enim '
    'eu turpis. Pretium fusce id velit ut tortor. Adipiscing enim eu turpis '
    'egestas pretium. Quis varius quam quisque id. Blandit aliquam etiam erat '
    'velit scelerisque. In nisl nisi scelerisque eu. Semper risus in hendrerit '
    'gravida rutrum quisque. Suspendisse in est ante in nibh mauris cursus '
    'mattis molestie. Adipiscing elit duis tristique sollicitudin nibh sit '
    'amet commodo nulla. Pretium viverra suspendisse potenti nullam ac tortor '
    'vitae';

const double _fabDimension = 56.0;

class AnimationsDemo extends StatefulWidget {
  @override
  _AnimationsDemoState createState() => _AnimationsDemoState();
}

class _AnimationsDemoState extends State<AnimationsDemo> {
  ContainerTransitionType _transitionType = ContainerTransitionType.fadeThrough;
  void _showMarkedAsDoneSnackbar(bool isMarkedAsDone) {
    if (isMarkedAsDone ?? false)
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Marked as done!'),
      ));
  }

  @override
  Widget build(BuildContext context) {
    double topbarHeight = MediaQueryData.fromWindow(window).padding.top;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xD93A5BAA), Color(0xD617B1E5)],
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: topbarHeight,
              ),
              Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios_outlined),
                      color: Colors.white,
                      tooltip:
                          MaterialLocalizations.of(context).backButtonTooltip,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Expanded(
                      // child: Hero(
                      //   tag: 'searchRow',
                      //   child: _SearchBar(),
                      // ),
                      child: Card(
                        child: OpenContainer<bool>(
                          transitionType: _transitionType,
                          openBuilder: (BuildContext context, VoidCallback _) {
                            return SearchPage();
                          },
                          // onClosed: onClosed,
                          tappable: false,
                          closedBuilder: (BuildContext context,
                              VoidCallback openContainer) {
                            return _SearchBar(openContainer: openContainer);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        color: Colors.teal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Text('模拟器上效果很差，请打包后在真机查看效果。'),
            ),
            _OpenContainerWrapper(
              transitionType: _transitionType,
              closedBuilder: (BuildContext _, VoidCallback openContainer) {
                return _ExampleCard(openContainer: openContainer);
              },
              onClosed: _showMarkedAsDoneSnackbar,
            ),
            Expanded(
              child: Container(
                child: Center(
                  child: Text(
                    'Content',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: OpenContainer(
        transitionType: _transitionType,
        // transitionDuration: Duration(seconds: 5),
        openBuilder: (BuildContext context, VoidCallback _) {
          return const _DetailsPage(
            includeMarkAsDoneButton: false,
            id: 888,
          );
        },
        closedElevation: 6.0,
        closedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(_fabDimension / 2),
          ),
        ),
        closedColor: Theme.of(context).colorScheme.secondary,
        closedBuilder: (BuildContext context, VoidCallback openContainer) {
          return SizedBox(
            height: _fabDimension,
            width: _fabDimension,
            child: Center(
              child: Icon(
                Icons.add,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({this.openContainer});
  final VoidCallback openContainer;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () {
      //   Navigator.pushNamed(context, '/search');
      // },
      onTap: openContainer,
      child: Container(
        height: 36,
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 10.0,
            ),
            Icon(
              Icons.search,
              color: Colors.grey,
            ),
            SizedBox(
              width: 6.0,
            ),
            Expanded(
              child: Text(
                'Search',
                style: TextStyle(
                  height: 1,
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _OpenContainerWrapper extends StatelessWidget {
  const _OpenContainerWrapper({
    this.closedBuilder,
    this.transitionType,
    this.onClosed,
  });

  final CloseContainerBuilder closedBuilder;
  final ContainerTransitionType transitionType;
  final ClosedCallback<bool> onClosed;

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionType: transitionType,
      // transitionDuration: Duration(seconds: 5),
      openBuilder: (BuildContext context, VoidCallback _) {
        return const _DetailsPage(
          id: 666,
        );
      },
      onClosed: onClosed,
      tappable: false,
      closedBuilder: closedBuilder,
    );
  }
}

class _ExampleCard extends StatelessWidget {
  const _ExampleCard({this.openContainer});

  final VoidCallback openContainer;

  @override
  Widget build(BuildContext context) {
    return _InkWellOverlay(
      openContainer: openContainer,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.black38,
              child: Center(
                child: Image.asset(
                  'assets/images/placeholder_image.png',
                  width: 100,
                ),
              ),
            ),
          ),
          const ListTile(
            title: Text('Title'),
            subtitle: Text('Secondary text'),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 16.0,
            ),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur '
              'adipiscing elit, sed do eiusmod tempor.',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}

class _InkWellOverlay extends StatelessWidget {
  const _InkWellOverlay({
    this.openContainer,
    this.width,
    this.height,
    this.child,
  });

  final VoidCallback openContainer;
  final double width;
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: InkWell(
        onTap: openContainer,
        child: child,
      ),
    );
  }
}

class _DetailsPage extends StatelessWidget {
  const _DetailsPage({this.includeMarkAsDoneButton = true, this.id});

  final bool includeMarkAsDoneButton;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details page'),
        actions: <Widget>[
          if (includeMarkAsDoneButton)
            IconButton(
              icon: const Icon(Icons.done),
              onPressed: () => Navigator.pop(context, true),
              tooltip: 'Mark as done',
            )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.black38,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(70.0),
              child: Image.asset(
                'assets/images/placeholder_image.png',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Title(id:$id)',
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.black54,
                        fontSize: 30.0,
                      ),
                ),
                const SizedBox(height: 10),
                Text(
                  _loremIpsumParagraph,
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                        color: Colors.black54,
                        height: 1.5,
                        fontSize: 16.0,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
