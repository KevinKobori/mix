import 'package:flutter/material.dart';
import 'package:material_extension_example/theme/data.dart';
import 'package:mix/mix.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle headlineMedium = theme.textTheme.headlineMedium!;

    final MixThemeData mixTheme = MixTheme.of(context);

    final StyledTokens<BreakpointToken, Breakpoint> breakpoints = mixTheme.breakpoints;
    final Breakpoint breakpointExample = breakpoints[$token.breakpoint.small]!;

    final StyledTokens<ColorToken, Color> colors = mixTheme.colors;
    final Color colorExample = colors[$token.color.example]!;
    final Color colorExample2 = colors[$token.color.example2]!;
    final Color materialPrimary = colors[$material.colorScheme.primary]!;

    final StyledTokens<RadiusToken, Radius> radii = mixTheme.radii;
    final Radius radiusExample = radii[$token.radius.example]!;

    final StyledTokens<SpaceToken, double> spaces = mixTheme.spaces;
    final double spaceExample = spaces[$token.space.example]!;

    // final StyledTokens<GapToken, Gap> gaps = mixTheme.gaps;
    // final Gap gapExample = gaps[$token.space.example.gap]!;
    final Gap gapExample = spaces[$token.space.example]!.toGap();

    final StyledTokens<TextStyleToken, TextStyle> textStyles = mixTheme.textStyles;
    final TextStyle textStyleExample = textStyles[$token.textStyle.example]!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(spaceExample),
          decoration: BoxDecoration(
            color: colorExample,
            borderRadius: BorderRadius.all(radiusExample),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
                style: textStyleExample,
              ),
              SizedBox(height: spaceExample),
              Container(
                // color: colorExample2,
                color: materialPrimary,
                height: breakpointExample.minWidth,
              ),
              gapExample,
              SizedBox(height: spaceExample),
              Text(
                '$_counter',
                style: headlineMedium,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
