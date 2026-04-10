---
title: "FileSystemFileHandle: phương thức createSyncAccessHandle()"
short-title: createSyncAccessHandle()
slug: Web/API/FileSystemFileHandle/createSyncAccessHandle
page-type: web-api-instance-method
browser-compat: api.FileSystemFileHandle.createSyncAccessHandle
---

{{securecontext_header}}{{APIRef("File System API")}}{{AvailableInWorkers("dedicated")}}

Phương thức **`createSyncAccessHandle()`** của giao diện {{domxref("FileSystemFileHandle")}} trả về một {{jsxref('Promise')}} được thực thi thành một đối tượng {{domxref('FileSystemSyncAccessHandle')}} có thể dùng để đọc và ghi file đồng bộ. Tính đồng bộ của phương thức này mang lại lợi thế về hiệu năng, nhưng nó chỉ có thể dùng bên trong các [Web Worker](/en-US/docs/Web/API/Web_Workers_API) chuyên dụng cho các tệp nằm trong [origin private file system](/en-US/docs/Web/API/File_System_API/Origin_private_file_system).

Việc tạo một {{domxref('FileSystemSyncAccessHandle')}} sẽ lấy một khóa độc quyền trên file liên kết với file handle. Điều này ngăn việc tạo thêm các {{domxref('FileSystemSyncAccessHandle')}} hoặc {{domxref('FileSystemWritableFileStream')}} cho file đó cho đến khi access handle hiện có được đóng.

## Cú pháp

```js-nolint
createSyncAccessHandle()
createSyncAccessHandle(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một object với các thuộc tính sau:
    - `mode` {{optional_inline}} {{non-standard_inline}}
      - : Một chuỗi chỉ định chế độ khóa cho access handle. Giá trị mặc định là `"readwrite"`.
        Các giá trị có thể có là:
        - `"read-only"`
          - : Có thể mở đồng thời nhiều đối tượng `FileSystemSyncAccessHandle` trên cùng một file, miễn là tất cả đều mở ở chế độ `"read-only"`. Sau khi mở, các phương thức kiểu đọc có thể được gọi trên handle — {{domxref("FileSystemSyncAccessHandle.read", "read()")}}, {{domxref("FileSystemSyncAccessHandle.getSize", "getSize()")}}, và {{domxref("FileSystemSyncAccessHandle.close", "close()")}}.
        - `"readwrite"`
          - : Chỉ có thể mở một đối tượng `FileSystemSyncAccessHandle` trên một file. Cố mở các handle tiếp theo trước khi handle đầu tiên được đóng sẽ dẫn tới ngoại lệ `NoModificationAllowedError`.
        - `"readwrite-unsafe"`
          - : Có thể mở đồng thời nhiều đối tượng `FileSystemSyncAccessHandle` trên cùng một file, miễn là tất cả đều mở ở chế độ `"readwrite-unsafe"`. Sau khi mở, mọi phương thức khả dụng đều có thể được gọi trên các handle.

### Giá trị trả về

Một {{jsxref('Promise')}} được thực thi thành một đối tượng {{domxref('FileSystemSyncAccessHandle')}}.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref('PermissionStatus.state')}} của handle không phải là `granted` ở chế độ `readwrite`.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu đối tượng {{domxref('FileSystemSyncAccessHandle')}} không đại diện cho một file trong [origin private file system](/en-US/docs/Web/API/File_System_API/Origin_private_file_system).
- `NotFoundError` {{domxref("DOMException")}}
  - : Được ném ra nếu mục hiện tại không được tìm thấy.
- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu trình duyệt không thể lấy khóa trên file liên kết với file handle. Điều này có thể xảy ra vì `mode` được đặt thành `readwrite` và có nỗ lực mở nhiều handle cùng lúc.

## Ví dụ

### Cách dùng cơ bản

Hàm xử lý sự kiện bất đồng bộ sau nằm bên trong một Web Worker. Đoạn mã bên trong nó tạo ra một handle truy cập file đồng bộ.

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

### Ví dụ đầy đủ với tùy chọn `mode`

Ví dụ [`createSyncAccessHandle()` mode test](https://mdn.github.io/dom-examples/file-system-api/createsyncaccesshandle-mode/) của chúng tôi (xem [mã nguồn](https://github.com/mdn/dom-examples/tree/main/file-system-api/createsyncaccesshandle-mode)) cung cấp một trường {{htmlelement("input")}} để nhập văn bản, và hai nút — một nút để ghi văn bản đã nhập vào cuối file trong origin private file system, và một nút để làm trống file khi nó trở nên quá đầy.

Hãy thử xem demo ở trên, đồng thời mở bảng console của nhà phát triển trình duyệt để thấy điều gì đang xảy ra. Nếu bạn mở demo trong nhiều tab trình duyệt, bạn sẽ thấy nhiều handle có thể được mở cùng lúc để ghi vào file cùng lúc. Điều này là do `mode: "readwrite-unsafe"` được đặt trong các lời gọi `createSyncAccessHandle()`.

Phía dưới chúng ta sẽ xem mã nguồn.

#### HTML

Hai phần tử {{htmlelement("button")}} và trường văn bản {{htmlelement("input")}} trông như sau:

```html
<ol>
  <li>
    <label for="file-text">Enter text to write to the file:</label>
    <input type="text" id="file-text" name="file-text" />
  </li>
  <li>
    Write your text to the file: <button class="write">Write text</button>
  </li>
  <li>
    Empty the file if it gets too full:
    <button class="empty">Empty file</button>
  </li>
