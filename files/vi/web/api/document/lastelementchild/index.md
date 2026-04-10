---
title: "Document: thuộc tính lastElementChild"
short-title: lastElementChild
slug: Web/API/Document/lastElementChild
page-type: web-api-instance-property
browser-compat: api.Document.lastElementChild
---

{{ APIRef("DOM") }}

Thuộc tính chỉ đọc **`Document.lastElementChild`** trả về phần tử {{domxref("Element")}} con cuối cùng của tài liệu, hoặc `null` nếu không có phần tử con nào.

Đối với tài liệu HTML, đây thường là phần tử con duy nhất, phần tử gốc `<html>`.

Xem {{domxref("Element.lastElementChild")}} cho phần tử con cuối cùng của các phần tử cụ thể trong tài liệu.

## Giá trị

Phần tử gốc `<html>`.

## Ví dụ

```js
document.lastElementChild;
// trả về phần tử <html> gốc, phần tử con duy nhất của tài liệu
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Element.lastElementChild")}}
