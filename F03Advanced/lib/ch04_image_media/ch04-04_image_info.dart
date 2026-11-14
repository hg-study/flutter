import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '04-04: 이미지 정보 표시',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ImageInfoPage(),
    );
  }
}

class ImageInfoPage extends StatefulWidget {
  const ImageInfoPage({super.key});

  @override
  State<ImageInfoPage> createState() => _ImageInfoPageState();
}

class _ImageInfoPageState extends State<ImageInfoPage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _pickedImage;
  // 파일 크기(바이트). length()는 비동기 메서드라서
  // 미리 await로 읽어 상태 변수에 저장해 둡니다.
  int? _fileSize;

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );

      if (image != null) {
        // 주의: image.length는 메서드이므로 ${image.length}로 쓰면
        // 크기가 아니라 함수(Closure)가 출력됩니다. 반드시 await image.length()!
        final int size = await image.length();
        if (!mounted) return;
        setState(() {
          _pickedImage = image;
          _fileSize = size;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('에러: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('04-04: 이미지 정보 표시'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (_pickedImage != null)
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    File(_pickedImage!.path),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            else
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image, size: 50, color: Colors.grey),
                      SizedBox(height: 8),
                      Text('이미지가 없습니다'),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _pickImage,
              icon: const Icon(Icons.photo_library),
              label: const Text('이미지 선택'),
            ),
            const SizedBox(height: 24),
            _pickedImage != null
                ? Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.blue.shade200),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '이미지 정보',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text('경로: ${_pickedImage!.path}'),
                        Text('이름: ${_pickedImage!.name}'),
                        Text(
                          '크기: $_fileSize bytes'
                          ' (${((_fileSize ?? 0) / 1024).toStringAsFixed(1)} KB)',
                        ),
                        Text('MIME 타입: ${_pickedImage!.mimeType ?? '알 수 없음'}'),
                      ],
                    ),
                  )
                : const Text('이미지를 선택하세요'),
          ],
        ),
      ),
    );
  }
}

