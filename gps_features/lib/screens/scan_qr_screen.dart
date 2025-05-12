import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQrScreen extends StatefulWidget {
  const ScanQrScreen({super.key});

  @override
  State<ScanQrScreen> createState() => _ScanQrScreenState();
}

class _ScanQrScreenState extends State<ScanQrScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Animation for red line scanner
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: false);

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  @override
  void reassemble() {
    super.reassemble();
    if (controller != null) {
      if (defaultTargetPlatform == TargetPlatform.android) {
        controller!.pauseCamera();
      } else if (defaultTargetPlatform == TargetPlatform.iOS) {
        controller!.resumeCamera();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double cutOutSize = MediaQuery.of(context).size.width * 0.7;
    double topOffset = MediaQuery.of(context).size.height / 2 - cutOutSize / 2;

    return Scaffold(
      body: Stack(
        children: [
          // QR code scanner view
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Colors.white,
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 8,
              cutOutSize: cutOutSize,
            ),
          ),
          // Back button
          Positioned(
            top: MediaQuery.of(context).padding.top + 20,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => _goBack(context),
            ),
          ),
          // Animated red scanning line
          Center(
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Positioned(
                  top: topOffset + (_animation.value * cutOutSize),
                  child: Container(
                    width: cutOutSize,
                    height: 2,
                    color: Colors.redAccent,
                  ),
                );
              },
            ),
          ),
          // Display QR code result
          if (result != null)
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  color: Colors.black54,
                  child: Text(
                    'Result: ${result!.code}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    _animationController.dispose();
    super.dispose();
  }
}

void _goBack(BuildContext context) {
  Navigator.pop(context);
}
