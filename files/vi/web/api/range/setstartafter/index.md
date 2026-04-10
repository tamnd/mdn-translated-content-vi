---
title: "Range: phương thức setStartAfter()"
short-title: setStartAfter()
slug: Web/API/Range/setStartAfter
page-type: web-api-instance-method
browser-compat: api.Range.setStartAfter
---

{{APIRef("DOM")}}

Phương thức **`Range.setStartAfter()`** đặt vị trí bắt đầu của một {{domxref("Range")}} tương đối với một {{domxref("Node")}}. Nút cha `Node` ở đầu `Range` sẽ giống với nút của `referenceNode`.

## Cú pháp

```js-nolint
setStartAfter(referenceNode)
```

### Tham số

- `referenceNode`
  - : {{domxref("Node")}} mà `Range` sẽ bắt đầu sau nó.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
const range = document.createRange();
const referenceNode = document.getElementsByTagName("div").item(0);

range.setStartAfter(referenceNode);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Chỉ mục các giao diện DOM](/en-US/docs/Web/API/Document_Object_Model)
