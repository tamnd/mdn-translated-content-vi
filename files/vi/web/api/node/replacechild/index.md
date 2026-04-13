---
title: "Node: phương thức replaceChild()"
short-title: replaceChild()
slug: Web/API/Node/replaceChild
page-type: web-api-instance-method
browser-compat: api.Node.replaceChild
---

{{APIRef("DOM")}}

Phương thức **`replaceChild()`** của giao diện {{domxref("Node")}} thay thế một nút con hiện có bằng một nút khác.

## Cú pháp

```js-nolint
replaceChild(newChild, oldChild)
```

### Tham số

- `newChild`
  - : Nút mới sẽ được chèn vào.
- `oldChild`
  - : Nút con hiện tại sẽ bị thay thế.

### Giá trị trả về

Nút cũ đã bị thay thế.

## Ví dụ

```js
const parent = document.getElementById("parent");
const oldChild = document.getElementById("old");
const newChild = document.createElement("div");
parent.replaceChild(newChild, oldChild);
```

## Xem thêm

- {{domxref("Node.appendChild()")}}
- {{domxref("Node.insertBefore()")}}
- {{domxref("Node.removeChild()")}}
