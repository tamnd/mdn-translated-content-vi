---
title: "Metadata: thuộc tính modificationTime"
short-title: modificationTime
slug: Web/API/Metadata/modificationTime
page-type: web-api-instance-property
status:
  - experimental
  - non-standard
browser-compat: api.Metadata.modificationTime
---

{{APIRef("File and Directory Entries API")}}{{Non-standard_header}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`modificationTime`** của giao diện {{domxref("Metadata")}} là đối tượng {{jsxref("Date")}} xác định ngày và giờ mục trong hệ thống tệp (hoặc dữ liệu được tham chiếu bởi mục) được sửa đổi lần cuối. Một mục trong hệ thống tệp được coi là đã được sửa đổi nếu siêu dữ liệu hoặc nội dung của tệp được tham chiếu (hoặc thư mục, hoặc bất kỳ loại mục hệ thống tệp nào khác có thể tồn tại trên nền tảng đang dùng) đã thay đổi.

## Giá trị

Dấu thời gian {{jsxref("Date")}} cho biết khi nào mục trong hệ thống tệp được thay đổi lần cuối.

## Ví dụ

Ví dụ này cố lấy tệp làm việc cụ thể tại `tmp/work-file.json`. Sau khi tìm thấy tệp, siêu dữ liệu của nó được lấy và năm dấu thời gian sửa đổi được so sánh với năm hiện tại. Nếu lần sửa đổi cuối cùng vào năm ít nhất 5 năm trước năm hiện tại, tệp được xóa và tệp mới được tạo.

```js
workingDirectory.getFile(
  "tmp/work-file.json",
  { create: true },
  (fileEntry) => {
    fileEntry.getMetadata((metadata) => {
      if (
        new Date().getFullYear() - metadata.modificationTime.getFullYear() >=
        5
      ) {
        fileEntry.remove(() => {
          workingDirectory.getFile(
            "tmp/work-file.json",
            { create: true },
            (newEntry) => {
              fileEntry = newEntry;
            },
          );
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
