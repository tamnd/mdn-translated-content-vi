---
title: "TextMetrics: emHeightAscent property"
short-title: emHeightAscent
slug: Web/API/TextMetrics/emHeightAscent
page-type: web-api-instance-property
browser-compat: api.TextMetrics.emHeightAscent
---

{{APIRef("Canvas API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc `emHeightAscent` của giao diện {{domxref("TextMetrics")}} trả về khoảng cách từ đường ngang được chỉ định bởi thuộc tính {{domxref("CanvasRenderingContext2D.textBaseline")}} đến đỉnh của ô _em_ trong hộp dòng, tính bằng pixel CSS.

## Giá trị

Một số, tính bằng pixel CSS.

## Ví dụ

```js
const canvas = document.createElement("canvas");
const ctx = canvas.getContext("2d");
const text = ctx.measureText("foo"); // trả về đối tượng TextMetrics

text.emHeightAscent; // 7.59765625;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("TextMetrics")}}
