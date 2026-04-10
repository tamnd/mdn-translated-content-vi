---
title: "FileSystemDirectoryHandle: phương thức getDirectoryHandle()"
short-title: getDirectoryHandle()
slug: Web/API/FileSystemDirectoryHandle/getDirectoryHandle
page-type: web-api-instance-method
browser-compat: api.FileSystemDirectoryHandle.getDirectoryHandle
---

{{securecontext_header}}{{APIRef("File System API")}}{{AvailableInWorkers}}

Phương thức **`getDirectoryHandle()`** của giao diện {{domxref("FileSystemDirectoryHandle")}} trả về một {{domxref('FileSystemDirectoryHandle')}} cho một thư mục con có tên được chỉ định bên trong thư mục mà phương thức được gọi trên đó.

## Cú pháp

```js-nolint
getDirectoryHandle(name)
getDirectoryHandle(name, options)
```

### Tham số

- `name`
  - : Một chuỗi biểu thị {{domxref('FileSystemHandle.name')}} của thư mục con mà bạn muốn truy xuất.
- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn chứa các thiết lập cho thư mục con được truy xuất. Các tùy chọn như sau:
    - `create` {{optional_inline}}
      - : Một giá trị boolean, mặc định là `false`. Khi đặt là `true` mà thư mục không được tìm thấy, một thư mục với tên đã chỉ định sẽ được tạo và trả về.

### Giá trị trả về

Một {{jsxref('Promise')}} được thực thi thành một {{domxref('FileSystemDirectoryHandle')}}.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu trạng thái {{domxref('PermissionStatus.state')}} của handle không phải là `'granted'` ở chế độ `readwrite` khi tùy chọn `create` được đặt thành `true`, hoặc ở chế độ `read` khi tùy chọn `create` được đặt thành `false`.
- {{jsxref("TypeError")}}
  - : Được ném ra nếu tên được chỉ định không phải là một chuỗi hợp lệ hoặc chứa các ký tự có thể gây xung đột với hệ thống tệp gốc.
- `TypeMismatchError` {{domxref("DOMException")}}
  - : Được ném ra nếu mục được trả về là một tệp chứ không phải thư mục.
- `NotFoundError` {{domxref("DOMException")}}
  - : Được ném ra nếu mục hiện tại không được tìm thấy hoặc nếu thư mục đích không tồn tại và tùy chọn `create` được đặt thành `false`.

## Ví dụ

Ví dụ sau trả về một handle thư mục với tên được chỉ định; nếu thư mục chưa tồn tại thì nó sẽ được tạo.

```js
const dirName = "directoryToGetName";

// giả sử chúng ta có một handle thư mục: 'currentDirHandle'
const subDir = await currentDirHandle.getDirectoryHandle(dirName, {
  create: true,
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File System API](/en-US/docs/Web/API/File_System_API)
- [The File System Access API: simplifying access to local files](https://developer.chrome.com/docs/capabilities/web-apis/file-system-access)
