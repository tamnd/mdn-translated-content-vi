---
title: "Range: phương thức setEndAfter()"
short-title: setEndAfter()
slug: Web/API/Range/setEndAfter
page-type: web-api-instance-method
browser-compat: api.Range.setEndAfter
---

{{APIRef("DOM")}}

Phương thức **`Range.setEndAfter()`** đặt vị trí kết thúc của một {{domxref("Range")}} tương đối với một {{domxref("Node")}} khác. Nút cha `Node` ở cuối `Range` sẽ giống với nút của `referenceNode`.

## Cú pháp

```js-nolint
setEndAfter(referenceNode)
```

### Tham số

- `referenceNode`
  - : {{domxref("Node")}} mà `Range` sẽ kết thúc sau nó.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
const range = document.createRange();
const referenceNode = document.getElementsByTagName("div").item(0);

range.setEndAfter(referenceNode);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Chỉ mục các giao diện DOM](/en-US/docs/Web/API/Document_Object_Model)
