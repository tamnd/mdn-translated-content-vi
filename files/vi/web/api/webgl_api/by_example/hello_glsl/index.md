---
title: Xin chào GLSL
slug: Web/API/WebGL_API/By_example/Hello_GLSL
page-type: guide
---

{{DefaultAPISidebar("WebGL")}}{{PreviousNext("Web/API/WebGL_API/By_example/Raining_rectangles","Web/API/WebGL_API/By_example/Hello_vertex_attributes")}}

Ví dụ về WebGL này trình bày một chương trình đổ bóng GLSL rất cơ bản để vẽ một hình vuông màu đồng nhất.

> [!LƯU Ý]
> Ví dụ này rất có thể sẽ hoạt động trong tất cả các trình duyệt máy tính để bàn hiện đại. Nhưng nó có thể không hoạt động trong một số trình duyệt di động hoặc cũ hơn. Nếu khung vẽ vẫn trống, bạn có thể kiểm tra đầu ra của ví dụ tiếp theo, nó vẽ chính xác thứ tương tự. Nhưng hãy nhớ đọc qua phần giải thích và mã trên trang này trước khi chuyển sang trang tiếp theo.

## Chương trình Hello World trong GLSL

{{EmbedLiveSample("Hello_World_program_in_GLSL",660,425)}}

Một chương trình đổ bóng đầu tiên rất đơn giản.

```html hidden
<p>Hello World! Hello GLSL!</p>
```

```html hidden
<canvas>Your browser does not seem to support HTML canvas.</canvas>
```

```css hidden
body {
  text-align: center;
}
canvas {
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

```html
<script type="x-shader/x-vertex" id="vertex-shader">
  #version 100
  void main() {
    gl_Position = vec4(0.0, 0.0, 0.0, 1.0);
    gl_PointSize = 64.0;
  }
</script>
```

```html
<script type="x-shader/x-fragment" id="fragment-shader">
  #version 100
  void main() {
    gl_FragColor = vec4(0.18, 0.54, 0.34, 1.0);
  }
</script>
```

```js
const canvas = document.querySelector("canvas");

const gl = getRenderingContext();
let source = document.querySelector("#vertex-shader").innerHTML;
const vertexShader = gl.createShader(gl.VERTEX_SHADER);
gl.shaderSource(vertexShader, source);
gl.compileShader(vertexShader);

source = document.querySelector("#fragment-shader").innerHTML;
const fragmentShader = gl.createShader(gl.FRAGMENT_SHADER);
gl.shaderSource(fragmentShader, source);
gl.compileShader(fragmentShader);
const program = gl.createProgram();
gl.attachShader(program, vertexShader);
gl.attachShader(program, fragmentShader);
gl.linkProgram(program);
gl.detachShader(program, vertexShader);
gl.detachShader(program, fragmentShader);
gl.deleteShader(vertexShader);
gl.deleteShader(fragmentShader);
if (!gl.getProgramParameter(program, gl.LINK_STATUS)) {
  const linkErrLog = gl.getProgramInfoLog(program);
  cleanup();
  document.querySelector("p").textContent =
    `Shader program did not link successfully. Error log: ${linkErrLog}`;
  throw new Error("Program failed to link");
}

let buffer;
initializeAttributes();

gl.useProgram(program);
gl.drawArrays(gl.POINTS, 0, 1);

cleanup();

function getRenderingContext() {
  canvas.width = canvas.clientWidth;
  canvas.height = canvas.clientHeight;
  const gl = canvas.getContext("webgl");
  gl.viewport(0, 0, gl.drawingBufferWidth, gl.drawingBufferHeight);
  gl.clearColor(0.0, 0.0, 0.0, 1.0);
  gl.clear(gl.COLOR_BUFFER_BIT);
  return gl;
}

function initializeAttributes() {
  gl.enableVertexAttribArray(0);
  buffer = gl.createBuffer();
  gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
  gl.vertexAttribPointer(0, 1, gl.FLOAT, false, 0, 0);
}

function cleanup() {
  gl.useProgram(null);
  if (buffer) {
    gl.deleteBuffer(buffer);
  }
  if (program) {
    gl.deleteProgram(program);
  }
}
```

Mã nguồn của ví dụ này cũng có trên [GitHub](https://github.com/idofilin/webgl-by-example/tree/master/hello-glsl).

{{PreviousNext("Web/API/WebGL_API/By_example/Raining_rectangles","Web/API/WebGL_API/By_example/Hello_vertex_attributes")}}
