---
title: "HTMLLinkElement: thuộc tính sheet"
short-title: sheet
slug: Web/API/HTMLLinkElement/sheet
page-type: web-api-instance-property
browser-compat: api.HTMLLinkElement.sheet
---

{{APIRef("HTML DOM")}}

Thuộc tính **`sheet`** chỉ đọc của giao diện {{domxref("HTMLLinkElement")}} chứa bảng kiểu liên kết với phần tử đó.

Một bảng kiểu được liên kết với `HTMLLinkElement` nếu `rel="stylesheet"` được sử dụng với `<link>`.

## Giá trị

Một đối tượng {{DOMxRef("StyleSheet")}}, hoặc `null` nếu không có đối tượng nào liên kết với phần tử.

## Ví dụ

```html
<link rel="stylesheet" href="styles.css" />
```

Thuộc tính `sheet` của đối tượng `HTMLLinkElement` sẽ trả về đối tượng {{domxref("StyleSheet")}} mô tả `styles.css`.

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}
