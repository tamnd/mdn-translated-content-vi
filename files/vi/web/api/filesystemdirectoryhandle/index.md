---
title: FileSystemDirectoryHandle
slug: Web/API/FileSystemDirectoryHandle
page-type: web-api-interface
browser-compat: api.FileSystemDirectoryHandle
---

{{securecontext_header}}{{APIRef("File System API")}}{{AvailableInWorkers}}

Giao diện **`FileSystemDirectoryHandle`** của {{domxref("File System API", "File System API", "", "nocode")}} cung cấp một handle cho một thư mục trong hệ thống tệp.

Giao diện này có thể được truy cập thông qua các phương thức {{domxref('window.showDirectoryPicker()')}}, {{domxref('StorageManager.getDirectory()')}}, {{domxref('DataTransferItem.getAsFileSystemHandle()')}}, và {{domxref('FileSystemDirectoryHandle.getDirectoryHandle()')}}.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

_Kế thừa các thuộc tính từ lớp cha của nó, {{DOMxRef("FileSystemHandle")}}._

## Phương thức thể hiện

_Kế thừa các phương thức từ lớp cha của nó, {{DOMxRef("FileSystemHandle")}}._

Các phương thức thông thường:

- {{domxref('FileSystemDirectoryHandle.getDirectoryHandle()')}}
  - : Trả về một {{jsxref('Promise')}} được thực thi thành `FileSystemDirectoryHandle` cho một thư mục con có tên được chỉ định bên trong handle thư mục mà phương thức được gọi trên đó.
- {{domxref('FileSystemDirectoryHandle.getFileHandle()')}}
  - : Trả về một {{jsxref('Promise')}} được thực thi thành một {{domxref('FileSystemFileHandle')}} cho một tệp có tên được chỉ định, bên trong thư mục nơi phương thức được gọi.
- {{domxref('FileSystemDirectoryHandle.removeEntry()')}}
  - : Cố gắng xóa không đồng bộ một mục nếu handle thư mục chứa một tệp hoặc thư mục có tên được chỉ định.
- {{domxref('FileSystemDirectoryHandle.resolve()')}}
  - : Trả về một {{jsxref('Promise')}} được thực thi thành một {{jsxref('Array')}} các tên thư mục từ handle cha đến mục con được chỉ định, với tên của mục con là phần tử cuối cùng trong mảng.

[Các phương thức của trình lặp bất đồng bộ](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_async_iterator_and_async_iterable_protocols):

- {{domxref('FileSystemDirectoryHandle.entries()')}}
  - : Trả về một _bộ lặp bất đồng bộ_ mới của các cặp `[key, value]` có thể liệt kê của chính đối tượng đã cho.
- {{domxref('FileSystemDirectoryHandle.keys()')}}
  - : Trả về một _bộ lặp bất đồng bộ_ mới chứa các khóa cho mỗi mục trong `FileSystemDirectoryHandle`.
- {{domxref('FileSystemDirectoryHandle.values()')}}
  - : Trả về một _bộ lặp bất đồng bộ_ mới chứa các giá trị cho mỗi mục trong đối tượng `FileSystemDirectoryHandle`.
- `FileSystemDirectoryHandle[Symbol.asyncIterator]()`
  - : Trả về một _bộ lặp bất đồng bộ_ mới của các cặp `[key, value]` có thể liệt kê của chính đối tượng đã cho.

## Ví dụ

### Trả về handle thư mục

Ví dụ sau trả về một handle thư mục với tên được chỉ định; nếu thư mục chưa tồn tại, nó sẽ được tạo.

```js
const dirName = "directoryToGetName";

// giả sử chúng ta có một handle thư mục: 'currentDirHandle'
const subDir = await currentDirHandle.getDirectoryHandle(dirName, {
  create: true,
});
```

### Trả về đường dẫn tệp

Hàm bất đồng bộ sau dùng `resolve()` để tìm đường dẫn tới một tệp đã chọn, tương đối với một handle thư mục được chỉ định.

```js
async function returnPathDirectories(directoryHandle) {
  // Lấy một file handle bằng cách hiển thị bộ chọn tệp:
  const handle = await self.showOpenFilePicker();
  if (!handle) {
    // Người dùng đã hủy, hoặc không mở được tệp.
    return;
  }

  // Kiểm tra xem handle có tồn tại bên trong handle thư mục của chúng ta không
  const relativePaths = await directoryHandle.resolve(handle);

  if (relativePath === null) {
    // Không nằm trong handle thư mục
  } else {
    // relativePath là một mảng các tên, biểu thị đường dẫn tương đối

    for (const name of relativePaths) {
      // ghi log từng mục
      console.log(name);
    }
  }
}
```

### Trả về các handle cho mọi tệp trong một thư mục

Ví dụ sau quét đệ quy qua một thư mục để trả về các đối tượng {{domxref('FileSystemFileHandle')}} cho từng tệp trong thư mục đó:

```js
async function* getFilesRecursively(entry) {
  if (entry.kind === "file") {
    const file = await entry.getFile();
    if (file !== null) {
      file.relativePath = getRelativePath(entry);
      yield file;
    }
  } else if (entry.kind === "directory") {
    for await (const handle of entry.values()) {
      yield* getFilesRecursively(handle);
    }
  }
}
for await (const fileHandle of getFilesRecursively(directoryHandle)) {
  console.log(fileHandle);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File System API](/en-US/docs/Web/API/File_System_API)
- [The File System Access API: simplifying access to local files](https://developer.chrome.com/docs/capabilities/web-apis/file-system-access)
