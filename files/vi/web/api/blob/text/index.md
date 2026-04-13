---
title: "Blob: phương thức text()"
short-title: text()
slug: Web/API/Blob/text
page-type: web-api-instance-method
browser-compat: api.Blob.text
---

{{APIRef("File API")}}{{AvailableInWorkers}}

Phương thức **`text()`** của giao diện {{domxref("Blob")}} trả về một {{jsxref("Promise")}} được resolve với một chuỗi chứa nội dung của blob, được diễn giải là UTF-8.

## Cú pháp

```js-nolint
text()
```

### Tham số

Không có.

### Giá trị trả về

Một promise được resolve với một chuỗi chứa dữ liệu của blob dưới dạng chuỗi văn bản. Dữ liệu _luôn_ được giả định ở định dạng UTF-8.

## Lưu ý sử dụng

Phương thức {{domxref("FileReader.readAsText", "readAsText()")}} của {{domxref("FileReader")}} là một phương thức cũ hơn thực hiện chức năng tương tự. Nó hoạt động trên cả đối tượng `Blob` lẫn {{domxref("File")}}. Có hai khác biệt chính:

- `Blob.text()` trả về promise, trong khi `FileReader.readAsText()` là một API dựa trên sự kiện.
- `Blob.text()` luôn dùng UTF-8 làm bảng mã, trong khi `FileReader.readAsText()` có thể dùng bảng mã khác tùy theo kiểu của blob và tên bảng mã được chỉ định.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Response.text()")}}
- [Streams API](/en-US/docs/Web/API/Streams_API)
- {{domxref("FileReader.readAsText()")}}
