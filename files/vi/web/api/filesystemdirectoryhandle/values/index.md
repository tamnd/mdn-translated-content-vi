---
title: "FileSystemDirectoryHandle: phương thức values()"
short-title: values()
slug: Web/API/FileSystemDirectoryHandle/values
page-type: web-api-instance-method
browser-compat: api.FileSystemDirectoryHandle.values
---

{{securecontext_header}}{{APIRef("File System API")}}{{AvailableInWorkers}}

Phương thức **`values()`** của giao diện {{domxref("FileSystemDirectoryHandle")}} trả về một bộ lặp bất đồng bộ mới để lặp qua các giá trị của các mục bên trong `FileSystemDirectoryHandle` mà phương thức này được gọi trên đó.

## Cú pháp

```js-nolint
values()
```

### Tham số

Không có.

### Giá trị trả về

Một bộ lặp bất đồng bộ mới chứa các handle của từng mục bên trong `FileSystemDirectoryHandle`.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu trạng thái {{domxref('PermissionStatus.state')}} của handle không phải là `'granted'` ở chế độ `read`.
- `NotFoundError` {{domxref("DOMException")}}
  - : Được ném ra nếu mục hiện tại không được tìm thấy.

## Ví dụ

Dùng vòng lặp `for await...of` có thể giúp đơn giản hóa quá trình lặp.

```js
const dirHandle = await window.showDirectoryPicker();

for await (const value of dirHandle.values()) {
  console.log(value);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File System API](/en-US/docs/Web/API/File_System_API)
- [The File System Access API: simplifying access to local files](https://developer.chrome.com/docs/capabilities/web-apis/file-system-access)
