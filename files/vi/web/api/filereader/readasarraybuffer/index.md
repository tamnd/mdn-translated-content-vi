---
title: "FileReader: phương thức readAsArrayBuffer()"
short-title: readAsArrayBuffer()
slug: Web/API/FileReader/readAsArrayBuffer
page-type: web-api-instance-method
browser-compat: api.FileReader.readAsArrayBuffer
---

{{APIRef("File API")}}{{AvailableInWorkers}}

Phương thức **`readAsArrayBuffer()`** của giao diện {{domxref("FileReader")}} được dùng để bắt đầu đọc nội dung của một {{domxref("Blob")}} hoặc {{domxref("File")}} được chỉ định. Khi thao tác đọc hoàn tất, thuộc tính {{domxref("FileReader.readyState","readyState")}} trở thành `DONE` và sự kiện {{domxref("FileReader/loadend_event", "loadend")}} được kích hoạt. Lúc đó, thuộc tính {{domxref("FileReader.result","result")}} chứa một {{jsxref("ArrayBuffer")}} đại diện cho dữ liệu của tệp.

> [!NOTE]
> Phương thức {{domxref("Blob.arrayBuffer()")}} là một API mới hơn dựa trên Promise để đọc tệp dưới dạng array buffer.

## Cú pháp

```js-nolint
readAsArrayBuffer(blob)
```

### Tham số

- `blob`
  - : {{domxref("Blob")}} hoặc {{domxref("File")}} cần đọc.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("FileReader")}}
