---
title: "FileReader: sự kiện error"
short-title: error
slug: Web/API/FileReader/error_event
page-type: web-api-event
browser-compat: api.FileReader.error_event
---

{{APIRef("File API")}}{{AvailableInWorkers}}

Sự kiện **`error`** của giao diện {{domxref("FileReader")}} được kích hoạt khi thao tác đọc thất bại do lỗi (ví dụ như tệp không tìm thấy hoặc không đọc được).

Sự kiện này không thể huỷ và không nổi bọt.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("error", (event) => { })

onerror = (event) => { }
```

## Loại sự kiện

Một {{domxref("ProgressEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("ProgressEvent")}}

## Thuộc tính sự kiện

_Cũng kế thừa các thuộc tính từ sự kiện cha {{domxref("Event")}}._

- {{domxref("ProgressEvent.lengthComputable")}} {{ReadOnlyInline}}
  - : Cờ boolean cho biết liệu tổng công việc cần thực hiện và lượng công việc đã làm bởi tiến trình bên dưới có thể tính toán được không.
- {{domxref("ProgressEvent.loaded")}} {{ReadOnlyInline}}
  - : Giá trị số nguyên 64-bit không dấu cho biết lượng công việc đã được thực hiện bởi tiến trình bên dưới. Tỷ lệ công việc hoàn thành có thể tính bằng cách chia `total` cho giá trị này. Khi tải tài nguyên qua HTTP, giá trị này chỉ tính phần thân của thông điệp HTTP, không tính tiêu đề và các phần mở rộng khác.
- {{domxref("ProgressEvent.total")}} {{ReadOnlyInline}}
  - : Giá trị số nguyên 64-bit không dấu đại diện cho tổng lượng công việc mà tiến trình bên dưới đang thực hiện. Khi tải tài nguyên qua HTTP, đây là `Content-Length` (kích thước phần thân thông điệp), không tính tiêu đề và các phần mở rộng khác.

## Ví dụ

```js
const fileInput = document.querySelector('input[type="file"]');
const reader = new FileReader();

function handleSelected(e) {
  const selectedFile = fileInput.files[0];
  if (selectedFile) {
    reader.addEventListener("error", () => {
      console.error(`Error occurred reading file: ${selectedFile.name}`);
    });

    reader.addEventListener("load", () => {
      console.log(`File: ${selectedFile.name} read successfully`);
    });

    reader.readAsDataURL(selectedFile);
  }
}

fileInput.addEventListener("change", handleSelected);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện liên quan: {{domxref("FileReader.loadstart_event", "loadstart")}}, {{domxref("FileReader.loadend_event", "loadend")}}, {{domxref("FileReader.progress_event", "progress")}}, {{domxref("FileReader.load_event", "load")}}, {{domxref("FileReader.abort_event", "abort")}}
