---
title: Tạo đối tượng 3D bằng WebGL
slug: Web/API/WebGL_API/Tutorial/Creating_3D_objects_using_WebGL
page-type: guide
---

{{PreviousNext("Web/API/WebGL_API/Tutorial/Animating_objects_with_WebGL", "Web/API/WebGL_API/Tutorial/Using_textures_in_WebGL")}} {{PreviousNext("Web/API/WebGL_API/Tutorial/Animating_objects_with_WebGL", "Web/API/WebGL_API/Tutorial/Using_textures_in_WebGL")}}
Hãy biến mặt phẳng hình vuông của chúng ta thành ba chiều bằng cách thêm năm mặt nữa để tạo thành một khối lập phương. Để thực hiện điều này một cách hiệu quả, chúng ta sẽ chuyển từ vẽ trực tiếp bằng cách sử dụng các đỉnh bằng cách gọi phương thức {{domxref("WebGLRenderingContext.drawElements()", "gl.drawElements()")}} sang sử dụng mảng đỉnh làm bảng và tham chiếu các đỉnh riêng lẻ trong bảng đó để xác định vị trí của các đỉnh của mỗi mặt, bằng cách gọi {{domxref("WebGLRenderingContext.drawElements()", "gl.drawElements()")}}.
Hãy xem xét: mỗi mặt cần có bốn đỉnh để xác định nó, nhưng mỗi đỉnh được chia sẻ bởi ba mặt. Chúng ta có thể truyền ít dữ liệu hơn bằng cách xây dựng một mảng gồm tất cả 24 đỉnh, sau đó tham chiếu từng đỉnh theo chỉ mục của nó vào mảng đó thay vì di chuyển toàn bộ bộ tọa độ xung quanh. Nếu bạn thắc mắc tại sao chúng ta cần 24 đỉnh chứ không chỉ 8, thì đó là vì mỗi góc thuộc về ba mặt có màu khác nhau và một đỉnh cần có một màu cụ thể; do đó chúng ta sẽ tạo ba bản sao của mỗi đỉnh với ba màu khác nhau, một bản cho mỗi mặt.

## Xác định vị trí các đỉnh của hình lập phương

Trước tiên, hãy xây dựng bộ đệm vị trí đỉnh của khối bằng cách cập nhật mã trong `initBuffers()`. Điều này khá giống với mặt phẳng hình vuông, nhưng dài hơn một chút vì có 24 đỉnh (4 cạnh).

Trong hàm `initPositionBuffer()` của mô-đun "init-buffers.js", hãy thay thế khai báo `positions` bằng mã này:

```js
const positions = [
  // Front face
  -1.0, -1.0, 1.0, 1.0, -1.0, 1.0, 1.0, 1.0, 1.0, -1.0, 1.0, 1.0,

  // Back face
  -1.0, -1.0, -1.0, -1.0, 1.0, -1.0, 1.0, 1.0, -1.0, 1.0, -1.0, -1.0,

  // Top face
  -1.0, 1.0, -1.0, -1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, -1.0,

  // Bottom face
  -1.0, -1.0, -1.0, 1.0, -1.0, -1.0, 1.0, -1.0, 1.0, -1.0, -1.0, 1.0,

  // Right face
  1.0, -1.0, -1.0, 1.0, 1.0, -1.0, 1.0, 1.0, 1.0, 1.0, -1.0, 1.0,

  // Left face
  -1.0, -1.0, -1.0, -1.0, -1.0, 1.0, -1.0, 1.0, 1.0, -1.0, 1.0, -1.0,
];
```

Vì chúng ta đã thêm thành phần z vào các đỉnh của mình nên chúng ta cần cập nhật `numComponents` của thuộc tính `vertexPosition` thành 3.

Trong hàm `setPositionAttribution()` của mô-đun "draw-scene.js" của bạn, hãy thay đổi hằng số `numComponents` từ `2` thành `3`:

```js
const numComponents = 3;
```

## Xác định màu của các đỉnh

Chúng ta cũng cần xây dựng một dãy màu cho mỗi đỉnh trong số 24 đỉnh. Mã này bắt đầu bằng cách xác định màu cho mỗi mặt, sau đó sử dụng vòng lặp để tập hợp một mảng gồm tất cả các màu cho mỗi đỉnh.

Trong hàm `initColorBuffer()` của mô-đun "init-buffers.js", hãy thay thế khai báo `colors` bằng mã này:

```js
const faceColors = [
  [1.0, 1.0, 1.0, 1.0], // Front face: white
  [1.0, 0.0, 0.0, 1.0], // Back face: red
  [0.0, 1.0, 0.0, 1.0], // Top face: green
  [0.0, 0.0, 1.0, 1.0], // Bottom face: blue
  [1.0, 1.0, 0.0, 1.0], // Right face: yellow
  [1.0, 0.0, 1.0, 1.0], // Left face: purple
];

// Convert the array of colors into a table for all the vertices.

let colors = [];

for (const c of faceColors) {
  // Repeat each color four times for the four vertices of the face
  colors = colors.concat(c, c, c, c);
}
```

## Xác định mảng phần tử

Khi các mảng đỉnh được tạo, chúng ta cần xây dựng mảng phần tử.

Trong mô-đun "init-buffer.js" của bạn, hãy thêm chức năng sau:

