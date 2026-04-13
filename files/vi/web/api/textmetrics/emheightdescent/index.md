---
title: "TextMetrics: emHeightDescent property"
short-title: emHeightDescent
slug: Web/API/TextMetrics/emHeightDescent
page-type: web-api-instance-property
browser-compat: api.TextMetrics.emHeightDescent
---

{{APIRef("Canvas API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc `emHeightDescent` của giao diện {{domxref("TextMetrics")}} trả về khoảng cách từ đường ngang được chỉ định bởi thuộc tính {{domxref("CanvasRenderingContext2D.textBaseline")}} đến đáy của ô _em_ trong hộp dòng, tính bằng pixel CSS.

## Giá trị

Một số, tính bằng pixel CSS.

## Ví dụ

```js
const canvas = document.createElement("canvas");
const ctx = canvas.getContext("2d");
const text = ctx.measureText("foo"); // trả về đối tượng TextMetrics

text.emHeightDescent; // -2.40234375;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("TextMetrics")}}
