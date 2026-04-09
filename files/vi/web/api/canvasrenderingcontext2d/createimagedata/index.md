---
title: "CanvasRenderingContext2D: phương thức createImageData()"
short-title: createImageData()
slug: Web/API/CanvasRenderingContext2D/createImageData
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.createImageData
---

{{APIRef("Canvas API")}}

Phương pháp **`CanvasRenderingContext2D.createImageData()`** của
API Canvas 2D tạo một đối tượng {{domxref("ImageData")}} mới, trống với
các kích thước quy định. Tất cả các pixel trong đối tượng mới đều có màu đen trong suốt.

## Cú pháp

```js-nolint
createImageData(width, height)
createImageData(width, height, settings)
createImageData(imagedata)
```

### Tham số

- `width`
- : Chiều rộng để cung cấp cho đối tượng `ImageData` mới. Một giá trị âm lật
  hình chữ nhật quanh trục thẳng đứng.
- `height`
- : Chiều cao để cung cấp cho đối tượng `ImageData` mới. Một giá trị âm lật
  hình chữ nhật quanh trục hoành.
- `settings` {{optional_inline}}
- : Một đối tượng có các thuộc tính sau:
- `colorSpace`
- : Chỉ định không gian màu của dữ liệu hình ảnh. Có thể được đặt thành `"srgb"`cho [sRGB color space](https://en.wikipedia.org/wiki/SRGB) hoặc`"display-p3"` cho [display-p3 color space](https://en.wikipedia.org/wiki/DCI-P3).
- `pixelFormat`
- : Chỉ định định dạng pixel. Các giá trị có thể:
- `"rgba-unorm8"`, dành cho RGBA với định dạng chuẩn hóa không dấu 8 bit cho mỗi thành phần, sử dụng {{jsxref("Uint8ClampedArray")}}.
- `"rgba-float16"`, dành cho RGBA với 16 bit cho mỗi thành phần, sử dụng {{jsxref("Float16Array")}}. Giá trị pixel dấu phẩy động cho phép thể hiện màu sắc theo gam màu rộng tùy ý và dải động cao (HDR).
- `imagedata`
- : Một đối tượng `ImageData` hiện có để sao chép chiều rộng và chiều cao.
  Bản thân hình ảnh này **không** được sao chép.

### Giá trị trả về

Một đối tượng {{domxref("ImageData")}} mới có chiều rộng và chiều cao được chỉ định. cái mới
đối tượng được lấp đầy bằng các pixel màu đen trong suốt.

### Ngoại lệ

- `IndexSizeError` {{domxref("DOMException")}}
- : Được ném nếu một trong hai đối số `width`hoặc`height` bằng 0.

## Ví dụ

### Tạo một đối tượng ImageData trống

Đoạn mã này tạo một đối tượng `ImageData` trống bằng cách sử dụng
Phương pháp `createImageData()`.

```html
<canvas id="canvas"></canvas>
```

Đối tượng được tạo có chiều rộng 100 pixel và chiều cao 50 pixel, tổng cộng là 5.000 pixel.
Mỗi pixel trong đối tượng `ImageData` bao gồm bốn giá trị mảng, do đó
thuộc tính {{domxref("ImageData.data", "data")}} của đối tượng có chiều dài 4 × 5.000 hoặc
20.000.

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

const imageData = ctx.createImageData(100, 50);
console.log(imageData);
// ImageData { width: 100, height: 50, data: Uint8ClampedArray[20000] }
```

### Điền vào một đối tượng ImageData trống

Ví dụ này tạo và lấp đầy một đối tượng `ImageData` mới bằng các pixel màu tím.

```html
<canvas id="canvas"></canvas>
```

Vì mỗi pixel bao gồm bốn giá trị nên vòng lặp `for` lặp lại bằng cách
bội số của bốn. Các giá trị mảng được liên kết với mỗi pixel là R (đỏ), G (xanh lục), B
(màu xanh) và A (alpha), theo thứ tự đó.

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");
const imageData = ctx.createImageData(100, 100);

// Iterate through every pixel
for (let i = 0; i < imageData.data.length; i += 4) {
  // Modify pixel data
  imageData.data[i + 0] = 190; // R value
  imageData.data[i + 1] = 0; // G value
  imageData.data[i + 2] = 210; // B value
  imageData.data[i + 3] = 255; // A value
}

// Draw image data to the canvas
ctx.putImageData(imageData, 20, 20);
```

#### Kết quả

{{EmbedLiveSample("Filling_a_blank_ImageData_object", 700, 180)}}

### Ví dụ khácĐể biết thêm ví dụ sử dụng `createImageData()`và`ImageData`

đối tượng, xem [Pixel manipulation with canvas](/en-US/docs/Web/API/Canvas_API/Tutorial/Pixel_manipulation_with_canvas) và {{domxref("ImageData.data")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định phương thức này: {{domxref("CanvasRenderingContext2D")}}
- {{domxref("ImageData")}}
- [Pixel manipulation with canvas](/en-US/docs/Web/API/Canvas_API/Tutorial/Pixel_manipulation_with_canvas)
