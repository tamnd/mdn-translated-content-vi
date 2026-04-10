---
title: "Document: thuộc tính alinkColor"
short-title: alinkColor
slug: Web/API/Document/alinkColor
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.Document.alinkColor
---

{{APIRef("DOM")}}{{Deprecated_header}}

Trả về hoặc thiết lập màu của một liên kết đang hoạt động trong phần body của tài liệu. Một liên kết đang hoạt động trong khoảng thời gian giữa sự kiện `mousedown` và `mouseup`.

## Giá trị

Một chuỗi chứa tên của màu (ví dụ: `blue`, `darkblue`, v.v.) hoặc giá trị thập lục phân của màu (ví dụ: `#0000FF`).

Khi được đặt thành giá trị `null`, giá trị `null` đó được chuyển đổi thành chuỗi rỗng (`""`), vì vậy `document.alinkColor = null` tương đương với `document.alinkColor = ""`.

## Ghi chú

Giá trị mặc định cho thuộc tính này trong Mozilla Firefox là màu đỏ (`#ee0000` trong hệ thập lục phân).

`document.alinkColor` đã bị lỗi thời trong [đặc tả kỹ thuật HTML](https://html.spec.whatwg.org/multipage/obsolete.html#dom-document-alinkcolor). Một thay thế là bộ chọn CSS {{Cssxref(":active")}}.

Firefox hỗ trợ cả `alinkColor`/`:active` và {{Cssxref(":focus")}}.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
