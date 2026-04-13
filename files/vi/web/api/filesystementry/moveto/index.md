---
title: "FileSystemEntry: moveTo() method"
short-title: moveTo()
slug: Web/API/FileSystemEntry/moveTo
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.FileSystemEntry.moveTo
---

{{APIRef("File and Directory Entries API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Phương thức **`moveTo()`** của giao diện {{domxref("FileSystemEntry")}} di chuyển tệp được chỉ định bởi mục đến một vị trí mới trong hệ thống tệp, hoặc đổi tên tệp nếu thư mục đích trùng với thư mục nguồn.

Có một số hạn chế điển hình về những gì bạn có thể làm:

- Không thể di chuyển một thư mục vào chính nó.
- Không thể di chuyển một mục vào thư mục cha của nó trừ khi bạn chỉ định tên mới. Chỉ định tên mới cho phép `moveTo()` hoạt động như một thao tác đổi tên.
- Khi di chuyển một thư mục, thao tác luôn đệ quy; bạn không thể bỏ qua các thư mục con.
- Không thể di chuyển tệp để thay thế thư mục đã có, và không thể di chuyển thư mục để thay thế tệp đã có. Tuy nhiên, tệp có thể thay thế tệp và thư mục có thể thay thế thư mục.
- Bạn chỉ có thể ghi đè thư mục nếu nó rỗng.

## Cú pháp

```js-nolint
moveTo(newParent, newName)
moveTo(newParent, newName, successCallback)
moveTo(newParent, newName, successCallback, errorCallback)
```

### Tham số

- `newParent`
  - : Một đối tượng {{domxref("FileSystemDirectoryEntry")}} chỉ định thư mục đích cho thao tác di chuyển.
- `newName` {{optional_inline}}
  - : Nếu tham số này được cung cấp, mục sẽ được đổi tên thành chuỗi này làm tên tệp hoặc thư mục mới.
- `successCallback` {{optional_inline}}
  - : Hàm được gọi khi thao tác di chuyển hoàn tất thành công. Nhận một tham số đầu vào duy nhất: một đối tượng dựa trên {{domxref("FileSystemEntry")}} cung cấp thông tin chi tiết mới của mục đã di chuyển.
- `errorCallback` {{optional_inline}}
  - : Callback tùy chọn được thực thi nếu xảy ra lỗi khi di chuyển các mục. Có một tham số duy nhất: một {{domxref("DOMException")}} mô tả lỗi xảy ra.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `DOMException.INVALID_MODIFICATION_ERR`
  - : Thao tác yêu cầu liên quan đến một thay đổi không thể thực hiện, chẳng hạn như di chuyển thư mục vào chính nó hoặc vào một trong các thư mục con của nó, hoặc sao chép một mục trong cùng thư mục mà không đổi tên.
- `DOMException.QUOTA_EXCEEDED_ERR`
  - : Thao tác vượt quá hạn mức lưu trữ của người dùng, hoặc không còn đủ dung lượng để hoàn tất thao tác.

## Ví dụ

Ví dụ này cho thấy cách một tệp nhật ký tạm thời có thể được chuyển vào thư mục "log" cố định hơn khi nó vượt quá một megabyte.

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
- {{domxref("FileSystemEntry.copyTo()")}}
