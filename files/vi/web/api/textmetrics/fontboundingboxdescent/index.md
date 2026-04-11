---
title: "TextMetrics: fontBoundingBoxDescent property"
short-title: fontBoundingBoxDescent
slug: Web/API/TextMetrics/fontBoundingBoxDescent
page-type: web-api-instance-property
browser-compat: api.TextMetrics.fontBoundingBoxDescent
---

{{APIRef("Canvas API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc `fontBoundingBoxDescent` của giao diện {{domxref("TextMetrics")}} trả về khoảng cách từ đường ngang được chỉ định bởi thuộc tính {{domxref("CanvasRenderingContext2D.textBaseline")}} đến đáy của hình chữ nhật bao quanh tất cả các font chữ được dùng để hiển thị văn bản, tính bằng pixel CSS.

## Giá trị

Một số, tính bằng pixel CSS.

## Ví dụ

Đoạn code dưới đây cho thấy cách lấy `fontBoundingBoxDescent` cho một văn bản với font chữ cụ thể.

```js
const canvas = document.createElement("canvas");
const ctx = canvas.getContext("2d");

ctx.font = "25px serif";
const text = "Foo";

const textMetrics = ctx.measureText(text); // trả về đối tượng TextMetrics
const descentCssPixels = textMetrics.fontBoundingBoxDescent;
```

```html hidden
<p id="log"></p>
```

```js hidden
const log = document.getElementById("log");
log.innerText = `fontBoundingBoxDescent: ${descentCssPixels}`;
```

Giá trị descent tính bằng pixel CSS cho văn bản "Foo" với font serif 25px được hiển thị bên dưới.

{{EmbedLiveSample('Examples', 100, 50)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("TextMetrics.fontBoundingBoxAscent")}}
- {{domxref("TextMetrics")}}
