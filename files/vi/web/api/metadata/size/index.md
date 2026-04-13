---
title: "Metadata: thuộc tính size"
short-title: size
slug: Web/API/Metadata/size
page-type: web-api-instance-property
status:
  - experimental
  - non-standard
browser-compat: api.Metadata.size
---

{{APIRef("File and Directory Entries API")}}{{Non-standard_header}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`size`** của giao diện {{domxref("Metadata")}} xác định kích thước, tính bằng byte, của tệp được tham chiếu hoặc đối tượng hệ thống tệp khác trên đĩa.

## Giá trị

Một số cho biết kích thước của tệp tính bằng byte.

## Ví dụ

Ví dụ này kiểm tra kích thước của tệp nhật ký và xóa nó nếu lớn hơn một megabyte.

```js
workingDirectory.getFile(
  "log/important.log",
  {},
  (fileEntry) => {
    fileEntry.getMetadata((metadata) => {
      if (metadata.size > 1048576) {
        fileEntry.remove(() => {
          /* log file removed; do something clever here */
        });
      }
    });
  },
  handleError,
);
```

## Thông số kỹ thuật

Tính năng này đã bị xóa khỏi tất cả các đặc tả và không trong quá trình được chuẩn hóa.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File and Directory Entries API](/en-US/docs/Web/API/File_and_Directory_Entries_API)
- {{domxref("Metadata")}}
- {{domxref("FileSystemEntry.getMetadata()")}}
- {{domxref("FileSystemFileEntry")}}
