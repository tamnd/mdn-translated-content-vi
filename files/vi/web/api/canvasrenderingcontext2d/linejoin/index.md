---
title: "CanvasRenderingContext2D: thuộc tính lineJoin"
short-title: dòngTham gia
slug: Web/API/CanvasRenderingContext2D/lineJoin
page-type: web-api-instance-property
browser-compat: api.CanvasRenderingContext2D.lineJoin
---

{{APIRef("Canvas API")}}

Thuộc tính **`CanvasRenderingContext2D.lineJoin`** của API Canvas 2D xác định hình dạng được sử dụng để nối hai đoạn đường nơi chúng gặp nhau.

Thuộc tính này không có hiệu lực khi hai đoạn được kết nối có cùng hướng, vì sẽ không có vùng nối nào được thêm vào trong trường hợp này. Các đoạn suy biến có độ dài bằng 0 (tức là với tất cả các điểm cuối và điểm kiểm soát ở cùng một vị trí) cũng bị bỏ qua.

> [!LƯU Ý]
> Các đường có thể được vẽ bằng
> {{domxref("CanvasRenderingContext2D.stroke()", "stroke()")}},
> {{domxref("CanvasRenderingContext2D.strokeRect()", "strokeRect()")}},
> và {{domxref("CanvasRenderingContext2D.strokeText()", "strokeText()")}}.

## Giá trị

Có ba giá trị có thể có cho thuộc tính này:`"round"`,`"bevel"`và`"miter"`. Mặc định là`"miter"`.

! [Three horizontal zigzag lines with round, bevel, and miter values, shown from top to bottom respectively.](canvas_linejoin.png)

- `"round"`
- : Làm tròn các góc của hình bằng cách lấp đầy một khu vực đĩa bổ sung ở giữa
  tại điểm cuối chung của các phân đoạn được kết nối. Bán kính của các góc tròn này bằng chiều rộng của đường thẳng.
- `"bevel"`
- : Lấp đầy một vùng hình tam giác bổ sung giữa điểm cuối chung của kết nối
  các đoạn và các góc hình chữ nhật bên ngoài riêng biệt của mỗi đoạn.
- `"miter"`
- : Các phân đoạn được kết nối được nối bằng cách mở rộng các cạnh bên ngoài của chúng để kết nối tại một
  một điểm duy nhất, với tác dụng lấp đầy một khu vực hình thoi bổ sung. Cài đặt này bị ảnh hưởng bởi thuộc tính {{domxref("CanvasRenderingContext2D.miterLimit", "miterLimit")}}. Giá trị mặc định.

## Ví dụ

### Thay đổi các kết nối trong một đường dẫn

Ví dụ này áp dụng các đường nối tròn cho một đường dẫn.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

ctx.lineWidth = 20;
ctx.lineJoin = "round";
ctx.beginPath();
ctx.moveTo(20, 20);
ctx.lineTo(190, 100);
ctx.lineTo(280, 20);
ctx.lineTo(280, 150);
ctx.stroke();
```

#### Kết quả

{{ EmbedLiveSample('Changing_the_joins_in_a_path', 700, 180) }}

### So sánh các đường nối

Ví dụ bên dưới vẽ ba đường dẫn khác nhau, thể hiện từng đường dẫn trong số ba tùy chọn `lineJoin`.

```html hidden
<canvas id="canvas" width="150" height="150"></canvas>
```

```js
const ctx = document.getElementById("canvas").getContext("2d");
ctx.lineWidth = 10;

["round", "bevel", "miter"].forEach((join, i) => {
  ctx.lineJoin = join;
  ctx.beginPath();
  ctx.moveTo(-5, 5 + i * 40);
  ctx.lineTo(35, 45 + i * 40);
  ctx.lineTo(75, 5 + i * 40);
  ctx.lineTo(115, 45 + i * 40);
  ctx.lineTo(155, 5 + i * 40);
  ctx.stroke();
});
```

{{EmbedLiveSample("Comparison_of_line_joins", "", "180")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

### Ghi chú dành riêng cho WebKit/Blink

- Trong Trình duyệt dựa trên WebKit và Blink, một phương thức không chuẩn và không được dùng nữa
  `ctx.setLineJoin()` được triển khai ngoài thuộc tính này.

## Xem thêm

- Giao diện xác định thuộc tính này: {{domxref("CanvasRenderingContext2D")}}
- {{domxref("CanvasRenderingContext2D.lineCap")}}
- {{domxref("CanvasRenderingContext2D.lineWidth")}}
- [Applying styles and color](/en-US/docs/Web/API/Canvas_API/Tutorial/Applying_styles_and_colors)
