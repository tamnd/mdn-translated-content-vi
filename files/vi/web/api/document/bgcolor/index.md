---
title: "Document: thuộc tính bgColor"
short-title: bgColor
slug: Web/API/Document/bgColor
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.Document.bgColor
---

{{APIRef("DOM")}} {{Deprecated_Header}}

Thuộc tính `bgColor` đã lỗi thời dùng để lấy hoặc thiết lập màu nền của tài liệu hiện tại.

## Giá trị

Một chuỗi đại diện cho màu dưới dạng từ (ví dụ: `"red"`) hoặc giá trị thập lục phân (ví dụ: `"#ff0000"`).

Khi được đặt thành giá trị `null`, giá trị `null` đó được chuyển đổi thành chuỗi rỗng (`""`), vì vậy `document.bgColor = null` tương đương với `document.bgColor = ""`.

## Ví dụ

```js
document.bgColor = "darkblue";
```

## Ghi chú

Giá trị mặc định cho thuộc tính này trong Firefox là màu trắng (`#ffffff` trong hệ thập lục phân).

`document.bgColor` đã bị lỗi thời trong [đặc tả kỹ thuật HTML](https://html.spec.whatwg.org/multipage/obsolete.html#dom-document-bgcolor). Phương án thay thế được khuyến nghị là sử dụng kiểu CSS {{Cssxref("background-color")}} có thể được truy cập qua DOM bằng `document.body.style.backgroundColor`.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
