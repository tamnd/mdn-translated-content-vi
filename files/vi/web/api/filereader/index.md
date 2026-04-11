---
title: FileReader
slug: Web/API/FileReader
page-type: web-api-interface
browser-compat: api.FileReader
---

{{APIRef("File API")}}{{AvailableInWorkers}}

Giao diện **`FileReader`** cho phép các ứng dụng web đọc bất đồng bộ nội dung của các tệp (hoặc bộ đệm dữ liệu thô) được lưu trên máy tính của người dùng, sử dụng đối tượng {{domxref("File")}} hoặc {{domxref("Blob")}} để chỉ định tệp hoặc dữ liệu cần đọc.

Đối tượng File có thể được lấy từ đối tượng {{domxref("FileList")}} được trả về khi người dùng chọn tệp thông qua phần tử `<input type="file">`, hoặc từ đối tượng {{domxref("DataTransfer")}} của thao tác kéo và thả. `FileReader` chỉ có thể truy cập nội dung các tệp mà người dùng đã chủ động chọn; nó không thể đọc tệp theo đường dẫn từ hệ thống tệp của người dùng. Để đọc tệp trên hệ thống tệp phía máy khách theo đường dẫn, hãy dùng [File System Access API](/en-US/docs/Web/API/File_System_API). Để đọc tệp phía máy chủ, hãy dùng {{domxref("Window/fetch", "fetch()")}}, với quyền [CORS](/en-US/docs/Web/HTTP/Guides/CORS) nếu đọc qua nguồn gốc khác.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("FileReader.FileReader", "FileReader()")}}
  - : Trả về một đối tượng `FileReader` mới.

Xem [Sử dụng tệp từ ứng dụng web](/en-US/docs/Web/API/File_API/Using_files_from_web_applications) để biết chi tiết và ví dụ.

## Thuộc tính phiên bản

- {{domxref("FileReader.error")}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMException")}} đại diện cho lỗi xảy ra khi đọc tệp.
- {{domxref("FileReader.readyState")}} {{ReadOnlyInline}}
  - : Một số chỉ trạng thái của `FileReader`. Giá trị là một trong các trạng thái sau:

    | Tên       | Giá trị | Mô tả                              |
    | --------- | ------- | ---------------------------------- |
    | `EMPTY`   | `0`     | Chưa có dữ liệu nào được tải.      |
    | `LOADING` | `1`     | Dữ liệu đang được tải.             |
    | `DONE`    | `2`     | Toàn bộ yêu cầu đọc đã hoàn thành. |

- {{domxref("FileReader.result")}} {{ReadOnlyInline}}
  - : Nội dung của tệp. Thuộc tính này chỉ hợp lệ sau khi thao tác đọc hoàn tất, và định dạng dữ liệu phụ thuộc vào phương thức nào được dùng để khởi tạo thao tác đọc.

## Phương thức phiên bản

- {{domxref("FileReader.abort()")}}
  - : Huỷ thao tác đọc. Sau khi trả về, `readyState` sẽ là `DONE`.
- {{domxref("FileReader.readAsArrayBuffer()")}}
  - : Bắt đầu đọc nội dung của {{domxref("Blob")}} được chỉ định; khi hoàn tất, thuộc tính `result` chứa một {{jsxref("ArrayBuffer")}} đại diện cho dữ liệu tệp.
- {{domxref("FileReader.readAsBinaryString()")}} {{deprecated_inline}}
  - : Bắt đầu đọc nội dung của {{domxref("Blob")}} được chỉ định; khi hoàn tất, thuộc tính `result` chứa dữ liệu nhị phân thô từ tệp dưới dạng chuỗi.
- {{domxref("FileReader.readAsDataURL()")}}
  - : Bắt đầu đọc nội dung của {{domxref("Blob")}} được chỉ định; khi hoàn tất, thuộc tính `result` chứa một URL `data:` đại diện cho dữ liệu tệp.
- {{domxref("FileReader.readAsText()")}}
  - : Bắt đầu đọc nội dung của {{domxref("Blob")}} được chỉ định; khi hoàn tất, thuộc tính `result` chứa nội dung tệp dưới dạng chuỗi văn bản. Có thể chỉ định tên mã hóa tùy chọn.

## Sự kiện

Lắng nghe các sự kiện này bằng cách dùng {{domxref("EventTarget/addEventListener", "addEventListener()")}} hoặc gán trình xử lý sự kiện vào thuộc tính `oneventname` của giao diện này. Xóa trình xử lý sự kiện bằng {{domxref("EventTarget.removeEventListener", "removeEventListener()")}} khi `FileReader` không còn được dùng nữa để tránh rò rỉ bộ nhớ.

- {{domxref("FileReader/abort_event", "abort")}}
  - : Kích hoạt khi thao tác đọc bị huỷ, chẳng hạn khi chương trình gọi {{domxref("FileReader.abort()")}}.
- {{domxref("FileReader/error_event", "error")}}
  - : Kích hoạt khi thao tác đọc thất bại do lỗi.
- {{domxref("FileReader/load_event", "load")}}
  - : Kích hoạt khi thao tác đọc hoàn tất thành công.
- {{domxref("FileReader/loadend_event", "loadend")}}
  - : Kích hoạt khi thao tác đọc hoàn tất, dù thành công hay không.
- {{domxref("FileReader/loadstart_event", "loadstart")}}
  - : Kích hoạt khi thao tác đọc bắt đầu.
- {{domxref("FileReader/progress_event", "progress")}}
  - : Kích hoạt định kỳ khi dữ liệu đang được đọc.

## Ví dụ

### Sử dụng FileReader

Ví dụ này đọc và hiển thị nội dung của một tệp văn bản trực tiếp trên trình duyệt.

#### HTML

```html
<h1>File Reader</h1>
<input type="file" id="file-input" />
<div id="message"></div>
<pre id="file-content"></pre>
```

#### JavaScript

```js
const fileInput = document.getElementById("file-input");
const fileContentDisplay = document.getElementById("file-content");
const messageDisplay = document.getElementById("message");

fileInput.addEventListener("change", handleFileSelection);

function handleFileSelection(event) {
  const file = event.target.files[0];
  fileContentDisplay.textContent = ""; // Xóa nội dung tệp trước đó
  messageDisplay.textContent = ""; // Xóa thông báo trước đó

  // Kiểm tra sự tồn tại và loại tệp
  if (!file) {
    showMessage("Chưa chọn tệp. Vui lòng chọn một tệp.", "error");
    return;
  }

  if (!file.type.startsWith("text")) {
    showMessage(
      "Loại tệp không được hỗ trợ. Vui lòng chọn tệp văn bản.",
      "error",
    );
    return;
  }

  // Đọc tệp
  const reader = new FileReader();
  reader.onload = () => {
    fileContentDisplay.textContent = reader.result;
  };
  reader.onerror = () => {
    showMessage("Lỗi khi đọc tệp. Vui lòng thử lại.", "error");
  };
  reader.readAsText(file);
}

// Hiển thị thông báo cho người dùng
function showMessage(message, type) {
  messageDisplay.textContent = message;
  messageDisplay.style.color = type === "error" ? "red" : "green";
}
```

### Kết quả

{{EmbedLiveSample("Using FileReader", 640, 300)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng tệp từ ứng dụng web](/en-US/docs/Web/API/File_API/Using_files_from_web_applications)
- {{domxref("File")}}
- {{domxref("Blob")}}
- {{domxref("FileReaderSync")}}
