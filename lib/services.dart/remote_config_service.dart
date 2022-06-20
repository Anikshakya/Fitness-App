import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  static FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

  Future<FirebaseRemoteConfig> setupRemoteConfig() async {
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 20),
      minimumFetchInterval: const Duration(seconds: 1),
    ));
    await remoteConfig.fetchAndActivate();

    await remoteConfig
        .setDefaults(<String, dynamic>{'splash_text': 'Fitness Ghar ho hai'});
    return remoteConfig;
  }
}
