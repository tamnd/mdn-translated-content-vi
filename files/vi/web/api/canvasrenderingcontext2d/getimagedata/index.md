---
title: "CanvasRenderingContext2D: phương thức getImageData()"
short-title: getImageData()
slug: Web/API/CanvasRenderingContext2D/getImageData
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.getImageData
---

{{APIRef("Canvas API")}}

Phương thức {{domxref("CanvasRenderingContext2D")}}**`getImageData()`** của API Canvas 2D trả về đối tượng {{domxref("ImageData")}} biểu thị dữ liệu pixel cơ bản cho một phần được chỉ định của canvas.

Phương pháp này không bị ảnh hưởng bởi ma trận chuyển đổi của canvas. Nếu hình chữ nhật được chỉ định mở rộng ra ngoài giới hạn của canvas thì các pixel bên ngoài canvas sẽ có màu đen trong suốt trong đối tượng `ImageData` được trả về.

> [!LƯU Ý]
> Dữ liệu hình ảnh có thể được vẽ lên canvas bằng cách sử dụng
> phương pháp {{domxref("CanvasRenderingContext2D.putImageData()", "putImageData()")}}.

Bạn có thể tìm thêm thông tin về `getImageData()` và thao tác chung đối với nội dung canvas trong [Pixel manipulation with canvas](/en-US/docs/Web/API/Canvas_API/Tutorial/Pixel_manipulation_with_canvas).

## Cú pháp

```js-nolint
getImageData(sx, sy, sw, sh)
getImageData(sx, sy, sw, sh, settings)
```

### Tham số

- `sx`
- : Tọa độ trục x của góc trên bên trái của hình chữ nhật mà từ đó
  `ImageData` sẽ được trích xuất.
- `sy`
- : Tọa độ trục y của góc trên bên trái của hình chữ nhật mà từ đó
  `ImageData` sẽ được trích xuất.
- `sw`
- : Chiều rộng của hình chữ nhật mà từ đó `ImageData` sẽ được trích xuất.
  Giá trị dương ở bên phải và âm ở bên trái.
- `sh`
- : Chiều cao của hình chữ nhật mà từ đó `ImageData` sẽ được trích xuất.
  Giá trị dương giảm, giá trị âm tăng.
- `settings`{{optional_inline}}
- : Một đối tượng có các thuộc tính sau: -`colorSpace`
- : Chỉ định không gian màu của dữ liệu hình ảnh. Có thể được đặt thành `"srgb"`cho [sRGB color space](https://en.wikipedia.org/wiki/SRGB) hoặc`"display-p3"`cho [display-p3 color space](https://en.wikipedia.org/wiki/DCI-P3). -`pixelFormat`
- : Chỉ định định dạng pixel. Các giá trị có thể: -`"rgba-unorm8"`, đối với RGBA với định dạng chuẩn hóa không dấu 8 bit cho mỗi thành phần, sử dụng {{jsxref("Uint8ClampedArray")}}. -`"rgba-float16"`, đối với RGBA có 16 bit cho mỗi thành phần, sử dụng {{jsxref("Float16Array")}}. Giá trị pixel dấu phẩy động cho phép thể hiện màu sắc theo gam màu rộng tùy ý và dải động cao (HDR).

### Giá trị trả về

Một đối tượng {{domxref("ImageData")}} chứa dữ liệu hình ảnh cho hình chữ nhật của khung vẽ được chỉ định. Tọa độ của góc trên bên trái của hình chữ nhật là `(sx, sy)`, trong khi tọa độ của góc dưới cùng là`(sx + sw - 1, sy + sh - 1)`.

### Ngoại lệ

- `IndexSizeError`{{domxref("DOMException")}}
- : Bị ném nếu `sw`hoặc`sh` bằng 0.
- `SecurityError`{{domxref("DOMException")}}
- : Canvas chứa hoặc có thể chứa các pixel được tải từ nguồn gốc khác
  hơn cái mà từ đó tài liệu được tải. Để tránh `SecurityError`{{domxref("DOMException")}} bị ném vào tình huống này, hãy định cấu hình CORS để cho phép sử dụng hình ảnh nguồn theo cách này. Xem [Allowing cross-origin use of images and canvas](/en-US/docs/Web/HTML/How_to/CORS_enabled_image).

## Ví dụ

### Lấy dữ liệu hình ảnh từ canvas

Ví dụ này vẽ một hình ảnh, sau đó sử dụng `getImageData()` để lấy một phần canvas.

Chúng tôi sử dụng `getImageData()`để trích xuất một lát hình ảnh, bắt đầu từ`(10, 20)`, với chiều rộng là`80`và chiều cao là`230`. Sau đó, chúng ta vẽ lát cắt này ba lần, định vị dần dần các lát cắt bên dưới và bên phải của lát cắt cuối cùng.

#### HTML

```html
<canvas id="canvas" width="700" height="400"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

const image = new Image();
image.src = "plumeria.jpg";
image.addEventListener("load", () => {
  ctx.drawImage(image, 0, 0, 233, 320);

  const imageData = ctx.getImageData(10, 20, 80, 230);
  ctx.putImageData(imageData, 260, 0);
  ctx.putImageData(imageData, 380, 50);
  ctx.putImageData(imageData, 500, 100);
});
```

#### Kết quả

{{EmbedLiveSample("Getting_image_data_from_a_canvas", "", 420)}}

### Chuyển đổi không gian màu

Cài đặt `colorSpace` tùy chọn cho phép bạn lấy dữ liệu hình ảnh ở định dạng mong muốn.

```js
const context = canvas.getContext("2d", { colorSpace: "display-p3" });
context.fillStyle = "color(display-p3 0.5 0 0)";
context.fillRect(0, 0, 10, 10);

// Get ImageData converted to sRGB
const imageData = context.getImageData(0, 0, 1, 1, { colorSpace: "srgb" });
console.log(imageData.colorSpace); // "srgb"
```

### Lấy dữ liệu ở các định dạng pixel khác nhau

Cài đặt `pixelFormat` tùy chọn cho phép bạn lấy dữ liệu hình ảnh ở định dạng pixel mong muốn.

```js
const context = canvas.getContext("2d");

const imageData = context.getImageData(0, 0, 1, 1);
console.log(imageData.pixelFormat); // "rgba-unorm8"

const imageData = context.getImageData(0, 0, 1, 1, {
  pixelFormat: "rgba-float16",
});
console.log(imageData.pixelFormat); // "rgba-float16"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định phương thức này: {{domxref("CanvasRenderingContext2D")}}
- đối tượng {{domxref("ImageData")}}
- {{domxref("CanvasRenderingContext2D.putImageData()")}}
- [Pixel manipulation with canvas](/en-US/docs/Web/API/Canvas_API/Tutorial/Pixel_manipulation_with_canvas)
