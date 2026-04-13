---
title: "Node: thuộc tính textContent"
short-title: textContent
slug: Web/API/Node/textContent
page-type: web-api-instance-property
browser-compat: api.Node.textContent
---

{{APIRef("DOM")}}

Thuộc tính **`textContent`** của giao diện {{domxref("Node")}} trả về hoặc đặt nội dung văn bản của nút hiện tại và tất cả nút con của nó.

## Giá trị

Một chuỗi chứa nội dung văn bản của nút hiện tại. Với tài liệu, `textContent` trả về `null`.

Khi được dùng như một bộ đặt, `textContent` sẽ thay thế toàn bộ nội dung của nút bằng chuỗi được cung cấp.

## Ví dụ

```js
const node = document.createElement("div");
node.textContent = "Hello world";
```

## Xem thêm

- {{domxref("Node.nodeValue")}}
- {{domxref("Element.textContent")}}
