---
title: "CanvasRenderingContext2D: phương thức putImageData()"
short-title: putImageData()
slug: Web/API/CanvasRenderingContext2D/putImageData
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.putImageData
---

{{APIRef("Canvas API")}}

Phương thức **`CanvasRenderingContext2D.putImageData()`** của API Canvas 2D vẽ dữ liệu từ đối tượng {{domxref("ImageData")}} đã cho lên canvas. Nếu một hình chữ nhật bẩn được cung cấp thì chỉ các pixel từ hình chữ nhật đó được sơn. Phương pháp này không bị ảnh hưởng bởi ma trận chuyển đổi canvas.

> [!LƯU Ý]
> Dữ liệu hình ảnh có thể được lấy từ canvas bằng cách sử dụng
> phương pháp {{domxref("CanvasRenderingContext2D.getImageData()", "getImageData()")}}.

Bạn có thể tìm thêm thông tin về `putImageData()` và thao tác chung đối với nội dung canvas trong bài viết [Pixel manipulation with canvas](/en-US/docs/Web/API/Canvas_API/Tutorial/Pixel_manipulation_with_canvas).

## Cú pháp

```js-nolint
putImageData(imageData, dx, dy)
putImageData(imageData, dx, dy, dirtyX, dirtyY, dirtyWidth, dirtyHeight)
```

### Tham số

- `imageData`
- : Một đối tượng {{domxref("ImageData")}} chứa mảng giá trị pixel.
- `dx`
- : Vị trí nằm ngang (tọa độ x) để đặt dữ liệu hình ảnh vào
  canvas đích.
- `dy`
- : Vị trí dọc (tọa độ y) để đặt dữ liệu hình ảnh vào đích
  canvas.
- `dirtyX`{{optional_inline}}
- : Vị trí nằm ngang (tọa độ x) của góc trên bên trái nơi chứa dữ liệu hình ảnh
  sẽ được trích xuất. Mặc định là `0`.
- `dirtyY`{{optional_inline}}
- : Vị trí dọc (tọa độ y) của góc trên bên trái nơi dữ liệu hình ảnh
  sẽ được trích xuất. Mặc định là `0`.
- `dirtyWidth`{{optional_inline}}
- : Chiều rộng của hình chữ nhật cần sơn. Mặc định về chiều rộng của dữ liệu hình ảnh.
- `dirtyHeight`{{optional_inline}}
- : Chiều cao của hình chữ nhật cần sơn. Mặc định là chiều cao của dữ liệu hình ảnh.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `NotSupportedError`{{domxref("DOMException")}}
- : Bị ném nếu bất kỳ đối số nào là vô hạn.
- `InvalidStateError`{{domxref("DOMException")}}
- : Bị ném nếu dữ liệu của đối tượng `ImageData` đã bị tách ra.

## Ví dụ

### Hiểu putImageData

Để hiểu rõ thuật toán này thực hiện những gì, đây là cách triển khai dựa trên {{domxref("CanvasRenderingContext2D.fillRect()")}}.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

function putImageData(
  ctx,
  imageData,
  dx,
  dy,
  dirtyX = 0,
  dirtyY = 0,
  dirtyWidth = imageData.width,
  dirtyHeight = imageData.height,
) {
  const data = imageData.data;
  const height = imageData.height;
  const width = imageData.width;
  const limitBottom = dirtyY + dirtyHeight;
  const limitRight = dirtyX + dirtyWidth;
  for (let y = dirtyY; y < limitBottom; y++) {
    for (let x = dirtyX; x < limitRight; x++) {
      const pos = y * width + x;
      ctx.fillStyle = `rgb(${data[pos * 4 + 0]} ${data[pos * 4 + 1]}
      ${data[pos * 4 + 2]} / ${data[pos * 4 + 3] / 255})`;
      ctx.fillRect(x + dx, y + dy, 1, 1);
    }
  }
}

// Draw content onto the canvas
ctx.fillRect(0, 0, 100, 100);
// Create an ImageData object from it
const imagedata = ctx.getImageData(0, 0, 100, 100);
// use the putImageData function that illustrates how putImageData works
putImageData(ctx, imagedata, 150, 0, 50, 50, 25, 25);
```

#### Kết quả

{{ EmbedLiveSample('Understanding_putImageData', 700, 180) }}

### Mất dữ liệu do tối ưu hóa trình duyệt

> [!CẢNH BÁO]
> Do tính chất mất mát của việc chuyển đổi sang và từ các giá trị màu alpha được nhân trước,
> các pixel vừa được đặt bằng `putImageData()` có thể được trả về
> tương đương `getImageData()` dưới dạng các giá trị khác nhau.

#### JavaScript

```js
const canvas = document.createElement("canvas");
canvas.width = 1;
canvas.height = 1;
const context = canvas.getContext("2d");
const imgData = context.getImageData(0, 0, canvas.width, canvas.height);
const pixels = imgData.data;
pixels[0 + 0] = 1;
pixels[0 + 1] = 127;
pixels[0 + 2] = 255;
pixels[0 + 3] = 1;
console.log("before:", pixels);
context.putImageData(imgData, 0, 0);
const imgData2 = context.getImageData(0, 0, canvas.width, canvas.height);
const pixels2 = imgData2.data;
console.log("after:", pixels2);
```

Đầu ra có thể trông giống như:

```plain
before: Uint8ClampedArray(4) [ 1, 127, 255, 1 ]
after: Uint8ClampedArray(4) [ 255, 255, 255, 1 ]
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định phương thức này: {{domxref("CanvasRenderingContext2D")}}
- đối tượng {{domxref("ImageData")}}
- {{domxref("CanvasRenderingContext2D.getImageData()")}}
- [Pixel manipulation with canvas](/en-US/docs/Web/API/Canvas_API/Tutorial/Pixel_manipulation_with_canvas)
