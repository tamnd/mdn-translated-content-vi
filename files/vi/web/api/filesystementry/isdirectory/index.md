---
title: "FileSystemEntry: isDirectory property"
short-title: isDirectory
slug: Web/API/FileSystemEntry/isDirectory
page-type: web-api-instance-property
browser-compat: api.FileSystemEntry.isDirectory
---

{{APIRef("File and Directory Entries API")}}

Thuộc tính chỉ đọc **`isDirectory`** của giao diện {{domxref("FileSystemEntry")}} là `true` nếu mục đại diện cho một thư mục (tức là nó là {{domxref("FileSystemDirectoryEntry")}}) và `false` nếu không phải.

Bạn cũng có thể sử dụng {{domxref("FileSystemEntry.isFile", "isFile")}} để xác định xem mục có phải là tệp hay không.

> [!WARNING]
> Bạn không nên giả định rằng bất kỳ mục nào không phải thư mục đều là tệp hoặc ngược lại.
> Có các loại mô tả tệp khác trên nhiều hệ điều hành. Hãy chắc chắn sử dụng
> cả `isDirectory` và `isFile` khi cần để đảm bảo rằng
> mục là thứ bạn biết cách xử lý.

## Giá trị

Giá trị Boolean cho biết liệu {{domxref("FileSystemEntry")}} có phải là thư mục hay không.

## Ví dụ

Ví dụ này cho thấy cách thuộc tính này có thể được sử dụng để xác định xem có nên xử lý mục như một thư mục hay tệp. Nếu mục không phải loại nào, một trình xử lý lỗi được gọi với thông báo phù hợp.

```js
if (entry.isDirectory) {
  processSubdirectory(entry);
} else if (entry.isFile) {
  processFile(entry);
} else {
  displayErrorMessage("Unsupported file system entry specified.");
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File and Directory Entries API](/en-US/docs/Web/API/File_and_Directory_Entries_API)
- {{domxref("FileSystemEntry")}}
- {{domxref("FileSystemEntry.isFile")}}
- {{domxref("FileSystemDirectoryEntry")}}
