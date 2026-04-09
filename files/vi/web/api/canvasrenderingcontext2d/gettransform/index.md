---
title: "CanvasRenderingContext2D: phương thức getTransform()"
short-title: getTransform()
slug: Web/API/CanvasRenderingContext2D/getTransform
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.getTransform
---

{{APIRef("Canvas API")}}

Phương thức **`CanvasRenderingContext2D.getTransform()`** của API Canvas 2D truy xuất ma trận chuyển đổi hiện tại đang được áp dụng cho ngữ cảnh.

## Cú pháp

```js-nolint
getTransform()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("DOMMatrix")}}.

Ma trận biến đổi được mô tả bởi:

<!-- prettier-ignore-start -->
<math display="block">
 <semantics><mrow><mo>[</mo><mtable columnalign="center center center" rowspacing="0.5ex"><mtr><mtd><mi>a</mi></mtd><mtd><mi>c</mi></mtd><mtd><mi>e</mi></mtd></mtr><mtr><mtd><mi>b</mi></mtd><mtd><mi>d</mi></mtd><mtd><mi>f</mi></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd></mtr></mtable><mo>]</mo></mrow><annotation encoding="TeX">\left [ \begin{array}{ccc} a & c & e \\ b & d & f \\ 0 & 0 & 1 \end{array} \right]</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

> [!LƯU Ý]
> Đối tượng được trả về không hoạt động nên việc cập nhật nó sẽ không hoạt động
> ảnh hưởng đến ma trận biến đổi hiện tại và cập nhật phép biến đổi hiện tại
> ma trận sẽ không ảnh hưởng đến `DOMMatrix` đã được trả về.

## Ví dụ

Trong ví dụ sau, chúng ta có hai phần tử {{htmlelement("canvas")}}. Chúng tôi áp dụng một phép biến đổi cho bối cảnh của bối cảnh đầu tiên bằng cách sử dụng {{domxref("CanvasRenderingContext2D.setTransform()")}} và vẽ một hình vuông trên đó, sau đó truy xuất ma trận từ nó bằng cách sử dụng `getTransform()`.

Sau đó, chúng tôi áp dụng trực tiếp ma trận được truy xuất vào ngữ cảnh canvas thứ hai bằng cách chuyển trực tiếp đối tượng `DOMMatrix`tới`setTransform()` và vẽ một vòng tròn trên đó.

### HTML

```html
<canvas width="240"></canvas> <canvas width="240"></canvas>
```

### CSS

```css
canvas {
  border: 1px solid black;
}
```

### JavaScript

```js
const canvases = document.querySelectorAll("canvas");
const ctx1 = canvases[0].getContext("2d");
const ctx2 = canvases[1].getContext("2d");

ctx1.setTransform(1, 0.2, 0.8, 1, 0, 0);
ctx1.fillRect(25, 25, 50, 50);

let storedTransform = ctx1.getTransform();
console.log(storedTransform);

ctx2.setTransform(storedTransform);
ctx2.beginPath();
ctx2.arc(50, 50, 50, 0, 2 * Math.PI);
ctx2.fill();
```

### Kết quả

{{ EmbedLiveSample('Examples', "100%", 180) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định phương thức này: {{domxref("CanvasRenderingContext2D")}}
- {{domxref("CanvasRenderingContext2D.transform()")}}
