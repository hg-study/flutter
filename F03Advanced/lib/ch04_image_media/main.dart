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
      title: '04단계: 이미지 & 미디어',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ImageMediaPage(),
    );
  }
}

class ImageMediaPage extends StatefulWidget {
  const ImageMediaPage({super.key});

  @override
  State<ImageMediaPage> createState() => _ImageMediaPageState();
}

class _ImageMediaPageState extends State<ImageMediaPage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _pickedImage;
  List<XFile> _multipleImages = [];
  // 파일 크기(바이트). length()는 비동기 메서드라서
  // 미리 await로 읽어 상태 변수에 저장해 둡니다.
  int? _fileSize;

  Future<void> _pickImageFromGallery() async {
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

  Future<void> _pickImageFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );

      if (image != null) {
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

  Future<void> _pickMultipleImages() async {
    try {
      final List<XFile> images = await _picker.pickMultiImage(
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );
      
      if (images.isNotEmpty) {
        setState(() {
          _multipleImages = images;
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

  void _clearImage() {
    setState(() {
      _pickedImage = null;
      _multipleImages = [];
      _fileSize = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('04단계: 이미지 & 미디어'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: '1. 갤러리에서 이미지 선택',
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
                    onPressed: _pickImageFromGallery,
                    icon: const Icon(Icons.photo_library),
                    label: const Text('갤러리에서 선택'),
                  ),
                ],
              ),
            ),
            const Divider(height: 40),
            _buildSection(
              title: '2. 카메라로 사진 촬영',
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
                            Icon(Icons.camera_alt, size: 50, color: Colors.grey),
                            SizedBox(height: 8),
                            Text('사진이 없습니다'),
                          ],
                        ),
                      ),
                    ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: _pickImageFromCamera,
                    icon: const Icon(Icons.camera_alt),
                    label: const Text('카메라로 촬영'),
                  ),
                ],
              ),
            ),
            const Divider(height: 40),
            _buildSection(
              title: '3. 여러 이미지 선택',
              child: Column(
                children: [
                  if (_multipleImages.isNotEmpty)
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _multipleImages.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 200,
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                File(_multipleImages[index].path),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
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
                            Icon(Icons.photo_library, size: 50, color: Colors.grey),
                            SizedBox(height: 8),
                            Text('이미지가 없습니다'),
                          ],
                        ),
                      ),
                    ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _pickMultipleImages,
                          icon: const Icon(Icons.photo_library),
                          label: const Text('여러 이미지 선택'),
                        ),
                      ),
                      if (_multipleImages.isNotEmpty) ...[
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _clearImage,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('초기화'),
                          ),
                        ),
                      ],
                    ],
                  ),
                  if (_multipleImages.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        '선택된 이미지: ${_multipleImages.length}개',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ),
                ],
              ),
            ),
            const Divider(height: 40),
            _buildSection(
              title: '4. 이미지 정보 표시',
              child: _pickedImage != null
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 16),
        child,
      ],
    );
  }
}

