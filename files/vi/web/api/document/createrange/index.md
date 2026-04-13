---
title: "Document: phương thức createRange()"
short-title: createRange()
slug: Web/API/Document/createRange
page-type: web-api-instance-method
browser-compat: api.Document.createRange
---

{{APIRef("DOM")}}

Phương thức **`Document.createRange()`** trả về một đối tượng {{domxref("Range")}} mới có điểm bắt đầu và kết thúc là offset 0 của đối tượng {{domxref("Document")}} mà nó được gọi.

## Cú pháp

```js-nolint
createRange()
```

### Tham số

Không có.

### Giá trị trả về

Đối tượng {{domxref("Range")}} đã tạo.

## Ví dụ

```js
const range = document.createRange();

range.setStart(startNode, startOffset);
range.setEnd(endNode, endOffset);
```

## Ghi chú

Sau khi một `Range` được tạo, bạn cần đặt các điểm ranh giới của nó trước khi có thể sử dụng hầu hết các phương thức của nó.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
