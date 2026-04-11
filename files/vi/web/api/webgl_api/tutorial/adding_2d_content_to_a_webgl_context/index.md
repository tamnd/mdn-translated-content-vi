---
title: Thêm nội dung 2D vào ngữ cảnh WebGL
slug: Web/API/WebGL_API/Tutorial/Adding_2D_content_to_a_WebGL_context
page-type: guide
---

{{PreviousNext("Web/API/WebGL_API/Tutorial/Getting_started_with_WebGL", "Web/API/WebGL_API/Tutorial/Using_shaders_to_apply_color_in_WebGL")}} {{PreviousNext("Web/API/WebGL_API/Tutorial/Getting_started_with_WebGL", "Web/API/WebGL_API/Tutorial/Using_shaders_to_apply_color_in_WebGL")}}
Sau khi đã [tạo bối cảnh WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial/Getting_started_with_WebGL thành công), bạn có thể bắt đầu hiển thị trong đó. Một điều đơn giản chúng ta có thể làm là vẽ một mặt phẳng hình vuông không có họa tiết, vì vậy hãy bắt đầu từ đó.

Mã nguồn hoàn chỉnh cho dự án này [có sẵn trên GitHub](https://github.com/mdn/dom-examples/tree/main/webgl-examples/tutorial/sample2).

## Bao gồm thư viện glMatrix

Dự án này sử dụng thư viện [glMatrix](https://glmatrix.net/) để thực hiện các phép toán ma trận, vì vậy bạn sẽ cần đưa thư viện đó vào dự án của mình. Chúng tôi đang tải một bản sao từ CDN.

> [!NOTE]
> Cập nhật "index.html" của bạn để nó trông như thế này:

```html
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>WebGL Demo</title>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/gl-matrix/2.8.1/gl-matrix-min.js"
      integrity="sha512-zhHQR0/H5SEBL3Wn6yYSaTTZej12z0hVZKOv3TwCUXT1z5qeqGcXJLLrbERYRScEDDpYIJhPC1fk31gqR783iQ=="
      crossorigin="anonymous"
      defer></script>
    <script src="webgl-demo.js" type="module"></script>
  </head>

  <body>
    <canvas id="gl-canvas" width="640" height="480"></canvas>
  </body>
</html>
```

## Vẽ cảnh

Điều quan trọng nhất cần hiểu trước khi bắt đầu là mặc dù chúng ta chỉ hiển thị một vật thể mặt phẳng hình vuông trong ví dụ này, chúng ta vẫn đang vẽ trong không gian 3D. Chỉ là chúng ta đang vẽ một hình vuông và đặt nó ngay trước máy ảnh vuông góc với hướng nhìn. Chúng ta cần xác định các shader sẽ tạo màu cho khung cảnh đơn giản cũng như vẽ đối tượng của chúng ta. Những điều này sẽ thiết lập cách mặt phẳng hình vuông xuất hiện trên màn hình.

### Trình đổ bóng

**Shader** là một chương trình được viết bằng [Ngôn ngữ tạo bóng OpenGL ES](https://registry.khronos.org/OpenGL/specs/es/3.2/GLSL_ES_Specification_3.20.pdf) (**GLSL**), chương trình này lấy thông tin về các đỉnh tạo nên hình dạng và tạo ra dữ liệu cần thiết để hiển thị các pixel trên màn hình: cụ thể là vị trí của các pixel và màu sắc của chúng.

Có hai hàm đổ bóng chạy khi vẽ nội dung WebGL: **trình đổ bóng đỉnh** và **trình đổ bóng phân đoạn**. Bạn viết những thứ này trong GLSL và chuyển văn bản mã vào WebGL để được biên dịch để thực thi trên GPU. Cùng với nhau, một tập hợp các trình đổ bóng đỉnh và đoạn được gọi là **chương trình đổ bóng**.

Chúng ta hãy xem nhanh hai loại trình đổ bóng, với ví dụ về việc vẽ hình dạng 2D vào ngữ cảnh WebGL.

#### Trình đổ bóng đỉnh

Mỗi khi một hình được hiển thị, trình đổ bóng đỉnh sẽ được chạy cho từng đỉnh trong hình đó. Công việc của nó là chuyển đổi đỉnh đầu vào từ hệ tọa độ ban đầu thành hệ tọa độ **[clip space](/en-US/docs/Web/API/WebGL_API/WebGL_model_view_projection#clip_space)** được WebGL sử dụng, trong đó mỗi trục có phạm vi từ -1,0 đến 1,0, bất kể tỷ lệ khung hình, kích thước thực tế hay bất kỳ yếu tố nào khác.

Trình đổ bóng đỉnh phải thực hiện các phép biến đổi cần thiết trên vị trí của đỉnh, thực hiện bất kỳ điều chỉnh hoặc phép tính nào khác mà nó cần thực hiện trên cơ sở từng đỉnh, sau đó trả về đỉnh đã biến đổi bằng cách lưu nó vào một biến đặc biệt do GLSL cung cấp, được gọi là `gl_Position`.

Khi cần, trình đổ bóng đỉnh cũng có thể thực hiện những việc như xác định tọa độ trong kết cấu bề mặt của {{glossary("texel")}} để áp dụng cho đỉnh, áp dụng các chuẩn mực để xác định hệ số chiếu sáng áp dụng cho đỉnh, v.v. Sau đó, thông tin này có thể được lưu trữ trong [varyings](/en-US/docs/Web/API/WebGL_API/Data#varyings) hoặc [attributes](/en-US/docs/Web/API/WebGL_API/Data#attributes) nếu thích hợp để chia sẻ với trình đổ bóng phân đoạn. đoạn.

Trình đổ bóng đỉnh của chúng tôi bên dưới nhận các giá trị vị trí đỉnh từ một thuộc tính mà chúng tôi xác định có tên là `aVertexPosition`. Sau đó, vị trí đó được nhân với hai ma trận 4x4 mà chúng tôi cung cấp có tên là `uProjectionMatrix` và `uModelViewMatrix`; `gl_Position` được đặt thành kết quả. Để biết thêm thông tin về phép chiếu và các ma trận khác [bạn có thể thấy bài viết này hữu ích](https://webglfundamentals.org/webgl/lessons/webgl-3d-perspective.html).

> [!NOTE]
> Thêm mã này vào hàm `main()` của bạn:

```js
// Vertex shader program
const vsSource = `
    attribute vec4 aVertexPosition;
    uniform mat4 uModelViewMatrix;
    uniform mat4 uProjectionMatrix;
    void main() {
      gl_Position = uProjectionMatrix * uModelViewMatrix * aVertexPosition;
    }
  `;
```

Điều đáng lưu ý là chúng tôi đang sử dụng thuộc tính `vec4` cho vị trí đỉnh, thuộc tính này không thực sự sử dụng vectơ 4 thành phần; nghĩa là, nó có thể được xử lý dưới dạng `vec2` hoặc `vec3` tùy theo tình huống. Nhưng khi làm toán, chúng ta sẽ cần nó là `vec4`, vì vậy thay vì chuyển nó thành `vec4` mỗi khi làm toán, chúng ta sẽ chỉ sử dụng `vec4` ngay từ đầu. Điều này giúp loại bỏ các thao tác khỏi mọi phép tính mà chúng tôi thực hiện trong trình đổ bóng của mình. Vấn đề hiệu suất.

Trong ví dụ này, chúng tôi không tính toán bất kỳ ánh sáng nào vì chúng tôi chưa áp dụng bất kỳ ánh sáng nào cho cảnh. Điều đó sẽ xuất hiện sau, trong ví dụ [Lighting in WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial/Lighting_in_WebGL). Cũng lưu ý rằng ở đây không có bất kỳ tác phẩm nào có họa tiết; sẽ được thêm vào trong [Sử dụng họa tiết trong WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial/Using_textures_in_WebGL).

#### Trình đổ bóng phân đoạn

**Bộ đổ bóng mảnh** được gọi một lần cho mỗi pixel trên mỗi hình được vẽ, sau khi các đỉnh của hình đã được xử lý bởi bộ đổ bóng đỉnh. Công việc của nó là xác định màu của pixel đó bằng cách tìm ra texel nào (tức là pixel từ bên trong kết cấu của hình dạng) để áp dụng cho pixel, lấy màu của texel đó, sau đó áp dụng ánh sáng thích hợp cho màu đó. Sau đó, màu được trả về lớp WebGL bằng cách lưu trữ nó trong biến đặc biệt `gl_FragColor`. Màu đó sau đó được vẽ lên màn hình ở đúng vị trí cho pixel tương ứng của hình dạng.

Trong trường hợp này, chúng ta luôn trả về màu trắng vì chúng ta chỉ vẽ một hình vuông màu trắng và không sử dụng ánh sáng.

> [!NOTE]
> Thêm mã này vào hàm `main()` của bạn:

```js
const fsSource = `
    void main() {
      gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0);
    }
  `;
```

### Khởi tạo shader

Bây giờ chúng ta đã xác định được hai shader, chúng ta cần chuyển chúng tới WebGL, biên dịch chúng và liên kết chúng với nhau. Đoạn mã bên dưới tạo hai trình đổ bóng bằng cách gọi `loadShader()`, chuyển loại và nguồn cho trình đổ bóng. Sau đó, nó tạo ra một chương trình, gắn các shader và liên kết chúng lại với nhau. Nếu biên dịch hoặc liên kết không thành công, mã sẽ hiển thị cảnh báo.

> [!NOTE]
> Thêm hai hàm này vào tập lệnh "webgl-demo.js" của bạn:

```js
//
// Initialize a shader program, so WebGL knows how to draw our data
//
function initShaderProgram(gl, vsSource, fsSource) {
  const vertexShader = loadShader(gl, gl.VERTEX_SHADER, vsSource);
  const fragmentShader = loadShader(gl, gl.FRAGMENT_SHADER, fsSource);

  // Create the shader program

  const shaderProgram = gl.createProgram();
  gl.attachShader(shaderProgram, vertexShader);
  gl.attachShader(shaderProgram, fragmentShader);
  gl.linkProgram(shaderProgram);

  // If creating the shader program failed, alert

  if (!gl.getProgramParameter(shaderProgram, gl.LINK_STATUS)) {
    alert(
      `Unable to initialize the shader program: ${gl.getProgramInfoLog(
        shaderProgram,
      )}`,
    );
    return null;
  }

  return shaderProgram;
}

//
// creates a shader of the given type, uploads the source and
// compiles it.
//
function loadShader(gl, type, source) {
  const shader = gl.createShader(type);

  // Send the source to the shader object

  gl.shaderSource(shader, source);

  // Compile the shader program

  gl.compileShader(shader);

  // See if it compiled successfully

  if (!gl.getShaderParameter(shader, gl.COMPILE_STATUS)) {
    alert(
      `An error occurred compiling the shaders: ${gl.getShaderInfoLog(shader)}`,
    );
    gl.deleteShader(shader);
    return null;
  }

  return shader;
}
```

Hàm `loadShader()` lấy bối cảnh WebGL, loại trình đổ bóng và mã nguồn làm đầu vào, sau đó tạo và biên dịch trình đổ bóng như sau:

1. Một trình đổ bóng mới được tạo bằng cách gọi {{domxref("WebGLRenderingContext.createShader", "gl.createShader()")}}.
2. Mã nguồn của trình đổ bóng được gửi tới trình đổ bóng bằng cách gọi {{domxref("WebGLRenderingContext.shaderSource", "gl.shaderSource()")}}.
3. Sau khi trình đổ bóng có mã nguồn, nó sẽ được biên dịch bằng cách sử dụng {{domxref("WebGLRenderingContext.compileShader", "gl.compileShader()")}}.
4. Để kiểm tra xem trình đổ bóng đã được biên dịch thành công hay chưa, tham số trình đổ bóng `gl.COMPILE_STATUS` được chọn. Để lấy giá trị của nó, chúng ta gọi {{domxref("WebGLRenderingContext.getShaderInfoLog", "gl.getShaderInfoLog()")}}, chỉ định shader và tên của tham số mà chúng ta muốn kiểm tra (`gl.COMPILE_STATUS`). Nếu đó là `false`, thì chúng tôi biết trình đổ bóng không biên dịch được, vì vậy, hãy hiển thị cảnh báo cùng với thông tin nhật ký thu được từ trình biên dịch bằng cách sử dụng {{domxref("WebGLRenderingContext.getShaderInfoLog", "gl.getShaderInfoLog()")}}, sau đó xóa trình đổ bóng và trả về `null` để biểu thị lỗi tải trình đổ bóng.óng.
5. Nếu trình đổ bóng đã được tải và biên dịch thành công, trình đổ bóng đã biên dịch sẽ được trả về cho người gọi.

> [!NOTE]
> Thêm mã này vào hàm `main()` của bạn:

```js
// Initialize a shader program; this is where all the lighting
// for the vertices and so forth is established.
const shaderProgram = initShaderProgram(gl, vsSource, fsSource);
```

Sau khi tạo chương trình đổ bóng, chúng ta cần tra cứu các vị trí mà WebGL đã chỉ định cho đầu vào của chúng ta. Trong trường hợp này chúng ta có một thuộc tính và hai đồng phục. Các thuộc tính nhận giá trị từ bộ đệm. Mỗi lần lặp của trình đổ bóng đỉnh sẽ nhận được giá trị tiếp theo từ bộ đệm được gán cho thuộc tính đó. [Đồng phục](/en-US/docs/Web/API/WebGL_API/Data#uniforms) tương tự như các biến toàn cục của JavaScript. Chúng giữ nguyên giá trị cho tất cả các lần lặp của trình đổ bóng. Vì thuộc tính và vị trí thống nhất là dành riêng cho một chương trình đổ bóng duy nhất nên chúng tôi sẽ lưu trữ chúng cùng nhau để giúp chúng dễ dàng được chuyển đi khắp nơi

> [!NOTE]
> Thêm mã này vào hàm `main()` của bạn:

```js
// Collect all the info needed to use the shader program.
// Look up which attribute our shader program is using
// for aVertexPosition and look up uniform locations.
const programInfo = {
  program: shaderProgram,
  attribLocations: {
    vertexPosition: gl.getAttribLocation(shaderProgram, "aVertexPosition"),
  },
  uniformLocations: {
    projectionMatrix: gl.getUniformLocation(shaderProgram, "uProjectionMatrix"),
    modelViewMatrix: gl.getUniformLocation(shaderProgram, "uModelViewMatrix"),
  },
};
```

## Tạo mặt phẳng hình vuông

Trước khi có thể hiển thị mặt phẳng hình vuông, chúng ta cần tạo bộ đệm chứa các vị trí đỉnh của nó và đặt các vị trí đỉnh vào đó.

Chúng ta sẽ thực hiện điều đó bằng cách sử dụng một hàm gọi là `initBuffers()`, hàm này sẽ được triển khai trong một [mô-đun JavaScript](/en-US/docs/Web/JavaScript/Guide/Modules riêng biệt). Khi chúng tôi khám phá các khái niệm WebGL nâng cao hơn, mô-đun này sẽ được tăng cường để tạo ra nhiều đối tượng 3D hơn — và phức tạp hơn.

> [!NOTE]
> Tạo một tệp mới có tên "init-buffers.js" và cung cấp cho nó các nội dung sau:

```js
function initBuffers(gl) {
  const positionBuffer = initPositionBuffer(gl);

  return {
    position: positionBuffer,
  };
}

function initPositionBuffer(gl) {
  // Create a buffer for the square's positions.
  const positionBuffer = gl.createBuffer();

  // Select the positionBuffer as the one to apply buffer
  // operations to from here out.
  gl.bindBuffer(gl.ARRAY_BUFFER, positionBuffer);

  // Now create an array of positions for the square.
  const positions = [1.0, 1.0, -1.0, 1.0, 1.0, -1.0, -1.0, -1.0];

  // Now pass the list of positions into WebGL to build the
  // shape. We do this by creating a Float32Array from the
  // JavaScript array, then use it to fill the current buffer.
  gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(positions), gl.STATIC_DRAW);

  return positionBuffer;
}

export { initBuffers };
```

Quy trình này khá đơn giản dựa trên tính chất cơ bản của cảnh trong ví dụ này. Nó bắt đầu bằng cách gọi phương thức {{domxref("WebGLRenderingContext.bindBuffer()", "bindBuffer()")}} của đối tượng `gl` để lấy một bộ đệm mà chúng ta sẽ lưu trữ các vị trí đỉnh. Sau đó, điều này được liên kết với ngữ cảnh bằng cách gọi phương thức {{domxref("WebGLRenderingContext.bindBuffer()", "bindBuffer()")}}.)}}.

Khi đã xong, chúng ta tạo một mảng JavaScript chứa vị trí của mỗi đỉnh của mặt phẳng hình vuông. Sau đó, điều này được chuyển đổi thành một mảng các float và được chuyển vào phương thức {{domxref("WebGLRenderingContext.bufferData()", "bufferData()")}} của đối tượng `gl` để thiết lập các vị trí đỉnh cho đối tượng.

## Hiển thị cảnh

Sau khi các shader được thiết lập, các vị trí được tra cứu và các vị trí đỉnh của mặt phẳng hình vuông được đặt vào vùng đệm, chúng ta thực sự có thể kết xuất cảnh. Chúng ta sẽ thực hiện điều này trong hàm `drawScene()` mà một lần nữa, chúng ta sẽ triển khai trong một mô-đun JavaScript riêng biệt.

> [!NOTE]
> Tạo một tệp mới có tên "draw-scene.js" và cung cấp cho nó các nội dung sau:

```js
function drawScene(gl, programInfo, buffers) {
  gl.clearColor(0.0, 0.0, 0.0, 1.0); // Clear to black, fully opaque
  gl.clearDepth(1.0); // Clear everything
  gl.enable(gl.DEPTH_TEST); // Enable depth testing
  gl.depthFunc(gl.LEQUAL); // Near things obscure far things

  // Clear the canvas before we start drawing on it.

  gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);

  // Create a perspective matrix, a special matrix that is
  // used to simulate the distortion of perspective in a camera.
  // Our field of view is 45 degrees, with a width/height
  // ratio that matches the display size of the canvas
  // and we only want to see objects between 0.1 units
  // and 100 units away from the camera.

  const fieldOfView = (45 * Math.PI) / 180; // in radians
  const aspect = gl.canvas.clientWidth / gl.canvas.clientHeight;
  const zNear = 0.1;
  const zFar = 100.0;
  const projectionMatrix = mat4.create();

  // note: glMatrix always has the first argument
  // as the destination to receive the result.
  mat4.perspective(projectionMatrix, fieldOfView, aspect, zNear, zFar);

  // Set the drawing position to the "identity" point, which is
  // the center of the scene.
  const modelViewMatrix = mat4.create();

  // Now move the drawing position a bit to where we want to
  // start drawing the square.
  mat4.translate(
    modelViewMatrix, // destination matrix
    modelViewMatrix, // matrix to translate
    [-0.0, 0.0, -6.0],
  ); // amount to translate

  // Tell WebGL how to pull out the positions from the position
  // buffer into the vertexPosition attribute.
  setPositionAttribute(gl, buffers, programInfo);

  // Tell WebGL to use our program when drawing
  gl.useProgram(programInfo.program);

  // Set the shader uniforms
  gl.uniformMatrix4fv(
    programInfo.uniformLocations.projectionMatrix,
    false,
    projectionMatrix,
  );
  gl.uniformMatrix4fv(
    programInfo.uniformLocations.modelViewMatrix,
    false,
    modelViewMatrix,
  );

  {
    const offset = 0;
    const vertexCount = 4;
    gl.drawArrays(gl.TRIANGLE_STRIP, offset, vertexCount);
  }
}

// Tell WebGL how to pull out the positions from the position
// buffer into the vertexPosition attribute.
function setPositionAttribute(gl, buffers, programInfo) {
  const numComponents = 2; // pull out 2 values per iteration
  const type = gl.FLOAT; // the data in the buffer is 32bit floats
  const normalize = false; // don't normalize
  const stride = 0; // how many bytes to get from one set of values to the next
  // 0 = use type and numComponents above
  const offset = 0; // how many bytes inside the buffer to start from
  gl.bindBuffer(gl.ARRAY_BUFFER, buffers.position);
  gl.vertexAttribPointer(
    programInfo.attribLocations.vertexPosition,
    numComponents,
    type,
    normalize,
    stride,
    offset,
  );
  gl.enableVertexAttribArray(programInfo.attribLocations.vertexPosition);
}

export { drawScene };
```

Bước đầu tiên là xóa khung vẽ thành màu nền của chúng ta; sau đó chúng tôi thiết lập phối cảnh của máy ảnh. Chúng tôi đặt trường nhìn là 45°, với tỷ lệ chiều rộng và chiều cao phù hợp với kích thước hiển thị của khung vẽ của chúng tôi. Chúng tôi cũng xác định rằng chúng tôi chỉ muốn các đối tượng cách máy ảnh từ 0,1 đến 100 đơn vị được hiển thị.

Sau đó, chúng tôi thiết lập vị trí của mặt phẳng vuông bằng cách tải vị trí nhận dạng và dịch ra xa camera 6 đơn vị. Sau đó, chúng tôi liên kết bộ đệm đỉnh của hình vuông với thuộc tính mà trình đổ bóng đang sử dụng cho `aVertexPosition` và chúng tôi cho WebGL biết cách lấy dữ liệu ra khỏi đó. Cuối cùng, chúng ta vẽ đối tượng bằng cách gọi phương thức {{domxref("WebGLRenderingContext.drawArrays()", "drawArrays()")}}.

Cuối cùng, hãy gọi `initBuffers()` và `drawScene()`.

> [!NOTE]
> Thêm mã này vào đầu tệp "webgl-demo.js" của bạn:

```js
import { initBuffers } from "./init-buffers.js";
import { drawScene } from "./draw-scene.js";
```

> [!NOTE]
> Thêm mã này vào cuối hàm `main()` của bạn:

```js
// Here's where we call the routine that builds all the
// objects we'll be drawing.
const buffers = initBuffers(gl);

// Draw the scene
drawScene(gl, programInfo, buffers);
```

Kết quả sẽ trông như thế này:

{{EmbedGHLiveSample('dom-examples/webgl-examples/tutorial/sample2/index.html', 670, 510) }}

[Xem mã hoàn chỉnh](https://github.com/mdn/dom-examples/tree/main/webgl-examples/tutorial/sample2) | [Mở bản demo này trên một trang mới](https://mdn.github.io/dom-examples/webgl-examples/tutorial/sample2/)

## Hoạt động tiện ích ma trận

Các thao tác với ma trận có vẻ phức tạp nhưng [chúng thực sự khá đơn giản nếu bạn thực hiện từng bước một](https://webglfundamentals.org/webgl/lessons/webgl-2d-matrices.html). Nói chung mọi người sử dụng thư viện ma trận thay vì viết thư viện của riêng họ. Trong trường hợp của chúng tôi, chúng tôi đang sử dụng [thư viện glMatrix](https://glmatrix.net/) phổ biến.

### Xem thêm

- [Matrices](https://webglfundamentals.org/webgl/lessons/webgl-2d-matrices.html) trên WebGLFundamentals
- [Ma trận](https://mathworld.wolfram.com/Matrix.html) trên Wolfram MathWorld
- [Matrix](<https://en.wikipedia.org/wiki/Matrix_(mathematics)>) trên Wikipedia

{{PreviousNext("Web/API/WebGL_API/Tutorial/Getting_started_with_WebGL", "Web/API/WebGL_API/Tutorial/Using_shaders_to_apply_color_in_WebGL")}}
