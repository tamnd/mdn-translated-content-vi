---
title: Xóa bằng cách nhấp vào
slug: Web/API/WebGL_API/By_example/Clearing_by_clicking
page-type: guide
---

{{DefaultAPISidebar("WebGL")}}{{PreviousNext("Web/API/WebGL_API/By_example/Clearing_with_colors","Web/API/WebGL_API/By_example/Simple_color_animation")}}

Ví dụ này trình bày cách kết hợp tương tác của người dùng với các hoạt động đồ họa WebGL bằng cách xóa ngữ cảnh hiển thị bằng màu ngẫu nhiên khi người dùng nhấp vào.

## Xóa bối cảnh hiển thị bằng các màu ngẫu nhiên

{{EmbedLiveSample("Clearing_the_rendering_context_with_random_colors",660,425)}}

Ví dụ này cung cấp sự minh họa về cách kết hợp {{glossary("WebGL")}} và tương tác của người dùng. Mỗi khi người dùng nhấp vào khung vẽ hoặc nút, khung vẽ sẽ bị xóa bằng màu mới được chọn ngẫu nhiên.

Lưu ý cách chúng tôi nhúng lệnh gọi hàm {{glossary("WebGL")}} bên trong hàm xử lý sự kiện.

```html
<p>
  A very simple WebGL program that still shows some color and user interaction.
</p>
<p>
  You can repeatedly click the empty canvas or the button below to change color.
</p>
<canvas id="canvas-view">
  Your browser does not seem to support HTML canvas.
</canvas>
<button id="color-switcher">Press here to switch color</button>
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
button {
  display: inline-block;
  font-size: inherit;
  margin: auto;
  padding: 0.6em;
}
```

```js
// Adding the same click event handler to both canvas and
// button.
const canvas = document.querySelector("#canvas-view");
const button = document.querySelector("#color-switcher");
canvas.addEventListener("click", switchColor);
button.addEventListener("click", switchColor);

// A variable to hold the WebGLRenderingContext.
const gl = canvas.getContext("webgl");
gl.viewport(0, 0, gl.drawingBufferWidth, gl.drawingBufferHeight);

// The click event handler.
function switchColor() {
  // Get a random color value using a helper function.
  const color = getRandomColor();
  // Set the clear color to the random color.
  gl.clearColor(color[0], color[1], color[2], 1.0);
  // Clear the context with the newly set color. This is
  // the function call that actually does the drawing.
  gl.clear(gl.COLOR_BUFFER_BIT);
}

// Random color helper function.
function getRandomColor() {
  return [Math.random(), Math.random(), Math.random()];
}
```

Mã nguồn của ví dụ này cũng có trên [GitHub](https://github.com/idofilin/webgl-by-example/tree/master/clearing-by-clicking).

{{PreviousNext("Web/API/WebGL_API/By_example/Clearing_with_colors","Web/API/WebGL_API/By_example/Simple_color_animation")}}
