---
title: "StorageManager: phương thức getDirectory()"
short-title: getDirectory()
slug: Web/API/StorageManager/getDirectory
page-type: web-api-instance-method
browser-compat: api.StorageManager.getDirectory
---

{{securecontext_header}}{{APIRef("File System API")}} {{AvailableInWorkers}}

Phương thức **`getDirectory()`** của giao diện {{domxref("StorageManager")}} được dùng để lấy tham chiếu đến một đối tượng {{domxref("FileSystemDirectoryHandle")}}, cho phép truy cập một thư mục và nội dung của nó, được lưu trong [origin private file system](/en-US/docs/Web/API/File_System_API/Origin_private_file_system) (OPFS).

## Cú pháp

```js-nolint
getDirectory()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref('Promise')}} được thực thi thành công với một đối tượng {{domxref("FileSystemDirectoryHandle")}}.

### Ngoại lệ

- `SecurityError` {{domxref("DOMException")}}
  - : Được ném ra nếu trình duyệt không thể ánh xạ thư mục được yêu cầu tới OPFS cục bộ, ví dụ do giới hạn lưu trữ hoặc bộ nhớ. Cũng được ném ra trong một số trình duyệt nếu `getDirectory()` được gọi trong chế độ duyệt riêng tư.
- `UnknownError` {{domxref("DOMException")}}
  - : Được ném ra trong một số trình duyệt nếu `getDirectory()` được gọi trong chế độ duyệt riêng tư.

## Ví dụ

Hàm xử lý sự kiện bất đồng bộ sau đây nằm bên trong một Web Worker. Khi nhận một thông điệp từ luồng chính, nó:

1. Lấy một {{domxref("FileSystemDirectoryHandle")}} đại diện cho gốc của OPFS bằng `getDirectory()`, lưu nó vào biến `root`.
2. Lấy một file handle bằng {{domxref("FileSystemDirectoryHandle.getFileHandle()")}}.
3. Tạo một synchronous file access handle bằng {{domxref("FileSystemFileHandle.createSyncAccessHandle()")}}.
4. Lấy kích thước của file và tạo một {{jsxref("ArrayBuffer")}} để chứa nó.
5. Đọc và ghi vào file.
6. Lưu các thay đổi xuống đĩa và đóng synchronous access handle.

```js
onmessage = async (e) => {
  // Lấy thông điệp được gửi tới worker từ script chính
  const message = e.data;

  // Lấy handle tới file nháp
  const root = await navigator.storage.getDirectory();
  const draftHandle = await root.getFileHandle("draft.txt", { create: true });
  // Lấy sync access handle
  const accessHandle = await draftHandle.createSyncAccessHandle();

  // Lấy kích thước của file.
  const fileSize = accessHandle.getSize();
  // Đọc nội dung file vào buffer.
  const buffer = new DataView(new ArrayBuffer(fileSize));
  const readBuffer = accessHandle.read(buffer, { at: 0 });

  // Ghi thông điệp vào cuối file.
  const encoder = new TextEncoder();
  const encodedMessage = encoder.encode(message);
  const writeBuffer = accessHandle.write(encodedMessage, { at: readBuffer });

  // Lưu thay đổi xuống đĩa.
  accessHandle.flush();

  // Luôn đóng FileSystemSyncAccessHandle khi hoàn tất.
  accessHandle.close();
};
```

> [!NOTE]
> Ở các phiên bản trước của đặc tả, {{domxref("FileSystemSyncAccessHandle.close()", "close()")}}, {{domxref("FileSystemSyncAccessHandle.flush()", "flush()")}}, {{domxref("FileSystemSyncAccessHandle.getSize()", "getSize()")}} và {{domxref("FileSystemSyncAccessHandle.truncate()", "truncate()")}} bị đặc tả nhầm là các phương thức bất đồng bộ, và các phiên bản cũ của một số trình duyệt đã triển khai chúng theo cách đó. Tuy nhiên, mọi trình duyệt hiện tại hỗ trợ các phương thức này đều triển khai chúng như các phương thức đồng bộ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("StorageManager")}}
- {{domxref("Navigator.storage")}}
- {{domxref("WorkerNavigator.storage")}}
- {{domxref("FileSystemDirectoryHandle")}}
