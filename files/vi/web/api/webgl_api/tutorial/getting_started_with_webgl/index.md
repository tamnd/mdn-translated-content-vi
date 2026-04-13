---
title: Bắt đầu với WebGL
slug: Web/API/WebGL_API/Tutorial/Getting_started_with_WebGL
page-type: guide
---

{{Next("Web/API/WebGL_API/Tutorial/Adding_2D_content_to_a_WebGL_context")}} {{Next("Web/API/WebGL_API/Tutorial/Adding_2D_content_to_a_WebGL_context")}}
[WebGL](/en-US/docs/Web/API/WebGL_API) cho phép nội dung web sử dụng API dựa trên [OpenGL ES](https://www.khronos.org/opengles/) 2.0 để thực hiện hiển thị 2D và 3D trong HTML [`canvas`](/en-US/docs/Web/API/Canvas_API) trong các trình duyệt hỗ trợ API mà không cần sử dụng plugin.

Các chương trình WebGL bao gồm mã điều khiển được viết bằng JavaScript và mã đổ bóng (GLSL) được thực thi trên Bộ xử lý đồ họa (GPU) của máy tính. Các phần tử WebGL có thể được trộn lẫn với các phần tử HTML khác và được kết hợp với các phần khác của trang hoặc nền trang.

Bài viết này sẽ giới thiệu cho bạn những kiến ​​thức cơ bản khi sử dụng WebGL. Giả định rằng bạn đã có hiểu biết về toán học liên quan đến đồ họa 3D và bài viết này không nhằm mục đích dạy bạn các khái niệm về đồ họa 3D.

Bạn cũng có thể tìm thấy các ví dụ về mã trong hướng dẫn này trong [thư mục webgl-examples trên GitHub](https://github.com/mdn/dom-examples/tree/main/webgl-examples/tutorial).

Điều đáng chú ý ở đây là loạt bài viết này giới thiệu chính WebGL; tuy nhiên, hiện có một số khung có khả năng gói gọn các khả năng của WebGL, giúp việc xây dựng ứng dụng và trò chơi 3D trở nên dễ dàng hơn, chẳng hạn như [THREE.js](https://thirdjs.org/) và [BABYLON.js](https://www.babylonjs.com/).

## Chuẩn bị hiển thị ở chế độ 3D

Đầu tiên, tạo hai tệp mới:

- "index.html"
- "webgl-demo.js"

Tệp "index.html" phải chứa nội dung sau:

```html
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>WebGL Demo</title>
    <script src="webgl-demo.js" type="module"></script>
  </head>

  <body>
    <canvas id="gl-canvas" width="640" height="480"></canvas>
  </body>
</html>
```

Lưu ý rằng điều này khai báo một canvas mà mẫu của chúng ta sẽ vẽ vào.

### Chuẩn bị bối cảnh WebGL

Thêm mã sau vào tệp "webgl-demo.js":

```js
main();

//
// start here
//
function main() {
  const canvas = document.querySelector("#gl-canvas");
  // Initialize the GL context
  const gl = canvas.getContext("webgl");

  // Only continue if WebGL is available and working
  if (gl === null) {
    alert(
      "Unable to initialize WebGL. Your browser or machine may not support it.",
    );
    return;
  }

  // Set clear color to black, fully opaque
  gl.clearColor(0.0, 0.0, 0.0, 1.0);
  // Clear the color buffer with specified clear color
  gl.clear(gl.COLOR_BUFFER_BIT);
}
```

Hàm `main()` được gọi khi tập lệnh của chúng tôi được tải. Mục đích của nó là thiết lập ngữ cảnh WebGL và bắt đầu hiển thị nội dung.

Điều đầu tiên chúng ta làm ở đây là lấy một tham chiếu đến canvas, gán nó cho một biến có tên `canvas`.

Sau khi có canvas, chúng tôi cố gắng lấy [`WebGLRenderingContext`](/en-US/docs/Web/API/WebGLRenderingContext) cho canvas đó bằng cách gọi [`getContext()`](/en-US/docs/Web/API/HTMLCanvasElement/getContext) và chuyển nó thành chuỗi `"webgl"`. Nếu trình duyệt không hỗ trợ WebGL, `getContext()` sẽ trả về `null` trong trường hợp đó chúng tôi hiển thị một thông báo cho người dùng và thoát.

Nếu bối cảnh được khởi tạo thành công, biến `gl` là tham chiếu của chúng ta tới nó. Trong trường hợp này, chúng tôi đặt màu rõ ràng thành màu đen và xóa bối cảnh thành màu đó (vẽ lại canvas bằng màu nền).

Tại thời điểm này, bạn có đủ mã để khởi tạo ngữ cảnh WebGL thành công và cuối cùng bạn sẽ có một hộp trống lớn, màu đen, sẵn sàng và chờ nhận nội dung.

{{EmbedGHLiveSample('dom-examples/webgl-examples/tutorial/sample1/index.html', 670, 510) }}

[Xem mã hoàn chỉnh](https://github.com/mdn/dom-examples/tree/main/webgl-examples/tutorial/sample1) | [Mở bản demo này trên một trang mới](https://mdn.github.io/dom-examples/webgl-examples/tutorial/sample1/)

## Xem thêm

- [Các nguyên tắc cơ bản về WebGL](https://webglfundamentals.org/)
- [Giới thiệu về OpenGL hiện đại:](https://duriansoftware.com/joe/an-intro-to-modern-opengl.-table-of-contents) Một loạt bài viết hay về OpenGL do Joe Groff viết, cung cấp phần giới thiệu rõ ràng về OpenGL từ lịch sử của nó đến khái niệm đường dẫn đồ họa quan trọng, đồng thời cũng bao gồm một số ví dụ để minh họa cách OpenGL hoạt động. Nếu bạn không biết OpenGL là gì thì đây là nơi tốt để bắt đầu.

{{Next("Web/API/WebGL_API/Tutorial/Adding_2D_content_to_a_WebGL_context")}}
