---
title: "FileSystemHandle: thuộc tính name"
short-title: name
slug: Web/API/FileSystemHandle/name
page-type: web-api-instance-property
browser-compat: api.FileSystemHandle.name
---

{{securecontext_header}}{{APIRef("File System API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`name`** của giao diện {{domxref("FileSystemHandle")}} trả về tên của mục nhập được handle biểu diễn.

## Giá trị

Một chuỗi.

## Ví dụ

Hàm sau cho phép người dùng chọn một file từ bộ chọn file và lấy thuộc tính `name`.

```js
// lưu tham chiếu tới file handle của chúng ta
let fileHandle;

async function getFile() {
  // mở bộ chọn file
  [fileHandle] = await window.showOpenFilePicker();

  const fileName = fileHandle.name;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File System API](/en-US/docs/Web/API/File_System_API)
- [File System Access API: đơn giản hóa truy cập tới file cục bộ](https://developer.chrome.com/docs/capabilities/web-apis/file-system-access)
