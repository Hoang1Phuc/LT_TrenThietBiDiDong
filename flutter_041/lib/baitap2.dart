import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  // Danh sách dữ liệu tin tức hoặc bài viết
  final List<Map<String, String>> articles = [
    {
      "image": "https://picsum.photos/200/200",
      "title": "Tiêu đề bài viết 1",
      "description": "Đây là mô tả ngắn gọn của bài viết 1. Nội dung hấp dẫn đang chờ bạn khám phá!"
    },
    {

      "image": "https://picsum.photos/200/200",
      "title": "Tiêu đề bài viết 2",
      "description": "Đây là mô tả ngắn gọn của bài viết 2. Hãy tìm hiểu thêm để biết thêm chi tiết!"
    },
    {

      "image": "https://picsum.photos/200/200",
      "title": "Tiêu đề bài viết 3",
      "description": "Đây là mô tả ngắn gọn của bài viết 3. Cùng đọc để cập nhật thông tin mới nhất!"
    },
    {

      "image": "https://picsum.photos/200/200",
      "title": "Tiêu đề bài viết 4",
      "description": "Đây là mô tả ngắn gọn của bài viết 4. Cùng đọc để cập nhật thông tin mới nhất!"
    },
    {

      "image": "https://picsum.photos/200/200",
      "title": "Tiêu đề bài viết 5",
      "description": "Đây là mô tả ngắn gọn của bài viết 5. Cùng đọc để cập nhật thông tin mới nhất!"
    },
    {

      "image": "https://picsum.photos/200/200",
      "title": "Tiêu đề bài viết 6",
      "description": "Đây là mô tả ngắn gọn của bài viết 6. Cùng đọc để cập nhật thông tin mới nhất!"
    },
    {

      "image": "https://picsum.photos/200/200",
      "title": "Tiêu đề bài viết 7",
      "description": "Đây là mô tả ngắn gọn của bài viết 7. Cùng đọc để cập nhật thông tin mới nhất!"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trang chủ"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: articles.length, // Số lượng bài viết
          itemBuilder: (context, index) {
            final article = articles[index];
            return Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Hình ảnh
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        article["image"]!,
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10),
                    // Tiêu đề và mô tả
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            article["title"]!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            article["description"]!,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}