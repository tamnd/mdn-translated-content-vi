---
title: FileEntrySync
slug: Web/API/FileEntrySync
page-type: web-api-interface
status:
  - deprecated
  - non-standard
browser-compat: api.FileEntrySync
---

{{APIRef("File and Directory Entries API")}} {{Non-standard_header}}{{Deprecated_Header}}

Giao diện `FileEntrySync` đại diện cho một tệp trong hệ thống tệp. Nó cho phép bạn ghi nội dung vào tệp.

> [!WARNING]
> Giao diện này đã bị ngừng sử dụng và không còn trên đường chuẩn hóa. _Không sử dụng nó nữa._ Hãy dùng [File and Directory Entries API](/en-US/docs/Web/API/File_and_Directory_Entries_API) thay thế.

## Khái niệm cơ bản

Để ghi nội dung vào tệp, hãy tạo đối tượng FileWriter bằng cách gọi [`createWriter()`](#createwriter).

## Phương thức phiên bản

### createWriter()

Tạo `FileWriter` mới liên kết với tệp mà `FileEntry` đại diện.

```js-nolint
createWriter()
```

#### Tham số

Không có.

#### Giá trị trả về

Một đối tượng `FileWriterSync`.

### file()

Trả về đối tượng `File` đại diện cho trạng thái hiện tại của tệp.

```js-nolint
file()
```

#### Tham số

Không có.

#### Giá trị trả về

Một đối tượng `File`.

## Thông số kỹ thuật

Tính năng này không còn là một phần của bất kỳ thông số kỹ thuật nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File and Directory Entries API](/en-US/docs/Web/API/File_and_Directory_Entries_API)
