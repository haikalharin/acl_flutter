class EnvironmentConfig {
  static EnvName envName = EnvName.values.byName(const String.fromEnvironment(
    'BASE_ENV_NAME',
    defaultValue: '',
  ));
}

enum EnvName { dev, staging, prod }
