---
title: "Document: thuộc tính fgColor"
short-title: fgColor
slug: Web/API/Document/fgColor
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.Document.fgColor
---

{{APIRef("DOM")}}{{Deprecated_header}}

**`fgColor`** lấy/đặt màu foreground, hay màu văn bản, của tài liệu hiện tại.

## Giá trị

Một chuỗi biểu diễn màu dưới dạng từ (ví dụ: `"red"`) hoặc giá trị hexadecimal (ví dụ: `"#ff0000"`).

## Ví dụ

```js
document.fgColor = "white";
document.bgColor = "darkblue";
```

## Ghi chú

Giá trị mặc định cho thuộc tính này trong Mozilla Firefox là màu đen (`#000000` trong hệ hexadecimal).

`document.fgColor` đã bị deprecated trong [HTML specification](https://html.spec.whatwg.org/multipage/obsolete.html#dom-document-fgcolor). Phương án thay thế được khuyến nghị là thuộc tính CSS {{Cssxref("color")}} (ví dụ: `document.body.style.color = "red"`).

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
