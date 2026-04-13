---
title: FileSystemSyncAccessHandle
slug: Web/API/FileSystemSyncAccessHandle
page-type: web-api-interface
browser-compat: api.FileSystemSyncAccessHandle
---

{{securecontext_header}}{{APIRef("File System API")}}{{AvailableInWorkers("dedicated")}}

Giao diện **`FileSystemSyncAccessHandle`** của {{domxref("File System API", "File System API", "", "nocode")}} đại diện cho một handle đồng bộ đến một mục nhập hệ thống tệp.

Lớp này chỉ có thể truy cập bên trong các [Web Worker](/en-US/docs/Web/API/Web_Workers_API) chuyên dụng (để các phương thức của nó không chặn thực thi trên luồng chính) cho các tệp trong [hệ thống tệp riêng tư của nguồn gốc](/en-US/docs/Web/API/File_System_API/Origin_private_file_system), không hiển thị cho người dùng cuối.

Do đó, các phương thức của nó không phải chịu các kiểm tra bảo mật giống như các phương thức chạy trên tệp trong hệ thống tệp hiển thị cho người dùng, nên chúng có hiệu suất cao hơn nhiều. Điều này làm cho chúng phù hợp với các cập nhật tệp lớn, đáng kể như các sửa đổi cơ sở dữ liệu [SQLite](https://sqlite.org/wasm).

Giao diện được truy cập thông qua phương thức {{domxref('FileSystemFileHandle.createSyncAccessHandle()')}}.

> [!NOTE]
> Trong các phiên bản trước của đặc tả, {{domxref("FileSystemSyncAccessHandle.close()", "close()")}}, {{domxref("FileSystemSyncAccessHandle.flush()", "flush()")}}, {{domxref("FileSystemSyncAccessHandle.getSize()", "getSize()")}}, và {{domxref("FileSystemSyncAccessHandle.truncate()", "truncate()")}} được chỉ định sai là phương thức bất đồng bộ, và các phiên bản cũ hơn của một số trình duyệt triển khai chúng theo cách này. Tuy nhiên, tất cả các trình duyệt hiện tại hỗ trợ các phương thức này đều triển khai chúng là phương thức đồng bộ.

## Thuộc tính phiên bản

Không có.

## Phương thức phiên bản

- {{domxref('FileSystemSyncAccessHandle.close', 'close()')}}
  - : Đóng một file handle đồng bộ đang mở, vô hiệu hóa mọi thao tác tiếp theo trên nó và giải phóng khóa độc quyền đặt trước đó trên tệp liên kết với file handle.
- {{domxref('FileSystemSyncAccessHandle.flush', 'flush()')}}
  - : Lưu trữ mọi thay đổi được thực hiện đối với tệp liên kết với handle qua phương thức {{domxref('FileSystemSyncAccessHandle.write', 'write()')}} vào đĩa.
- {{domxref('FileSystemSyncAccessHandle.getSize', 'getSize()')}}
  - : Trả về kích thước của tệp liên kết với handle tính bằng byte.
- {{domxref('FileSystemSyncAccessHandle.read', 'read()')}}
  - : Đọc nội dung của tệp liên kết với handle vào một buffer được chỉ định, tùy chọn tại một offset nhất định.
- {{domxref('FileSystemSyncAccessHandle.truncate', 'truncate()')}}
  - : Thay đổi kích thước tệp liên kết với handle thành số byte được chỉ định.
- {{domxref('FileSystemSyncAccessHandle.write', 'write()')}}
  - : Ghi nội dung của một buffer được chỉ định vào tệp liên kết với handle, tùy chọn tại một offset nhất định.

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
