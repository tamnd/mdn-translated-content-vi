---
title: "Range: phương thức setEndBefore()"
short-title: setEndBefore()
slug: Web/API/Range/setEndBefore
page-type: web-api-instance-method
browser-compat: api.Range.setEndBefore
---

{{APIRef("DOM")}}

Phương thức **`Range.setEndBefore()`** đặt vị trí kết thúc của một `Range` tương đối với một {{domxref("Node")}} khác. Nút cha `Node` ở cuối `Range` sẽ giống với nút của `referenceNode`.

## Cú pháp

```js-nolint
setEndBefore(referenceNode)
```

### Tham số

- `referenceNode`
  - : {{domxref("Node")}} mà `Range` sẽ kết thúc trước nó.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
const range = document.createRange();
const referenceNode = document.getElementsByTagName("div").item(0);

range.setEndBefore(referenceNode);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Chỉ mục các giao diện DOM](/en-US/docs/Web/API/Document_Object_Model)
