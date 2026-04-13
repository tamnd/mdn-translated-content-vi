---
title: "FileSystemEntry: name property"
short-title: name
slug: Web/API/FileSystemEntry/name
page-type: web-api-instance-property
browser-compat: api.FileSystemEntry.name
---

{{APIRef("File and Directory Entries API")}}

Thuộc tính chỉ đọc **`name`** của giao diện {{domxref("FileSystemEntry")}} trả về một chuỗi xác định tên của mục; đây là mục trong thư mục cha của nó (thành phần cuối cùng của đường dẫn được chỉ ra bởi thuộc tính {{domxref("FileSystemEntry.fullPath", "fullPath")}}).

## Giá trị

Một chuỗi cho biết tên của mục.

## Ví dụ

Ví dụ này hiển thị hàm `isFileWithExtension()` trả về true nếu {{domxref("FileSystemEntry")}} được chỉ định vừa là tệp vừa có tên tệp kết thúc bằng phần mở rộng được chỉ định.

```js
function isFileWithExtension(entry, extension) {
  return entry.isFile && entry.name.endsWith(`.${extension}`);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File and Directory Entries API](/en-US/docs/Web/API/File_and_Directory_Entries_API)
- {{domxref("FileSystemEntry")}}
- {{domxref("FileSystemEntry.fullPath")}}
