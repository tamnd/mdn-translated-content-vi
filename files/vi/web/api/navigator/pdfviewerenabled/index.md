---
title: "Navigator: thuộc tính pdfViewerEnabled"
short-title: pdfViewerEnabled
slug: Web/API/Navigator/pdfViewerEnabled
page-type: web-api-instance-property
browser-compat: api.Navigator.pdfViewerEnabled
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`pdfViewerEnabled`** của giao diện {{domxref("Navigator")}} cho biết liệu trình duyệt có hỗ trợ hiển thị nội tuyến các tệp PDF khi điều hướng đến chúng hay không.

Nếu chế độ xem nội tuyến không được hỗ trợ, tệp PDF sẽ được tải xuống và sau đó có thể được xử lý bởi một số ứng dụng bên ngoài.

> [!LƯU Ý]
> Phương pháp này thay thế một số phương pháp suy luận cũ, hỗ trợ xem nội tuyến các tệp PDF.

## Giá trị

`true` nếu trình duyệt có thể hiển thị nội tuyến tệp PDF khi điều hướng đến tệp (sử dụng trình xem nội bộ hoặc tiện ích mở rộng trình xem PDF); nếu không thì `false`.

## Ví dụ

Để kiểm tra hỗ trợ xem nội tuyến PDF:

```js
if (!navigator.pdfViewerEnabled) {
  // The browser does not support inline viewing of PDF files.
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
