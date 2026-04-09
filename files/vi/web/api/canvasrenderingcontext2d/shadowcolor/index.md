---
title: "CanvasRenderingContext2D: thuộc tính ShadowColor"
short-title: bóngMàu sắc
slug: Web/API/CanvasRenderingContext2D/shadowColor
page-type: web-api-instance-property
browser-compat: api.CanvasRenderingContext2D.shadowColor
---

{{APIRef("Canvas API")}}

Thuộc tính **`CanvasRenderingContext2D.shadowColor`** của API Canvas 2D chỉ định màu của bóng.

Xin lưu ý rằng độ mờ được hiển thị của bóng sẽ bị ảnh hưởng bởi độ mờ của màu{{domxref("CanvasRenderingContext2D.fillStyle", "fillStyle")}}khi tô màu và độ mờ của màu{{domxref("CanvasRenderingContext2D.strokeStyle", "strokeStyle")}}khi vuốt.

> [!LƯU Ý]
> Bóng chỉ được vẽ nếu`shadowColor`
> thuộc tính được đặt thành giá trị không minh bạch. Một trong những
> {{domxref("CanvasRenderingContext2D.shadowBlur", "shadowBlur")}},
> {{domxref("CanvasRenderingContext2D.shadowOffsetX", "shadowOffsetX")}}, hoặc
> thuộc tính{{domxref("CanvasRenderingContext2D.shadowOffsetY", "shadowOffsetY")}}phải
> cũng khác 0.

## Giá trị

Một chuỗi được phân tích cú pháp dưới dạng giá trị[CSS](/en-US/docs/Web/CSS){{cssxref("&lt;color&gt;")}}. Giá trị mặc định là màu đen hoàn toàn trong suốt.

## Ví dụ

### Thêm bóng vào hình dạng

Ví dụ này thêm bóng vào hai hình vuông; cái đầu tiên được lấp đầy, và cái thứ hai được vuốt ve. Thuộc tính`shadowColor`đặt màu của bóng, trong khi`shadowOffsetX`và`shadowOffsetY`đặt vị trí của chúng so với hình dạng.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

// Shadow
ctx.shadowColor = "red";
ctx.shadowOffsetX = 10;
ctx.shadowOffsetY = 10;

// Filled rectangle
ctx.fillRect(20, 20, 100, 100);

// Stroked rectangle
ctx.lineWidth = 6;
ctx.strokeRect(170, 20, 100, 100);
```

#### Kết quả

{{ EmbedLiveSample('Adding_a_shadow_to_shapes', 700, 180) }}

### Bóng trên các hình mờ

Độ mờ của bóng bị ảnh hưởng bởi mức độ trong suốt của đối tượng cha của nó (ngay cả khi`shadowColor`chỉ định giá trị mờ hoàn toàn). Ví dụ này tạo nét và tô màu hình chữ nhật bằng màu mờ.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

Giá trị alpha thu được của bóng đổ là`.8 * .2`hoặc`.16`. Alpha của bóng nét là`.8 * .6`hoặc`.48`.

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

// Shadow
ctx.shadowColor = "rgb(255 0 0 / 80%)";
ctx.shadowBlur = 8;
ctx.shadowOffsetX = 30;
ctx.shadowOffsetY = 20;

// Filled rectangle
ctx.fillStyle = "rgb(0 255 0 / 20%)";
ctx.fillRect(10, 10, 150, 100);

// Stroked rectangle
ctx.lineWidth = 10;
ctx.strokeStyle = "rgb(0 0 255 / 60%)";
ctx.strokeRect(10, 10, 150, 100);
```

#### Kết quả

{{ EmbedLiveSample('Shadows_on_translucent_shapes', 700, 180) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

### Ghi chú dành riêng cho WebKit/Blink

Trong các trình duyệt dựa trên WebKit và Blink, phương thức không chuẩn và không được dùng nữa`ctx.setShadow()`được triển khai bên cạnh thuộc tính này.

```js
setShadow(width, height, blur, color, alpha);
setShadow(width, height, blur, graylevel, alpha);
setShadow(width, height, blur, r, g, b, a);
setShadow(width, height, blur, c, m, y, k, a);
```

## Xem thêm

- Giao diện xác định thuộc tính này:{{domxref("CanvasRenderingContext2D")}}
