---
title: "FileSystemObserver: observe() method"
short-title: observe()
slug: Web/API/FileSystemObserver/observe
page-type: web-api-instance-method
status:
  - experimental
  - non-standard
browser-compat: api.FileSystemObserver.observe
---

{{securecontext_header}}{{APIRef("File System API")}}{{SeeCompatTable}}{{non-standard_header}}

Phương thức **`observe()`** của giao diện
{{domxref("FileSystemObserver")}} yêu cầu observer bắt đầu quan sát các thay đổi đối với tệp hoặc thư mục được cho.

## Cú pháp

```js-nolint
observe(handle)
observe(handle, options)
```

### Tham số

- `handle`
  - : Handle của mục nhập hệ thống tệp đại diện cho tệp hoặc thư mục cần quan sát.
    - Đối với hệ thống tệp người dùng quan sát được, đây có thể là {{domxref("FileSystemFileHandle")}} hoặc {{domxref("FileSystemDirectoryHandle")}}.
    - Đối với [Hệ thống tệp riêng tư theo nguồn gốc](/en-US/docs/Web/API/File_System_API/Origin_private_file_system) (OPFS), đây có thể là {{domxref("FileSystemFileHandle")}}, {{domxref("FileSystemDirectoryHandle")}}, hoặc {{domxref("FileSystemSyncAccessHandle")}}.

- `options` {{optional_inline}}
  - : Đối tượng chỉ định các tùy chọn cho lệnh gọi `observe()`. Có thể chứa các thuộc tính sau:
    - `recursive`
      - : Giá trị boolean xác định xem bạn có muốn quan sát các thay đổi đối với thư mục một cách đệ quy không. Nếu đặt là `true`, các thay đổi được quan sát trong chính thư mục đó và tất cả các thư mục con và tệp bên trong. Nếu đặt là `false`, các thay đổi chỉ được quan sát trong chính thư mục đó và các tệp được chứa trực tiếp (tức là các tệp trong thư mục con bị loại trừ). Mặc định là `false`.

        Thuộc tính này không có hiệu lực nếu `handle` đại diện cho một tệp.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải thành {{jsxref('undefined')}}.

### Ngoại lệ

- `NotFoundError` {{domxref("DOMException")}}
  - : Được ném ra nếu tệp hoặc thư mục được đại diện bởi `handle` không thể tìm thấy.

## Ví dụ

### Quan sát tệp hoặc thư mục

Giả sử một phiên bản `FileSystemObserver` đang có sẵn, bạn có thể bắt đầu quan sát các thay đổi đối với mục nhập hệ thống tệp bằng cách gọi `observe()`.

Bạn có thể quan sát tệp hoặc thư mục trong hệ thống tệp người dùng quan sát được hoặc [Hệ thống tệp riêng tư theo nguồn gốc](/en-US/docs/Web/API/File_System_API/Origin_private_file_system) (OPFS) bằng cách truyền {{domxref("FileSystemFileHandle")}} hoặc {{domxref("FileSystemDirectoryHandle")}} vào `observe()`. Các phiên bản của các đối tượng này có thể được trả về, ví dụ, khi yêu cầu người dùng chọn tệp hoặc thư mục bằng {{domxref("Window.showSaveFilePicker()")}} hoặc {{domxref("Window.showDirectoryPicker()")}}:

```js
// Observe a file
async function observeFile() {
  const fileHandle = await window.showSaveFilePicker();

  await observer.observe(fileHandle);
}

// Observe a directory
async function observeDirectory() {
  const directoryHandle = await window.showDirectoryPicker();

  await observer.observe(directoryHandle);
}
```

Bạn cũng có thể quan sát các thay đổi đối với OPFS bằng cách truyền {{domxref("FileSystemSyncAccessHandle")}} vào `observe()`:

```js
// Observe an OPFS file system entry
async function observeOPFSFile() {
  const root = await navigator.storage.getDirectory();
  const draftHandle = await root.getFileHandle("draft.txt", { create: true });
  const syncHandle = await draftHandle.createSyncAccessHandle();

  await observer.observe(syncHandle);
}
```

### Quan sát thư mục một cách đệ quy

Để quan sát thư mục một cách đệ quy, gọi `observe()` với tùy chọn `recursive` được đặt là `true`:

```js
// Observe a directory recursively
async function observeDirectory() {
  const directoryHandle = await window.showDirectoryPicker();

  await observer.observe(directoryHandle, { recursive: true });
}
```

## Thông số kỹ thuật

Hiện chưa là một phần của bất kỳ thông số kỹ thuật nào. Xem [https://github.com/whatwg/fs/pull/165](https://github.com/whatwg/fs/pull/165) để biết PR thông số kỹ thuật liên quan.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File System API](/en-US/docs/Web/API/File_System_API)
- [The File System Observer API origin trial](https://developer.chrome.com/blog/file-system-observer#stop-observing-the-file-system) trên developer.chrome.com (2024)
