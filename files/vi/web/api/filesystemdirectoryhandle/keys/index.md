---
title: "FileSystemDirectoryHandle: phương thức keys()"
short-title: keys()
slug: Web/API/FileSystemDirectoryHandle/keys
page-type: web-api-instance-method
browser-compat: api.FileSystemDirectoryHandle.keys
---

{{securecontext_header}}{{APIRef("File System API")}}{{AvailableInWorkers}}

Phương thức **`keys()`** của giao diện {{domxref("FileSystemDirectoryHandle")}} trả về một bộ lặp bất đồng bộ mới để lặp qua các khóa của các mục bên trong `FileSystemDirectoryHandle` mà phương thức này được gọi trên đó.

## Cú pháp

```js-nolint
keys()
```

### Tham số

Không có.

### Giá trị trả về

Một bộ lặp bất đồng bộ mới chứa các khóa của từng mục bên trong `FileSystemDirectoryHandle`.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu trạng thái {{domxref('PermissionStatus.state')}} của handle không phải là `'granted'` ở chế độ `read`.
- `NotFoundError` {{domxref("DOMException")}}
  - : Được ném ra nếu mục hiện tại không được tìm thấy.

## Ví dụ

Dùng vòng lặp `for await...of` có thể giúp đơn giản hóa quá trình lặp.

```js
const dirHandle = await window.showDirectoryPicker();

for await (const key of dirHandle.keys()) {
  console.log(key);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File System API](/en-US/docs/Web/API/File_System_API)
- [The File System Access API: simplifying access to local files](https://developer.chrome.com/docs/capabilities/web-apis/file-system-access)
