---
title: "CanvasRenderingContext2D: thuộc tính fillStyle"
short-title: điền kiểu
slug: Web/API/CanvasRenderingContext2D/fillStyle
page-type: web-api-instance-property
browser-compat: api.CanvasRenderingContext2D.fillStyle
---

{{APIRef("Canvas API")}}

Thuộc tính **`CanvasRenderingContext2D.fillStyle`** của [Canvas 2D API](/en-US/docs/Web/API/Canvas_API) chỉ định màu sắc, độ dốc hoặc mẫu để sử dụng các hình dạng bên trong. Kiểu mặc định là`black`.

> [!LƯU Ý]
> Để biết thêm ví dụ về kiểu tô màu và nét vẽ, hãy xem [Applying styles and color](/en-US/docs/Web/API/Canvas_API/Tutorial/Applying_styles_and_colors) trong [Canvas tutorial](/en-US/docs/Web/API/Canvas_API/Tutorial).

## Giá trị

Một trong những điều sau đây:

- Một chuỗi được phân tích cú pháp dưới dạng giá trị CSS {{cssxref("&lt;color&gt;")}}.
- Đối tượng {{domxref("CanvasGradient")}}(gradient tuyến tính hoặc hướng tâm).
- Đối tượng {{domxref("CanvasPattern")}}(hình ảnh lặp lại).

## Ví dụ

### Thay đổi màu tô của hình dạng

Ví dụ này áp dụng màu tô màu xanh lam cho hình chữ nhật.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

ctx.fillStyle = "blue";
ctx.fillRect(10, 10, 100, 100);
```

#### Kết quả

{{ EmbedLiveSample('Changing_the_fill_color_of_a_shape', 700, 160) }}

### Tạo nhiều màu tô bằng vòng lặp

Trong ví dụ này, chúng tôi sử dụng hai vòng lặp `for`để vẽ một lưới các hình chữ nhật, mỗi lưới có một màu tô khác nhau. Để đạt được điều này, chúng tôi sử dụng hai biến`i`và`j` để tạo màu RGB duy nhất cho mỗi hình vuông và chỉ sửa đổi giá trị màu đỏ và xanh lục. (Kênh màu xanh lam có giá trị cố định.) Bằng cách sửa đổi các kênh, bạn có thể tạo tất cả các loại bảng màu.

```html hidden
<canvas id="canvas" width="150" height="150"></canvas>
```

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

for (let i = 0; i < 6; i++) {
  for (let j = 0; j < 6; j++) {
    ctx.fillStyle = `rgb(
        ${Math.floor(255 - 42.5 * i)}
        ${Math.floor(255 - 42.5 * j)}
        0)`;
    ctx.fillRect(j * 25, i * 25, 25, 25);
  }
}
```

Kết quả trông như thế này:

{{EmbedLiveSample("Creating_multiple_fill_colors_using_loops", "", "160")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

### Ghi chú dành riêng cho WebKit/Blink

Trong các trình duyệt dựa trên WebKit và Blink, phương thức không chuẩn và không được dùng nữa `ctx.setFillColor()` được triển khai cùng với thuộc tính này.

```js
setFillColor(color, /* (optional) */ alpha);
setFillColor(grayLevel, /* (optional) */ alpha);
setFillColor(r, g, b, a);
setFillColor(c, m, y, k, a);
```

## Xem thêm

- [Canvas API](/en-US/docs/Web/API/Canvas_API)
- Giao diện xác định thuộc tính này: {{domxref("CanvasRenderingContext2D")}}
- Các giá trị được sử dụng bởi thuộc tính này:
- {{cssxref("&lt;color&gt;")}} Kiểu dữ liệu CSS - đối tượng {{domxref("CanvasGradient")}}- đối tượng {{domxref("CanvasPattern")}}
