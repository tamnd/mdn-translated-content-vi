---
title: FileSystemSync
slug: Web/API/FileSystemSync
page-type: web-api-interface
status:
  - deprecated
  - non-standard
browser-compat: api.FileSystemSync
---

{{APIRef("File and Directory Entries API")}}{{Non-standard_Header}}{{Deprecated_Header}}

Trong [File and Directory Entries API](/en-US/docs/Web/API/File_and_Directory_Entries_API), đối tượng `FileSystemSync` đại diện cho một hệ thống tệp. Nó có hai thuộc tính.

> [!WARNING]
> Giao diện này đã bị ngừng sử dụng và không còn trên đường chuẩn hóa. _Không sử dụng nó nữa._ Hãy dùng [File System API](/en-US/docs/Web/API/File_System_API) thay thế.

## Khái niệm cơ bản

Đối tượng `FileSystemSync` là cửa ngõ vào toàn bộ API và bạn sẽ sử dụng nó nhiều. Vì vậy, khi đã có tham chiếu, hãy lưu đối tượng vào biến toàn cục hoặc thuộc tính của lớp.

## Thuộc tính phiên bản

- `name` {{ReadOnlyInline}} {{Non-standard_Inline}} {{Deprecated_Inline}}
  - : Chuỗi đại diện cho tên của hệ thống tệp. Tên phải là duy nhất trong danh sách các hệ thống tệp được cung cấp.
- `root` {{ReadOnlyInline}} {{Non-standard_Inline}} {{Deprecated_Inline}}
  - : `DirectoryEntry` là thư mục gốc của hệ thống tệp.

## Thông số kỹ thuật

Tính năng này không còn là một phần của bất kỳ thông số kỹ thuật nào. Nó không còn trên đường trở thành chuẩn.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File and Directory Entries API](/en-US/docs/Web/API/File_and_Directory_Entries_API)
