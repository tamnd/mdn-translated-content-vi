---
title: "CanvasRenderingContext2D: phương thức createPattern()"
short-title: createPattern()
slug: Web/API/CanvasRenderingContext2D/createPattern
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.createPattern
---

{{APIRef("Canvas API")}}

Phương thức **`CanvasRenderingContext2D.createPattern()`** của API Canvas 2D tạo mẫu bằng cách sử dụng hình ảnh được chỉ định và sự lặp lại.
Phương thức này trả về {{domxref("CanvasPattern")}}.

Phương pháp này không vẽ trực tiếp bất cứ thứ gì lên canvas.
Mẫu mà nó tạo ra phải được gán cho thuộc tính {{domxref("CanvasRenderingContext2D.fillStyle")}} hoặc {{domxref("CanvasRenderingContext2D.strokeStyle")}}, sau đó nó được áp dụng cho bất kỳ bản vẽ tiếp theo nào.

## Cú pháp

```js-nolint
createPattern(image, repetition)
```

### Tham số

- `image`
- : Một hình ảnh được sử dụng làm hình ảnh của mẫu.
  Nó có thể là bất kỳ điều nào sau đây: -{{domxref("HTMLImageElement")}} ({{HTMLElement("img")}}) -{{domxref("SVGImageElement")}} ({{SVGElement("image")}})
- {{domxref("HTMLVideoElement")}} ({{HTMLElement("video")}}, bằng cách sử dụng tính năng quay video) -{{domxref("HTMLCanvasElement")}} ({{HTMLElement("canvas")}})
- {{domxref("ImageBitmap")}}
- {{domxref("OffscreenCanvas")}}
- {{domxref("VideoFrame")}}

-`repetition`

- : Một chuỗi cho biết cách lặp lại hình ảnh của mẫu.
  Các giá trị có thể là:
- `"repeat"` (cả hai hướng)
- `"repeat-x"` (chỉ ngang)
- `"repeat-y"` (chỉ dọc)
- `"no-repeat"` (không hướng)

Giá trị [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) được xử lý giống như chuỗi trống (`""`): cả hai đều là từ đồng nghĩa của`"repeat"`.

### Giá trị trả về

Một {{domxref("CanvasPattern")}} mờ đục mô tả một mẫu.

Nếu `image`không được tải đầy đủ ({{domxref("HTMLImageElement.complete")}} là`false`), thì [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) sẽ được trả về.

## Ví dụ

### Tạo mẫu từ hình ảnh

Ví dụ này sử dụng phương thức `createPattern()` để tạo {{domxref("CanvasPattern")}} với hình ảnh nguồn lặp lại.
Sau khi được tạo, mẫu sẽ được gán cho kiểu tô của ngữ cảnh canvas và được áp dụng cho hình chữ nhật.

Hình ảnh gốc trông như thế này:

! [A flowery pattern](canvas_create_pattern.png)

#### HTML

```html
<canvas id="canvas" width="300" height="300"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

const img = new Image();
img.src = "canvas_create_pattern.png";
// Only use the image after it's loaded
img.onload = () => {
  const pattern = ctx.createPattern(img, "repeat");
  ctx.fillStyle = pattern;
  ctx.fillRect(0, 0, 300, 300);
};
```

{{ EmbedLiveSample('Creating_a_pattern_from_an_image', 700, 310) }}

### Tạo mẫu từ canvas

Trong ví dụ này, chúng tôi tạo một mẫu từ nội dung của canvas ngoài màn hình.
Sau đó, chúng tôi áp dụng nó cho kiểu tô màu của khung vẽ chính của mình và tô màu khung vẽ đó bằng mẫu.

#### JavaScript

```js
// Create a pattern, offscreen
const patternCanvas = document.createElement("canvas");
const patternContext = patternCanvas.getContext("2d");

// Give the pattern a width and height of 50
patternCanvas.width = 50;
patternCanvas.height = 50;

// Give the pattern a background color and draw an arc
patternContext.fillStyle = "#ffeecc";
patternContext.fillRect(0, 0, patternCanvas.width, patternCanvas.height);
patternContext.arc(0, 0, 50, 0, 0.5 * Math.PI);
patternContext.stroke();

// Create our primary canvas and fill it with the pattern
const canvas = document.createElement("canvas");
const ctx = canvas.getContext("2d");
const pattern = ctx.createPattern(patternCanvas, "repeat");
ctx.fillStyle = pattern;
ctx.fillRect(0, 0, canvas.width, canvas.height);

// Add our primary canvas to the webpage
document.body.appendChild(canvas);
```

#### Kết quả

{{ EmbedLiveSample('Creating_a_pattern_from_a_canvas', 700, 160) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định phương thức này: {{domxref("CanvasRenderingContext2D")}}
- {{domxref("CanvasPattern")}}
