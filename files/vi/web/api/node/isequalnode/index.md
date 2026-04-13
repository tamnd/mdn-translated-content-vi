---
title: "Node: phương thức isEqualNode()"
short-title: isEqualNode()
slug: Web/API/Node/isEqualNode
page-type: web-api-instance-method
browser-compat: api.Node.isEqualNode
---

{{APIRef("DOM")}}

Phương thức **`isEqualNode()`** của giao diện {{domxref("Node")}} trả về `true` nếu nút đã cho có cùng kiểu và cùng dữ liệu xác định với nút hiện tại.

## Cú pháp

```js-nolint
isEqualNode(otherNode)
```

### Tham số

- `otherNode`
  - : Nút cần so sánh.

### Giá trị trả về

`true` nếu hai nút bằng nhau về mặt cấu trúc và dữ liệu, ngược lại `false`.

## Ví dụ

```js
const node1 = document.createElement("p");
const node2 = document.createElement("p");
console.log(node1.isEqualNode(node2)); // true
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
