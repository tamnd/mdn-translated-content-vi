---
title: Hoạt hình cắt kéo
slug: Web/API/WebGL_API/By_example/Scissor_animation
page-type: guide
---

{{DefaultAPISidebar("WebGL")}}{{PreviousNext("Web/API/WebGL_API/By_example/Boilerplate_1","Web/API/WebGL_API/By_example/Raining_rectangles")}}

Một ví dụ WebGL đơn giản trong đó chúng ta có một số hoạt ảnh thú vị bằng cách sử dụng các thao tác cắt kéo và xóa.

## Hoạt hình bằng cách cắt kéo

{{EmbedLiveSample("Animation_with_scissoring",660,425)}}

Trong ví dụ này, chúng tôi đang tạo hiệu ứng hình vuông bằng cách sử dụng {{domxref("WebGLRenderingContext.scissor()","scissor()")}} và {{domxref("WebGLRenderingContext.clear()","clear()")}}. Chúng tôi lại thiết lập một vòng lặp hoạt ảnh bằng cách sử dụng bộ tính giờ. Lưu ý rằng lần này vị trí của hình vuông (khu vực cắt kéo) được cập nhật ở mọi khung hình (chúng tôi đặt tốc độ khung hình ở khoảng 17 mili giây một khung hình hoặc khoảng 60 khung hình/giây – khung hình trên giây).

Ngược lại, màu của hình vuông (được đặt bằng {{domxref("WebGLRenderingContext.clearColor()","clearColor")}}) chỉ được cập nhật khi một hình vuông mới được tạo. Đây là một minh chứng thú vị về {{glossary("WebGL")}} như một máy trạng thái. Đối với mỗi hình vuông, chúng tôi đặt màu cho nó một lần và sau đó chỉ cập nhật vị trí của nó trong mỗi khung hình. Trạng thái màu rõ ràng của WebGL vẫn ở giá trị đã đặt cho đến khi chúng ta thay đổi lại khi tạo một hình vuông mới.

```html hidden
<p>
  WebGL animation by clearing the drawing buffer with solid color and applying
  scissor test.
</p>
<button id="animation-onoff">
  Press here to <strong>[verb goes here]</strong> the animation.
</button>
```

```html hidden
<canvas>Your browser does not seem to support canvases.</canvas>
```

```css hidden
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

```js
const canvas = document.querySelector("canvas");

// Variables to hold the WebGL context, and the color and
// position of animated squares.
const gl = getRenderingContext();
let color = getRandomColor();
// Unlike the browser window, vertical position in WebGL is
// measured from bottom to top. In here we set the initial
// position of the square to be at the top left corner of the
// drawing buffer.
let position = [0, gl.drawingBufferHeight];

gl.enable(gl.SCISSOR_TEST);
gl.clearColor(color[0], color[1], color[2], 1.0);

const button = document.querySelector("button");
let timer;

function getRenderingContext() {
  canvas.width = canvas.clientWidth;
  canvas.height = canvas.clientHeight;
  const gl = canvas.getContext("webgl");
  gl.viewport(0, 0, gl.drawingBufferWidth, gl.drawingBufferHeight);
  gl.clearColor(0.0, 0.0, 0.0, 1.0);
  gl.clear(gl.COLOR_BUFFER_BIT);
  return gl;
}

function startAnimation(evt) {
  button.removeEventListener(evt.type, startAnimation);
  button.addEventListener("click", stopAnimation);
  document.querySelector("strong").textContent = "stop";
  timer = setInterval(drawAnimation, 17);
  drawAnimation();
}

function stopAnimation(evt) {
  button.removeEventListener(evt.type, stopAnimation);
  button.addEventListener("click", startAnimation);
  document.querySelector("strong").textContent = "start";
  clearInterval(timer);
}

stopAnimation({ type: "click" });

// Variables to hold the size and velocity of the square.
const size = [60, 60];
let velocity = 3.0;
function drawAnimation() {
  gl.scissor(position[0], position[1], size[0], size[1]);
  gl.clear(gl.COLOR_BUFFER_BIT);
  // Every frame the vertical position of the square is
  // decreased, to create the illusion of movement.
  position[1] -= velocity;
  // When the square hits the bottom of the drawing buffer,
  // we override it with new square of different color and
  // velocity.
  if (position[1] < 0) {
    // Horizontal position chosen randomly, and vertical
    // position at the top of the drawing buffer.
    position = [
      Math.random() * (gl.drawingBufferWidth - size[0]),
      gl.drawingBufferHeight,
    ];
    // Random velocity between 1.0 and 7.0
    velocity = 1.0 + 6.0 * Math.random();
    color = getRandomColor();
    gl.clearColor(color[0], color[1], color[2], 1.0);
  }
}

function getRandomColor() {
  return [Math.random(), Math.random(), Math.random()];
}
```

Mã nguồn của ví dụ này cũng có trên [GitHub](https://github.com/idofilin/webgl-by-example/tree/master/scissor-animation).

{{PreviousNext("Web/API/WebGL_API/By_example/Boilerplate_1","Web/API/WebGL_API/By_example/Raining_rectangles")}}
