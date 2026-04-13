---
title: "FileSystemSyncAccessHandle: flush() method"
short-title: flush()
slug: Web/API/FileSystemSyncAccessHandle/flush
page-type: web-api-instance-method
browser-compat: api.FileSystemSyncAccessHandle.flush
---

{{securecontext_header}}{{APIRef("File System API")}}{{AvailableInWorkers("dedicated")}}

Phương thức **`flush()`** của giao diện {{domxref("FileSystemSyncAccessHandle")}} lưu trữ mọi thay đổi được thực hiện đối với tệp liên kết với handle qua phương thức {{domxref('FileSystemSyncAccessHandle.write', 'write()')}} vào đĩa.

Lưu ý rằng bạn chỉ cần gọi phương thức này nếu cần các thay đổi được cam kết vào đĩa tại một thời điểm cụ thể. Nếu không, bạn có thể để hệ điều hành cơ bản xử lý khi nào thích hợp.

> [!NOTE]
> Trong các phiên bản trước của đặc tả, {{domxref("FileSystemSyncAccessHandle.close()", "close()")}}, `flush()`, {{domxref("FileSystemSyncAccessHandle.getSize()", "getSize()")}}, và {{domxref("FileSystemSyncAccessHandle.truncate()", "truncate()")}} được chỉ định sai là phương thức bất đồng bộ. Tuy nhiên, tất cả các trình duyệt hiện tại hỗ trợ các phương thức này đều triển khai chúng là phương thức đồng bộ.

## Cú pháp

```js-nolint
flush()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref('undefined')}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu access handle liên kết đã bị đóng.

## Ví dụ

Hàm xử lý sự kiện bất đồng bộ dưới đây nằm trong một Web Worker. Khi nhận thông báo từ luồng chính, nó:

- Tạo một file access handle đồng bộ.
- Lấy kích thước tệp và tạo một {{jsxref("ArrayBuffer")}} để chứa nó.
- Đọc nội dung tệp vào buffer.
- Mã hóa thông báo và ghi nó vào cuối tệp.
- Lưu các thay đổi vào đĩa và đóng access handle.

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
