---
title: FileReaderSync
slug: Web/API/FileReaderSync
page-type: web-api-interface
browser-compat: api.FileReaderSync
---

{{APIRef("File API")}} {{AvailableInWorkers("worker_except_service")}}

Giao diện **`FileReaderSync`** cho phép đọc các đối tượng {{DOMxRef("File")}} hoặc {{DOMxRef("Blob")}} một cách đồng bộ. Giao diện này [chỉ khả dụng](/en-US/docs/Web/API/Web_Workers_API/Functions_and_classes_available_to_workers) trong [workers](/en-US/docs/Web/API/Worker) vì nó cho phép I/O đồng bộ có khả năng gây chặn luồng thực thi.

## Hàm tạo

- {{domxref("FileReaderSync.FileReaderSync", "FileReaderSync()")}}
  - : Trả về một đối tượng `FileReaderSync` mới.

## Thuộc tính thể hiện

Giao diện này không có thuộc tính nào.

## Phương thức thể hiện

- {{DOMxRef("FileReaderSync.readAsArrayBuffer","FileReaderSync.readAsArrayBuffer()")}}
  - : Phương thức này chuyển đổi một {{DOMxRef("Blob")}} hoặc {{DOMxRef("File")}} được chỉ định thành một {{jsxref("ArrayBuffer")}} biểu diễn dữ liệu đầu vào dưới dạng chuỗi nhị phân.
- {{DOMxRef("FileReaderSync.readAsBinaryString","FileReaderSync.readAsBinaryString()")}} {{deprecated_inline}}
  - : Phương thức này chuyển đổi một {{DOMxRef("Blob")}} hoặc {{DOMxRef("File")}} được chỉ định thành một chuỗi biểu diễn dữ liệu đầu vào dưới dạng chuỗi nhị phân. Phương thức này đã lỗi thời, cân nhắc dùng `readAsArrayBuffer()` thay thế.
- {{DOMxRef("FileReaderSync.readAsText","FileReaderSync.readAsText()")}}
  - : Phương thức này chuyển đổi một {{DOMxRef("Blob")}} hoặc {{DOMxRef("File")}} được chỉ định thành một chuỗi biểu diễn dữ liệu đầu vào dưới dạng chuỗi văn bản. Tham số **`encoding`** tùy chọn chỉ định bảng mã sẽ sử dụng (ví dụ: iso-8859-1 hoặc UTF-8). Nếu không có, phương thức sẽ áp dụng thuật toán tự động phát hiện.
- {{DOMxRef("FileReaderSync.readAsDataURL","FileReaderSync.readAsDataURL()")}}
  - : Phương thức này chuyển đổi một {{DOMxRef("Blob")}} hoặc {{DOMxRef("File")}} được chỉ định thành một chuỗi biểu diễn dữ liệu đầu vào dưới dạng data URL.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("FileReader")}}
- {{DOMxRef("Blob")}}
- {{DOMxRef("File")}}
