---
title: "FileSystemObserver: FileSystemObserver() constructor"
short-title: FileSystemObserver()
slug: Web/API/FileSystemObserver/FileSystemObserver
page-type: web-api-constructor
status:
  - experimental
  - non-standard
browser-compat: api.FileSystemObserver.FileSystemObserver
---

{{APIRef("File System API")}}{{SeeCompatTable}}{{non-standard_header}}

Hàm khởi tạo **`FileSystemObserver()`** tạo một phiên bản đối tượng {{domxref("FileSystemObserver")}} mới.

## Cú pháp

```js-nolint
new FileSystemObserver(callback)
```

### Tham số

- `callback`
  - : Hàm callback do người dùng định nghĩa sẽ được gọi khi observer quan sát thấy thay đổi trong mục nhập hệ thống tệp mà nó được yêu cầu quan sát (thông qua {{domxref("FileSystemObserver.observe()")}}). Hàm callback sẽ được truyền hai tham số sau:
    - `records`
      - : Một mảng các đối tượng {{domxref("FileSystemChangeRecord")}} chứa chi tiết về tất cả các thay đổi được quan sát.
    - `observer`
      - : Tham chiếu đến đối tượng `FileSystemObserver` hiện tại, được cung cấp trong trường hợp, ví dụ, bạn muốn dừng quan sát sau khi nhận được các bản ghi hiện tại bằng phương thức {{domxref('FileSystemObserver.disconnect()')}}.

### Giá trị trả về

Một đối tượng {{domxref("FileSystemObserver")}} mới.

## Ví dụ

> [!NOTE]
> Để xem ví dụ hoạt động đầy đủ, hãy xem [File System Observer Demo](https://mdn.github.io/dom-examples/file-system-api/filesystemobserver/) ([mã nguồn](https://github.com/mdn/dom-examples/tree/main/file-system-api/filesystemobserver)).

### Khởi tạo `FileSystemObserver`

Trước khi có thể bắt đầu quan sát các thay đổi tệp hoặc thư mục, bạn cần khởi tạo `FileSystemObserver` để xử lý các quan sát:

```js
const observer = new FileSystemObserver(callback);
```

Nội dung hàm callback có thể được chỉ định để trả về và xử lý các quan sát thay đổi tệp theo bất kỳ cách nào bạn muốn:

```js
const callback = (records, observer) => {
  for (const record of records) {
    console.log("Change detected:", record);
    const reportContent = `Change observed to ${record.changedHandle.kind} ${record.changedHandle.name}. Type: ${record.type}.`;
    sendReport(reportContent); // Some kind of user-defined reporting function
  }

  observer.disconnect();
};
```

## Thông số kỹ thuật

Hiện chưa là một phần của bất kỳ thông số kỹ thuật nào. Xem [https://github.com/whatwg/fs/pull/165](https://github.com/whatwg/fs/pull/165) để biết PR thông số kỹ thuật liên quan.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File System API](/en-US/docs/Web/API/File_System_API)
- [The File System Observer API origin trial](https://developer.chrome.com/blog/file-system-observer#stop-observing-the-file-system) trên developer.chrome.com (2024)
