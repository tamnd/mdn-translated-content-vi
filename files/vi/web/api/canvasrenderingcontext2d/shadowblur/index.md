---
title: "CanvasRenderingContext2D: thuộc tính ShadowBlur"
short-title: bóngMờ
slug: Web/API/CanvasRenderingContext2D/shadowBlur
page-type: web-api-instance-property
browser-compat: api.CanvasRenderingContext2D.shadowBlur
---

{{APIRef("Canvas API")}}

Thuộc tính **`CanvasRenderingContext2D.shadowBlur`** của API Canvas 2D chỉ định mức độ mờ được áp dụng cho bóng. Mặc định là`0`(không mờ).

> [!LƯU Ý]
> Bóng chỉ được vẽ nếu
> Thuộc tính{{domxref("CanvasRenderingContext2D.shadowColor", "shadowColor")}}được đặt thành
> một giá trị không minh bạch. Một trong những`shadowBlur`,
> {{domxref("CanvasRenderingContext2D.shadowOffsetX", "shadowOffsetX")}}, hoặc
> thuộc tính{{domxref("CanvasRenderingContext2D.shadowOffsetY", "shadowOffsetY")}}phải
> cũng khác 0.

## Giá trị

Một số float không âm chỉ định mức độ mờ của bóng, trong đó`0`biểu thị không có độ mờ và số lớn hơn biểu thị mức độ mờ ngày càng nhiều. Giá trị này không tương ứng với một số pixel và không bị ảnh hưởng bởi ma trận chuyển đổi hiện tại. Giá trị mặc định là`0`. Các giá trị âm,{{jsxref("Infinity")}}và{{jsxref("NaN")}}bị bỏ qua.

## Ví dụ

### Thêm bóng vào hình dạng

Ví dụ này thêm bóng mờ vào hình chữ nhật. Thuộc tính`shadowColor`đặt màu của nó và`shadowBlur`đặt mức độ mờ của nó.

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
ctx.shadowBlur = 15;

// Rectangle
ctx.fillStyle = "blue";
ctx.fillRect(20, 20, 150, 100);
```

#### Kết quả

{{ EmbedLiveSample('Adding_a_shadow_to_a_shape', 700, 180) }}

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
- {{domxref("CanvasRenderingContext2D.shadowColor")}}
