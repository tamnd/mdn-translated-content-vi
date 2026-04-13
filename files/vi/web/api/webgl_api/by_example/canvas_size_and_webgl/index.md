---
title: Kích thước canvas và WebGL
slug: Web/API/WebGL_API/By_example/Canvas_size_and_WebGL
page-type: guide
---

{{DefaultAPISidebar("WebGL")}}{{PreviousNext("Web/API/WebGL_API/By_example/Basic_scissoring","Web/API/WebGL_API/By_example/Boilerplate_1")}}

Ví dụ về WebGL này khám phá tác động của việc cài đặt (hoặc không cài đặt) kích thước canvas thành kích thước phần tử của nó tính bằng {{glossary("CSS")}} pixel, khi nó xuất hiện trong cửa sổ trình duyệt.

## Ảnh hưởng của kích thước canvas đến kết xuất với WebGL

{{EmbedLiveSample("Effect_of_canvas_size_on_rendering_with_WebGL",660,180)}}

Với {{domxref("WebGLRenderingContext.scissor()","scissor()")}} và {{domxref("WebGLRenderingContext.clear()","clear()")}} chúng ta có thể chứng minh kích thước của canvas ảnh hưởng đến bộ đệm vẽ WebGL như thế nào.

Kích thước của khung vẽ đầu tiên được đặt thành kích thước {{domxref("Element")}} theo kiểu, được xác định bởi {{glossary("CSS")}}. Việc này được thực hiện bằng cách chỉ định các thuộc tính {{domxref("HTMLCanvasElement.width","width")}} và {{domxref("HTMLCanvasElement.height","height")}} của canvas cho các giá trị của thuộc tính {{domxref("Element.clientWidth","clientWidth")}} và {{domxref("Element.clientHeight","clientHeight")}} tương ứng.

Ngược lại, không có sự phân công nào như vậy được thực hiện cho khung vẽ thứ hai. Thuộc tính {{domxref("HTMLCanvasElement.width","width")}} và {{domxref("HTMLCanvasElement.height","height")}} bên trong của canvas vẫn giữ nguyên giá trị mặc định, khác với kích thước thực tế của canvas {{domxref("Element")}} trong cửa sổ trình duyệt.

Hiệu ứng này hiển thị rõ ràng khi sử dụng {{domxref("WebGLRenderingContext.scissor()","scissor()")}} và {{domxref("WebGLRenderingContext.clear()","clear()")}} để vẽ một hình vuông ở giữa canvas, bằng cách chỉ định vị trí và kích thước của nó tính bằng pixel. Trong canvas đầu tiên, chúng ta nhận được kết quả mong muốn. Trong trường hợp thứ hai, hình vuông có hình dạng, kích thước và vị trí sai.

```html
<p>Compare the two canvases.</p>
<canvas>Your browser does not seem to support HTML canvas.</canvas>
<canvas>Your browser does not seem to support HTML canvas.</canvas>
```

```css
body {
  text-align: center;
}
canvas {
  display: inline-block;
  width: 120px;
  height: 80px;
  margin: auto;
  padding: 0;
  border: none;
  background-color: black;
}
```

```js
const [firstCanvas, secondCanvas] = document.getElementsByTagName("canvas");
firstCanvas.width = firstCanvas.clientWidth;
firstCanvas.height = firstCanvas.clientHeight;
[firstCanvas, secondCanvas].forEach((canvas) => {
  const gl = canvas.getContext("webgl");
  gl.viewport(0, 0, gl.drawingBufferWidth, gl.drawingBufferHeight);
  gl.enable(gl.SCISSOR_TEST);
  gl.scissor(30, 10, 60, 60);
  gl.clearColor(1.0, 1.0, 0.0, 1.0);
  gl.clear(gl.COLOR_BUFFER_BIT);
});
```

Mã nguồn của ví dụ này cũng có trên [GitHub](https://github.com/idofilin/webgl-by-example/tree/master/canvas-size-and-webgl).

{{PreviousNext("Web/API/WebGL_API/By_example/Basic_scissoring","Web/API/WebGL_API/By_example/Boilerplate_1")}}
