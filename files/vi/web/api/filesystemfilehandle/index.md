---
title: FileSystemFileHandle
slug: Web/API/FileSystemFileHandle
page-type: web-api-interface
browser-compat: api.FileSystemFileHandle
---

{{securecontext_header}}{{APIRef("File System API")}}{{AvailableInWorkers}}

Giao diện **`FileSystemFileHandle`** của {{domxref("File System API", "File System API", "", "nocode")}} đại diện cho một handle tới một mục nhập file. Giao diện này được truy cập thông qua phương thức {{domxref('window.showOpenFilePicker()')}}.

Lưu ý rằng các thao tác đọc và ghi phụ thuộc vào quyền truy cập file, và các quyền này sẽ không còn sau khi tải lại trang nếu không còn tab nào khác cho origin đó đang mở. Phương thức {{domxref("FileSystemHandle.queryPermission()", "queryPermission")}} của giao diện {{domxref("FileSystemHandle")}} có thể được dùng để kiểm tra trạng thái quyền trước khi truy cập file.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

_Kế thừa các thuộc tính từ lớp cha của nó, {{DOMxRef("FileSystemHandle")}}._

## Phương thức thể hiện

_Kế thừa các phương thức từ lớp cha của nó, {{DOMxRef("FileSystemHandle")}}._

- {{domxref('FileSystemFileHandle.getFile', 'getFile()')}}
  - : Trả về một {{jsxref('Promise')}} được thực thi thành một đối tượng {{domxref('File')}} đại diện cho trạng thái trên đĩa của mục nhập được handle đại diện.
- {{domxref('FileSystemFileHandle.createSyncAccessHandle', 'createSyncAccessHandle()')}}
  - : Trả về một {{jsxref('Promise')}} được thực thi thành một đối tượng {{domxref('FileSystemSyncAccessHandle')}} có thể dùng để đọc và ghi file đồng bộ. Tính đồng bộ của phương thức này mang lại lợi thế về hiệu năng, nhưng chỉ có thể dùng bên trong các [Web Worker](/en-US/docs/Web/API/Web_Workers_API) chuyên dụng cho các tệp nằm trong [origin private file system](/en-US/docs/Web/API/File_System_API/Origin_private_file_system).
- {{domxref('FileSystemFileHandle.createWritable', 'createWritable()')}}
  - : Trả về một {{jsxref('Promise')}} được thực thi thành một đối tượng {{domxref('FileSystemWritableFileStream')}} mới được tạo, có thể dùng để ghi vào file.

## Ví dụ

### Đọc một file

Hàm bất đồng bộ sau hiển thị bộ chọn file và, sau khi người dùng chọn file, dùng phương thức `getFile()` để lấy nội dung.

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

  // mở bộ chọn file
  const [fileHandle] = await window.showOpenFilePicker(pickerOpts);
  // lấy nội dung file
  const fileData = await fileHandle.getFile();
  return fileData;
}
```

### Ghi một file

Hàm bất đồng bộ sau ghi nội dung đã cho vào file handle, và do đó ghi ra đĩa.

```js
async function writeFile(fileHandle, contents) {
  // Tạo một FileSystemWritableFileStream để ghi vào.
  const writable = await fileHandle.createWritable();

  // Ghi nội dung của file vào stream.
  await writable.write(contents);

  // Đóng file và ghi nội dung ra đĩa.
  await writable.close();
}
```

### Đọc và ghi file đồng bộ

Hàm xử lý sự kiện bất đồng bộ sau nằm bên trong một Web Worker. Khi nhận một thông điệp từ luồng chính, nó:

- Tạo một handle truy cập file đồng bộ.
- Lấy kích thước file và tạo một {{jsxref("ArrayBuffer")}} để chứa nó.
- Đọc nội dung file vào bộ đệm.
- Mã hóa thông điệp và ghi nó vào cuối file.
- Lưu thay đổi xuống đĩa và đóng handle truy cập.

```js
onmessage = async (e) => {
  // Lấy thông điệp được gửi tới worker từ script chính
  const message = e.data;

  // Lấy handle tới file nháp
  const root = await navigator.storage.getDirectory();
  const draftHandle = await root.getFileHandle("draft.txt", { create: true });
  // Lấy sync access handle
  const accessHandle = await draftHandle.createSyncAccessHandle();

  // …

  // Luôn đóng FileSystemSyncAccessHandle khi xong.
  accessHandle.close();
};
```

> [!NOTE]
> Ở các phiên bản trước của đặc tả, {{domxref("FileSystemSyncAccessHandle.close()", "close()")}}, {{domxref("FileSystemSyncAccessHandle.flush()", "flush()")}}, {{domxref("FileSystemSyncAccessHandle.getSize()", "getSize()")}}, và {{domxref("FileSystemSyncAccessHandle.truncate()", "truncate()")}} đã được chỉ định sai là các phương thức bất đồng bộ, và các phiên bản cũ của một số trình duyệt triển khai chúng theo cách đó. Tuy nhiên, tất cả trình duyệt hiện tại hỗ trợ các phương thức này đều triển khai chúng như các phương thức đồng bộ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File System API](/en-US/docs/Web/API/File_System_API)
- [The File System Access API: simplifying access to local files](https://developer.chrome.com/docs/capabilities/web-apis/file-system-access)
