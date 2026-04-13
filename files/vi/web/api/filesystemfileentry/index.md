---
title: FileSystemFileEntry
slug: Web/API/FileSystemFileEntry
page-type: web-api-interface
browser-compat: api.FileSystemFileEntry
---

{{APIRef("File and Directory Entries API")}}

Giao diện **`FileSystemFileEntry`** của [File and Directory Entries API](/en-US/docs/Web/API/File_and_Directory_Entries_API) đại diện cho một tệp trong hệ thống tệp. Nó cung cấp các thuộc tính mô tả các thuộc tính của tệp, cũng như phương thức {{domxref("FileSystemFileEntry.file", "file()")}} tạo đối tượng {{domxref("File")}} có thể được sử dụng để đọc tệp.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính của giao diện cha, {{domxref("FileSystemEntry")}}, nhưng không có thuộc tính riêng biệt cho giao diện này._

## Phương thức phiên bản

- {{domxref("FileSystemFileEntry.createWriter", "createWriter()")}} {{deprecated_inline}} {{non-standard_inline}}
  - : Trả về đối tượng {{domxref("FileWriter")}} có thể được sử dụng để ghi dữ liệu vào tệp được đại diện bởi mục thư mục.
- {{domxref("FileSystemFileEntry.file", "file()")}}
  - : Tạo đối tượng {{domxref("File")}} mới có thể được sử dụng để đọc tệp.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File and Directory Entries API](/en-US/docs/Web/API/File_and_Directory_Entries_API)
