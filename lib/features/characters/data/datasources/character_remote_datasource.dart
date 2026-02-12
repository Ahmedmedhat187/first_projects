import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:samurai_studios/core/constants/api_constants.dart';
import 'package:samurai_studios/core/providers/dio_provider.dart';
import 'package:samurai_studios/features/characters/data/models/character_response_dto.dart';

abstract class CharacterRemoteDataSource {
  Future<CharacterResponseDto> getCharacters({int page = 1});
}

class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  final Dio dio;

  CharacterRemoteDataSourceImpl(this.dio);

  @override
  Future<CharacterResponseDto> getCharacters({int page = 1}) async {
    final response = await dio.get(
      ApiConstants.charactersEndpoint,
      queryParameters: {'page': page},
    );
    return CharacterResponseDto.fromJson(response.data as Map<String, dynamic>);
  }
}

final characterRemoteDataSourceProvider = Provider<CharacterRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return CharacterRemoteDataSourceImpl(dio);
});
