---
title: File
slug: Web/API/File
page-type: web-api-interface
browser-compat: api.File
---

{{APIRef("File API")}}{{AvailableInWorkers}}

Giao diện **`File`** cung cấp thông tin về các tệp và cho phép JavaScript trong trang web truy cập nội dung của chúng.

Các đối tượng `File` thường được lấy từ đối tượng {{DOMxRef("FileList")}} trả về khi người dùng chọn tệp bằng phần tử {{HTMLElement("input")}}, hoặc từ đối tượng {{DOMxRef("DataTransfer")}} của thao tác kéo thả.

Đối tượng `File` là một loại {{DOMxRef("Blob")}} cụ thể và có thể được sử dụng trong bất kỳ ngữ cảnh nào mà Blob có thể được dùng. Cụ thể, các API sau đây chấp nhận cả `Blob` và đối tượng `File`:

- {{DOMxRef("FileReader")}}
- {{DOMxRef("URL.createObjectURL_static", "URL.createObjectURL()")}}
- {{DOMxRef("Window.createImageBitmap()")}} và {{DOMxRef("WorkerGlobalScope.createImageBitmap()")}}
- tùy chọn [`body`](/en-US/docs/Web/API/RequestInit#body) trong {{domxref("Window/fetch", "fetch()")}}
- {{DOMxRef("XMLHttpRequest.send()")}}

Xem [Sử dụng tệp từ ứng dụng web](/en-US/docs/Web/API/File_API/Using_files_from_web_applications) để biết thêm thông tin và ví dụ.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{DOMxRef("File.File", "File()")}}
  - : Trả về một đối tượng `File` mới được tạo.

## Thuộc tính phiên bản

_Giao diện `File` cũng kế thừa các thuộc tính từ giao diện {{DOMxRef("Blob")}}._

- {{DOMxRef("File.lastModified")}} {{ReadOnlyInline}}
  - : Trả về thời gian sửa đổi cuối cùng của tệp, tính bằng mili giây kể từ epoch Unix (1 tháng 1 năm 1970, nửa đêm).
- {{DOMxRef("File.lastModifiedDate")}} {{Deprecated_Inline}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Trả về {{JSxRef("Date")}} sửa đổi cuối cùng của tệp được tham chiếu bởi đối tượng `File`.
- {{DOMxRef("File.name")}} {{ReadOnlyInline}}
  - : Trả về tên của tệp được tham chiếu bởi đối tượng `File`.
- {{DOMxRef("File.webkitRelativePath")}} {{ReadOnlyInline}}
  - : Trả về đường dẫn mà URL của `File` có liên quan.

## Phương thức phiên bản

_Giao diện `File` cũng kế thừa các phương thức từ giao diện {{DOMxRef("Blob")}}._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng tệp từ ứng dụng web](/en-US/docs/Web/API/File_API/Using_files_from_web_applications)
- {{DOMxRef("FileReader")}}
