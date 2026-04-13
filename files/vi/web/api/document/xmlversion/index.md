---
title: "Document: thuộc tính xmlVersion"
short-title: xmlVersion
slug: Web/API/Document/xmlVersion
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.Document.xmlVersion
---

{{APIRef("DOM")}}{{deprecated_header}}

Trả về số phiên bản như được chỉ định trong XML declaration (ví dụ: `<?xml version="1.0"?>`) hoặc "1.0" nếu không có declaration.

Thuộc tính này chưa bao giờ thực sự hữu ích, vì nó luôn trả về 1.0, và đã bị xóa trong DOM Level 4. Do đó, Firefox 10 không còn triển khai nó. Công dụng chính của nó trong quá khứ là để phát hiện xem tài liệu có đang được kết xuất dưới dạng XML thay vì HTML hay không. Để phát hiện điều này, bạn có thể tạo một phần tử với tên ở chữ thường, sau đó kiểm tra xem nó có được chuyển thành chữ hoa hay không (trong trường hợp đó tài liệu đang ở chế độ HTML không phải XML):

```js
if (document.createElement("foo").tagName === "FOO") {
  /* Tài liệu không phải XML */
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
