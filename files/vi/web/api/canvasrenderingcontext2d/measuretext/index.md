---
title: "CanvasRenderingContext2D: phương thức MeasureText()"
short-title: đoText()
slug: Web/API/CanvasRenderingContext2D/measureText
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.measureText
---

{{APIRef("Canvas API")}}

Phương thức `CanvasRenderingContext2D.measureText()` trả về một đối tượng {{domxref("TextMetrics")}} chứa thông tin về văn bản được đo (chẳng hạn như chiều rộng của nó chẳng hạn).

## Cú pháp

```js-nolint
measureText(text)
```

### Tham số

- `text`
- : Chuỗi văn bản cần đo.

### Giá trị trả về

Một đối tượng {{domxref("TextMetrics")}}.

## Ví dụ

Với phần tử {{HTMLElement("canvas")}} này:

```html
<canvas id="canvas"></canvas>
```

… bạn có thể nhận được một đối tượng {{domxref("TextMetrics")}} bằng cách sử dụng đoạn mã sau:

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

let text = ctx.measureText("Hello world");
console.log(text.width); // 56;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định phương thức này: {{domxref("CanvasRenderingContext2D")}}
- {{domxref("TextMetrics")}}
