import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FxRatingBar extends StatefulWidget {
  final int length;
  final double spacing;
  final IconData filledIcon;
  final IconData halfFilledIcon;
  final IconData defaultIcon;
  final bool allowHalfRating;
  final bool enable;
  final double rating;
  final Color? color;
  final Color? borderColor;
  final double size;
  final void Function(double rating)? onRated;

  const FxRatingBar({
    Key? key,
    required this.length,
    required this.defaultIcon,
    required this.filledIcon,
    required this.halfFilledIcon,
    required this.onRated,
    this.allowHalfRating = true,
    this.spacing = 4.0,
    this.enable = true,
    this.rating = 0.0,
    this.color,
    this.borderColor,
    this.size = 24,
  }) : super(key: key);

  @override
  State<FxRatingBar> createState() => _FxRatingBarState();
}

class _FxRatingBarState extends State<FxRatingBar> {
  static const double halfStarThreshold = 0.53;
  bool isWidgetTapped = false;
  double? currentRating;
  Timer? debounceTimer;
  Color? color;

  @override
  void initState() {
    currentRating = widget.rating;
    super.initState();
    if (!widget.enable) {
      color = const Color(0xff707070);
    }
  }

  @override
  void dispose() {
    debounceTimer?.cancel();
    debounceTimer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: widget.spacing,
        children: List.generate(
          widget.length,
          (index) => buildStar(context, index),
        ),
      ),
    );
  }

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= currentRating!) {
      icon = Icon(
        widget.defaultIcon,
        color: color ??
            widget.borderColor ??
            Theme.of(context).colorScheme.primary,
        size: widget.size,
      );
    } else if (index >
            currentRating! -
                (widget.allowHalfRating ? halfStarThreshold : 1.0) &&
        index < currentRating!) {
      icon = Icon(
        widget.halfFilledIcon,
        color: widget.color ?? Theme.of(context).colorScheme.primary,
        size: widget.size,
      );
    } else {
      icon = Icon(
        widget.filledIcon,
        color: widget.color ?? Theme.of(context).colorScheme.primary,
        size: widget.size,
      );
    }
    final Widget star = widget.enable
        ? kIsWeb
            ? MouseRegion(
                onExit: (event) {
                  if (widget.onRated != null && !isWidgetTapped) {
                    //reset to zero only if rating is not set by user
                    setState(() {
                      currentRating = 0;
                    });
                  }
                },
                onEnter: (event) {
                  isWidgetTapped = false; //reset
                },
                onHover: (event) {
                  RenderBox? box = context.findRenderObject() as RenderBox?;
                  var pos = box!.globalToLocal(event.position);
                  var i = pos.dx / (widget.size + widget.spacing);
                  var newRating =
                      widget.allowHalfRating ? i : i.round().toDouble();
                  if (newRating > widget.length) {
                    newRating = widget.length.toDouble();
                  }
                  if (newRating < 0) {
                    newRating = 0.0;
                  }
                  setState(() {
                    currentRating = newRating;
                  });
                },
                child: GestureDetector(
                  onTapDown: (detail) {
                    isWidgetTapped = true;
                    RenderBox? box = context.findRenderObject() as RenderBox?;
                    var pos = box!.globalToLocal(detail.globalPosition);
                    var i = ((pos.dx - widget.spacing) / widget.size);
                    var newRating =
                        widget.allowHalfRating ? i : i.round().toDouble();
                    if (newRating > widget.length) {
                      newRating = widget.length.toDouble();
                    }
                    if (newRating < 0) {
                      newRating = 0.0;
                    }
                    setState(() {
                      currentRating = newRating;
                    });
                    if (widget.onRated != null) {
                      widget.onRated!(normalizeRating(currentRating!));
                    }
                  },
                  onHorizontalDragUpdate: (dragDetails) {
                    isWidgetTapped = true;
                    RenderBox? box = context.findRenderObject() as RenderBox?;
                    var pos = box!.globalToLocal(dragDetails.globalPosition);
                    var i = pos.dx / widget.size;
                    var newRating =
                        widget.allowHalfRating ? i : i.round().toDouble();
                    if (newRating > widget.length) {
                      newRating = widget.length.toDouble();
                    }
                    if (newRating < 0) {
                      newRating = 0.0;
                    }
                    setState(() {
                      currentRating = newRating;
                    });
                    debounceTimer?.cancel();
                    debounceTimer =
                        Timer(const Duration(milliseconds: 100), () {
                      currentRating = normalizeRating(newRating);
                      widget.onRated!(currentRating!);
                    });
                  },
                  child: icon,
                ),
              )
            : GestureDetector(
                onTapDown: (detail) {
                  RenderBox? box = context.findRenderObject() as RenderBox?;
                  var pos = box!.globalToLocal(detail.globalPosition);
                  var i = ((pos.dx - widget.spacing) / widget.size);
                  var newRating =
                      widget.allowHalfRating ? i : i.round().toDouble();
                  if (newRating > widget.length) {
                    newRating = widget.length.toDouble();
                  }
                  if (newRating < 0) {
                    newRating = 0.0;
                  }
                  newRating = normalizeRating(newRating);
                  setState(() {
                    currentRating = newRating;
                  });
                },
                onTapUp: (e) {
                  if (widget.onRated != null) widget.onRated!(currentRating!);
                },
                onHorizontalDragUpdate: (dragDetails) {
                  RenderBox? box = context.findRenderObject() as RenderBox?;
                  var pos = box!.globalToLocal(dragDetails.globalPosition);
                  var i = pos.dx / widget.size;
                  var newRating =
                      widget.allowHalfRating ? i : i.round().toDouble();
                  if (newRating > widget.length) {
                    newRating = widget.length.toDouble();
                  }
                  if (newRating < 0) {
                    newRating = 0.0;
                  }
                  setState(() {
                    currentRating = newRating;
                  });
                  debounceTimer?.cancel();
                  debounceTimer = Timer(const Duration(milliseconds: 100), () {
                    currentRating = normalizeRating(newRating);
                    widget.onRated!(currentRating!);
                  });
                },
                child: icon,
              )
        : icon;

    return star;
  }

  double normalizeRating(double newRating) {
    var k = newRating - newRating.floor();
    if (k != 0) {
      //half stars
      if (k >= halfStarThreshold) {
        newRating = newRating.floor() + 1.0;
      } else {
        newRating = newRating.floor() + 0.5;
      }
    }
    return newRating;
  }
}

