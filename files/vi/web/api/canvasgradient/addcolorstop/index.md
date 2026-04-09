---
title: "CanvasGradient: phương thức addColorStop()"
short-title: addColorStop()
slug: Web/API/CanvasGradient/addColorStop
page-type: web-api-instance-method
browser-compat: api.CanvasGradient.addColorStop
---

{{APIRef("Canvas API")}}{{AvailableInWorkers}}

**`CanvasGradient.addColorStop()`** thêm một điểm dừng màu mới, được xác định bởi `offset` và `color`, vào một gradient canvas cho trước.

## Cú pháp

```js-nolint
addColorStop(offset, color)
```

### Tham số

- `offset`
  - : Một số từ `0` đến `1`, bao gồm cả hai đầu, biểu thị vị trí của điểm dừng màu. `0` là đầu bắt đầu của gradient và `1` là đầu kết thúc.
- `color`
  - : Một giá trị [CSS](/en-US/docs/Web/CSS) {{cssxref("&lt;color&gt;")}} biểu thị màu của điểm dừng.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `IndexSizeError` {{domxref("DOMException")}}
  - : Ném ra nếu `offset` không nằm giữa 0 và 1, bao gồm cả hai đầu.
- `SyntaxError` {{domxref("DOMException")}}
  - : Ném ra nếu `color` không thể được phân tích cú pháp thành giá trị CSS {{cssxref("&lt;color&gt;")}}.

## Ví dụ

### Thêm các điểm dừng vào dải màu chuyển sắc

Ví dụ này dùng phương thức `addColorStop` để thêm các điểm dừng vào một đối tượng {{domxref("CanvasGradient")}} tuyến tính. Sau đó dải màu chuyển sắc được dùng để tô một hình chữ nhật.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

let gradient = ctx.createLinearGradient(0, 0, 200, 0);
gradient.addColorStop(0, "green");
gradient.addColorStop(0.7, "white");
gradient.addColorStop(1, "pink");
ctx.fillStyle = gradient;
ctx.fillRect(10, 10, 200, 100);
```

#### Kết quả

{{ EmbedLiveSample('Adding_stops_to_a_gradient', 700, 180) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện định nghĩa phương thức này: {{domxref("CanvasGradient")}}
- {{domxref("CanvasRenderingContext2D.createLinearGradient()")}}
- {{domxref("CanvasRenderingContext2D.createRadialGradient()")}}
