---
title: "FileSystemSyncAccessHandle: getSize() method"
short-title: getSize()
slug: Web/API/FileSystemSyncAccessHandle/getSize
page-type: web-api-instance-method
browser-compat: api.FileSystemSyncAccessHandle.getSize
---

{{securecontext_header}}{{APIRef("File System API")}}{{AvailableInWorkers("dedicated")}}

Phương thức **`getSize()`** của giao diện {{domxref("FileSystemSyncAccessHandle")}} trả về kích thước của tệp liên kết với handle tính bằng byte.

> [!NOTE]
> Trong các phiên bản trước của đặc tả, {{domxref("FileSystemSyncAccessHandle.close()", "close()")}}, {{domxref("FileSystemSyncAccessHandle.flush()", "flush()")}}, `getSize()`, và {{domxref("FileSystemSyncAccessHandle.truncate()", "truncate()")}} được chỉ định sai là phương thức bất đồng bộ. Tuy nhiên, tất cả các trình duyệt hiện tại hỗ trợ các phương thức này đều triển khai chúng là phương thức đồng bộ.

## Cú pháp

```js-nolint
getSize()
```

### Tham số

Không có.

### Giá trị trả về

Một số đại diện cho kích thước của tệp tính bằng byte.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu access handle liên kết đã bị đóng.

## Ví dụ

Hàm xử lý sự kiện bất đồng bộ dưới đây nằm trong một Web Worker. Khi nhận thông báo từ luồng chính, nó tạo một file access handle đồng bộ, lấy kích thước tệp, và thực hiện các thao tác đọc/ghi:

```js
onmessage = async (e) => {
  // Retrieve message sent to work from main script
  const message = e.data;

  // Get handle to draft file
  const root = await navigator.storage.getDirectory();
  const draftHandle = await root.getFileHandle("draft.txt", { create: true });
  // Get sync access handle
  const accessHandle = await draftHandle.createSyncAccessHandle();

  // Get size of the file.
  const fileSize = accessHandle.getSize();
  // Read file content to a buffer.
  const buffer = new DataView(new ArrayBuffer(fileSize));
  const readBuffer = accessHandle.read(buffer, { at: 0 });

  // Write the message to the end of the file.
  const encoder = new TextEncoder();
  const encodedMessage = encoder.encode(message);
  const writeBuffer = accessHandle.write(encodedMessage, { at: readBuffer });

  // Persist changes to disk.
  accessHandle.flush();

  // Always close FileSystemSyncAccessHandle if done.
  accessHandle.close();
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File System API](/en-US/docs/Web/API/File_System_API)
- [The File System Access API: simplifying access to local files](https://developer.chrome.com/docs/capabilities/web-apis/file-system-access)
