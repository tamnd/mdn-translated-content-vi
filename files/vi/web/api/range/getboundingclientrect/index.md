---
title: "Range: phương thức getBoundingClientRect()"
short-title: getBoundingClientRect()
slug: Web/API/Range/getBoundingClientRect
page-type: web-api-instance-method
browser-compat: api.Range.getBoundingClientRect
---

{{APIRef("DOM")}}

Phương thức **`getBoundingClientRect()`** của giao diện {{domxref("Range")}} trả về một đối tượng {{domxref("DOMRect")}} bao quanh toàn bộ nội dung của `Range`.

## Cú pháp

```js-nolint
getBoundingClientRect()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("DOMRect")}}.

## Ví dụ

```js
const range = document.createRange();
range.selectNode(document.getElementsByTagName("div").item(0));
const rect = range.getBoundingClientRect();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Chỉ mục các giao diện DOM](/en-US/docs/Web/API/Document_Object_Model)
