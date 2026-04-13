---
title: "Node: phương thức isSameNode()"
short-title: isSameNode()
slug: Web/API/Node/isSameNode
page-type: web-api-instance-method
browser-compat: api.Node.isSameNode
---

{{APIRef("DOM")}}

Phương thức **`isSameNode()`** của giao diện {{domxref("Node")}} trả về `true` nếu hai nút là cùng một đối tượng.

## Cú pháp

```js-nolint
isSameNode(otherNode)
```

### Tham số

- `otherNode`
  - : Nút cần so sánh.

### Giá trị trả về

`true` nếu hai biến tham chiếu đến cùng một nút, ngược lại `false`.

## Ví dụ

```js
const node1 = document.querySelector("p");
const node2 = node1;
console.log(node1.isSameNode(node2)); // true
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
