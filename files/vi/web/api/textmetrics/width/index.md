---
title: "TextMetrics: width property"
short-title: width
slug: Web/API/TextMetrics/width
page-type: web-api-instance-property
browser-compat: api.TextMetrics.width
---

{{APIRef("Canvas API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`width`** của giao diện {{domxref("TextMetrics")}} chứa chiều rộng tiến (advance width) của văn bản (chiều rộng của hộp nội tuyến đó) tính bằng pixel CSS.

## Ví dụ

Bắt đầu với phần tử {{HTMLElement("canvas")}} sau:

```html
<canvas id="canvas"></canvas>
```

Bạn có thể lấy đối tượng {{domxref("TextMetrics")}} bằng đoạn code sau:

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

let text = ctx.measureText("foo"); // đối tượng TextMetrics
text.width; // 16;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("TextMetrics")}}
