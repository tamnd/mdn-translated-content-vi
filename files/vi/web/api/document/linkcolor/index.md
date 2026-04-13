---
title: "Document: thuộc tính linkColor"
short-title: linkColor
slug: Web/API/Document/linkColor
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.Document.linkColor
---

{{APIRef("DOM")}} {{Deprecated_header}}

Thuộc tính **`Document.linkColor`** lấy/đặt màu của các liên kết trong tài liệu.

Thuộc tính này đã lỗi thời. Thay vào đó, bạn có thể đặt thuộc tính CSS {{cssxref("color")}} trên các liên kết neo HTML ({{HtmlElement("a")}}) hoặc trên các pseudo-classes {{cssxref(":link")}}.

## Giá trị

Một chuỗi đại diện cho màu dưới dạng từ (ví dụ: `red`) hoặc giá trị thập lục phân (ví dụ: `#ff0000`).

Khi được đặt thành giá trị `null`, giá trị `null` đó được chuyển đổi thành chuỗi rỗng (`""`), vì vậy `document.linkColor = null` tương đương với `document.linkColor = ""`.

## Ví dụ

```js
document.linkColor = "blue";
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

Giá trị mặc định cho thuộc tính này trong Mozilla Firefox là xanh dương (`#0000ee` ở hệ thập lục phân).

## Xem thêm

- {{domxref("document.vlinkColor")}}
- {{domxref("document.alinkColor")}}
