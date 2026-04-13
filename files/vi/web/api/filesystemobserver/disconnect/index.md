---
title: "FileSystemObserver: disconnect() method"
short-title: disconnect()
slug: Web/API/FileSystemObserver/disconnect
page-type: web-api-instance-method
status:
  - experimental
  - non-standard
browser-compat: api.FileSystemObserver.disconnect
---

{{securecontext_header}}{{APIRef("File System API")}}{{SeeCompatTable}}{{non-standard_header}}

Phương thức **`disconnect()`** của giao diện
{{domxref("FileSystemObserver")}} dừng observer quan sát hệ thống tệp.

## Cú pháp

```js-nolint
disconnect()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref('undefined')}}).

## Ví dụ

### Dừng quan sát hệ thống tệp

Giả sử một phiên bản `FileSystemObserver` đang có sẵn, bạn có thể gọi phương thức `disconnect()` trên nó khi muốn dừng quan sát các thay đổi đối với mục nhập hệ thống tệp:

```js
observer.disconnect();
```

## Thông số kỹ thuật

Hiện chưa là một phần của bất kỳ thông số kỹ thuật nào. Xem [https://github.com/whatwg/fs/pull/165](https://github.com/whatwg/fs/pull/165) để biết PR thông số kỹ thuật liên quan.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File System API](/en-US/docs/Web/API/File_System_API)
- [The File System Observer API origin trial](https://developer.chrome.com/blog/file-system-observer#stop-observing-the-file-system) trên developer.chrome.com (2024)
