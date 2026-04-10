---
title: FileSystemFileHandle
slug: Web/API/FileSystemFileHandle
page-type: web-api-interface
browser-compat: api.FileSystemFileHandle
---

{{securecontext_header}}{{APIRef("File System API")}}{{AvailableInWorkers}}

Giao diện **`FileSystemFileHandle`** của {{domxref("File System API", "File System API", "", "nocode")}} đại diện cho một handle tới một mục trong hệ thống tệp. Giao diện này được truy cập thông qua phương thức {{domxref('window.showOpenFilePicker()')}}.

Lưu ý rằng các thao tác đọc và ghi phụ thuộc vào quyền truy cập tệp, và các quyền này sẽ không được duy trì sau khi tải lại trang nếu không còn tab nào khác của origin đó đang mở. Phương thức {{domxref("FileSystemHandle.queryPermission()", "queryPermission")}} của giao diện {{domxref("FileSystemHandle")}} có thể được dùng để kiểm tra trạng thái quyền trước khi truy cập một tệp.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

_Kế thừa các thuộc tính từ lớp cha của nó, {{DOMxRef("FileSystemHandle")}}._

## Phương thức thể hiện

_Kế thừa các phương thức từ lớp cha của nó, {{DOMxRef("FileSystemHandle")}}._

- {{domxref('FileSystemFileHandle.getFile', 'getFile()')}}
  - : Trả về một {{jsxref('Promise')}} sẽ được resolve thành một đối tượng {{domxref('File')}} đại diện cho trạng thái trên đĩa của mục được handle này biểu diễn.
- {{domxref('FileSystemFileHandle.createSyncAccessHandle', 'createSyncAccessHandle()')}}
  - : Trả về một {{jsxref('Promise')}} sẽ được resolve thành một đối tượng {{domxref('FileSystemSyncAccessHandle')}}, có thể dùng để đọc và ghi đồng bộ vào một tệp. Tính đồng bộ của phương thức này mang lại lợi thế về hiệu năng, nhưng nó chỉ có thể dùng bên trong các [Web Worker](/en-US/docs/Web/API/Web_Workers_API) chuyên dụng.
- {{domxref('FileSystemFileHandle.createWritable', 'createWritable()')}}
  - : Trả về một {{jsxref('Promise')}} sẽ được resolve thành một đối tượng {{domxref('FileSystemWritableFileStream')}} mới, có thể được dùng để ghi vào một tệp.

## Ví dụ

### Đọc một tệp

Hàm bất đồng bộ sau hiển thị trình chọn tệp và, sau khi người dùng chọn một tệp, dùng phương thức `getFile()` để lấy nội dung tệp.

```js
async function getTheFile() {
  const pickerOpts = {
    types: [
      {
        description: "Images",
        accept: {
          "image/*": [".png", ".gif", ".jpeg", ".jpg"],
        },
      },
    ],
    excludeAcceptAllOption: true,
    multiple: false,
  };

  // mở trình chọn tệp
  const [fileHandle] = await window.showOpenFilePicker(pickerOpts);
  // lấy nội dung tệp
  const fileData = await fileHandle.getFile();
  return fileData;
}
```

### Ghi một tệp

Hàm bất đồng bộ sau ghi nội dung đã cho vào file handle, và vì thế ghi xuống đĩa.

```js
async function writeFile(fileHandle, contents) {
  // Tạo một FileSystemWritableFileStream để ghi.
  const writable = await fileHandle.createWritable();

  // Ghi nội dung của tệp vào stream.
  await writable.write(contents);

  // Đóng tệp và ghi nội dung xuống đĩa.
  await writable.close();
}
```

### Đọc và ghi một tệp một cách đồng bộ

Hàm xử lý sự kiện bất đồng bộ sau nằm bên trong một Web Worker. Khi nhận một thông điệp từ luồng chính, nó sẽ:

- Tạo một handle truy cập tệp đồng bộ.
- Lấy kích thước của tệp và tạo một {{jsxref("ArrayBuffer")}} để chứa nội dung.
- Đọc nội dung tệp vào buffer.
- Mã hóa thông điệp và ghi nó vào cuối tệp.
- Ghi bền các thay đổi xuống đĩa và đóng access handle.

```js
onmessage = async (e) => {
  // Lấy thông điệp được gửi đến worker từ script chính
  const message = e.data;

  // Lấy handle tới tệp nháp
  const root = await navigator.storage.getDirectory();
  const draftHandle = await root.getFileHandle("draft.txt", { create: true });
  // Lấy sync access handle
  const accessHandle = await draftHandle.createSyncAccessHandle();

  // Lấy kích thước của tệp.
  const fileSize = accessHandle.getSize();
  // Đọc nội dung tệp vào buffer.
  const buffer = new DataView(new ArrayBuffer(fileSize));
  const readBuffer = accessHandle.read(buffer, { at: 0 });

  // Ghi thông điệp vào cuối tệp.
  const encoder = new TextEncoder();
  const encodedMessage = encoder.encode(message);
  const writeBuffer = accessHandle.write(encodedMessage, { at: readBuffer });

  // Ghi bền các thay đổi xuống đĩa.
  accessHandle.flush();

  // Luôn đóng FileSystemSyncAccessHandle khi xong việc.
  accessHandle.close();
};
```

> [!NOTE]
> Ở các phiên bản đầu của đặc tả, {{domxref("FileSystemSyncAccessHandle.close()", "close()")}}, {{domxref("FileSystemSyncAccessHandle.flush()", "flush()")}}, {{domxref("FileSystemSyncAccessHandle.getSize()", "getSize()")}}, và {{domxref("FileSystemSyncAccessHandle.truncate()", "truncate()")}} được mô tả nhầm là các phương thức bất đồng bộ, và các phiên bản cũ của một số trình duyệt đã triển khai theo cách đó. Tuy nhiên, tất cả trình duyệt hiện tại hỗ trợ các phương thức này đều triển khai chúng như các phương thức đồng bộ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File System API](/en-US/docs/Web/API/File_System_API)
- [The File System Access API: simplifying access to local files](https://developer.chrome.com/docs/capabilities/web-apis/file-system-access)
