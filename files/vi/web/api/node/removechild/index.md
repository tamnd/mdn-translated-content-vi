---
title: "Node: phương thức removeChild()"
short-title: removeChild()
slug: Web/API/Node/removeChild
page-type: web-api-instance-method
browser-compat: api.Node.removeChild
---

{{APIRef("DOM")}}

Phương thức **`removeChild()`** của giao diện {{domxref("Node")}} xóa một nút con khỏi nút hiện tại.

## Cú pháp

```js-nolint
removeChild(child)
```

### Tham số

- `child`
  - : Nút con cần xóa.

### Giá trị trả về

Nút đã bị xóa.

### Ngoại lệ

- `NotFoundError` {{domxref("DOMException")}}
  - : Được ném ra nếu `child` không phải là nút con của nút hiện tại.

## Ví dụ

```js
const node = document.getElementById("box");
while (node.firstChild) {
  node.removeChild(node.firstChild);
}
```

## Xem thêm

- {{domxref("Node.appendChild()")}}
- {{domxref("Node.insertBefore()")}}
- {{domxref("Node.replaceChild()")}}
