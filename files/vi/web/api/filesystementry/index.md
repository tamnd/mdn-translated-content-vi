---
title: FileSystemEntry
slug: Web/API/FileSystemEntry
page-type: web-api-interface
browser-compat: api.FileSystemEntry
---

{{APIRef("File and Directory Entries API")}}

Giao diện **`FileSystemEntry`** của File and Directory Entries API đại diện cho một mục đơn lẻ trong hệ thống tệp. Mục đó có thể là tệp hoặc thư mục (thư mục được đại diện bởi giao diện {{domxref("FileSystemDirectoryEntry")}}). Giao diện này bao gồm các phương thức để làm việc với tệp, chẳng hạn như sao chép, di chuyển, xóa và đọc tệp, cũng như thông tin về tệp mà nó trỏ đến, bao gồm tên tệp và đường dẫn từ thư mục gốc đến mục.

## Khái niệm cơ bản

Bạn không tạo trực tiếp các đối tượng `FileSystemEntry`. Thay vào đó, bạn sẽ nhận được một đối tượng dựa trên giao diện này thông qua các API khác. Giao diện này đóng vai trò là lớp cơ sở cho các giao diện {{domxref("FileSystemFileEntry")}} và {{domxref("FileSystemDirectoryEntry")}}, cung cấp các tính năng đặc thù cho các mục hệ thống tệp đại diện cho tệp và thư mục tương ứng.

Giao diện `FileSystemEntry` bao gồm các phương thức mà bạn mong đợi để thao tác tệp và thư mục, nhưng nó cũng có một phương thức tiện lợi để lấy URL của mục: [`toURL()`](/en-US/docs/Web/API/FileSystemEntry/toURL). Nó cũng giới thiệu một lược đồ URL mới: `filesystem:`.

Bạn có thể sử dụng lược đồ `filesystem:` trên Google Chrome để xem tất cả tệp và thư mục được lưu trữ trong nguồn gốc của ứng dụng. Chỉ cần dùng lược đồ `filesystem:` cho thư mục gốc của nguồn gốc ứng dụng. Ví dụ: nếu ứng dụng của bạn ở [`http://www.example.com`](https://www.example.com/), hãy mở `filesystem:http://www.example.com/temporary/` trong một tab. Chrome hiển thị danh sách chỉ đọc tất cả tệp và thư mục được lưu trữ trong nguồn gốc của ứng dụng.

### Ví dụ

Để xem ví dụ về cách `toURL()` hoạt động, hãy xem [mô tả phương thức](/en-US/docs/Web/API/FileSystemEntry/toURL). Đoạn mã dưới đây cho thấy cách bạn có thể xóa một tệp theo tên.

```js
// Xử lý các tiền tố dành riêng cho từng trình duyệt.
window.requestFileSystem =
  window.requestFileSystem || window.webkitRequestFileSystem;

// …

// Mở hệ thống tệp với bộ nhớ tạm thời
window.requestFileSystem(
  TEMPORARY,
  1024 * 1024 /* 1MB */,
  (fs) => {
    fs.root.getFile(
      "log.txt",
      {},
      (fileEntry) => {
        fileEntry.remove(() => {
          console.log("File removed.");
        }, onError);
      },
      onError,
    );
  },
  onError,
);
```

## Thuộc tính phiên bản

_Giao diện này cung cấp các thuộc tính sau._

- {{domxref("FileSystemEntry.filesystem", "filesystem")}} {{ReadOnlyInline}}
  - : Một đối tượng {{domxref("FileSystem")}} đại diện cho hệ thống tệp nơi mục đó tồn tại.
- {{domxref("FileSystemEntry.fullPath", "fullPath")}} {{ReadOnlyInline}}
  - : Một chuỗi cung cấp đường dẫn đầy đủ, tuyệt đối từ thư mục gốc của hệ thống tệp đến mục; cũng có thể được coi là đường dẫn tương đối so với thư mục gốc, có thêm ký tự "/" ở đầu.
- {{domxref("FileSystemEntry.isDirectory", "isDirectory")}} {{ReadOnlyInline}}
  - : Giá trị boolean là `true` nếu mục đại diện cho một thư mục; ngược lại là `false`.
- {{domxref("FileSystemEntry.isFile", "isFile")}} {{ReadOnlyInline}}
  - : Giá trị Boolean là `true` nếu mục đại diện cho một tệp. Nếu không phải tệp, giá trị này là `false`.
- {{domxref("FileSystemEntry.name", "name")}} {{ReadOnlyInline}}
  - : Một chuỗi chứa tên của mục (phần cuối của đường dẫn, sau ký tự "/" cuối cùng).

## Phương thức phiên bản

_Giao diện này định nghĩa các phương thức sau._

- {{domxref("FileSystemEntry.copyTo", "copyTo()")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Sao chép tệp hoặc thư mục đến một vị trí mới trong hệ thống tệp.
- {{domxref("FileSystemEntry.getMetadata", "getMetadata()")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Lấy siêu dữ liệu về tệp, chẳng hạn như ngày sửa đổi và kích thước.
- {{domxref("FileSystemEntry.getParent", "getParent()")}}
  - : Trả về một {{domxref("FileSystemDirectoryEntry")}} đại diện cho thư mục cha của mục.
- {{domxref("FileSystemEntry.moveTo", "moveTo()")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Di chuyển tệp hoặc thư mục đến một vị trí mới trong hệ thống tệp, hoặc đổi tên tệp hoặc thư mục.
- {{domxref("FileSystemEntry.remove", "remove()")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Xóa tệp hoặc thư mục được chỉ định. Bạn chỉ có thể xóa các thư mục rỗng.
- {{domxref("FileSystemEntry.toURL", "toURL()")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Tạo và trả về URL xác định mục. URL này sử dụng lược đồ URL `"filesystem:"`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File and Directory Entries API](/en-US/docs/Web/API/File_and_Directory_Entries_API)
- {{domxref("FileSystemFileEntry")}} và {{domxref("FileSystemDirectoryEntry")}} được dựa trên `FileSystemEntry`.
