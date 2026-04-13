---
title: Hướng dẫn WebGL
slug: Web/API/WebGL_API/Tutorial
page-type: guide
---

{{DefaultAPISidebar("WebGL")}}

Hướng dẫn này mô tả cách dùng phần tử {{HTMLElement("canvas")}} để vẽ đồ họa WebGL, bắt đầu từ những điều cơ bản. Các ví dụ được cung cấp sẽ cho bạn những ý tưởng rõ ràng về những gì có thể làm với WebGL, đồng thời cung cấp các đoạn mã có thể giúp bạn bắt đầu xây dựng nội dung của riêng mình.

[WebGL](https://www.khronos.org/webgl/) cho phép nội dung web sử dụng một API dựa trên [OpenGL ES](https://www.khronos.org/opengles/) 2.0 để thực hiện kết xuất 3D trong một `<canvas>` HTML trên các trình duyệt hỗ trợ nó mà không cần plug-in. Các chương trình WebGL bao gồm mã điều khiển viết bằng JavaScript và mã hiệu ứng đặc biệt (mã shader) được thực thi trên GPU (Graphics Processing Unit) của máy tính. Các phần tử WebGL có thể được trộn với các phần tử HTML khác và được hợp thành cùng các phần khác của trang hoặc nền trang.

## Trước khi bắt đầu

Sử dụng phần tử `<canvas>` không quá khó, nhưng bạn cần có hiểu biết cơ bản về [HTML](/en-US/docs/Web/HTML) và [JavaScript](/en-US/docs/Web/JavaScript). Phần tử `<canvas>` và WebGL không được hỗ trợ trong một số trình duyệt cũ, nhưng được hỗ trợ trong các phiên bản gần đây của mọi trình duyệt lớn. Để vẽ đồ họa lên canvas, chúng ta dùng một đối tượng ngữ cảnh JavaScript, đối tượng này tạo đồ họa ngay lập tức.

## Trong hướng dẫn này

- [Bắt đầu với WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial/Getting_started_with_WebGL)
  - : Cách thiết lập một ngữ cảnh WebGL.
- [Thêm nội dung 2D vào ngữ cảnh WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial/Adding_2D_content_to_a_WebGL_context)
  - : Cách kết xuất các hình phẳng đơn giản bằng WebGL.
- [Dùng shader để áp dụng màu trong WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial/Using_shaders_to_apply_color_in_WebGL)
  - : Minh họa cách thêm màu vào hình bằng shader.
- [Tạo hoạt ảnh cho đối tượng với WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial/Animating_objects_with_WebGL)
  - : Cho thấy cách xoay và dịch chuyển đối tượng để tạo hoạt ảnh đơn giản.
- [Tạo đối tượng 3D bằng WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial/Creating_3D_objects_using_WebGL)
  - : Cho thấy cách tạo và tạo hoạt ảnh cho một đối tượng 3D, trong trường hợp này là một khối lập phương.
- [Sử dụng texture trong WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial/Using_textures_in_WebGL)
  - : Minh họa cách ánh xạ texture lên các mặt của một đối tượng.
- [Chiếu sáng trong WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial/Lighting_in_WebGL)
  - : Cách mô phỏng hiệu ứng chiếu sáng trong ngữ cảnh WebGL của bạn.
- [Tạo hoạt ảnh cho texture trong WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial/Animating_textures_in_WebGL)
  - : Cho thấy cách tạo hoạt ảnh cho texture; trong trường hợp này là bằng cách ánh xạ một video Ogg lên các mặt của một khối lập phương đang quay.
