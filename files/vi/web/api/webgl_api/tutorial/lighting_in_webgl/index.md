---
title: Chiếu sáng trong WebGL
slug: Web/API/WebGL_API/Tutorial/Lighting_in_WebGL
page-type: guide
---

{{PreviousNext("Web/API/WebGL_API/Tutorial/Using_textures_in_WebGL", "Web/API/WebGL_API/Tutorial/Animating_textures_in_WebGL")}} {{PreviousNext("Web/API/WebGL_API/Tutorial/Using_textures_in_WebGL", "Web/API/WebGL_API/Tutorial/Animating_textures_in_WebGL")}}
Như đã rõ, WebGL không có nhiều kiến ​​thức tích hợp sẵn. Nó chỉ chạy hai hàm mà bạn cung cấp — trình đổ bóng đỉnh và trình đổ bóng phân đoạn — và yêu cầu bạn viết các hàm sáng tạo để đạt được kết quả mong muốn. Nói cách khác, nếu bạn muốn có ánh sáng, bạn phải tự tính toán. May mắn thay, điều đó không quá khó thực hiện và bài viết này sẽ đề cập đến một số điều cơ bản.

## Mô phỏng ánh sáng và bóng trong 3D

Mặc dù việc đi sâu vào chi tiết về lý thuyết đằng sau ánh sáng mô phỏng trong đồ họa 3D nằm ngoài phạm vi của bài viết này nhưng sẽ rất hữu ích nếu biết một chút về cách thức hoạt động của nó. Thay vì thảo luận sâu hơn ở đây, hãy xem bài viết về [PhongShading](https://en.wikipedia.org/wiki/Phong_shading) tại Wikipedia, bài viết này cung cấp cái nhìn tổng quan về mô hình chiếu sáng được sử dụng phổ biến nhất. Hoặc nếu bạn muốn xem phần giải thích dựa trên WebGL, hãy đọc [WebGL 3D - Point Lighting](https://webglfundamentals.org/webgl/lessons/webgl-3d-lighting-point.html).

Có ba loại ánh sáng cơ bản:

**Ánh sáng xung quanh** là ánh sáng lan tỏa khắp khung cảnh; nó không có tính định hướng và ảnh hưởng như nhau đến mọi khuôn mặt trong khung cảnh, bất kể khuôn mặt đó hướng về hướng nào.

**Ánh sáng định hướng** là ánh sáng được phát ra từ một hướng cụ thể. Đây là ánh sáng đến từ rất xa đến nỗi mọi photon đều chuyển động song song với mọi photon khác. Ví dụ, ánh sáng mặt trời được coi là ánh sáng định hướng.

**Ánh sáng điểm** là ánh sáng được phát ra từ một điểm, tỏa ra mọi hướng. Đây là cách nhiều nguồn sáng trong thế giới thực thường hoạt động. Ví dụ, một bóng đèn phát ra ánh sáng theo mọi hướng.

Với mục đích của chúng ta, chúng ta sẽ đơn giản hóa mô hình chiếu sáng bằng cách chỉ xem xét ánh sáng định hướng và ánh sáng xung quanh đơn giản; chúng tôi sẽ không có bất kỳ [điểm nổi bật cụ thể](https://en.wikipedia.org/wiki/Specular_highlights) hoặc nguồn sáng điểm nào trong cảnh này. Thay vào đó, chúng ta sẽ có ánh sáng xung quanh cộng với một nguồn sáng định hướng duy nhất, nhắm vào khối xoay từ [bản demo trước](/en-US/docs/Web/API/WebGL_API/Tutorial/Using_textures_in_WebGL).

Sau khi bạn loại bỏ khái niệm về nguồn điểm và ánh sáng phản chiếu, chúng ta sẽ cần hai thông tin sau để triển khai ánh sáng định hướng:

1. Chúng ta cần liên kết một **bề mặt bình thường** với mỗi đỉnh. Đây là một vectơ vuông góc với mặt tại đỉnh đó.
2. Chúng ta cần biết hướng ánh sáng truyền đi; điều này được xác định bởi **vectơ chỉ hướng**.

Sau đó, chúng tôi cập nhật trình đổ bóng đỉnh để điều chỉnh màu của từng đỉnh, có tính đến ánh sáng xung quanh cũng như hiệu ứng của ánh sáng định hướng dựa trên góc mà nó chiếu vào khuôn mặt. Chúng ta sẽ biết cách thực hiện điều đó khi xem mã của trình đổ bóng.

## Xây dựng chuẩn cho các đỉnh

Điều đầu tiên chúng ta cần làm là tạo ra mảng chuẩn cho tất cả các đỉnh tạo nên khối lập phương của chúng ta. Vì khối lập phương là một vật rất đơn giản nên việc này rất dễ thực hiện; rõ ràng đối với các đối tượng phức tạp hơn, việc tính toán các chuẩn mực sẽ phức tạp hơn.

> [!NOTE]
> Thêm chức năng này vào mô-đun "init-buffer.js" của bạn:

```js
function initNormalBuffer(gl) {
  const normalBuffer = gl.createBuffer();
  gl.bindBuffer(gl.ARRAY_BUFFER, normalBuffer);

  const vertexNormals = [
    // Front
    0.0, 0.0, 1.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0,

    // Back
    0.0, 0.0, -1.0, 0.0, 0.0, -1.0, 0.0, 0.0, -1.0, 0.0, 0.0, -1.0,

    // Top
    0.0, 1.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0, 0.0,

    // Bottom
    0.0, -1.0, 0.0, 0.0, -1.0, 0.0, 0.0, -1.0, 0.0, 0.0, -1.0, 0.0,

    // Right
    1.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0, 0.0, 0.0,

    // Left
    -1.0, 0.0, 0.0, -1.0, 0.0, 0.0, -1.0, 0.0, 0.0, -1.0, 0.0, 0.0,
  ];

  gl.bufferData(
    gl.ARRAY_BUFFER,
    new Float32Array(vertexNormals),
    gl.STATIC_DRAW,
  );

  return normalBuffer;
}
```

Điều này bây giờ trông khá quen thuộc; chúng tôi tạo một bộ đệm mới, liên kết nó với bộ đệm mà chúng tôi đang làm việc, sau đó gửi mảng các quy tắc đỉnh của chúng tôi vào bộ đệm bằng cách gọi `bufferData()`.

Như trước đây, chúng ta đã cập nhật `initBuffers()` để gọi hàm mới và trả về bộ đệm mà nó đã tạo.

> [!NOTE]
> Ở cuối hàm `initBuffers()`, hãy thêm đoạn mã sau, thay thế câu lệnh `return` hiện có:

```js
const normalBuffer = initNormalBuffer(gl);

return {
  position: positionBuffer,
  normal: normalBuffer,
  textureCoord: textureCoordBuffer,
  indices: indexBuffer,
};
```

Sau đó, chúng tôi thêm mã vào mô-đun "draw-scene.js" để liên kết mảng thông thường với thuộc tính đổ bóng để mã đổ bóng có thể truy cập vào nó.

> [!NOTE]
> Thêm chức năng này vào mô-đun "draw-scene.js" của bạn:

```js
// Tell WebGL how to pull out the normals from
// the normal buffer into the vertexNormal attribute.
function setNormalAttribute(gl, buffers, programInfo) {
  const numComponents = 3;
  const type = gl.FLOAT;
  const normalize = false;
  const stride = 0;
  const offset = 0;
  gl.bindBuffer(gl.ARRAY_BUFFER, buffers.normal);
  gl.vertexAttribPointer(
    programInfo.attribLocations.vertexNormal,
    numComponents,
    type,
    normalize,
    stride,
    offset,
  );
  gl.enableVertexAttribArray(programInfo.attribLocations.vertexNormal);
}
```

> [!NOTE]
> Thêm dòng này vào hàm `drawScene()` của mô-đun "draw-scene.js" của bạn, ngay trước dòng `gl.useProgram()`:

```js
setNormalAttribute(gl, buffers, programInfo);
```

Cuối cùng, chúng ta cần cập nhật mã xây dựng các ma trận đồng nhất để tạo và cung cấp cho bộ đổ bóng một **ma trận thông thường**, được sử dụng để biến đổi các chuẩn mực khi xử lý hướng hiện tại của khối so với nguồn sáng.

> [!NOTE]
> Thêm đoạn mã sau vào hàm `drawScene()` của mô-đun "draw-scene.js" của bạn, ngay sau ba lệnh gọi `mat4.rotate()`:

```js
const normalMatrix = mat4.create();
mat4.invert(normalMatrix, modelViewMatrix);
mat4.transpose(normalMatrix, normalMatrix);
```

> [!NOTE]
> Thêm đoạn mã sau vào hàm `drawScene()` của mô-đun "draw-scene.js" của bạn, ngay sau hai lệnh gọi `gl.uniformMatrix4fv()` trước đó:

```js
gl.uniformMatrix4fv(
  programInfo.uniformLocations.normalMatrix,
  false,
  normalMatrix,
);
```

## Cập nhật shader

Bây giờ tất cả dữ liệu mà trình đổ bóng cần đều có sẵn, chúng ta cần cập nhật mã trong trình đổ bóng.

### Trình đổ bóng đỉnh

Điều đầu tiên cần làm là cập nhật trình đổ bóng đỉnh để nó tạo ra giá trị đổ bóng cho mỗi đỉnh dựa trên ánh sáng xung quanh cũng như ánh sáng định hướng.

> [!NOTE]
> Cập nhật khai báo `vsSource` trong hàm `main()` của bạn như thế này:

```js
const vsSource = `
    attribute vec4 aVertexPosition;
    attribute vec3 aVertexNormal;
    attribute vec2 aTextureCoord;

    uniform mat4 uNormalMatrix;
    uniform mat4 uModelViewMatrix;
    uniform mat4 uProjectionMatrix;

    varying highp vec2 vTextureCoord;
    varying highp vec3 vLighting;

    void main(void) {
      gl_Position = uProjectionMatrix * uModelViewMatrix * aVertexPosition;
      vTextureCoord = aTextureCoord;

      // Apply lighting effect

      highp vec3 ambientLight = vec3(0.3, 0.3, 0.3);
      highp vec3 directionalLightColor = vec3(1, 1, 1);
      highp vec3 directionalVector = normalize(vec3(0.85, 0.8, 0.75));

      highp vec4 transformedNormal = uNormalMatrix * vec4(aVertexNormal, 1.0);

      highp float directional = max(dot(transformedNormal.xyz, directionalVector), 0.0);
      vLighting = ambientLight + (directionalLightColor * directional);
    }
  `;
```

Sau khi vị trí của đỉnh được tính toán và chúng ta chuyển tọa độ của {{glossary("texel")}} tương ứng với đỉnh đó cho trình đổ bóng phân đoạn, chúng ta có thể tính toán độ bóng cho đỉnh đó.nh đó.

Điều đầu tiên chúng ta làm là biến đổi pháp tuyến dựa trên hướng hiện tại của khối lập phương, bằng cách nhân pháp tuyến của đỉnh với ma trận pháp tuyến. Sau đó, chúng ta có thể tính toán lượng ánh sáng định hướng cần được áp dụng cho đỉnh bằng cách tính tích số chấm của pháp tuyến được biến đổi và vectơ định hướng (nghĩa là hướng mà ánh sáng chiếu tới). Nếu giá trị này nhỏ hơn 0 thì chúng tôi ghim giá trị đó thành 0, vì bạn không thể có ánh sáng nhỏ hơn 0.

Sau khi tính toán lượng ánh sáng định hướng, chúng ta có thể tạo ra giá trị ánh sáng bằng cách lấy ánh sáng xung quanh và thêm vào tích màu của ánh sáng định hướng và lượng ánh sáng định hướng cần cung cấp. Kết quả là hiện tại chúng ta có một giá trị RGB sẽ được trình đổ bóng phân đoạn sử dụng để điều chỉnh màu của từng pixel mà chúng ta hiển thị.

### Trình đổ bóng phân đoạn

Bây giờ, trình đổ bóng phân đoạn cần được cập nhật để tính đến giá trị ánh sáng được tính toán bởi trình đổ bóng đỉnh.

> [!NOTE]
> Cập nhật khai báo `fsSource` trong hàm `main()` của bạn như thế này:

```js
const fsSource = `
    varying highp vec2 vTextureCoord;
    varying highp vec3 vLighting;

    uniform sampler2D uSampler;

    void main(void) {
      highp vec4 texelColor = texture2D(uSampler, vTextureCoord);

      gl_FragColor = vec4(texelColor.rgb * vLighting, texelColor.a);
    }
  `;
```

Ở đây, chúng tôi lấy màu của texel, giống như chúng tôi đã làm trong ví dụ trước, nhưng trước khi đặt màu của mảnh, chúng tôi nhân màu của texel với giá trị ánh sáng để điều chỉnh màu của texel nhằm tính đến hiệu ứng của nguồn sáng.

Việc duy nhất còn lại là tra cứu vị trí của thuộc tính `aVertexNormal` và đồng phục `uNormalMatrix`.

> [!NOTE]
> Cập nhật khai báo `programInfo` trong hàm `main()` của bạn như thế này:

```js
const programInfo = {
  program: shaderProgram,
  attribLocations: {
    vertexPosition: gl.getAttribLocation(shaderProgram, "aVertexPosition"),
    vertexNormal: gl.getAttribLocation(shaderProgram, "aVertexNormal"),
    textureCoord: gl.getAttribLocation(shaderProgram, "aTextureCoord"),
  },
  uniformLocations: {
    projectionMatrix: gl.getUniformLocation(shaderProgram, "uProjectionMatrix"),
    modelViewMatrix: gl.getUniformLocation(shaderProgram, "uModelViewMatrix"),
    normalMatrix: gl.getUniformLocation(shaderProgram, "uNormalMatrix"),
    uSampler: gl.getUniformLocation(shaderProgram, "uSampler"),
  },
};
```

Và thế là xong!

{{EmbedGHLiveSample('dom-examples/webgl-examples/tutorial/sample7/index.html', 670, 510) }}

[Xem mã hoàn chỉnh](https://github.com/mdn/dom-examples/tree/main/webgl-examples/tutorial/sample7) | [Mở bản demo này trên một trang mới](https://mdn.github.io/dom-examples/webgl-examples/tutorial/sample7/)

## Bài tập dành cho người đọc

Rõ ràng, đây là một ví dụ đơn giản, triển khai chiếu sáng cơ bản trên mỗi đỉnh. Đối với đồ họa nâng cao hơn, bạn sẽ muốn triển khai ánh sáng trên mỗi pixel, nhưng điều này sẽ giúp bạn đi đúng hướng.

Bạn cũng có thể thử thử nghiệm hướng của nguồn sáng, màu sắc của nguồn sáng, v.v.

{{PreviousNext("Web/API/WebGL_API/Tutorial/Using_textures_in_WebGL", "Web/API/WebGL_API/Tutorial/Animating_textures_in_WebGL")}}
