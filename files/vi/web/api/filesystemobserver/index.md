---
title: FileSystemObserver
slug: Web/API/FileSystemObserver
page-type: web-api-interface
status:
  - experimental
  - non-standard
browser-compat: api.FileSystemObserver
---

{{securecontext_header}}{{APIRef("File System API")}}{{SeeCompatTable}}{{non-standard_header}}

Giao diện **`FileSystemObserver`** của {{domxref("File System API", "File System API", "", "nocode")}} cung cấp cơ chế để theo dõi các thay đổi trong hệ thống tệp người dùng quan sát được và [Hệ thống tệp riêng tư theo nguồn gốc](/en-US/docs/Web/API/File_System_API/Origin_private_file_system) (OPFS). Điều này có nghĩa là các ứng dụng web không cần phải liên tục truy vấn hệ thống tệp để tìm thay đổi trong các tệp hoặc cấu trúc thư mục, điều này có thể tốn thời gian và lãng phí.

## Hàm khởi tạo

- {{domxref("FileSystemObserver.FileSystemObserver", "FileSystemObserver()")}} {{Experimental_Inline}} {{non-standard_inline}}
  - : Tạo một phiên bản đối tượng `FileSystemObserver` mới.

## Phương thức phiên bản

- {{domxref("FileSystemObserver.disconnect", "disconnect()")}} {{Experimental_Inline}} {{non-standard_inline}}
  - : Dừng quan sát hệ thống tệp.
- {{domxref("FileSystemObserver.observe", "observe()")}} {{Experimental_Inline}} {{non-standard_inline}}
  - : Bắt đầu quan sát các thay đổi đối với tệp hoặc thư mục được cho.

## Ví dụ

> [!NOTE]
> Để xem ví dụ hoạt động đầy đủ, hãy xem [File System Observer Demo](https://mdn.github.io/dom-examples/file-system-api/filesystemobserver/) ([mã nguồn](https://github.com/mdn/dom-examples/tree/main/file-system-api/filesystemobserver)).

### Khởi tạo `FileSystemObserver`

Trước khi có thể bắt đầu quan sát các thay đổi tệp hoặc thư mục, bạn cần khởi tạo `FileSystemObserver` để xử lý các quan sát. Điều này được thực hiện bằng cách sử dụng hàm khởi tạo {{domxref("FileSystemObserver.FileSystemObserver", "FileSystemObserver()")}}, nhận một hàm callback làm tham số:

```js
const observer = new FileSystemObserver(callback);
```

Nội dung [hàm callback](/en-US/docs/Web/API/FileSystemObserver/FileSystemObserver#callback) có thể được chỉ định để trả về và xử lý các quan sát thay đổi tệp theo bất kỳ cách nào bạn muốn:

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

### Quan sát tệp hoặc thư mục

Sau khi có phiên bản `FileSystemObserver`, bạn có thể bắt đầu quan sát các thay đổi đối với một mục nhập hệ thống tệp bằng cách gọi phương thức {{domxref("FileSystemObserver.observe()")}}.

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

### Dừng quan sát hệ thống tệp

Khi bạn muốn dừng quan sát các thay đổi đối với mục nhập hệ thống tệp, bạn có thể gọi {{domxref("FileSystemObserver.disconnect()")}}:

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
