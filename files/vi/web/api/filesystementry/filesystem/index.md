---
title: "FileSystemEntry: filesystem property"
short-title: filesystem
slug: Web/API/FileSystemEntry/filesystem
page-type: web-api-instance-property
browser-compat: api.FileSystemEntry.filesystem
---

{{APIRef("File and Directory Entries API")}}

Thuộc tính chỉ đọc **`filesystem`** của giao diện {{domxref("FileSystemEntry")}} chứa một đối tượng {{domxref("FileSystem")}} đại diện cho hệ thống tệp mà mục đó tồn tại.

## Giá trị

Một {{domxref("FileSystem")}} đại diện cho hệ thống tệp nơi tệp hoặc thư mục được mô tả bởi `FileSystemEntry` được đặt.

## Ví dụ

Ví dụ này lấy một {{domxref("FileSystemDirectoryEntry")}} cho thư mục gốc của hệ thống tệp chứa một tệp.

```js
let rootDirEntry = fileEntry.filesystem.root;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File and Directory Entries API](/en-US/docs/Web/API/File_and_Directory_Entries_API)
- {{domxref("FileSystemEntry")}}
- {{domxref("FileSystem")}}
