---
title: "FileSystemFileEntry: file() method"
short-title: file()
slug: Web/API/FileSystemFileEntry/file
page-type: web-api-instance-method
browser-compat: api.FileSystemFileEntry.file
---

{{APIRef("File and Directory Entries API")}}

Phương thức **`file()`** của giao diện {{domxref("FileSystemFileEntry")}} trả về đối tượng {{domxref("File")}} có thể được sử dụng để đọc dữ liệu từ tệp được đại diện bởi mục thư mục.

## Cú pháp

```js-nolint
file(successCallback)
file(successCallback, errorCallback)
```

### Tham số

- `successCallback`
  - : Hàm callback được gọi khi {{domxref("File")}} được tạo thành công; `File` được truyền vào callback là tham số duy nhất.
- `errorCallback` {{optional_inline}}
  - : Nếu được cung cấp, đây phải là phương thức được gọi khi xảy ra lỗi trong khi cố gắng tạo {{domxref("File")}}. Callback này nhận đối tượng {{domxref("DOMException")}} mô tả lỗi làm đầu vào.

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

Ví dụ này thiết lập phương thức `readFile()` đọc tệp văn bản và gọi hàm callback được chỉ định với văn bản nhận được (trong chuỗi) khi quá trình đọc hoàn tất. Nếu xảy ra lỗi, hàm callback lỗi tùy chọn được gọi.

```js
function readFile(entry, successCallback, errorCallback) {
  entry.file((file) => {
    let reader = new FileReader();

    reader.onload = () => {
      successCallback(reader.result);
    };

    reader.onerror = () => {
      errorCallback(reader.error);
    };

    reader.readAsText(file);
  }, errorCallback);
}
```

Hàm này gọi `file()`, chỉ định callback thành công là một phương thức sử dụng {{domxref("FileReader")}} để đọc tệp dưới dạng văn bản. Trình xử lý sự kiện {{domxref("FileReader/load_event", "load")}} của FileReader được thiết lập để cung cấp chuỗi đã tải cho `successCallback` được chỉ định khi phương thức `readFile()` được gọi; tương tự, trình xử lý {{domxref("FileReader/error_event", "error")}} của nó được thiết lập để gọi `errorCallback` được chỉ định.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File and Directory Entries API](/en-US/docs/Web/API/File_and_Directory_Entries_API)
