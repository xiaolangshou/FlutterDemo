import 'package:flutter/material.dart';
export 'DialOfBottom.dart';
export 'dart:ui';
export 'IndicatorPainter.dart';

export 'DashBoardIndicatorPainter_X.dart';
export 'DashBoardTablePainter_X.dart';

export 'DashBoardIndicatorPainter_Y.dart';
export 'DashBoardTablePainter_Y.dart';

export 'DashBoardIndicatorPainter_DA.dart';
export 'DashBoardTablePainter_DA.dart';


export 'DashBoardIndicatorPainter_Z.dart';
export 'DashBoardTablePainter_Z.dart';


final double Length = 67.0; /*视图大小*/
double strokeWidth = Length / 8.0; /*背景宽度*/

final int tableCount_y = 160;/*平分160分，只显示120分，即四分之三*/

final int tableCount_x = 187;/*平分187分，只显示140分，即四分之三  140 *0.75取整 */


final int tableCount_da = 160;/*平分160分，只显示120分，即四分之三*/


final int tableCount_z = 88;/*平分88分，只显示66分，即四分之三*/

//final double ratio_x = 0.75 ;
final double pi = 3.14159265;

final double wholeCirclesRadian = pi * 2;

final Color backColor = Color.fromARGB(255, 237, 237, 244);