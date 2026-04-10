---
title: "FileSystemHandle: thuộc tính kind"
short-title: kind
slug: Web/API/FileSystemHandle/kind
page-type: web-api-instance-property
browser-compat: api.FileSystemHandle.kind
---

{{securecontext_header}}{{APIRef("File System API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`kind`** của giao diện {{domxref("FileSystemHandle")}} trả về kiểu của mục nhập. Giá trị là `'file'` nếu mục nhập liên quan là một file hoặc `'directory'` nếu là thư mục. Thuộc tính này được dùng để phân biệt file với thư mục khi lặp qua nội dung của một thư mục.

## Giá trị

Một chuỗi có thể là:

- `'file'`: Nếu handle là {{domxref('FileSystemFileHandle')}}.
- `'directory'`: Nếu handle là {{domxref('FileSystemDirectoryHandle')}}.

## Ví dụ

Hàm sau cho phép người dùng chọn một file từ bộ chọn file rồi kiểm tra xem handle trả về là file hay thư mục.

```js
// lưu tham chiếu tới file handle của chúng ta
let fileHandle;

async function getFile() {
  // mở bộ chọn file
  [fileHandle] = await window.showOpenFilePicker();

  if (fileHandle.kind === "file") {
    // chạy mã dành cho file
  } else if (fileHandle.kind === "directory") {
    // chạy mã dành cho thư mục
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File System API](/en-US/docs/Web/API/File_System_API)
- [File System Access API: đơn giản hóa truy cập tới file cục bộ](https://developer.chrome.com/docs/capabilities/web-apis/file-system-access)
