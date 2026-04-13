---
title: "Document: thuộc tính compatMode"
short-title: compatMode
slug: Web/API/Document/compatMode
page-type: web-api-instance-property
browser-compat: api.Document.compatMode
---

{{ ApiRef("DOM") }}

Thuộc tính chỉ đọc **`Document.compatMode`** cho biết tài liệu đang được kết xuất ở [chế độ Quirks](/en-US/docs/Web/HTML/Guides/Quirks_mode_and_standards_mode) hay chế độ Standards.

## Giá trị

Một chuỗi là một trong các giá trị sau:

- `"BackCompat"` nếu tài liệu ở chế độ quirks.
- `"CSS1Compat"` nếu tài liệu ở chế độ no-quirks (còn gọi là "standards") hoặc chế độ limited-quirks (còn gọi là "almost standards").

> [!NOTE]
> Tất cả các chế độ này đã được chuẩn hóa, vì vậy các tên "standards" và "almost standards" cũ hơn không còn ý nghĩa và không còn được sử dụng trong các tiêu chuẩn.

## Ví dụ

```js
if (document.compatMode === "BackCompat") {
  // in Quirks mode
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
