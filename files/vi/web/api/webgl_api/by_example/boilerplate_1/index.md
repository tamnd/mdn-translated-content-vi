---
title: Nồi hơi 1
slug: Web/API/WebGL_API/By_example/Boilerplate_1
page-type: guide
---

{{DefaultAPISidebar("WebGL")}}{{PreviousNext("Web/API/WebGL_API/By_example/Canvas_size_and_WebGL","Web/API/WebGL_API/By_example/Scissor_animation")}}

Ví dụ này mô tả các đoạn mã lặp lại sẽ bị ẩn từ bây giờ, cũng như xác định hàm tiện ích JavaScript để giúp việc khởi tạo WebGL dễ dàng hơn.

## Mã soạn sẵn để thiết lập ngữ cảnh kết xuất WebGL

Đến bây giờ bạn đã khá quen với việc thấy các phần {{glossary("HTML")}}, {{glossary("CSS")}} và {{glossary("JavaScript")}} giống nhau được lặp đi lặp lại nhiều lần. Vì vậy, chúng ta sẽ giấu chúng từ bây giờ. Điều này sẽ cho phép chúng ta tập trung vào những đoạn mã thú vị phù hợp nhất cho việc học {{glossary("WebGL")}}.

Cụ thể, HTML có phần tử {{HTMLElement("p")}} chứa một số văn bản mô tả về trang và cũng có thể chứa thông báo lỗi; phần tử {{HTMLElement("canvas")}}; và tùy chọn một {{HTMLElement("button")}}. CSS chứa các quy tắc cho `body`, `canvas` và `button`. Mọi CSS và HTML không tầm thường bổ sung sẽ được hiển thị trên các trang có ví dụ cụ thể.

Trong các ví dụ sau, chúng ta sẽ sử dụng hàm trợ giúp JavaScript, `getRenderingContext()`, để khởi tạo {{domxref("WebGLRenderingContext","WebGL rendering context", "", 1)}}. Đến bây giờ, bạn đã có thể hiểu chức năng này làm gì. Về cơ bản, nó lấy bối cảnh hiển thị WebGL từ phần tử canvas, khởi tạo bộ đệm vẽ, xóa màu đen và trả về bối cảnh đã khởi tạo. Trong trường hợp có lỗi, nó hiển thị thông báo lỗi và trả về [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null).

Cuối cùng, tất cả mã JavaScript sẽ chạy trong một hàm tức thời, đây là một kỹ thuật JavaScript phổ biến (xem {{glossary("Function")}}). Việc khai báo và gọi hàm cũng sẽ bị ẩn.

### HTML

```html
<p>[ Some descriptive text about the example. ]</p>
<button>[ Optional button element. ]</button>
<canvas>Your browser does not seem to support HTML canvas.</canvas>
```

### CSS

```css
body {
  text-align: center;
}
canvas {
  display: block;
  width: 280px;
  height: 210px;
  margin: auto;
  padding: 0;
  border: none;
  background-color: black;
}
button {
  display: block;
  font-size: inherit;
  margin: auto;
  padding: 0.6em;
}
```

### Javascript

```js
function getRenderingContext() {
  const canvas = document.querySelector("canvas");
  canvas.width = canvas.clientWidth;
  canvas.height = canvas.clientHeight;
  const gl =
    canvas.getContext("webgl") || canvas.getContext("experimental-webgl");
  if (!gl) {
    const paragraph = document.querySelector("p");
    paragraph.textContent =
      "Failed to get WebGL context. Your browser or device may not support WebGL.";
    return null;
  }
  gl.viewport(0, 0, gl.drawingBufferWidth, gl.drawingBufferHeight);
  gl.clearColor(0.0, 0.0, 0.0, 1.0);
  gl.clear(gl.COLOR_BUFFER_BIT);
  return gl;
}
```

Mã nguồn của ví dụ này cũng có trên [GitHub](https://github.com/idofilin/webgl-by-example/tree/master/boilerplate-1).

{{PreviousNext("Web/API/WebGL_API/By_example/Canvas_size_and_WebGL","Web/API/WebGL_API/By_example/Scissor_animation")}}
