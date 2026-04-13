---
title: "Range: phương thức setStartBefore()"
short-title: setStartBefore()
slug: Web/API/Range/setStartBefore
page-type: web-api-instance-method
browser-compat: api.Range.setStartBefore
---

{{APIRef("DOM")}}

Phương thức **`Range.setStartBefore()`** đặt vị trí bắt đầu của một {{domxref("Range")}} tương đối với một {{domxref("Node")}} khác. Nút cha `Node` ở đầu `Range` sẽ giống với nút của `referenceNode`.

## Cú pháp

```js-nolint
setStartBefore(referenceNode)
```

### Tham số

- `referenceNode`
  - : {{domxref("Node")}} mà `Range` nên bắt đầu trước nó.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
const range = document.createRange();
const referenceNode = document.getElementsByTagName("div").item(0);

range.setStartBefore(referenceNode);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Chỉ mục các giao diện DOM](/en-US/docs/Web/API/Document_Object_Model)