// typedef RatingChangeCallback = void Function(double rating);

// class RatingBar extends StatefulWidget {
//   final int length;
//   final double rating;
//   final RatingChangeCallback onRated;
//   final Color? color;
//   final Color? borderColor;
//   final double size;
//   final bool allowHalfRating;
//   final IconData filledIconData;
//   final IconData halfFilledIconData;
//   final IconData defaultIconData;
//   final double spacing;
//   final bool isReadOnly;

//   const RatingBar({
//     Key? key,
//     required this.length,
//     this.isReadOnly = false,
//     this.spacing = 0.0,
//     this.rating = 0.0,
//     required this.onRated,
//     this.color,
//     this.borderColor,
//     this.size = 25,
//     required this.defaultIconData,
//     required this.filledIconData,
//     required this.halfFilledIconData,
//     this.allowHalfRating = true,
//   }) : super(key: key);

//   @override
//   _RatingBarState createState() => _RatingBarState();
// }

// class _RatingBarState extends State<RatingBar> {
//   static const double halfStarThreshold = 0.53;
//   bool isWidgetTapped = false;
//   double? currentRating;
//   Timer? debounceTimer;

//   @override
//   void initState() {
//     currentRating = widget.rating;
//     super.initState();
//   }

//   @override
//   void dispose() {
//     debounceTimer?.cancel();
//     debounceTimer = null;
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.transparent,
//       child: Wrap(
//         alignment: WrapAlignment.start,
//         spacing: widget.spacing,
//         children: List.generate(
//           widget.length,
//           (index) => buildStar(context, index),
//         ),
//       ),
//     );
//   }

