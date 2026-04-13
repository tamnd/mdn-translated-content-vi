---
title: "ClipboardChangeEvent: thuộc tính types"
short-title: types
slug: Web/API/ClipboardChangeEvent/types
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.ClipboardChangeEvent.types
---

{{securecontext_header}}{{APIRef("Clipboard API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`types`** của giao diện {{domxref("ClipboardChangeEvent")}} trả về một mảng chuỗi biểu diễn các {{glossary("MIME type","kiểu MIME")}} bắt buộc có sẵn trên bảng nhớ tạm hệ thống khi sự kiện `ClipboardChangeEvent` được kích hoạt. Các kiểu tùy chọn và định dạng tùy chỉnh không được đưa vào nhằm hạn chế {{glossary("fingerprinting")}}.

## Giá trị

Một mảng chuỗi.

## Ví dụ

Trong ví dụ này, khi nội dung bảng nhớ tạm thay đổi, trình lắng nghe sự kiện ghi vào bảng điều khiển từng chuỗi biểu diễn một [kiểu MIME](/en-US/docs/Web/HTTP/Guides/MIME_types) có sẵn trong mảng do thuộc tính `ClipboardChangeEvent.types` trả về.

```js
navigator.clipboard.addEventListener("clipboardchange", (event) => {
  event.types.forEach((value) => {
    console.log(value);
  });
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ClipboardChangeEvent.changeId")}}
- {{domxref("ClipboardChangeEvent")}}
- {{domxref("ClipboardEvent")}}
- [Clipboard API](/en-US/docs/Web/API/Clipboard_API)
