// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'games_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gamesRepositoryHash() => r'490987c8da7ad1015589829f37c68288b53420b2';

/// See also [gamesRepository].
@ProviderFor(gamesRepository)
final gamesRepositoryProvider = AutoDisposeProvider<IGamesRepository>.internal(
  gamesRepository,
  name: r'gamesRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gamesRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GamesRepositoryRef = AutoDisposeProviderRef<IGamesRepository>;
String _$getGamesByDifficultyHash() =>
    r'23d5e96ef3c5a154793df312d116e94f5375f879';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getGamesByDifficulty].
@ProviderFor(getGamesByDifficulty)
const getGamesByDifficultyProvider = GetGamesByDifficultyFamily();

/// See also [getGamesByDifficulty].
class GetGamesByDifficultyFamily extends Family<Raw<Future<List<GameModel>>>> {
  /// See also [getGamesByDifficulty].
  const GetGamesByDifficultyFamily();

  /// See also [getGamesByDifficulty].
  GetGamesByDifficultyProvider call(
    Difficulty difficulty,
  ) {
    return GetGamesByDifficultyProvider(
      difficulty,
    );
  }

  @override
  GetGamesByDifficultyProvider getProviderOverride(
    covariant GetGamesByDifficultyProvider provider,
  ) {
    return call(
      provider.difficulty,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getGamesByDifficultyProvider';
}

/// See also [getGamesByDifficulty].
class GetGamesByDifficultyProvider
    extends Provider<Raw<Future<List<GameModel>>>> {
  /// See also [getGamesByDifficulty].
  GetGamesByDifficultyProvider(
    Difficulty difficulty,
  ) : this._internal(
          (ref) => getGamesByDifficulty(
            ref as GetGamesByDifficultyRef,
            difficulty,
          ),
          from: getGamesByDifficultyProvider,
          name: r'getGamesByDifficultyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getGamesByDifficultyHash,
          dependencies: GetGamesByDifficultyFamily._dependencies,
          allTransitiveDependencies:
              GetGamesByDifficultyFamily._allTransitiveDependencies,
          difficulty: difficulty,
        );

  GetGamesByDifficultyProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.difficulty,
  }) : super.internal();

  final Difficulty difficulty;

  @override
  Override overrideWith(
    Raw<Future<List<GameModel>>> Function(GetGamesByDifficultyRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetGamesByDifficultyProvider._internal(
        (ref) => create(ref as GetGamesByDifficultyRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        difficulty: difficulty,
      ),
    );
  }

  @override
  ProviderElement<Raw<Future<List<GameModel>>>> createElement() {
    return _GetGamesByDifficultyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetGamesByDifficultyProvider &&
        other.difficulty == difficulty;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, difficulty.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetGamesByDifficultyRef on ProviderRef<Raw<Future<List<GameModel>>>> {
  /// The parameter `difficulty` of this provider.
  Difficulty get difficulty;
}

class _GetGamesByDifficultyProviderElement
    extends ProviderElement<Raw<Future<List<GameModel>>>>
    with GetGamesByDifficultyRef {
  _GetGamesByDifficultyProviderElement(super.provider);

  @override
  Difficulty get difficulty =>
      (origin as GetGamesByDifficultyProvider).difficulty;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
