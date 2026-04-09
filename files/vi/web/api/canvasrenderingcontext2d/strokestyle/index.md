---
title: "CanvasRenderingContext2D: thuộc tính StrokeStyle"
short-title: đột quỵPhong cách
slug: Web/API/CanvasRenderingContext2D/strokeStyle
page-type: web-api-instance-property
browser-compat: api.CanvasRenderingContext2D.strokeStyle
---

{{APIRef("Canvas API")}}

Thuộc tính **`CanvasRenderingContext2D.strokeStyle`** của API Canvas 2D chỉ định màu sắc, độ chuyển màu hoặc mẫu sẽ sử dụng cho các nét (đường viền) xung quanh hình dạng. Mặc định là`black`.

> [!LƯU Ý]
> Để biết thêm ví dụ về kiểu nét và tô màu, hãy xem[Applying styles and color](/en-US/docs/Web/API/Canvas_API/Tutorial/Applying_styles_and_colors)trong[Canvas tutorial](/en-US/docs/Web/API/Canvas_API/Tutorial).

## Giá trị

Một trong những điều sau đây:

- `color`
  - : Một chuỗi được phân tích cú pháp là[CSS](/en-US/docs/Web/CSS)
    Giá trị{{cssxref("&lt;color&gt;")}}.
- `gradient`
  - : Đối tượng{{domxref("CanvasGradient")}}(gradient tuyến tính hoặc hướng tâm).
- `pattern`
  - : Đối tượng{{domxref("CanvasPattern")}}(hình ảnh lặp lại).

## Ví dụ

### Thay đổi màu nét của hình

Ví dụ này áp dụng màu nét viền màu xanh lam cho hình chữ nhật.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

ctx.strokeStyle = "blue";
ctx.strokeRect(10, 10, 100, 100);
```

#### Kết quả

{{ EmbedLiveSample('Changing_the_stroke_color_of_a_shape', 700, 160) }}

### Tạo nhiều màu nét bằng cách sử dụng vòng lặp

Trong ví dụ này, chúng tôi sử dụng hai vòng lặp`for`và phương thức{{domxref("CanvasRenderingContext2D.arc", "arc()")}}để vẽ một lưới các vòng tròn, mỗi vòng có một màu nét khác nhau. Để đạt được điều này, chúng tôi sử dụng hai biến`i`và`j`để tạo màu RGB duy nhất cho mỗi vòng tròn và chỉ sửa đổi giá trị xanh lục và xanh lam. (Kênh màu đỏ có giá trị cố định.)

```html hidden
<canvas id="canvas" width="150" height="150"></canvas>
```

```js
const ctx = document.getElementById("canvas").getContext("2d");

for (let i = 0; i < 6; i++) {
  for (let j = 0; j < 6; j++) {
    ctx.strokeStyle = `rgb(
        0
        ${Math.floor(255 - 42.5 * i)}
        ${Math.floor(255 - 42.5 * j)})`;
    ctx.beginPath();
    ctx.arc(12.5 + j * 25, 12.5 + i * 25, 10, 0, Math.PI * 2, true);
    ctx.stroke();
  }
}
```

Kết quả trông như thế này:

{{EmbedLiveSample("Creating_multiple_stroke_colors_using_loops", "", "180")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

### Ghi chú dành riêng cho WebKit/Blink

Trong các trình duyệt dựa trên WebKit và Blink, phương thức không chuẩn và không được dùng nữa`ctx.setStrokeColor()`được triển khai cùng với thuộc tính này.

```js
setStrokeColor(color);
setStrokeColor(color, alpha);
setStrokeColor(grayLevel);
setStrokeColor(grayLevel, alpha);
setStrokeColor(r, g, b, a);
setStrokeColor(c, m, y, k, a);
```

## Xem thêm

- Giao diện xác định thuộc tính này:{{domxref("CanvasRenderingContext2D")}}
- {{domxref("CanvasGradient")}}
- {{domxref("CanvasPattern")}}
