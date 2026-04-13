---
title: Tạo hoạt ảnh cho các đối tượng bằng WebGL
slug: Web/API/WebGL_API/Tutorial/Animating_objects_with_WebGL
page-type: guide
---

{{PreviousNext("Web/API/WebGL_API/Tutorial/Using_shaders_to_apply_color_in_WebGL", "Web/API/WebGL_API/Tutorial/Creating_3D_objects_using_WebGL") }} {{PreviousNext("Web/API/WebGL_API/Tutorial/Using_shaders_to_apply_color_in_WebGL", "Web/API/WebGL_API/Tutorial/Creating_3D_objects_using_WebGL") }}


## Làm hình vuông xoay

Trong ví dụ này, chúng tôi thực sự sẽ xoay camera của mình. Bằng cách đó, nó sẽ trông như thể chúng ta đang xoay hình vuông. Trước tiên, chúng ta sẽ cần một số biến để theo dõi chuyển động quay hiện tại của camera.

> [!NOTE]
> Thêm mã này vào đầu tập lệnh "webgl-demo.js" của bạn:

```js
let squareRotation = 0.0;
let deltaTime = 0;
```

Bây giờ chúng ta cần cập nhật hàm `drawScene()` để áp dụng chế độ xoay hiện tại cho máy ảnh khi vẽ nó. Sau khi dịch camera sang vị trí vẽ ban đầu cho hình vuông, chúng ta áp dụng phép xoay.

Trong mô-đun "draw-scene.js" của bạn, hãy cập nhật phần khai báo của hàm `drawScene()` để nó có thể được chuyển qua vòng quay để sử dụng:

```js
function drawScene(gl, programInfo, buffers, squareRotation) {
  // …
}
```

Trong hàm `drawScene()` của bạn, ngay sau lệnh gọi dòng `mat4.translate()`, hãy thêm mã này:

```js
mat4.rotate(
  modelViewMatrix, // destination matrix
  modelViewMatrix, // matrix to rotate
  squareRotation, // amount to rotate in radians
  [0, 0, 1],
); // axis to rotate around
```

Thao tác này sẽ xoay modelViewMatrix theo giá trị hiện tại của `squareRotation`, quanh trục Z.

Để thực sự tạo hiệu ứng động, chúng ta cần thêm mã thay đổi giá trị của `squareRotation` theo thời gian.

Thêm mã này vào cuối hàm `main()` của bạn, thay thế lệnh gọi `drawScene()` hiện có:

```js
let then = 0;

// Draw the scene repeatedly
function render(now) {
  now *= 0.001; // convert to seconds
  deltaTime = now - then;
  then = now;

  drawScene(gl, programInfo, buffers, squareRotation);
  squareRotation += deltaTime;

  requestAnimationFrame(render);
}
requestAnimationFrame(render);
```

Mã này sử dụng `requestAnimationFrame` để yêu cầu trình duyệt gọi hàm `render` trên mỗi khung hình. `requestAnimationFrame` chuyển cho chúng tôi thời gian tính bằng mili giây kể từ khi trang được tải. Chúng tôi chuyển đổi số đó thành giây rồi trừ đi vào lần cuối cùng để tính `deltaTime`, là số giây kể từ khi khung hình cuối cùng được hiển thị.

Cuối cùng, chúng tôi cập nhật `squareRotation`.

{{EmbedGHLiveSample('dom-examples/webgl-examples/tutorial/sample4/index.html', 670, 510) }}

[Xem mã hoàn chỉnh](https://github.com/mdn/dom-examples/tree/main/webgl-examples/tutorial/sample4) | [Mở bản demo này trên một trang mới](https://mdn.github.io/dom-examples/webgl-examples/tutorial/sample4/)

{{PreviousNext("Web/API/WebGL_API/Tutorial/Using_shaders_to_apply_color_in_WebGL", "Web/API/WebGL_API/Tutorial/Creating_3D_objects_using_WebGL") }}
