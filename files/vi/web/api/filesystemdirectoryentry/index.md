---
title: FileSystemDirectoryEntry
slug: Web/API/FileSystemDirectoryEntry
page-type: web-api-interface
browser-compat: api.FileSystemDirectoryEntry
---

{{APIRef("File and Directory Entries API")}}

Giao diện **`FileSystemDirectoryEntry`** của [API Mục Tệp và Thư mục](/en-US/docs/Web/API/File_and_Directory_Entries_API) đại diện cho một thư mục trong hệ thống tệp. Nó cung cấp các phương thức cho phép truy cập và thao tác các tệp trong thư mục, cũng như truy cập các mục trong thư mục.

{{InheritanceDiagram}}

## Khái niệm cơ bản

Bạn có thể tạo thư mục mới bằng cách gọi {{domxref("FileSystemDirectoryEntry.getDirectory", "getDirectory()")}}. Nếu bạn muốn tạo các thư mục con, hãy tạo từng thư mục con theo thứ tự. Nếu bạn cố gắng tạo thư mục bằng một đường dẫn đầy đủ bao gồm các thư mục cha chưa tồn tại, lỗi sẽ được trả về. Vì vậy, hãy tạo cấu trúc bằng cách thêm đường dẫn mới đệ quy sau khi tạo thư mục cha.

### Ví dụ

Trong đoạn mã sau, chúng ta tạo một thư mục có tên "Documents."

```js
// Taking care of the browser-specific prefixes.
window.requestFileSystem =
  window.requestFileSystem || window.webkitRequestFileSystem;
window.directoryEntry = window.directoryEntry || window.webkitDirectoryEntry;

// …

function onFs(fs) {
  fs.root.getDirectory(
    "Documents",
    { create: true },
    (directoryEntry) => {
      // directoryEntry.isFile === false
      // directoryEntry.isDirectory === true
      // directoryEntry.name === 'Documents'
      // directoryEntry.fullPath === '/Documents'
    },
    onError,
  );
}

// Opening a file system with temporary storage
window.requestFileSystem(TEMPORARY, 1024 * 1024 /* 1MB */, onFs, onError);
```

## Thuộc tính phiên bản

_Giao diện này không có thuộc tính riêng, nhưng kế thừa các thuộc tính từ giao diện cha, {{domxref("FileSystemEntry")}}._

## Phương thức phiên bản

_Giao diện này kế thừa các phương thức từ giao diện cha, {{domxref("FileSystemEntry")}}._

- {{domxref("FileSystemDirectoryEntry.createReader", "createReader()")}}
  - : Tạo một đối tượng {{domxref("FileSystemDirectoryReader")}} có thể được sử dụng để đọc các mục trong thư mục này.
- {{domxref("FileSystemDirectoryEntry.getDirectory", "getDirectory()")}}
  - : Trả về một đối tượng `FileSystemDirectoryEntry` đại diện cho một thư mục nằm tại một đường dẫn nhất định, tương đối với thư mục mà phương thức được gọi.
- {{domxref("FileSystemDirectoryEntry.getFile", "getFile()")}}
  - : Trả về một đối tượng {{domxref("FileSystemFileEntry")}} đại diện cho một tệp nằm trong hệ thống cấp bậc của thư mục, với đường dẫn tương đối với thư mục mà phương thức được gọi.
- {{domxref("FileSystemDirectoryEntry.removeRecursively", "removeRecursively()")}} {{Deprecated_inline}} {{Non-standard_inline}}
  - : Xóa thư mục cùng với toàn bộ nội dung của nó, lặp đệ quy qua toàn bộ cây con các tệp và thư mục con.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [API Mục Tệp và Thư mục](/en-US/docs/Web/API/File_and_Directory_Entries_API)
- {{domxref("FileSystemDirectoryReader")}}
- {{domxref("FileSystemEntry")}}
- {{domxref("FileSystemFileEntry")}}
