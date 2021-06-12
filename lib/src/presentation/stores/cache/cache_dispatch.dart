// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:equatable/equatable.dart';

// import '../../../../../domain/helpers/cache/cache_error.dart';

// import '../../../../../data/usecases/cache/cache_usecase.dart';

// part 'cache_state.dart';

// class CacheDispatch extends Cubit<CacheState> {
//   late final Cache cache;

//   CacheDispatch({
//     required this.cache,
//   }) : super(CacheInitial());

//   Future<void> fetchValue({required String key}) async {
//     try {
//       emit(CacheLoading());

//       final String? value = await cache.fetch(key: key);

//       if (value != null) {
//         emit(CacheSeccess(value: value));
//       } else {
//         emit(CacheFailure(message: 'Erro ao pegar o valor!'));
//       }
//     } on CacheError catch (error) {
//       emit(CacheFailure(message: error.descripition));
//     }
//   }

//   Future<void> saveValue({required String key, required String value}) async {
//     try {
//       emit(CacheLoading());
//     } on CacheError catch (error) {
//       emit(CacheFailure(message: error.descripition));
//     }
//   }

//   Future<void> removeValue({required String key}) async {
//     try {
//       emit(CacheLoading());
//     } on CacheError catch (error) {
//       emit(CacheFailure(message: error.descripition));
//     }
//   }
// }
