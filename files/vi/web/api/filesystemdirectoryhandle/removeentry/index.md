---
title: "FileSystemDirectoryHandle: phương thức removeEntry()"
short-title: removeEntry()
slug: Web/API/FileSystemDirectoryHandle/removeEntry
page-type: web-api-instance-method
browser-compat: api.FileSystemDirectoryHandle.removeEntry
---

{{securecontext_header}}{{APIRef("File System API")}}{{AvailableInWorkers}}

Phương thức **`removeEntry()`** của giao diện {{domxref("FileSystemDirectoryHandle")}} cố gắng xóa không đồng bộ một mục nếu handle thư mục chứa một tệp hoặc thư mục có tên được chỉ định.

## Cú pháp

```js-nolint
removeEntry(name)
removeEntry(name, options)
```

### Tham số

- `name`
  - : Một chuỗi biểu thị tên của mục cần xóa.
- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn chứa các thiết lập cho mục được xóa. Các tùy chọn như sau:
    - `recursive` {{optional_inline}}
      - : Một giá trị boolean, mặc định là `false`. Khi đặt thành `true`, xóa cả mục và mọi mục con bên trong nó.

### Giá trị trả về

Một {{jsxref('Promise')}} được thực thi khi việc xóa hoàn tất.

### Ngoại lệ

- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu trạng thái {{domxref('PermissionStatus.state')}} của handle không phải là `'granted'` ở chế độ `readwrite`.
- {{jsxref("TypeError")}}
  - : Được ném ra nếu tên được chỉ định không phải là một chuỗi hợp lệ hoặc chứa các ký tự có thể gây xung đột với hệ thống tệp gốc.
- `NotFoundError` {{domxref("DOMException")}}
  - : Được ném ra nếu mục hiện tại không được tìm thấy.

## Ví dụ

```js
const dirHandle = await window.showDirectoryPicker();
await dirHandle.removeEntry("app.tmp");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File System API](/en-US/docs/Web/API/File_System_API)
- [The File System Access API: simplifying access to local files](https://developer.chrome.com/docs/capabilities/web-apis/file-system-access)
