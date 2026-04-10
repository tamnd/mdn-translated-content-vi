---
title: "FileReaderSync: Phương thức readAsDataURL()"
short-title: readAsDataURL()
slug: Web/API/FileReaderSync/readAsDataURL
page-type: web-api-instance-method
browser-compat: api.FileReaderSync.readAsDataURL
---

{{APIRef("File API")}} {{AvailableInWorkers("worker_except_service")}}

Phương thức **`readAsDataURL()`** của giao diện {{DOMxRef("FileReaderSync")}} cho phép đọc các đối tượng {{DOMxRef("File")}} hoặc {{DOMxRef("Blob")}} một cách đồng bộ vào một chuỗi biểu diễn data URL. Giao diện này [chỉ khả dụng](/en-US/docs/Web/API/Web_Workers_API/Functions_and_classes_available_to_workers) trong [workers](/en-US/docs/Web/API/Worker) vì nó cho phép I/O đồng bộ có khả năng gây chặn luồng thực thi.

## Cú pháp

```js-nolint
readAsDataURL(blob)
```

### Tham số

- `blob`
  - : Đối tượng {{DOMxRef("File")}} hoặc {{DOMxRef("Blob")}} cần đọc.

### Giá trị trả về

Một chuỗi biểu diễn dữ liệu đầu vào dưới dạng data URL.

### Ngoại lệ

Các ngoại lệ sau có thể được ném ra bởi phương thức này:

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

- [File and Directory Entries API](/en-US/docs/Web/API/File_and_Directory_Entries_API)
- {{DOMxRef("File")}}
- {{DOMxRef("FileReaderSync")}}
- {{DOMxRef("FileReader")}}
- {{ domxref("Blob") }}
