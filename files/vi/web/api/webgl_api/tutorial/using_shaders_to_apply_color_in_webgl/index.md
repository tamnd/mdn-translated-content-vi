---
title: Sử dụng trình đổ bóng để áp dụng màu trong WebGL
slug: Web/API/WebGL_API/Tutorial/Using_shaders_to_apply_color_in_WebGL
page-type: guide
---

{{PreviousNext("Web/API/WebGL_API/Tutorial/Adding_2D_content_to_a_WebGL_context", "Web/API/WebGL_API/Tutorial/Animating_objects_with_WebGL")}} {{PreviousNext("Web/API/WebGL_API/Tutorial/Adding_2D_content_to_a_WebGL_context", "Web/API/WebGL_API/Tutorial/Animating_objects_with_WebGL")}}
Sau khi tạo một mặt phẳng hình vuông trong [mục trình diễn trước](/en-US/docs/Web/API/WebGL_API/Tutorial/Adding_2D_content_to_a_WebGL_context), bước hiển nhiên tiếp theo là thêm một vệt màu vào mặt phẳng đó. Chúng ta có thể làm điều này bằng cách sửa đổi các shader.

## Áp dụng màu cho các đỉnh

Trong WebGL, các đối tượng được xây dựng bằng cách sử dụng các tập hợp các đỉnh, mỗi đỉnh có một vị trí và một màu. Theo mặc định, tất cả màu sắc của các pixel khác (và tất cả các thuộc tính khác của nó, bao gồm cả vị trí) được tính toán bằng phép nội suy, tự động tạo độ chuyển màu mượt mà. Trước đây, trình đổ bóng đỉnh của chúng tôi không áp dụng bất kỳ màu cụ thể nào cho các đỉnh. Giữa điều này và trình đổ bóng phân đoạn gán màu trắng cố định cho mỗi pixel, toàn bộ hình vuông được hiển thị dưới dạng màu trắng đồng nhất.

Giả sử chúng ta muốn hiển thị một gradient trong đó mỗi góc của hình vuông có một màu khác nhau: đỏ, xanh dương, xanh lá cây và trắng. Điều đầu tiên cần làm là thiết lập các màu này cho bốn đỉnh. Để làm điều này, trước tiên chúng ta cần tạo một mảng các màu đỉnh, sau đó lưu nó vào bộ đệm WebGL.

> [!NOTE]
> Thêm chức năng sau vào mô-đun `init-buffers.js` của bạn:

```js
function initColorBuffer(gl) {
  const colors = [
    1.0,
    1.0,
    1.0,
    1.0, // white
    1.0,
    0.0,
    0.0,
    1.0, // red
    0.0,
    1.0,
    0.0,
    1.0, // green
    0.0,
    0.0,
    1.0,
    1.0, // blue
  ];

  const colorBuffer = gl.createBuffer();
  gl.bindBuffer(gl.ARRAY_BUFFER, colorBuffer);
  gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(colors), gl.STATIC_DRAW);

  return colorBuffer;
}
```

Mã này bắt đầu bằng cách tạo một mảng JavaScript chứa bốn vectơ 4 giá trị, một vectơ cho mỗi màu đỉnh. Sau đó, bộ đệm WebGL mới được phân bổ để lưu trữ các màu này và mảng được chuyển đổi thành các số float và được lưu vào bộ đệm.

Tất nhiên, chúng ta cũng cần gọi hàm mới này từ `initBuffers()` và trả về bộ đệm mới mà nó tạo.

> [!NOTE]
> Ở cuối hàm `initBuffers()`, hãy thêm đoạn mã sau, thay thế câu lệnh `return` hiện có:

```js
const colorBuffer = initColorBuffer(gl);

return {
  position: positionBuffer,
  color: colorBuffer,
};
```

Để sử dụng những màu này, vertex shader cần được cập nhật để lấy màu thích hợp từ bộ đệm màu.

> [!NOTE]
> Cập nhật khai báo `vsSource` trong hàm `main()` của bạn như thế này:

