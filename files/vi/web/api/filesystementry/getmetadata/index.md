---
title: "FileSystemEntry: getMetadata() method"
short-title: getMetadata()
slug: Web/API/FileSystemEntry/getMetadata
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.FileSystemEntry.getMetadata
---

{{APIRef("File and Directory Entries API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Phương thức **`getMetadata()`** của giao diện {{domxref("FileSystemEntry")}} lấy một đối tượng {{domxref("Metadata")}} với thông tin về mục hệ thống tệp, chẳng hạn như ngày và giờ sửa đổi cũng như kích thước của nó.

## Cú pháp

```js-nolint
getMetadata(successCallback)
getMetadata(successCallback, errorCallback)
```

### Tham số

- `successCallback`
  - : Hàm được gọi khi thao tác hoàn tất thành công. Nhận một tham số đầu vào duy nhất: một đối tượng {{domxref("Metadata")}} với thông tin về tệp.
- `errorCallback` {{optional_inline}}
  - : Callback tùy chọn được thực thi nếu xảy ra lỗi khi tra cứu siêu dữ liệu. Có một tham số duy nhất: một {{domxref("DOMException")}} mô tả lỗi xảy ra.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `DOMException.NOT_FOUND_ERR`
  - : {{domxref("FileSystemEntry")}} tham chiếu đến một mục không tồn tại.
- `DOMException.SECURITY_ERR`
  - : Các hạn chế bảo mật ngăn cản việc lấy siêu dữ liệu được yêu cầu.

## Ví dụ

Ví dụ này kiểm tra kích thước của tệp nhật ký trong thư mục tạm thời và nếu vượt quá một megabyte, sẽ chuyển nó sang thư mục khác.

```js
workingDirectory.getFile(
  "tmp/log.txt",
  {},
  (fileEntry) => {
    fileEntry.getMetadata((metadata) => {
      if (metadata.size > 1048576) {
        workingDirectory.getDirectory(
          "log",
          {},
          (dirEntry) => {
            fileEntry.moveTo(dirEntry);
          },
          handleError,
        );
      }
    });
  },
  handleError,
);
```

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File and Directory Entries API](/en-US/docs/Web/API/File_and_Directory_Entries_API)
