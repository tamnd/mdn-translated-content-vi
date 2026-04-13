---
title: DirectoryEntrySync
slug: Web/API/DirectoryEntrySync
page-type: web-api-interface
status:
  - deprecated
  - non-standard
browser-compat: api.DirectoryEntrySync
---

{{APIRef("File and Directory Entries API")}}{{Non-standard_Header}}{{Deprecated_Header}}

Giao diện `DirectoryEntrySync` đại diện cho một thư mục trong hệ thống tệp. Nó bao gồm các phương thức để tạo, đọc, tra cứu và xóa đệ quy các tệp trong thư mục.

> [!WARNING]
> Giao diện này đã bị ngừng sử dụng và không còn trên đường chuẩn hóa. _Không sử dụng nó nữa._ Hãy dùng [File and Directory Entries API](/en-US/docs/Web/API/File_and_Directory_Entries_API) thay thế.

## Khái niệm cơ bản

Nếu bạn muốn tạo các thư mục con, bạn phải tạo từng thư mục con theo trình tự. Nếu bạn cố tạo thư mục bằng đường dẫn đầy đủ bao gồm các thư mục cha chưa tồn tại, bạn sẽ gặp lỗi.

## Phương thức phiên bản

### createReader()

Tạo `DirectoryReaderSync` mới để đọc các mục từ thư mục này.

### getFile()

Tùy thuộc vào cách bạn đặt tham số, phương thức này trả về một tệp trong hệ thống tệp hoặc tạo một tệp mới.

### getDirectory()

Tạo hoặc tra cứu thư mục. Phương thức này tương tự với `getFile()` với `DirectoryEntrySync` được truyền.

### removeRecursively()

Xóa một thư mục và tất cả nội dung của nó. Nếu bạn xóa thư mục gốc của hệ thống tệp, nội dung của hệ thống tệp sẽ bị xóa nhưng không phải hệ thống tệp.

## Thông số kỹ thuật

Tính năng này không còn là một phần của bất kỳ thông số kỹ thuật nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File and Directory Entries API](/en-US/docs/Web/API/File_and_Directory_Entries_API)