```js
function initIndexBuffer(gl) {
  const indexBuffer = gl.createBuffer();
  gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, indexBuffer);

  // This array defines each face as two triangles, using the
  // indices into the vertex array to specify each triangle's
  // position.

  // prettier-ignore
  const indices = [
     0,  1,  2,      0,  2,  3,    // front
     4,  5,  6,      4,  6,  7,    // back
     8,  9,  10,     8,  10, 11,   // top
     12, 13, 14,     12, 14, 15,   // bottom
     16, 17, 18,     16, 18, 19,   // right
     20, 21, 22,     20, 22, 23,   // left
  ];

  // Now send the element array to GL

  gl.bufferData(
    gl.ELEMENT_ARRAY_BUFFER,
    new Uint16Array(indices),
    gl.STATIC_DRAW,
  );

  return indexBuffer;
}
```

Mảng `chỉ số` xác định mỗi mặt giống như một cặp hình tam giác, chỉ định các đỉnh của mỗi tam giác làm chỉ mục trong mảng đỉnh của hình khối. Do đó, khối lập phương được mô tả là một tập hợp gồm 12 hình tam giác.

Tiếp theo, bạn cần gọi hàm mới này từ `initBuffers()` và trả về bộ đệm mà nó tạo.

Ở cuối hàm `initBuffers()` của mô-đun "init-buffers.js", hãy thêm đoạn mã sau, thay thế câu lệnh `return` hiện có:

```js
function initBuffers(gl) {
  // …

  const indexBuffer = initIndexBuffer(gl);

  return {
    position: positionBuffer,
    color: colorBuffer,
    indices: indexBuffer,
  };
}
```

## Vẽ hình khối

Tiếp theo, chúng ta cần thêm mã vào hàm `drawScene()` để vẽ bằng bộ đệm chỉ mục của khối, thêm các lệnh gọi {{domxref("WebGLRenderingContext.drawElements()", "gl.drawElements()")}} và {{domxref("WebGLRenderingContext.drawElements()", "gl.drawElements()")}} mới.
Trong hàm `drawScene()` của bạn, hãy thêm đoạn mã sau ngay trước dòng `gl.useProgram`:

```js
// Tell WebGL which indices to use to index the vertices
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, buffers.indices);
```

Trong hàm `drawScene()` của mô-đun "draw-scene.js" của bạn, hãy thay thế khối ngay sau hai lệnh gọi `gl.uniformMatrix4fv`, chứa dòng `gl.drawArrays()`, bằng khối sau:

```js
{
  const vertexCount = 36;
  const type = gl.UNSIGNED_SHORT;
  const offset = 0;
  gl.drawElements(gl.TRIANGLES, vertexCount, type, offset);
}
```

Vì mỗi mặt của khối lập phương của chúng ta bao gồm hai hình tam giác nên có 6 đỉnh mỗi cạnh hoặc tổng cộng 36 đỉnh trong khối lập phương, mặc dù nhiều trong số đó là các đỉnh trùng lặp.

Cuối cùng, hãy thay thế biến `squareRotation` của chúng ta bằng `cubeRotation` và thêm phép xoay thứ hai quanh trục x.

Khi bắt đầu tệp "webgl-demo.js", hãy thay thế khai báo `squareRotation` bằng dòng này:

```js
let cubeRotation = 0.0;
```

Trong phần khai báo hàm `drawScene()` của bạn, hãy thay thế `squareRotation` bằng `cubeRotation`:

```js
function drawScene(gl, programInfo, buffers, cubeRotation) {
  // …
}
```

Trong hàm `drawScene()` của bạn, hãy thay thế lệnh gọi `mat4.rotate` bằng mã sau:

```js
mat4.rotate(
  modelViewMatrix, // destination matrix
  modelViewMatrix, // matrix to rotate
  cubeRotation, // amount to rotate in radians
  [0, 0, 1],
); // axis to rotate around (Z)
mat4.rotate(
  modelViewMatrix, // destination matrix
  modelViewMatrix, // matrix to rotate
  cubeRotation * 0.7, // amount to rotate in radians
  [0, 1, 0],
); // axis to rotate around (Y)
mat4.rotate(
  modelViewMatrix, // destination matrix
  modelViewMatrix, // matrix to rotate
  cubeRotation * 0.3, // amount to rotate in radians
  [1, 0, 0],
); // axis to rotate around (X)
```

Trong hàm `main()` của bạn, hãy thay thế mã gọi `drawScene()` và cập nhật `squareRotation` để chuyển vào và cập nhật `cubeRotation`:

```js
drawScene(gl, programInfo, buffers, cubeRotation);
cubeRotation += deltaTime;
```

Tại thời điểm này, chúng ta có một khối hoạt hình đang xoay, sáu mặt của nó có màu sắc khá sống động.

{{EmbedGHLiveSample('dom-examples/webgl-examples/tutorial/sample5/index.html', 670, 510) }}

[Xem mã hoàn chỉnh](https://github.com/mdn/dom-examples/tree/main/webgl-examples/tutorial/sample5) | [Mở bản demo này trên một trang mới](https://mdn.github.io/dom-examples/webgl-examples/tutorial/sample5/)

{{PreviousNext("Web/API/WebGL_API/Tutorial/Animating_objects_with_WebGL", "Web/API/WebGL_API/Tutorial/Using_textures_in_WebGL")}}
