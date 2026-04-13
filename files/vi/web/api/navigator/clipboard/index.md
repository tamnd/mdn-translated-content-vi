---
title: "Navigator: thuộc tính clipboard"
short-title: clipboard
slug: Web/API/Navigator/clipboard
page-type: web-api-instance-property
browser-compat: api.Navigator.clipboard
---

{{APIRef("Clipboard API")}} {{securecontext_header}}

Thuộc tính chỉ đọc **`clipboard`** của giao diện {{domxref("Navigator")}} trả về đối tượng {{domxref("Clipboard")}} được sử dụng để đọc và ghi nội dung của bảng nhớ tạm.

Đây là điểm vào [Clipboard API](/en-US/docs/Web/API/Clipboard_API), có thể được sử dụng để triển khai các tính năng cắt, sao chép và dán trong ứng dụng web.

## Giá trị

Đối tượng {{domxref("Clipboard")}} được sử dụng để truy cập vào bảng tạm hệ thống.

## Ví dụ

Đoạn mã sau sử dụng `navigator.clipboard` để truy cập vào bảng tạm hệ thống nhằm đọc nội dung văn bản từ bảng ghi tạm.

```js
navigator.clipboard
  .readText()
  .then(
    (clipText) => (document.querySelector(".clip-text").innerText = clipText),
  );
```

Đoạn mã này thay thế nội dung của phần tử có lớp `"clip-text"` bằng nội dung văn bản của bảng ghi tạm.
Có lẽ mã này đang được sử dụng trong tiện ích mở rộng của trình duyệt hiển thị nội dung bảng tạm hiện tại, tự động cập nhật định kỳ hoặc khi các sự kiện cụ thể xảy ra.

Nếu bảng nhớ tạm trống hoặc không chứa văn bản thì nội dung của phần tử `"clip-text"` sẽ bị xóa.
Điều này xảy ra vì {{domxref("Clipboard.readText", "readText()")}} trả về một chuỗi trống nếu bảng nhớ tạm trống hoặc không chứa văn bản.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