//   Widget buildStar(BuildContext context, int index) {
//     Icon icon;
//     if (index >= currentRating!) {
//       icon = Icon(
//         widget.defaultIconData,
//         color: widget.borderColor ?? Theme.of(context).primaryColor,
//         size: widget.size,
//       );
//     } else if (index >
//             currentRating! -
//                 (widget.allowHalfRating ? halfStarThreshold : 1.0) &&
//         index < currentRating!) {
//       icon = Icon(
//         widget.halfFilledIconData,
//         color: widget.color ?? Theme.of(context).primaryColor,
//         size: widget.size,
//       );
//     } else {
//       icon = Icon(
//         widget.filledIconData,
//         color: widget.color ?? Theme.of(context).primaryColor,
//         size: widget.size,
//       );
//     }
//     final Widget star = widget.isReadOnly
//         ? icon
//         : kIsWeb
//             ? MouseRegion(
//                 onExit: (event) {
//                   if (widget.onRated != null && !isWidgetTapped) {
//                     //reset to zero only if rating is not set by user
//                     setState(() {
//                       currentRating = 0;
//                     });
//                   }
//                 },
//                 onEnter: (event) {
//                   isWidgetTapped = false; //reset
//                 },
//                 onHover: (event) {
//                   RenderBox? box = context.findRenderObject() as RenderBox?;
//                   var pos = box!.globalToLocal(event.position);
//                   var i = pos.dx / widget.size;
//                   var newRating =
//                       widget.allowHalfRating ? i : i.round().toDouble();
//                   if (newRating > widget.length) {
//                     newRating = widget.length.toDouble();
//                   }
//                   if (newRating < 0) {
//                     newRating = 0.0;
//                   }
//                   setState(() {
//                     currentRating = newRating;
//                   });
//                 },
//                 child: GestureDetector(
//                   onTapDown: (detail) {
//                     isWidgetTapped = true;
//                     RenderBox? box = context.findRenderObject() as RenderBox?;
//                     var pos = box!.globalToLocal(detail.globalPosition);
//                     var i = ((pos.dx - widget.spacing) / widget.size);
//                     var newRating =
//                         widget.allowHalfRating ? i : i.round().toDouble();
//                     if (newRating > widget.length) {
//                       newRating = widget.length.toDouble();
//                     }
//                     if (newRating < 0) {
//                       newRating = 0.0;
//                     }
//                     setState(() {
//                       currentRating = newRating;
//                     });
//                     if (widget.onRated != null) {
//                       widget.onRated(normalizeRating(currentRating!));
//                     }
//                   },
//                   onHorizontalDragUpdate: (dragDetails) {
//                     isWidgetTapped = true;
//                     RenderBox? box = context.findRenderObject() as RenderBox?;
//                     var pos = box!.globalToLocal(dragDetails.globalPosition);
//                     var i = pos.dx / widget.size;
//                     var newRating =
//                         widget.allowHalfRating ? i : i.round().toDouble();
//                     if (newRating > widget.length) {
//                       newRating = widget.length.toDouble();
//                     }
//                     if (newRating < 0) {
//                       newRating = 0.0;
//                     }
//                     setState(() {
//                       currentRating = newRating;
//                     });
//                     debounceTimer?.cancel();
//                     debounceTimer =
//                         Timer(const Duration(milliseconds: 100), () {
//                       currentRating = normalizeRating(newRating);
//                       widget.onRated(currentRating!);
//                     });
//                   },
//                   child: icon,
//                 ),
//               )
//             : GestureDetector(
//                 onTapDown: (detail) {
//                   RenderBox? box = context.findRenderObject() as RenderBox?;
//                   var pos = box!.globalToLocal(detail.globalPosition);
//                   var i = ((pos.dx - widget.spacing) / widget.size);
//                   var newRating =
//                       widget.allowHalfRating ? i : i.round().toDouble();
//                   if (newRating > widget.length) {
//                     newRating = widget.length.toDouble();
//                   }
//                   if (newRating < 0) {
//                     newRating = 0.0;
//                   }
//                   newRating = normalizeRating(newRating);
//                   setState(() {
//                     currentRating = newRating;
//                   });
//                 },
//                 onTapUp: (e) {
//                   if (widget.onRated != null) widget.onRated(currentRating!);
//                 },
//                 onHorizontalDragUpdate: (dragDetails) {
//                   RenderBox? box = context.findRenderObject() as RenderBox?;
//                   var pos = box!.globalToLocal(dragDetails.globalPosition);
//                   var i = pos.dx / widget.size;
//                   var newRating =
//                       widget.allowHalfRating ? i : i.round().toDouble();
//                   if (newRating > widget.length) {
//                     newRating = widget.length.toDouble();
//                   }
//                   if (newRating < 0) {
//                     newRating = 0.0;
//                   }
//                   setState(() {
//                     currentRating = newRating;
//                   });
//                   debounceTimer?.cancel();
//                   debounceTimer = Timer(const Duration(milliseconds: 100), () {
//                     currentRating = normalizeRating(newRating);
//                     widget.onRated(currentRating!);
//                   });
//                 },
//                 child: icon,
//               );

//     return star;
//   }

//   double normalizeRating(double newRating) {
//     var k = newRating - newRating.floor();
//     if (k != 0) {
//       //half stars
//       if (k >= halfStarThreshold) {
//         newRating = newRating.floor() + 1.0;
//       } else {
//         newRating = newRating.floor() + 0.5;
//       }
//     }
//     return newRating;
//   }
// }
