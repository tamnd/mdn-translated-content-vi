---
title: WebGL qua ví dụ
slug: Web/API/WebGL_API/By_example
page-type: guide
---

{{DefaultAPISidebar("WebGL")}}{{Next("Web/API/WebGL_API/By_example/Detect_WebGL")}}

_WebGL qua ví dụ_ là một chuỗi các mẫu chạy trực tiếp kèm giải thích ngắn, giới thiệu các khái niệm và khả năng của WebGL.

Các ví dụ được sắp xếp theo chủ đề và mức độ khó, bao quát ngữ cảnh kết xuất WebGL, lập trình shader, texture, hình học, tương tác người dùng, và nhiều hơn nữa.

## Ví dụ theo chủ đề

Các ví dụ được sắp xếp theo thứ tự tăng dần về độ khó. Nhưng thay vì chỉ trình bày chúng trong một danh sách dài, chúng còn được chia theo chủ đề. Đôi khi chúng ta quay lại một chủ đề nhiều lần, chẳng hạn khi cần bàn về nó ở mức cơ bản, rồi sau đó ở mức trung cấp và nâng cao.

Thay vì cố gắng xử lý shader, hình học và bộ nhớ {{Glossary("GPU")}} ngay từ chương trình đầu tiên, các ví dụ ở đây khám phá WebGL theo hướng tăng dần. Chúng tôi tin rằng cách này mang lại trải nghiệm học hiệu quả hơn và cuối cùng là hiểu sâu hơn về các khái niệm nền tảng.

Phần giải thích về các ví dụ có ở cả phần văn bản chính và trong các chú thích bên trong mã. Bạn nên đọc hết các chú thích, vì các ví dụ nâng cao hơn không thể lặp lại các chú thích về những phần của mã đã được giải thích trước đó.

### Làm quen với ngữ cảnh kết xuất

- [Detect WebGL](/en-US/docs/Web/API/WebGL_API/By_example/Detect_WebGL)
  - : Ví dụ này minh họa cách phát hiện một ngữ cảnh kết xuất {{Glossary("WebGL")}} và báo kết quả cho người dùng.
- [Clearing with colors](/en-US/docs/Web/API/WebGL_API/By_example/Clearing_with_colors)
  - : Cách xóa ngữ cảnh kết xuất bằng một màu đơn.
- [Clearing by clicking](/en-US/docs/Web/API/WebGL_API/By_example/Clearing_by_clicking)
  - : Cách kết hợp tương tác người dùng với các thao tác đồ họa. Xóa ngữ cảnh kết xuất bằng một màu ngẫu nhiên khi người dùng nhấp chuột.
- [Simple color animation](/en-US/docs/Web/API/WebGL_API/By_example/Simple_color_animation)
  - : Một hoạt ảnh màu rất cơ bản, thực hiện bằng cách xóa bộ đệm vẽ {{Glossary("WebGL")}} bằng một màu ngẫu nhiên khác mỗi giây.
- [Color masking](/en-US/docs/Web/API/WebGL_API/By_example/Color_masking)
  - : Thay đổi các màu ngẫu nhiên bằng cách áp dụng che màu, từ đó giới hạn dải màu hiển thị thành các sắc thái cụ thể.
- [Basic scissoring](/en-US/docs/Web/API/WebGL_API/By_example/Basic_scissoring)
  - : Cách vẽ hình chữ nhật và hình vuông bằng thao tác scissoring.
- [Canvas size and WebGL](/en-US/docs/Web/API/WebGL_API/By_example/Canvas_size_and_WebGL)
  - : Ví dụ này khám phá ảnh hưởng của việc đặt kích thước canvas bằng đúng kích thước phần tử của nó trong các pixel {{Glossary("CSS")}}, như khi nó xuất hiện trong cửa sổ trình duyệt.
- [Boilerplate 1](/en-US/docs/Web/API/WebGL_API/By_example/Boilerplate_1)
  - : Ví dụ mô tả những đoạn mã lặp lại sẽ từ đây trở đi được ẩn đi, đồng thời định nghĩa một hàm tiện ích JavaScript để việc khởi tạo WebGL dễ hơn.
- [Scissor animation](/en-US/docs/Web/API/WebGL_API/By_example/Scissor_animation)
  - : Một chút vui nhộn với hoạt ảnh cùng thao tác scissoring và xóa.
- [Raining rectangles](/en-US/docs/Web/API/WebGL_API/By_example/Raining_rectangles)
  - : Một trò chơi minh họa việc xóa bằng màu đơn, scissoring, hoạt ảnh và tương tác người dùng.

### Kiến thức cơ bản về lập trình shader

- [Hello GLSL](/en-US/docs/Web/API/WebGL_API/By_example/Hello_GLSL)
  - : Một chương trình shader rất cơ bản, vẽ một hình vuông màu đơn.
- [Hello vertex attributes](/en-US/docs/Web/API/WebGL_API/By_example/Hello_vertex_attributes)
  - : Kết hợp lập trình shader và tương tác người dùng thông qua các thuộc tính đỉnh.
- [Textures from code](/en-US/docs/Web/API/WebGL_API/By_example/Textures_from_code)
  - : Một minh họa về tạo texture thủ tục với fragment shader.

### Ví dụ nâng cao linh tinh

- [Video textures](/en-US/docs/Web/API/WebGL_API/By_example/Video_textures)
  - : Ví dụ này minh họa cách dùng tệp video làm texture.

{{Next("Web/API/WebGL_API/By_example/Detect_WebGL")}}
