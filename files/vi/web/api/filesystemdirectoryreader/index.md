---
title: FileSystemDirectoryReader
slug: Web/API/FileSystemDirectoryReader
page-type: web-api-interface
browser-compat: api.FileSystemDirectoryReader
---

{{APIRef("File and Directory Entries API")}}

Giao diện `FileSystemDirectoryReader` của [File and Directory Entries API](/en-US/docs/Web/API/File_and_Directory_Entries_API) cho phép bạn truy cập các đối tượng dựa trên {{domxref("FileSystemFileEntry")}} (thường là {{domxref("FileSystemFileEntry")}} hoặc {{domxref("FileSystemDirectoryEntry")}}) đại diện cho từng mục trong một thư mục.

## Phương thức phiên bản

- {{domxref("FileSystemDirectoryReader.readEntries", "readEntries()")}}
  - : Trả về một mảng chứa một số mục nhập trong thư mục. Mỗi phần tử trong mảng là một đối tượng dựa trên {{domxref("FileSystemEntry")}}, thường là {{domxref("FileSystemFileEntry")}} hoặc {{domxref("FileSystemDirectoryEntry")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File and Directory Entries API](/en-US/docs/Web/API/File_and_Directory_Entries_API)
- {{domxref("FileSystemDirectoryEntry")}}
- {{domxref("FileSystem")}}
