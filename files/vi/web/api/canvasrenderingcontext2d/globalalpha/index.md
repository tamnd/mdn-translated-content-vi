---
title: "CanvasRenderingContext2D: thuộc tính GlobalAlpha"
short-title: toàn cầuAlpha
slug: Web/API/CanvasRenderingContext2D/globalAlpha
page-type: web-api-instance-property
browser-compat: api.CanvasRenderingContext2D.globalAlpha
---

{{APIRef("Canvas API")}}

Thuộc tính **`CanvasRenderingContext2D.globalAlpha`** của API Canvas 2D chỉ định giá trị alpha (độ trong suốt) được áp dụng cho các hình dạng và hình ảnh trước khi chúng được vẽ lên canvas.

> [!LƯU Ý]
> Xem thêm chương [Applying styles and color](/en-US/docs/Web/API/Canvas_API/Tutorial/Applying_styles_and_colors) trong [Canvas Tutorial](/en-US/docs/Web/API/Canvas_API/Tutorial).

## Giá trị

Một số nằm trong khoảng từ `0.0`(hoàn toàn trong suốt) đến`1.0`(hoàn toàn mờ), bao gồm. Giá trị mặc định là`1.0`. Các giá trị nằm ngoài phạm vi đó, bao gồm {{jsxref("Infinity")}} và {{jsxref("NaN")}}, sẽ không được đặt và`globalAlpha` sẽ giữ nguyên giá trị trước đó.

## Ví dụ

### Vẽ các hình trong suốt

Ví dụ này sử dụng thuộc tính `globalAlpha` để vẽ hai hình chữ nhật bán trong suốt.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

ctx.globalAlpha = 0.5;

ctx.fillStyle = "blue";
ctx.fillRect(10, 10, 100, 100);

ctx.fillStyle = "red";
ctx.fillRect(50, 50, 100, 100);
```

#### Kết quả

{{ EmbedLiveSample('Drawing_translucent_shapes', 700, 180) }}

### Xếp chồng các hình dạng trong suốt

Ví dụ này minh họa tác dụng của việc chồng nhiều hình dạng trong suốt lên nhau. Chúng ta bắt đầu bằng cách vẽ một nền đồng nhất gồm bốn hình vuông có màu khác nhau. Tiếp theo, chúng tôi đặt thuộc tính `globalAlpha`thành`0.2`(mờ 20%); mức alpha này sẽ áp dụng cho tất cả các hình dạng trong suốt của chúng tôi. Sau đó, chúng ta sử dụng vòng lặp`for` để vẽ một loạt các vòng tròn có bán kính tăng dần.

Với mỗi vòng tròn mới, độ mờ của các vòng tròn trước đó bên dưới sẽ tăng lên một cách hiệu quả. Nếu chúng ta tăng số bước (và do đó vẽ nhiều vòng tròn hơn), nền cuối cùng sẽ biến mất hoàn toàn khỏi tâm hình ảnh.

```html hidden
<canvas id="canvas" width="150" height="150"></canvas>
```

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

// Draw background
ctx.fillStyle = "#ffdd00";
ctx.fillRect(0, 0, 75, 75);
ctx.fillStyle = "#66cc00";
ctx.fillRect(75, 0, 75, 75);
ctx.fillStyle = "#0099ff";
ctx.fillRect(0, 75, 75, 75);
ctx.fillStyle = "#ff3300";
ctx.fillRect(75, 75, 75, 75);
ctx.fillStyle = "white";

// Set transparency value
ctx.globalAlpha = 0.2;

// Draw transparent circles
for (let i = 0; i < 7; i++) {
  ctx.beginPath();
  ctx.arc(75, 75, 10 + 10 * i, 0, Math.PI * 2, true);
  ctx.fill();
}
```

{{EmbedLiveSample("Overlaying_transparent_shapes", "", "180")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

### Ghi chú dành riêng cho tắc kè

- Bắt đầu với Gecko 5.0, chỉ định giá trị không hợp lệ cho `globalAlpha` không
  ném ra ngoại lệ `SYNTAX_ERR` lâu hơn; những điều này hiện đã được bỏ qua một cách chính xác.

### Ghi chú dành riêng cho WebKit/Blink

- Trong các trình duyệt dựa trên WebKit và Blink, một phương pháp không chuẩn và không được dùng nữa
  `ctx.setAlpha()` được triển khai ngoài thuộc tính này.

## Xem thêm

- Giao diện xác định thuộc tính này: {{domxref("CanvasRenderingContext2D")}}
- {{domxref("CanvasRenderingContext2D.globalCompositeOperation")}}
