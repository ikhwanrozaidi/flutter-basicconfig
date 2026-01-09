import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

@singleton
class ConnectivityService {
  final Connectivity _connectivity = Connectivity();

  StreamController<bool>? _connectivityController;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;
  bool _isConnected = false;

  Stream<bool> get connectivityStream {
    _connectivityController ??= StreamController<bool>.broadcast();
    return _connectivityController!.stream;
  }

  bool get isCurrentlyConnected => _isConnected;

  void startMonitoring() {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((
      List<ConnectivityResult> results,
    ) async {
      final wasConnected = _isConnected;
      _isConnected = await _checkActualConnectivity(results.first);

      if (wasConnected != _isConnected) {
        _connectivityController?.add(_isConnected);
      }
    });

    // Check initial connectivity
    _checkInitialConnectivity();
  }

  Future<void> _checkInitialConnectivity() async {
    final results = await _connectivity.checkConnectivity();
    _isConnected = await _checkActualConnectivity(results.first);
    _connectivityController?.add(_isConnected);
  }

  Future<bool> _checkActualConnectivity(ConnectivityResult result) async {
    if (result == ConnectivityResult.none) {
      return false;
    }

    // Even if connectivity shows we're connected, we need to verify
    // actual internet access
    try {
      final response = await InternetAddress.lookup(
        'google.com',
      ).timeout(const Duration(seconds: 5));
      return response.isNotEmpty && response[0].rawAddress.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  Future<bool> checkConnectivity() async {
    final results = await _connectivity.checkConnectivity();
    _isConnected = await _checkActualConnectivity(results.first);
    return _isConnected;
  }

  void dispose() {
    _connectivitySubscription?.cancel();
    _connectivityController?.close();
  }
}

// Enhanced network info that uses ConnectivityService
@LazySingleton(as: NetworkInfo)
class EnhancedNetworkInfo implements NetworkInfo {
  final ConnectivityService _connectivityService;

  EnhancedNetworkInfo(this._connectivityService);

  @override
  Future<bool> get isConnected async {
    return await _connectivityService.checkConnectivity();
  }

  Stream<bool> get connectivityStream =>
      _connectivityService.connectivityStream;
}

// Base NetworkInfo interface (if not already defined)
abstract class NetworkInfo {
  Future<bool> get isConnected;
}
