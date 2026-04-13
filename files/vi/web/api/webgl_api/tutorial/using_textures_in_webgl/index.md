---
title: Sử dụng họa tiết trong WebGL
slug: Web/API/WebGL_API/Tutorial/Using_textures_in_WebGL
page-type: guide
---

{{PreviousNext("Web/API/WebGL_API/Tutorial/Creating_3D_objects_using_WebGL", "Web/API/WebGL_API/Tutorial/Lighting_in_WebGL")}} {{PreviousNext("Web/API/WebGL_API/Tutorial/Creating_3D_objects_using_WebGL", "Web/API/WebGL_API/Tutorial/Lighting_in_WebGL")}}
Bây giờ chương trình mẫu của chúng ta có một khối 3D xoay, hãy ánh xạ họa tiết lên nó thay vì để các mặt của nó có màu đơn sắc.

## Đang tải họa tiết

Điều đầu tiên cần làm là thêm mã để tải họa tiết. Trong trường hợp của chúng tôi, chúng tôi sẽ sử dụng một họa tiết duy nhất, được ánh xạ lên tất cả sáu cạnh của khối xoay, nhưng kỹ thuật tương tự có thể được sử dụng cho bất kỳ số lượng họa tiết nào.

> [!NOTE]
> Điều quan trọng cần lưu ý là việc tải họa tiết tuân theo [quy tắc tên miền chéo](/en-US/docs/Web/HTTP/Guides/CORS); nghĩa là, bạn chỉ có thể tải họa tiết từ các trang web mà nội dung của bạn được CORS phê duyệt. Xem [Kết cấu tên miền chéo bên dưới](#cross-domain_texture) để biết chi tiết.

> [!NOTE]
> Thêm hai hàm này vào tập lệnh "webgl-demo.js" của bạn:

```js
//
// Initialize a texture and load an image.
// When the image finished loading copy it into the texture.
//
function loadTexture(gl, url) {
  const texture = gl.createTexture();
  gl.bindTexture(gl.TEXTURE_2D, texture);

  // Because images have to be downloaded over the internet
  // they might take a moment until they are ready.
  // Until then put a single pixel in the texture so we can
  // use it immediately. When the image has finished downloading
  // we'll update the texture with the contents of the image.
  const level = 0;
  const internalFormat = gl.RGBA;
  const width = 1;
  const height = 1;
  const border = 0;
  const srcFormat = gl.RGBA;
  const srcType = gl.UNSIGNED_BYTE;
  const pixel = new Uint8Array([0, 0, 255, 255]); // opaque blue
  gl.texImage2D(
    gl.TEXTURE_2D,
    level,
    internalFormat,
    width,
    height,
    border,
    srcFormat,
    srcType,
    pixel,
  );

  const image = new Image();
  image.onload = () => {
    gl.bindTexture(gl.TEXTURE_2D, texture);
    gl.texImage2D(
      gl.TEXTURE_2D,
      level,
      internalFormat,
      srcFormat,
      srcType,
      image,
    );

    // WebGL1 has different requirements for power of 2 images
    // vs. non power of 2 images so check if the image is a
    // power of 2 in both dimensions.
    if (isPowerOf2(image.width) && isPowerOf2(image.height)) {
      // Yes, it's a power of 2. Generate mips.
      gl.generateMipmap(gl.TEXTURE_2D);
    } else {
      // No, it's not a power of 2. Turn off mips and set
      // wrapping to clamp to edge
      gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE);
      gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE);
      gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
    }
  };
  image.src = url;

  return texture;
}

function isPowerOf2(value) {
  return (value & (value - 1)) === 0;
}
```

Quy trình `loadTexture()` bắt đầu bằng cách tạo một đối tượng kết cấu WebGL `texture` bằng cách gọi hàm WebGL {{domxref("WebGLRenderingContext.texImage2D()", "texImage2D()")}}. Sau đó, nó tải lên một pixel màu xanh lam bằng cách sử dụng {{domxref("WebGLRenderingContext.texImage2D()", "texImage2D()")}}. Điều này làm cho kết cấu có thể sử dụng được ngay lập tức dưới dạng màu xanh lam đồng nhất mặc dù có thể mất một chút thời gian để hình ảnh của chúng ta tải xuống.xuống.

Để tải họa tiết từ tệp hình ảnh, sau đó nó tạo một đối tượng `Image` và gán `src` cho URL cho hình ảnh mà chúng tôi muốn sử dụng làm họa tiết. Hàm chúng ta gán cho `image.onload` sẽ được gọi sau khi hình ảnh được tải xuống xong. Tại thời điểm đó, chúng tôi lại gọi {{domxref("WebGLRenderingContext.texImage2D()", "texImage2D()")}} lần này bằng cách sử dụng hình ảnh làm nguồn cho kết cấu. Sau đó, chúng tôi thiết lập tính năng lọc và gói kết cấu dựa trên việc hình ảnh chúng tôi tải xuống có lũy thừa 2 ở cả hai chiều hay không.

WebGL1 chỉ có thể sử dụng 2 kết cấu không có sức mạnh với bộ lọc được đặt thành `NEAREST` hoặc `LINEAR` và nó không thể tạo mipmap cho chúng. Chế độ gói của chúng cũng phải được đặt thành `CLAMP_TO_EDGE`. Mặt khác, nếu kết cấu có lũy thừa 2 ở cả hai chiều thì WebGL có thể lọc chất lượng cao hơn, nó có thể sử dụng mipmap và nó có thể đặt chế độ gói thành `REPEAT` hoặc `MIRRORED_REPEAT`.

Một ví dụ về kết cấu lặp đi lặp lại là xếp hình ảnh một vài viên gạch để che đi bức tường gạch.

Có thể tắt tính năng ánh xạ Mipmapping và lặp lại UV bằng {{domxref("WebGLRenderingContext.texParameter()", "texParameteri()")}}. Điều này sẽ cho phép các kết cấu không có sức mạnh của hai (NPOT) với chi phí mipmapping, bọc UV, ốp lát UV và khả năng kiểm soát của bạn đối với cách thiết bị sẽ xử lý kết cấu của bạn.

```js
// gl.NEAREST is also allowed, instead of gl.LINEAR, as neither mipmap.
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
// Prevents s-coordinate wrapping (repeating).
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE);
// Prevents t-coordinate wrapping (repeating).
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE);
```

Một lần nữa, với những tham số này, các thiết bị WebGL tương thích sẽ tự động chấp nhận mọi độ phân giải cho kết cấu đó (tối đa kích thước tối đa của chúng). Nếu không thực hiện cấu hình trên, WebGL yêu cầu tất cả các mẫu kết cấu NPOT không thành công bằng cách trả về màu đen trong suốt: `rgb(0 0 0 / 0%)`.

Để tải hình ảnh, hãy thêm lệnh gọi đến hàm `loadTexture()` trong hàm `main()` của chúng tôi. Điều này có thể được thêm vào sau lệnh gọi `initBuffers(gl)`.

Nhưng cũng cần lưu ý: Trình duyệt sao chép pixel từ hình ảnh đã tải theo thứ tự từ trên xuống dưới - từ góc trên cùng bên trái; nhưng WebGL muốn các pixel theo thứ tự từ dưới lên trên - bắt đầu từ góc dưới cùng bên trái. (Để biết thêm chi tiết, hãy xem [Tại sao kết cấu WebGL của tôi bị lộn ngược?](https://jameshfisher.com/2020/10/22/why-is-my-webgl-texture-upside-down/).)

Vì vậy, để ngăn kết cấu hình ảnh thu được có hướng sai khi hiển thị, chúng ta cũng cần gọi [`pixelStorei()`](/en-US/docs/Web/API/WebGLRenderingContext/pixelStorei) với tham số `gl.UNPACK_FLIP_Y_WEBGL` được đặt thành `true` — để khiến các pixel được lật theo thứ tự từ dưới lên trên mà WebGL mong đợi.

> [!NOTE]
> Thêm đoạn mã sau vào hàm `main()` của bạn, ngay sau lệnh gọi `initBuffers()`:

```js
// Load texture
const texture = loadTexture(gl, "cubetexture.png");
// Flip image pixels into the bottom-to-top order that WebGL expects.
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
```

> [!NOTE]
> Cuối cùng, tải tệp [cubetexture.png](https://raw.githubusercontent.com/mdn/dom-examples/main/webgl-examples/tutorial/sample6/cubetexture.png) xuống cùng thư mục cục bộ với các tệp JavaScript của bạn.

## Ánh xạ họa tiết lên các khuôn mặt

Tại thời điểm này, kết cấu đã được tải và sẵn sàng để sử dụng. Nhưng trước khi có thể sử dụng nó, chúng ta cần thiết lập ánh xạ tọa độ kết cấu tới các đỉnh của các mặt của khối lập phương. Điều này thay thế tất cả mã hiện có trước đó để định cấu hình màu cho từng mặt của khối trong `initBuffers()`.

> [!NOTE]
> Thêm chức năng này vào mô-đun "init-buffer.js" của bạn:

```js
function initTextureBuffer(gl) {
  const textureCoordBuffer = gl.createBuffer();
  gl.bindBuffer(gl.ARRAY_BUFFER, textureCoordBuffer);

  const textureCoordinates = [
    // Front
    0.0, 0.0, 1.0, 0.0, 1.0, 1.0, 0.0, 1.0,
    // Back
    0.0, 0.0, 1.0, 0.0, 1.0, 1.0, 0.0, 1.0,
    // Top
    0.0, 0.0, 1.0, 0.0, 1.0, 1.0, 0.0, 1.0,
    // Bottom
    0.0, 0.0, 1.0, 0.0, 1.0, 1.0, 0.0, 1.0,
    // Right
    0.0, 0.0, 1.0, 0.0, 1.0, 1.0, 0.0, 1.0,
    // Left
    0.0, 0.0, 1.0, 0.0, 1.0, 1.0, 0.0, 1.0,
  ];

  gl.bufferData(
    gl.ARRAY_BUFFER,
    new Float32Array(textureCoordinates),
    gl.STATIC_DRAW,
  );

  return textureCoordBuffer;
}
```

Đầu tiên, mã này tạo một bộ đệm WebGL trong đó chúng ta sẽ lưu trữ tọa độ kết cấu cho từng mặt, sau đó chúng ta liên kết bộ đệm đó dưới dạng mảng mà chúng ta sẽ ghi vào.

Mảng `textureCoordines` xác định tọa độ kết cấu tương ứng với từng đỉnh của mỗi mặt. Lưu ý rằng tọa độ kết cấu nằm trong khoảng từ 0,0 đến 1,0; kích thước của họa tiết được chuẩn hóa thành phạm vi từ 0,0 đến 1,0 bất kể kích thước thực tế của chúng, nhằm mục đích ánh xạ kết cấu.

Sau khi thiết lập mảng ánh xạ kết cấu, chúng tôi chuyển mảng đó vào bộ đệm để WebGL có sẵn dữ liệu đó để sử dụng.

Sau đó chúng tôi trả lại bộ đệm mới.

Tiếp theo, chúng ta cần cập nhật `initBuffers()` để tạo và trả về bộ đệm tọa độ kết cấu thay vì bộ đệm màu.

> [!NOTE]
> Trong hàm `initBuffers()` của mô-đun "init-buffers.js" của bạn, hãy thay thế lệnh gọi `initColorBuffer()` bằng dòng sau:

```js
const textureCoordBuffer = initTextureBuffer(gl);
```

> [!NOTE]
> Trong hàm `initBuffers()` của mô-đun "init-buffers.js", hãy thay thế câu lệnh `return` bằng câu lệnh sau:

```js
return {
  position: positionBuffer,
  textureCoord: textureCoordBuffer,
  indices: indexBuffer,
};
```

## Cập nhật shader

Chương trình đổ bóng cũng cần được cập nhật để sử dụng họa tiết thay vì màu đơn sắc.

### Trình đổ bóng đỉnh

Chúng ta cần thay thế trình đổ bóng đỉnh để thay vì tìm nạp dữ liệu màu, nó sẽ tìm nạp dữ liệu tọa độ kết cấu.

> [!NOTE]
> Cập nhật khai báo `vsSource` trong hàm `main()` của bạn như thế này:

```js
const vsSource = `
    attribute vec4 aVertexPosition;
    attribute vec2 aTextureCoord;

    uniform mat4 uModelViewMatrix;
    uniform mat4 uProjectionMatrix;

    varying highp vec2 vTextureCoord;

    void main(void) {
      gl_Position = uProjectionMatrix * uModelViewMatrix * aVertexPosition;
      vTextureCoord = aTextureCoord;
    }
  `;
```

Thay đổi quan trọng ở đây là thay vì tìm nạp màu đỉnh, chúng ta tìm nạp tọa độ kết cấu và chuyển chúng tới trình đổ bóng phân đoạn; điều này sẽ chỉ ra vị trí trong kết cấu tương ứng với đỉnh.

### Trình đổ bóng phân đoạn

Trình đổ bóng phân đoạn cũng cần được cập nhật.

> [!NOTE]
> Cập nhật khai báo `fsSource` trong hàm `main()` của bạn như thế này:

```js
const fsSource = `
    varying highp vec2 vTextureCoord;

    uniform sampler2D uSampler;

    void main(void) {
      gl_FragColor = texture2D(uSampler, vTextureCoord);
    }
  `;
```

Thay vì gán giá trị màu cho màu của mảnh, màu của mảnh được tính bằng cách tìm nạp {{glossary("texel")}} (nghĩa là pixel trong kết cấu) dựa trên giá trị của `vTextureCoord` giống như màu được nội suy giữa các đỉnh.

### Thuộc tính và vị trí thống nhất

Bởi vì chúng tôi đã thay đổi thuộc tính và thêm đồng phục nên chúng tôi cần tra cứu vị trí của họ.

> [!NOTE]
> Cập nhật khai báo `programInfo` trong hàm `main()` của bạn như thế này:

```js
const programInfo = {
  program: shaderProgram,
  attribLocations: {
    vertexPosition: gl.getAttribLocation(shaderProgram, "aVertexPosition"),
    textureCoord: gl.getAttribLocation(shaderProgram, "aTextureCoord"),
  },
  uniformLocations: {
    projectionMatrix: gl.getUniformLocation(shaderProgram, "uProjectionMatrix"),
    modelViewMatrix: gl.getUniformLocation(shaderProgram, "uModelViewMatrix"),
    uSampler: gl.getUniformLocation(shaderProgram, "uSampler"),
  },
};
```

## Vẽ khối có kết cấu

Những thay đổi đối với hàm `drawScene()` rất đơn giản.

> [!NOTE]
> Trong hàm `drawScene()` của mô-đun "draw-scene.js" của bạn, hãy thêm hàm sau:

```js
// tell webgl how to pull out the texture coordinates from buffer
function setTextureAttribute(gl, buffers, programInfo) {
  const num = 2; // every coordinate composed of 2 values
  const type = gl.FLOAT; // the data in the buffer is 32-bit float
  const normalize = false; // don't normalize
  const stride = 0; // how many bytes to get from one set to the next
  const offset = 0; // how many bytes inside the buffer to start from
  gl.bindBuffer(gl.ARRAY_BUFFER, buffers.textureCoord);
  gl.vertexAttribPointer(
    programInfo.attribLocations.textureCoord,
    num,
    type,
    normalize,
    stride,
    offset,
  );
  gl.enableVertexAttribArray(programInfo.attribLocations.textureCoord);
}
```

> [!NOTE]
> Trong hàm `drawScene()` của mô-đun "draw-scene.js" của bạn, hãy thay thế lệnh gọi `setColorAttribution()` bằng dòng sau:

```js
setTextureAttribute(gl, buffers, programInfo);
```

Sau đó thêm mã để chỉ định kết cấu để ánh xạ lên các mặt.

> [!NOTE]
> Trong hàm `drawScene()` của bạn, ngay sau hai lệnh gọi đến `gl.uniformMatrix4fv()`, hãy thêm mã sau:

```js
// Tell WebGL we want to affect texture unit 0
gl.activeTexture(gl.TEXTURE0);

// Bind the texture to texture unit 0
gl.bindTexture(gl.TEXTURE_2D, texture);

// Tell the shader we bound the texture to texture unit 0
gl.uniform1i(programInfo.uniformLocations.uSampler, 0);
```

WebGL cung cấp tối thiểu 8 đơn vị kết cấu; cái đầu tiên trong số này là `gl.TEXTURE0`. Chúng tôi thông báo cho WebGL rằng chúng tôi muốn tác động đến đơn vị 0. Sau đó, chúng tôi gọi {{domxref("WebGLRenderingContext.bindTexture()", "bindTexture()")}} liên kết kết cấu với điểm liên kết `TEXTURE_2D` của đơn vị kết cấu 0. Sau đó, chúng tôi thông báo cho trình đổ bóng rằng đối với `uSampler` hãy sử dụng đơn vị kết cấu 0.

Cuối cùng, thêm `texture` làm tham số cho hàm `drawScene()`, cả nơi nó được xác định và nơi nó được gọi.

Cập nhật phần khai báo của hàm `drawScene()` để thêm tham số mới:

```js
function drawScene(gl, programInfo, buffers, texture, cubeRotation) {
  // …
}
```

Cập nhật vị trí trong hàm `main()` nơi bạn gọi `drawScene()`:

```js
drawScene(gl, programInfo, buffers, texture, cubeRotation);
```

Tại thời điểm này, khối xoay sẽ hoạt động tốt.

{{EmbedGHLiveSample('dom-examples/webgl-examples/tutorial/sample6/index.html', 670, 510) }}

[Xem mã hoàn chỉnh](https://github.com/mdn/dom-examples/tree/main/webgl-examples/tutorial/sample6) | [Mở bản demo này trên một trang mới](https://mdn.github.io/dom-examples/webgl-examples/tutorial/sample6/)

## Kết cấu tên miền chéo

Việc tải kết cấu WebGL phải tuân theo các biện pháp kiểm soát quyền truy cập giữa các miền. Để nội dung của bạn tải họa tiết từ một miền khác, cần phải có sự phê duyệt của CORS. Xem [Kiểm soát truy cập HTTP](/en-US/docs/Web/HTTP/Guides/CORS) để biết chi tiết về CORS.

Các trình duyệt hiện đại thường coi nguồn gốc của các tệp được tải bằng lược đồ file:/// là _opaque Origin_. Ngay cả khi một tệp bao gồm các tệp khác trong cùng một thư mục, chúng không được coi là có cùng nguồn gốc và có thể gây ra lỗi CORS (xem [Same-origin Policy#File Origins](/en-US/docs/Web/Security/Defenses/Same-origin_policy#file_origins)). Điều đó có nghĩa là bạn không thể sử dụng họa tiết được tải từ URL `file:///` trong WebGL và cần có máy chủ web để kiểm tra và triển khai mã của bạn. Để thử nghiệm cục bộ, hãy xem hướng dẫn của chúng tôi [Làm cách nào để thiết lập máy chủ thử nghiệm cục bộ?](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/set_up_a_local_testing_server) để được trợ giúp.

Hãy xem [bài viết hacks.mozilla.org](https://hacks.mozilla.org/2011/11/USE-cors-to-load-webgl-textures-from-cross-domain-images/) này để biết giải thích về cách sử dụng hình ảnh được CORS phê duyệt làm họa tiết WebGL.

Không thể sử dụng canvas 2D bị nhiễm độc (chỉ viết) làm họa tiết WebGL. Ví dụ: 2D {{ HTMLElement("canvas") }} bị nhiễm độc khi một hình ảnh tên miền chéo được vẽ trên đó.

{{PreviousNext("Web/API/WebGL_API/Tutorial/Creating_3D_objects_using_WebGL", "Web/API/WebGL_API/Tutorial/Lighting_in_WebGL")}}