```js
// Vertex shader program

const vsSource = `
    attribute vec4 aVertexPosition;
    attribute vec4 aVertexColor;

    uniform mat4 uModelViewMatrix;
    uniform mat4 uProjectionMatrix;

    varying lowp vec4 vColor;

    void main(void) {
      gl_Position = uProjectionMatrix * uModelViewMatrix * aVertexPosition;
      vColor = aVertexColor;
    }
  `;
```

Điểm khác biệt chính ở đây là đối với mỗi đỉnh, chúng ta chuyển màu của nó bằng cách sử dụng `variing` cho trình đổ bóng phân đoạn.

## Tô màu các mảnh vỡ

Để chọn màu nội suy cho từng pixel, chúng ta cần thay đổi trình đổ bóng phân đoạn để lấy giá trị từ biến thể `vColor`.

> [!NOTE]
> Cập nhật khai báo `fsSource` trong hàm `main()` của bạn như thế này:

```js
// Fragment shader program

const fsSource = `
    varying lowp vec4 vColor;

    void main(void) {
      gl_FragColor = vColor;
    }
  `;
```

Mỗi đoạn nhận được màu nội suy dựa trên vị trí của nó so với vị trí đỉnh thay vì một giá trị cố định.

## Vẽ bằng màu sắc

Tiếp theo, bạn cần thêm mã để tra cứu vị trí thuộc tính cho màu sắc và thiết lập thuộc tính đó cho chương trình đổ bóng.

> [!NOTE]
> Cập nhật khai báo `programInfo` trong hàm `main()` của bạn như thế này:

```js
// Collect all the info needed to use the shader program.
// Look up which attributes our shader program is using
// for aVertexPosition, aVertexColor and also
// look up uniform locations.
const programInfo = {
  program: shaderProgram,
  attribLocations: {
    vertexPosition: gl.getAttribLocation(shaderProgram, "aVertexPosition"),
    vertexColor: gl.getAttribLocation(shaderProgram, "aVertexColor"),
  },
  uniformLocations: {
    projectionMatrix: gl.getUniformLocation(shaderProgram, "uProjectionMatrix"),
    modelViewMatrix: gl.getUniformLocation(shaderProgram, "uModelViewMatrix"),
  },
};
```

Tiếp theo, `drawScene()` cần sử dụng các màu này khi vẽ hình vuông.

> [!NOTE]
> Thêm chức năng sau vào mô-đun `draw-scene.js` của bạn:

```js
// Tell WebGL how to pull out the colors from the color buffer
// into the vertexColor attribute.
function setColorAttribute(gl, buffers, programInfo) {
  const numComponents = 4;
  const type = gl.FLOAT;
  const normalize = false;
  const stride = 0;
  const offset = 0;
  gl.bindBuffer(gl.ARRAY_BUFFER, buffers.color);
  gl.vertexAttribPointer(
    programInfo.attribLocations.vertexColor,
    numComponents,
    type,
    normalize,
    stride,
    offset,
  );
  gl.enableVertexAttribArray(programInfo.attribLocations.vertexColor);
}
```

> [!NOTE]
> Gọi hàm `setColorAttribution()` từ `drawScene()`, ngay trước lệnh gọi `gl.useProgram()`:

```js
setColorAttribute(gl, buffers, programInfo);
```

Kết quả bây giờ sẽ trông như thế này:

{{EmbedGHLiveSample('dom-examples/webgl-examples/tutorial/sample3/index.html', 670, 510) }}

[Xem mã hoàn chỉnh](https://github.com/mdn/dom-examples/tree/main/webgl-examples/tutorial/sample3) | [Mở bản demo này trên một trang mới](https://mdn.github.io/dom-examples/webgl-examples/tutorial/sample3/)

{{PreviousNext("Web/API/WebGL_API/Tutorial/Adding_2D_content_to_a_WebGL_context", "Web/API/WebGL_API/Tutorial/Animating_objects_with_WebGL")}}
