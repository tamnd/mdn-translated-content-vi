---
title: "Document: vlinkColor property"
short-title: vlinkColor
slug: Web/API/Document/vlinkColor
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.Document.vlinkColor
---

{{APIRef("DOM")}} {{Deprecated_Header}}

Thuộc tính **`Document.vlinkColor`** lấy/đặt màu của các liên kết mà người dùng đã truy cập trong tài liệu.

## Giá trị

Một chuỗi đại diện cho màu dưới dạng từ (ví dụ: `"red"`) hoặc giá trị thập lục phân (ví dụ: `"#ff0000"`).

Khi được đặt thành giá trị `null`, giá trị `null` đó được chuyển đổi thành chuỗi rỗng (`""`), nên `document.vlinkColor = null` tương đương với `document.vlinkColor = ""`.

## Ghi chú

- Giá trị mặc định cho thuộc tính này trong Mozilla Firefox là màu tím
  (`#551a8b` dưới dạng thập lục phân).
- `Document.vlinkColor` đã bị loại bỏ trong [đặc tả HTML](https://html.spec.whatwg.org/multipage/obsolete.html#dom-document-vlinkcolor).
- Phương án thay thế được khuyến nghị là lấy/đặt màu của lớp giả CSS {{Cssxref(":visited")}} trên các phần tử HTML {{HtmlElement("a")}} (ví dụ: `a:visited {color:red;}`).

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
