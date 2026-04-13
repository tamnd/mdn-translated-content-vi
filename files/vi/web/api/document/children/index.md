---
title: "Document: thuộc tính children"
short-title: children
slug: Web/API/Document/children
page-type: web-api-instance-property
browser-compat: api.Document.children
---

{{ APIRef("DOM") }}

Thuộc tính chỉ đọc **`children`** trả về một {{domxref("HTMLCollection")}} trực tiếp chứa tất cả các {{domxref("Element", "phần tử")}} con của tài liệu mà nó được gọi.

Đối với các tài liệu HTML, đây thường chỉ là phần tử `<html>` gốc.

Xem {{domxref("Element.children")}} để biết các phần tử con của các phần tử HTML cụ thể trong tài liệu.

## Giá trị

Một {{ domxref("HTMLCollection") }} là một collection trực tiếp, có thứ tự của các phần tử DOM là phần tử con của tài liệu hiện tại. Bạn có thể truy cập các phần tử con riêng lẻ trong collection bằng cách sử dụng phương thức {{domxref("HTMLCollection.item()", "item()")}} trên collection hoặc bằng cách sử dụng ký hiệu kiểu mảng JavaScript.

Nếu tài liệu không có phần tử con nào, thì `children` là một danh sách rỗng với `length` là `0`.

## Ví dụ

```js
document.children;
// HTMLCollection [<html>]
// Usually only contains the root <html> element, the document's only direct child
```

Xem {{domxref("Element.children")}} để biết các phần tử con của các phần tử HTML cụ thể trong tài liệu.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Element.children")}}
- {{domxref("Node.childNodes")}}
