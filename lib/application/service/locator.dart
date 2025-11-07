abstract interface class Locator {
  /// Get factory or singleton instance of a class of required type [T].
  T get<T>();

  /// Register a factory using the given [constructor].
  ///
  /// This provides a new instance of the class everytime.
  void registerFactory<T>(T Function() constructor);

  /// Register a singleton using the given [instance].
  ///
  /// Returns the same instance of the class every time.
  void registerSingleton<T>(final T instance);
}

class LocatorImpl implements Locator {
  static final LocatorImpl instance = LocatorImpl();

  /// The key is Type of the value(Object).
  ///
  /// Value[Object] is of dynamic type.
  final Map<Type, dynamic> singletonStorage = {};

  /// Value[Object] is of Object? Function() or dynamic type
  final Map<Type, dynamic> factoryStorage = {};

  @override
  T get<T>() {
    if (singletonStorage.containsKey(T)) return singletonStorage[T];
    if (factoryStorage.containsKey(T)) return factoryStorage[T]();
    throw 'Please Register $T before accessing it.';
  }

  @override
  void registerFactory<T>(T Function() constructor) {
    factoryStorage[T] = constructor;
  }

  @override
  void registerSingleton<T>(T instance) {
    singletonStorage[T] = instance;
  }
}
