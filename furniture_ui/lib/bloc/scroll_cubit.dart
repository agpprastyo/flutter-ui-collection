import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'scroll_state.dart';

class ScrollCubit extends Cubit<ScrollState> {
  ScrollCubit() : super(ScrollInitial());

  final ScrollController scrollCubitController = ScrollController();
}
