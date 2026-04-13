---
title: "Range: phương thức getClientRects()"
short-title: getClientRects()
slug: Web/API/Range/getClientRects
page-type: web-api-instance-method
browser-compat: api.Range.getClientRects
---

{{APIRef("DOM")}}

Phương thức **`getClientRects()`** của giao diện {{domxref("Range")}} trả về danh sách các đối tượng {{domxref("DOMRect")}} tổng hợp kết quả của {{domxref("Element.getClientRects()")}} cho mọi phần tử trong `Range`.

## Cú pháp

```js-nolint
getClientRects()
```

### Tham số

Không có.

### Giá trị trả về

Danh sách các đối tượng {{domxref("DOMRect")}}.

## Ví dụ

```js
const range = document.createRange();
range.selectNode(document.getElementsByTagName("div").item(0));
const rects = range.getClientRects();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Chỉ mục các giao diện DOM](/en-US/docs/Web/API/Document_Object_Model)
