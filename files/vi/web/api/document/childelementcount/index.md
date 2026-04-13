---
title: "Document: thuộc tính childElementCount"
short-title: childElementCount
slug: Web/API/Document/childElementCount
page-type: web-api-instance-property
browser-compat: api.Document.childElementCount
---

{{ APIRef("DOM") }}

Thuộc tính chỉ đọc **`Document.childElementCount`** trả về số lượng phần tử con của tài liệu.

Để lấy số lượng phần tử con của một phần tử cụ thể, xem {{domxref("Element.childElementCount")}}.

## Giá trị

Một số.

## Ví dụ

```js
document.children;
// HTMLCollection, usually containing an <html> element, the document's only child

document.childElementCount;
// 1
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Element.childElementCount")}}
- {{domxref("DocumentFragment.childElementCount")}}
