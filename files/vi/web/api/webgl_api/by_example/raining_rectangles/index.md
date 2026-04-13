---
title: Hình chữ nhật mưa
slug: Web/API/WebGL_API/By_example/Raining_rectangles
page-type: guide
---

{{DefaultAPISidebar("WebGL")}}{{PreviousNext("Web/API/WebGL_API/By_example/Scissor_animation","Web/API/WebGL_API/By_example/Hello_GLSL")}}

Một trò chơi WebGL đơn giản thể hiện khả năng xóa bằng màu đồng nhất, cắt kéo, hoạt ảnh và tương tác của người dùng.

## Hoạt ảnh và tương tác của người dùng với tính năng cắt kéo

{{EmbedLiveSample("Animation_and_user_interaction_with_scissoring",660,425)}}

Đây là một trò chơi đơn giản. Mục tiêu: cố gắng bắt càng nhiều hình chữ nhật đang mưa càng tốt bằng cách nhấp vào chúng. Trong ví dụ này, chúng tôi sử dụng cách tiếp cận hướng đối tượng cho các hình chữ nhật được hiển thị, giúp giữ trạng thái của hình chữ nhật (vị trí, màu sắc, v.v.) được sắp xếp ở một nơi và mã tổng thể nhỏ gọn hơn và có thể tái sử dụng.

Ví dụ này kết hợp việc xóa vùng đệm vẽ bằng các thao tác cắt kéo và màu đồng nhất. Đây là bản xem trước của một ứng dụng đồ họa đầy đủ thao tác các giai đoạn khác nhau của đường dẫn đồ họa và máy trạng thái {{glossary("WebGL")}}.

Ngoài ra, ví dụ này minh họa cách tích hợp các lệnh gọi hàm WebGL trong vòng lặp trò chơi. Vòng lặp trò chơi chịu trách nhiệm vẽ các khung hoạt ảnh và giữ cho hoạt ảnh phản hồi theo đầu vào của người dùng. Ở đây, vòng lặp trò chơi được triển khai bằng cách sử dụng thời gian chờ.

```html hidden
<p>You caught <strong>0</strong>. You missed <strong>0</strong>.</p>
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
const [scoreDisplay, missesDisplay] = document.querySelectorAll("strong");

function getRenderingContext() {
  canvas.width = canvas.clientWidth;
  canvas.height = canvas.clientHeight;
  const gl = canvas.getContext("webgl");
  gl.viewport(0, 0, gl.drawingBufferWidth, gl.drawingBufferHeight);
  gl.clearColor(0.0, 0.0, 0.0, 1.0);
  gl.clear(gl.COLOR_BUFFER_BIT);
  return gl;
}

const gl = getRenderingContext();
gl.enable(gl.SCISSOR_TEST);

function getRandomVector() {
  return [Math.random(), Math.random(), Math.random()];
}

class Rectangle {
  constructor() {
    // We get three random numbers and use them for new rectangle
    // size and position. For each we use a different number,
    // because we want horizontal size, vertical size and
    // position to be determined independently.
    const randVec = getRandomVector();
    this.size = [5 + 120 * randVec[0], 5 + 120 * randVec[1]];
    this.position = [
      randVec[2] * (gl.drawingBufferWidth - this.size[0]),
      gl.drawingBufferHeight,
    ];
    this.velocity = 1.0 + 6.0 * Math.random();
    this.color = getRandomVector();
    gl.clearColor(this.color[0], this.color[1], this.color[2], 1.0);
  }
}

let rainingRect = new Rectangle();

let score = 0;
let misses = 0;
let timer = null;
function drawAnimation() {
  gl.scissor(
    rainingRect.position[0],
    rainingRect.position[1],
    rainingRect.size[0],
    rainingRect.size[1],
  );
  gl.clear(gl.COLOR_BUFFER_BIT);
  rainingRect.position[1] -= rainingRect.velocity;
  if (rainingRect.position[1] < 0) {
    misses += 1;
    missesDisplay.textContent = misses;
    rainingRect = new Rectangle();
  }
  // We are using setTimeout for animation. So we reschedule
  // the timeout to call drawAnimation again in 17ms.
  // Otherwise we won't get any animation.
  timer = setTimeout(drawAnimation, 17);
}

function playerClick(evt) {
  // We need to transform the position of the click event from
  // window coordinates to relative position inside the canvas.
  // In addition we need to remember that vertical position in
  // WebGL increases from bottom to top, unlike in the browser
  // window.
  const position = [
    evt.pageX - evt.target.offsetLeft,
    gl.drawingBufferHeight - (evt.pageY - evt.target.offsetTop),
  ];
  // If the click falls inside the rectangle, we caught it.

  // Increment score and create a new rectangle.
  const diffPos = [
    position[0] - rainingRect.position[0],
    position[1] - rainingRect.position[1],
  ];
  if (
    diffPos[0] >= 0 &&
    diffPos[0] < rainingRect.size[0] &&
    diffPos[1] >= 0 &&
    diffPos[1] < rainingRect.size[1]
  ) {
    score += 1;
    scoreDisplay.textContent = score;
    rainingRect = new Rectangle();
  }
}

timer = setTimeout(drawAnimation, 17);
canvas.addEventListener("click", playerClick);
```

Mã nguồn của ví dụ này cũng có trên [GitHub](https://github.com/idofilin/webgl-by-example/tree/master/raining-ectangles).

{{PreviousNext("Web/API/WebGL_API/By_example/Scissor_animation","Web/API/WebGL_API/By_example/Hello_GLSL")}}
