---
title: Hoạt hình màu đơn giản
slug: Web/API/WebGL_API/By_example/Simple_color_animation
page-type: guide
---

{{DefaultAPISidebar("WebGL")}}{{PreviousNext("Web/API/WebGL_API/By_example/Clearing_by_clicking","Web/API/WebGL_API/By_example/Color_masking")}}

Một hoạt ảnh màu rất cơ bản được tạo bằng cách sử dụng {{glossary("WebGL")}}, được thực hiện bằng cách xóa bộ đệm vẽ bằng một màu ngẫu nhiên khác nhau mỗi giây.

## Màu sắc hoạt hình rõ ràng

{{EmbedLiveSample("Color_animation_with_clear",660,425)}}

Ví dụ này cung cấp minh họa về hoạt ảnh màu bằng {{glossary("WebGL")}} cũng như sự tương tác của người dùng. Người dùng có thể bắt đầu, dừng và khởi động lại hoạt ảnh bằng cách nhấp vào nút.

Lần này chúng tôi đặt lệnh gọi hàm {{glossary("WebGL")}} trong trình xử lý sự kiện hẹn giờ. Ngoài ra, trình xử lý sự kiện nhấp chuột còn cho phép người dùng tương tác cơ bản khi bắt đầu và dừng hoạt ảnh. Chức năng hẹn giờ và trình xử lý hẹn giờ thiết lập vòng lặp hoạt hình, một tập hợp các lệnh vẽ được thực hiện theo chu kỳ đều đặn (thông thường là mọi khung hình; trong trường hợp này là một lần mỗi giây).

```html
<p>A simple WebGL program that shows color animation.</p>
<p>You can click the button below to toggle the color animation on or off.</p>
<canvas id="canvas-view">
  Your browser does not seem to support HTML canvas.
</canvas>
<button id="animation-onoff">
  Press here to
  <strong>[verb goes here]</strong>
  the animation
</button>
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
// A variable to hold a timer that drives the animation.
let timer;

// Click event handlers.
const button = document.querySelector("#animation-onoff");
const verb = document.querySelector("strong");
const canvas = document.getElementById("canvas-view");
function startAnimation(evt) {
  button.removeEventListener(evt.type, startAnimation);
  button.addEventListener("click", stopAnimation);
  verb.textContent = "stop";
  // Setup animation loop by redrawing every second.
  timer = setInterval(drawAnimation, 1000);
  // Give immediate feedback to user after clicking, by
  // drawing one animation frame.
  drawAnimation();
}
function stopAnimation(evt) {
  button.removeEventListener(evt.type, stopAnimation);
  button.addEventListener("click", startAnimation);
  verb.textContent = "start";
  // Stop animation by clearing the timer.
  clearInterval(timer);
}
// Call stopAnimation() once to set up the initial event
// handlers for canvas and button.
stopAnimation({ type: "click" });

const gl = canvas.getContext("webgl");
gl.viewport(0, 0, gl.drawingBufferWidth, gl.drawingBufferHeight);
function drawAnimation() {
  // Get a random color value using a helper function.
  const color = getRandomColor();
  // Set the WebGLRenderingContext clear color to the
  // random color.
  gl.clearColor(color[0], color[1], color[2], 1.0);
  // Clear the context with the newly set color.
  gl.clear(gl.COLOR_BUFFER_BIT);
}

// Random color helper function.
function getRandomColor() {
  return [Math.random(), Math.random(), Math.random()];
}
```

Mã nguồn của ví dụ này cũng có trên [GitHub](https://github.com/idofilin/webgl-by-example/tree/master/simple-color-animation).

{{PreviousNext("Web/API/WebGL_API/By_example/Clearing_by_clicking","Web/API/WebGL_API/By_example/Color_masking")}}
