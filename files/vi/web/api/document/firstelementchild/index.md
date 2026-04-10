---
title: "Document: thuộc tính firstElementChild"
short-title: firstElementChild
slug: Web/API/Document/firstElementChild
page-type: web-api-instance-property
browser-compat: api.Document.firstElementChild
---

{{ APIRef("DOM") }}

Thuộc tính chỉ đọc **`Document.firstElementChild`** trả về {{domxref("Element")}} con đầu tiên của tài liệu, hoặc `null` nếu không có phần tử con nào.

Đối với tài liệu HTML, đây thường là phần tử con duy nhất, phần tử gốc `<html>`.

Xem {{domxref("Element.firstElementChild")}} cho phần tử con đầu tiên của các phần tử cụ thể trong tài liệu.

## Giá trị

Một đối tượng {{domxref("Element")}}, hoặc `null`.

## Ví dụ

```js
document.firstElementChild;
// trả về phần tử <html> gốc, phần tử con duy nhất của tài liệu
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Element.firstElementChild")}}
