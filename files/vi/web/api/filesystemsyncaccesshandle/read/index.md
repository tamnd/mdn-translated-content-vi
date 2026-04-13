---
title: "FileSystemSyncAccessHandle: read() method"
short-title: read()
slug: Web/API/FileSystemSyncAccessHandle/read
page-type: web-api-instance-method
browser-compat: api.FileSystemSyncAccessHandle.read
---

{{securecontext_header}}{{APIRef("File System API")}}{{AvailableInWorkers("dedicated")}}

Phương thức **`read()`** của giao diện {{domxref("FileSystemSyncAccessHandle")}} đọc nội dung của tệp liên kết với handle vào một buffer được chỉ định, tùy chọn tại một offset nhất định.

## Cú pháp

```js-nolint
read(buffer, options)
```

### Tham số

- `buffer`
  - : Một {{jsxref("ArrayBuffer")}} hoặc `ArrayBufferView` (chẳng hạn {{jsxref("DataView")}}) đại diện cho buffer mà nội dung tệp sẽ được đọc vào. Lưu ý rằng bạn không thể thao tác trực tiếp nội dung của `ArrayBuffer`. Thay vào đó, hãy tạo một trong các đối tượng mảng có kiểu như {{jsxref("Int8Array")}} hoặc đối tượng {{jsxref("DataView")}} đại diện cho buffer ở định dạng cụ thể.
- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn chứa các thuộc tính sau:
    - `at`
      - : Một số đại diện cho offset tính bằng byte để đọc tệp từ đó.

### Giá trị trả về

Một số đại diện cho số byte được đọc từ tệp.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu access handle liên kết đã bị đóng.
- {{jsxref("TypeError")}}
  - : Được ném ra nếu hệ thống tệp cơ bản không hỗ trợ đọc tệp từ offset tệp được chỉ định.

## Ví dụ

Hàm xử lý sự kiện bất đồng bộ dưới đây nằm trong một Web Worker. Khi nhận thông báo từ luồng chính, nó thực hiện đọc tệp:

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

> [!NOTE]
> Trong các phiên bản trước của đặc tả, {{domxref("FileSystemSyncAccessHandle.close()", "close()")}}, {{domxref("FileSystemSyncAccessHandle.flush()", "flush()")}}, {{domxref("FileSystemSyncAccessHandle.getSize()", "getSize()")}}, và {{domxref("FileSystemSyncAccessHandle.truncate()", "truncate()")}} được chỉ định sai là phương thức bất đồng bộ. Tuy nhiên, tất cả các trình duyệt hiện tại hỗ trợ các phương thức này đều triển khai chúng là phương thức đồng bộ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File System API](/en-US/docs/Web/API/File_System_API)
- [The File System Access API: simplifying access to local files](https://developer.chrome.com/docs/capabilities/web-apis/file-system-access)
