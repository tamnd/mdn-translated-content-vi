---
title: "FileSystemFileEntry: createWriter() method"
short-title: createWriter()
slug: Web/API/FileSystemFileEntry/createWriter
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.FileSystemFileEntry.createWriter
---

{{APIRef("File and Directories Entries API")}}{{deprecated_header}}{{Non-standard_header}}

Phương thức **`createWriter()`** của giao diện {{domxref("FileSystemFileEntry")}} trả về đối tượng {{domxref("FileWriter")}} có thể được sử dụng để ghi dữ liệu vào tệp được đại diện bởi mục thư mục.

## Cú pháp

```js-nolint
createWriter(successCallback)
createWriter(successCallback, errorCallback)
```

### Tham số

- `successCallback`
  - : Hàm callback được gọi khi {{domxref("FileWriter")}} được tạo thành công; `FileWriter` được truyền vào callback là tham số duy nhất.
- `errorCallback` {{optional_inline}}
  - : Nếu được cung cấp, đây phải là phương thức được gọi khi xảy ra lỗi trong khi cố gắng tạo {{domxref("FileWriter")}}. Callback này nhận đối tượng {{domxref("DOMException")}} mô tả lỗi làm đầu vào.

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

Ví dụ này thiết lập phương thức `writeToFileEntry()` xuất chuỗi văn bản vào tệp tương ứng với mục thư mục được truyền vào.

```js
function writeToFileEntry(entry, text) {
  entry.createWriter(
    (fileWriter) => {
      let data = Blob([text], { type: "text/plain" });

      fileWriter.write(data);
    },
    (error) => {
      /* do whatever to handle the error */
    },
  );
}
```

Callback thành công cho lệnh gọi `createWriter()` lấy văn bản được truyền vào và tạo đối tượng {{domxref("Blob")}} mới kiểu `text/plain` chứa văn bản đó. Blob này sau đó được xuất vào đối tượng {{domxref("FileWriter")}} để ghi vào tệp.

## Thông số kỹ thuật

Tính năng này không còn là một phần của bất kỳ đặc tả nào nữa. Nó không còn trên lộ trình để trở thành tiêu chuẩn.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File and Directory Entries API](/en-US/docs/Web/API/File_and_Directory_Entries_API)
