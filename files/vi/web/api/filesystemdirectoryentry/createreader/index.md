---
title: "FileSystemDirectoryEntry: createReader() method"
short-title: createReader()
slug: Web/API/FileSystemDirectoryEntry/createReader
page-type: web-api-instance-method
browser-compat: api.FileSystemDirectoryEntry.createReader
---

{{APIRef("File and Directory Entries API")}}

Phương thức **`createReader()`** của giao diện {{domxref("FileSystemDirectoryEntry")}} trả về một đối tượng {{domxref("FileSystemDirectoryReader")}} có thể được sử dụng để đọc các mục trong thư mục.

## Cú pháp

```js-nolint
createReader()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("FileSystemDirectoryReader")}} có thể được sử dụng để đọc các mục của thư mục.

## Ví dụ

Ví dụ này tạo một hàm async có tên `readDirectory()`, lấy tất cả các mục trong {{domxref("FileSystemDirectoryEntry")}} được chỉ định và trả về chúng trong một mảng.

```js
async function readDirectory(directory) {
  const dirReader = directory.createReader();
  const entries = [];

  while (true) {
    const results = await new Promise((resolve, reject) => {
      dirReader.readEntries(resolve, reject);
    });

    if (!results.length) {
      break;
    }

    for (const entry of results) {
      entries.push(entry);
    }
  }

  return entries;
}
```

Hoạt động bằng cách gọi {{domxref("FileSystemDirectoryReader.readEntries", "readEntries()")}} lặp lại để lấy tất cả các mục trong thư mục, ghép từng lô vào mảng. Khi nó trả về mảng rỗng, tất cả các mục đã được đọc và vòng lặp kết thúc.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [API Mục Tệp và Thư mục](/en-US/docs/Web/API/File_and_Directory_Entries_API)
- {{domxref("FileSystemDirectoryReader")}}
- {{domxref("FileSystemDirectoryEntry")}}
- {{domxref("FileSystemFileEntry")}}
- {{domxref("FileSystemEntry")}}
