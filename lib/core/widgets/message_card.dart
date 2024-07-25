import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget messageCard({required Color color,required dynamic data,required AlignmentGeometry alignment}){
  return SizedBox(
                                  width: 100,
                                  height: 60,
                                  child: Align(
                                    alignment: alignment,
                                    child: Card(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color:color,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20))),
                                        width: 300,
                                        height: 100,
                                        child: Center(
                                          child: Text(
                                               data
                                              .elementAt(2)
                                              .toString()),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
}