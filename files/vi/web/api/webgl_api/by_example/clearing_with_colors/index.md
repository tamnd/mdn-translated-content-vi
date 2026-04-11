---
title: Xóa bằng màu sắc
slug: Web/API/WebGL_API/By_example/Clearing_with_colors
page-type: guide
---

{{DefaultAPISidebar("WebGL")}}{{PreviousNext("Web/API/WebGL_API/By_example/Detect_WebGL","Web/API/WebGL_API/By_example/Clearing_by_clicking")}}

Một ví dụ cho thấy cách xóa ngữ cảnh hiển thị WebGL thành màu đồng nhất.

## Xóa ngữ cảnh WebGL bằng màu đồng nhất

{{EmbedLiveSample("Clearing_the_WebGL_context_with_a_solid_color",660,425)}}

Chương trình {{glossary("WebGL")}} đồ họa đơn giản nhất. Thiết lập {{domxref("WebGLRenderingContext","rendering context", "", 1)}} và sau đó chỉ cần xóa nó bằng màu xanh lục. Lưu ý rằng {{glossary("CSS")}} đặt màu nền của khung vẽ thành màu đen, vì vậy khi khung vẽ chuyển sang màu xanh lục, chúng ta biết rằng phép thuật của {{glossary("WebGL")}} đã phát huy tác dụng.

Ngoài ra, bạn có thể nhận thấy rằng việc xóa vùng đệm vẽ bằng màu đồng nhất là một quá trình gồm hai giai đoạn. Đầu tiên, chúng tôi đặt màu trong suốt thành màu xanh lục, sử dụng phương thức {{domxref("WebGLRenderingContext.clearColor()","clearColor()")}}. Điều này chỉ thay đổi một số trạng thái bên trong của {{glossary("WebGL")}} nhưng chưa vẽ ra bất cứ điều gì. Tiếp theo, chúng ta thực sự vẽ bằng cách gọi phương thức {{domxref("WebGLRenderingContext.clear()","clear()")}}. Đây là điển hình về cách thực hiện vẽ bằng WebGL. Chỉ có một số phương pháp để vẽ thực tế (`clear()` là một trong số đó). Tất cả các phương pháp khác là để thiết lập và truy vấn các biến trạng thái WebGL (chẳng hạn như màu rõ ràng).

Có nhiều "mặt số" và "công tắc" ảnh hưởng đến việc vẽ bằng {{glossary("WebGL")}}. Màu sắc rõ ràng chỉ là màu đầu tiên trong số nhiều màu bạn sẽ biết. Đây là lý do tại sao {{glossary("WebGL")}}/{{glossary("OpenGL")}} thường được gọi là _máy trạng thái_. Bằng cách điều chỉnh các "quay số" và "công tắc" đó, bạn có thể sửa đổi trạng thái bên trong của máy WebGL, từ đó thay đổi cách đầu vào (trong trường hợp này là một lệnh rõ ràng) chuyển thành đầu ra (trong trường hợp này, tất cả các pixel được đặt thành màu xanh lục).

Cuối cùng, chúng tôi lưu ý rằng màu trong WebGL thường ở định dạng {{glossary("RGB", "RGBA")}}, tức là bốn thành phần số cho màu đỏ, lục, lam và alpha (độ mờ). Do đó, `clearColor()` nhận bốn đối số.

```html
<p>A very simple WebGL program that shows some color.</p>
<!-- Text within a canvas element is displayed
    only if canvas is not supported. -->
<canvas>Your browser does not seem to support HTML canvas.</canvas>
```

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
```

```js
// References to the document elements.
const paragraph = document.querySelector("p");
const canvas = document.querySelector("canvas");

// Getting the WebGL rendering context.
const gl = canvas.getContext("webgl");

paragraph.textContent = "Congratulations! Your browser supports WebGL.";
gl.viewport(0, 0, gl.drawingBufferWidth, gl.drawingBufferHeight);
// Set the clear color to darkish green.
gl.clearColor(0.0, 0.5, 0.0, 1.0);
// Clear the context with the newly set color. This is
// the function call that actually does the drawing.
gl.clear(gl.COLOR_BUFFER_BIT);
```

Mã nguồn của ví dụ này cũng có trên [GitHub](https://github.com/idofilin/webgl-by-example/tree/master/clearing-with-colors).

{{PreviousNext("Web/API/WebGL_API/By_example/Detect_WebGL","Web/API/WebGL_API/By_example/Clearing_by_clicking")}}