</ol>
```

#### JavaScript chính

Đoạn JavaScript ở luồng chính trong file HTML được hiển thị bên dưới. Chúng ta lấy tham chiếu tới nút ghi văn bản, nút làm trống file, và trường nhập văn bản, sau đó tạo một web worker mới bằng constructor {{domxref("Worker.Worker", "Worker()")}}. Sau đó chúng ta định nghĩa hai hàm và gán chúng làm trình xử lý sự kiện cho các nút:

- `writeToOPFS()` chạy khi nút ghi văn bản được nhấn. Hàm này gửi giá trị đã nhập của trường văn bản tới worker trong một object bằng phương thức {{domxref("Worker.postMessage()")}}, rồi làm trống trường văn bản để sẵn sàng cho lần thêm tiếp theo. Lưu ý object được truyền cũng bao gồm thuộc tính `command: "write"` để chỉ định rằng chúng ta muốn kích hoạt hành động ghi bằng thông điệp này.
- `emptyOPFS()` chạy khi nút làm trống file được nhấn. Hàm này gửi một object chứa thuộc tính `command: "empty"` tới worker, chỉ định rằng file sẽ được làm trống.

```js
const writeBtn = document.querySelector(".write");
const emptyBtn = document.querySelector(".empty");
const fileText = document.querySelector("#file-text");

const opfsWorker = new Worker("worker.js");

function writeToOPFS() {
  opfsWorker.postMessage({
    command: "write",
    content: fileText.value,
  });
  console.log("Main script: Text posted to worker");
  fileText.value = "";
}

function emptyOPFS() {
  opfsWorker.postMessage({
    command: "empty",
  });
}

writeBtn.addEventListener("click", writeToOPFS);
emptyBtn.addEventListener("click", emptyOPFS);
```

#### JavaScript của worker

JavaScript của worker được hiển thị bên dưới.

Đầu tiên, chúng ta chạy một hàm tên `initOPFS()` để lấy tham chiếu tới gốc OPFS bằng {{domxref("StorageManager.getDirectory()")}}, tạo một file và trả về handle của nó bằng {{domxref("FileSystemDirectoryHandle.getFileHandle()")}}, rồi trả về một {{domxref("FileSystemSyncAccessHandle")}} bằng `createSyncAccessHandle()`. Lời gọi này bao gồm thuộc tính `mode: "readwrite-unsafe"`, cho phép nhiều handle truy cập cùng một file đồng thời.

```js
let accessHandle;

async function initOPFS() {
  const opfsRoot = await navigator.storage.getDirectory();
  const fileHandle = await opfsRoot.getFileHandle("file.txt", { create: true });
  accessHandle = await fileHandle.createSyncAccessHandle({
    mode: "readwrite-unsafe",
  });
}

initOPFS();
```

Trong hàm xử lý [sự kiện message](/en-US/docs/Web/API/Worker/message_event) của worker, trước tiên chúng ta lấy kích thước file bằng {{domxref("FileSystemSyncAccessHandle.getSize", "getSize()")}}. Sau đó chúng ta kiểm tra xem dữ liệu gửi trong thông điệp có bao gồm giá trị thuộc tính `command` là `"empty"` hay không. Nếu có, chúng ta làm trống file bằng {{domxref("FileSystemSyncAccessHandle.truncate", "truncate()")}} với giá trị `0`, và cập nhật kích thước file lưu trong biến `size`.

Nếu dữ liệu thông điệp là thứ khác, chúng ta:

- Tạo một {{domxref("TextEncoder")}} và {{domxref("TextDecoder")}} mới để xử lý mã hóa và giải mã nội dung văn bản sau này.
- Mã hóa dữ liệu thông điệp và ghi kết quả vào cuối file bằng {{domxref("FileSystemSyncAccessHandle.write", "write()")}}, rồi cập nhật kích thước file lưu trong biến `size`.
- Tạo một {{jsxref("DataView")}} để chứa nội dung file, và đọc nội dung vào đó bằng {{domxref("FileSystemSyncAccessHandle.read", "read()")}}.
- Giải mã nội dung `DataView` và ghi nó ra console.

```js
onmessage = function (e) {
  console.log("Worker: Message received from main script");

  // Get the current size of the file
  let size = accessHandle.getSize();

  if (e.data.command === "empty") {
    // Truncate the file to 0 bytes
    accessHandle.truncate(0);

    // Get the current size of the file
    size = accessHandle.getSize();
  } else {
    const textEncoder = new TextEncoder();
    const textDecoder = new TextDecoder();

    // Encode content to write to the file
    const content = textEncoder.encode(e.data.content);
    // Write the content at the end of the file
    accessHandle.write(content, { at: size });

    // Get the current size of the file
    size = accessHandle.getSize();

    // Prepare a data view of the length of the file
    const dataView = new DataView(new ArrayBuffer(size));

    // Read the entire file into the data view
    accessHandle.read(dataView, { at: 0 });

    // Log the current file contents to the console
    console.log(`File contents: ${textDecoder.decode(dataView)}`);

    // Flush the changes
    accessHandle.flush();
  }

  // Log the size of the file to the console
  console.log(`Size: ${size}`);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File System API](/en-US/docs/Web/API/File_System_API)
- [The File System Access API: simplifying access to local files](https://developer.chrome.com/docs/capabilities/web-apis/file-system-access)
