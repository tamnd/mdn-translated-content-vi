---
title: "FileReaderSync: Phương thức readAsBinaryString()"
short-title: readAsBinaryString()
slug: Web/API/FileReaderSync/readAsBinaryString
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.FileReaderSync.readAsBinaryString
---

{{APIRef("File API")}}{{deprecated_header}} {{AvailableInWorkers("worker_except_service")}}

> [!NOTE]
> Phương thức này đã lỗi thời và được thay thế bằng {{DOMxRef("FileReaderSync.readAsArrayBuffer","readAsArrayBuffer()")}}.

Phương thức **`readAsBinaryString()`** của giao diện {{DOMxRef("FileReaderSync")}} cho phép đọc các đối tượng {{DOMxRef("File")}} hoặc {{DOMxRef("Blob")}} một cách đồng bộ vào một chuỗi. Giao diện này [chỉ khả dụng](/en-US/docs/Web/API/Web_Workers_API/Functions_and_classes_available_to_workers) trong [workers](/en-US/docs/Web/API/Worker) vì nó cho phép I/O đồng bộ có khả năng gây chặn luồng thực thi.

## Cú pháp

```js-nolint
readAsBinaryString(blob)
```

### Tham số

- `blob`
  - : Đối tượng {{DOMxRef("File")}} hoặc {{DOMxRef("Blob")}} cần đọc.

### Giá trị trả về

Một chuỗi biểu diễn dữ liệu đầu vào.

### Ngoại lệ

- `NotFoundError` {{domxref("DOMException")}}
  - : Được ném nếu không thể tìm thấy tài nguyên được đại diện bởi DOM {{DOMxRef("File")}} hoặc {{DOMxRef("Blob")}}, ví dụ: vì nó đã bị xóa.
- `SecurityError` {{domxref("DOMException")}}
  - : Được ném nếu phát hiện một trong các tình huống có vấn đề sau:
    - tài nguyên đã bị sửa đổi bởi bên thứ ba;
    - quá nhiều thao tác đọc được thực hiện đồng thời;
    - tệp mà tài nguyên trỏ đến không an toàn để sử dụng từ Web (chẳng hạn như tệp hệ thống).
- `NotReadableError` {{domxref("DOMException")}}
  - : Được ném nếu không thể đọc tài nguyên do vấn đề quyền hạn, ví dụ như khóa đồng thời.
- `EncodingError` {{domxref("DOMException")}}
  - : Được ném nếu tài nguyên là một data URL và vượt quá giới hạn độ dài do mỗi trình duyệt định nghĩa.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File API](/en-US/docs/Web/API/File_API)
- {{DOMxRef("File")}}
- {{DOMxRef("FileReaderSync")}}
- {{DOMxRef("FileReader")}}
- {{ domxref("Blob") }}
