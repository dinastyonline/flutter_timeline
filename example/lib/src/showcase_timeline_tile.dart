import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';

import 'showcase_timeline.dart';

class ShowcaseTimelineTile extends StatelessWidget {
  const ShowcaseTimelineTile({super.key});

  @override
  Widget build(BuildContext context) => Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF004E92),
            Color(0xFF000428),
          ],
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 16),
                const Text(
                  'TimelineTile Showcase',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: examples.length,
                    itemBuilder: (context, index) {
                      final example = examples[index];

                      return TimelineTile(
                        alignment: TimelineAlign.manual,
                        lineXY: 0.1,
                        isFirst: index == 0,
                        isLast: index == examples.length - 1,
                        indicatorStyle: IndicatorStyle(
                          width: 40,
                          height: 40,
                          indicator: _IndicatorExample(number: '${index + 1}'),
                          drawGap: true,
                        ),
                        beforeLineStyle: LineStyle(
                          color: Colors.white.withOpacity(0.2),
                        ),
                        endChild: GestureDetector(
                          child: _RowExample(example: example),
                          onTap: () {
                            unawaited(Navigator.push(
                              context,
                              MaterialPageRoute<ShowcaseTimeline>(
                                builder: (_) =>
                                    ShowcaseTimeline(example: example),
                              ),
                            ),);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
}

class _IndicatorExample extends StatelessWidget {
  const _IndicatorExample({required this.number});

  final String number;

  @override
  Widget build(BuildContext context) => Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.fromBorderSide(
          BorderSide(
            color: Colors.white.withOpacity(0.2),
            width: 4,
          ),
        ),
      ),
      child: Center(
        child: Text(
          number,
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
}

class _RowExample extends StatelessWidget {
  const _RowExample({required this.example});

  final Example example;

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              example.name,
              style: GoogleFonts.jura(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          const Icon(
            Icons.navigate_next,
            color: Colors.white,
            size: 26,
          ),
        ],
      ),
    );
}
