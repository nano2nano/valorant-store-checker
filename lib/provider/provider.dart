import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  dio.interceptors.add(LogInterceptor());
  return dio;
});

final regionListProvider = Provider<List<Tuple2<String, String>>>(
  (ref) => const [
    Tuple2('North America', 'NA'),
    Tuple2('Europe', 'EU'),
    Tuple2('Asia Pacific', 'AP'),
    Tuple2('Korea', 'KO'),
  ],
);
