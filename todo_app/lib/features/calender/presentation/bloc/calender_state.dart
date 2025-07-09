part of 'calender_bloc.dart';

sealed class CalenderState extends Equatable {
  const CalenderState();
  
  @override
  List<Object> get props => [];
}

final class CalenderInitial extends CalenderState {}
