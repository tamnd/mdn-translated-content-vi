---
title: "FileSystemHandle: isSameEntry() method"
short-title: isSameEntry()
slug: Web/API/FileSystemHandle/isSameEntry
page-type: web-api-instance-method
browser-compat: api.FileSystemHandle.isSameEntry
---

{{securecontext_header}}{{APIRef("File System API")}}{{AvailableInWorkers}}

Phương thức **`isSameEntry()`** của giao diện {{domxref("FileSystemHandle")}} so sánh hai {{domxref("FileSystemHandle", "handle")}} để xem liệu các mục liên quan (tệp hoặc thư mục) có khớp hay không.

## Cú pháp

```js-nolint
isSameEntry(fileSystemHandle)
```

### Tham số

- {{domxref("FileSystemHandle")}}
  - : `FileSystemHandle` để so sánh với handle mà phương thức được gọi trên đó.

### Giá trị trả về

Một Promise được giải quyết với giá trị {{jsxref('Boolean')}}.

## Ví dụ

Hàm sau đây so sánh một mục duy nhất với một mảng các mục và trả về {{jsxref("Promise")}} được thực hiện với mảng mới đã loại bỏ các mục khớp.

```js
async function removeMatches(fileEntry, entriesArr) {
  const newArr = [];
  for (const entry of entriesArr) {
    if (!(await fileEntry.isSameEntry(entry))) {
      newArr.push(entry);
    }
  }
  return newArr;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File System API](/en-US/docs/Web/API/File_System_API)
- [The File System Access API: simplifying access to local files](https://developer.chrome.com/docs/capabilities/web-apis/file-system-access)
