---
title: "FileSystemDirectoryHandle: phương thức getFileHandle()"
short-title: getFileHandle()
slug: Web/API/FileSystemDirectoryHandle/getFileHandle
page-type: web-api-instance-method
browser-compat: api.FileSystemDirectoryHandle.getFileHandle
---

{{securecontext_header}}{{APIRef("File System API")}}{{AvailableInWorkers}}

Phương thức **`getFileHandle()`** của giao diện {{domxref("FileSystemDirectoryHandle")}} trả về một {{domxref('FileSystemFileHandle')}} cho một tệp có tên được chỉ định, nằm trong thư mục mà phương thức được gọi.

## Cú pháp

```js-nolint
getFileHandle(name)
getFileHandle(name, options)
```

### Tham số

- `name`
  - : Một chuỗi biểu thị {{domxref('FileSystemHandle.name')}} của tệp bạn muốn truy xuất.
- `options` {{optional_inline}}
  - : Một đối tượng với các thuộc tính sau:
    - `create` {{optional_inline}}
      - : Một {{jsxref('Boolean')}}. Mặc định là `false`. Khi đặt thành `true` mà tệp không được tìm thấy, một tệp với tên được chỉ định sẽ được tạo và trả về.

### Giá trị trả về

Một {{jsxref('Promise')}} được thực thi thành một {{domxref('FileSystemFileHandle')}}.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu trạng thái {{domxref('PermissionStatus.state')}} của handle không phải là `'granted'` ở chế độ `readwrite` khi tùy chọn `create` được đặt thành `true`, hoặc ở chế độ `read` khi tùy chọn `create` được đặt thành `false`.
- {{jsxref("TypeError")}}
  - : Được ném ra nếu tên được chỉ định không phải là một chuỗi hợp lệ hoặc chứa các ký tự có thể gây xung đột với hệ thống tệp gốc.
- `TypeMismatchError` {{domxref("DOMException")}}
  - : Được ném ra nếu mục được đặt tên là một thư mục chứ không phải tệp.
- `NotFoundError` {{domxref("DOMException")}}
  - : Được ném ra nếu mục hiện tại không được tìm thấy hoặc nếu tệp không tồn tại và tùy chọn `create` được đặt thành `false`.

## Ví dụ

Ví dụ sau trả về một file handle với tên được chỉ định; nếu tệp chưa tồn tại thì nó sẽ được tạo.

```js
const fileName = "fileToGetName";

// giả sử chúng ta có một handle thư mục: 'currentDirHandle'
const fileHandle = await currentDirHandle.getFileHandle(fileName, {
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
