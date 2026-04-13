---
title: DirectoryReaderSync
slug: Web/API/DirectoryReaderSync
page-type: web-api-interface
status:
  - deprecated
  - non-standard
browser-compat: api.DirectoryReaderSync
---

{{APIRef("File and Directory Entries API")}}{{Non-standard_Header}}{{Deprecated_Header}}

Giao diện `DirectoryReaderSync` cho phép bạn đọc các mục trong một thư mục.

> [!WARNING]
> Giao diện này đã bị ngừng sử dụng và không còn trên đường chuẩn hóa. _Không sử dụng nó nữa._ Hãy dùng [File and Directory Entries API](/en-US/docs/Web/API/File_and_Directory_Entries_API) thay thế.

## Khái niệm cơ bản

Trước khi gọi phương thức duy nhất trong giao diện này, [`readEntries()`](#readentries), hãy tạo đối tượng [`DirectoryEntrySync`](/en-US/docs/Web/API/DirectoryEntrySync).

## Phương thức phiên bản

### readEntries()

Trả về một mảng (không nhất thiết phải theo thứ tự) các mục trong thư mục đang được đọc. Nếu không có thêm mục nào để đọc, hãy gọi phương thức này một lần nữa. Khi mảng rỗng được trả về, không có thêm mục nào.

```js-nolint
readEntries()
```

#### Tham số

Không có.

#### Giá trị trả về

Mảng các đối tượng dựa trên `FileSystemEntry`.

## Thông số kỹ thuật

Tính năng này không còn là một phần của bất kỳ thông số kỹ thuật nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File and Directory Entries API](/en-US/docs/Web/API/File_and_Directory_Entries_API)
