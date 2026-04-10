---
title: "FileSystemFileHandle: phương thức createSyncAccessHandle()"
short-title: createSyncAccessHandle()
slug: Web/API/FileSystemFileHandle/createSyncAccessHandle
page-type: web-api-instance-method
browser-compat: api.FileSystemFileHandle.createSyncAccessHandle
---

{{securecontext_header}}{{APIRef("File System API")}}{{AvailableInWorkers("dedicated")}}

Phương thức **`createSyncAccessHandle()`** của giao diện {{domxref("FileSystemFileHandle")}} trả về một {{jsxref('Promise')}} sẽ được resolve thành một đối tượng {{domxref('FileSystemSyncAccessHandle')}}, có thể dùng để đọc và ghi đồng bộ vào một tệp. Tính đồng bộ của phương thức này mang lại lợi thế về hiệu năng, nhưng nó chỉ có thể dùng bên trong các [Web Worker](/en-US/docs/Web/API/Web_Workers_API) chuyên dụng cho các tệp trong [origin private file system](/en-US/docs/Web/API/File_System_API/Origin_private_file_system).

Việc tạo một {{domxref('FileSystemSyncAccessHandle')}} sẽ lấy một exclusive lock trên tệp liên kết với file handle. Điều này ngăn không cho tạo thêm {{domxref('FileSystemSyncAccessHandle')}} hoặc {{domxref('FileSystemWritableFileStream')}} cho tệp đó cho đến khi access handle hiện tại được đóng.

## Cú pháp

```js-nolint
createSyncAccessHandle()
createSyncAccessHandle(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một object với thuộc tính sau:
    - `mode` {{optional_inline}} {{non-standard_inline}}
      - : Một chuỗi chỉ định chế độ khóa cho access handle. Giá trị mặc định là `"readwrite"`.
        Các giá trị có thể là:
        - `"read-only"`
          - : Có thể mở nhiều đối tượng `FileSystemSyncAccessHandle` cùng lúc trên một tệp, ví dụ khi dùng cùng ứng dụng trong nhiều tab, miễn là tất cả đều mở ở chế độ `"read-only"`. Sau khi mở, có thể gọi các phương thức kiểu đọc trên handle: {{domxref("FileSystemSyncAccessHandle.read", "read()")}}, {{domxref("FileSystemSyncAccessHandle.getSize", "getSize()")}}, và {{domxref("FileSystemSyncAccessHandle.close", "close()")}}.
        - `"readwrite"`
          - : Chỉ có thể mở một đối tượng `FileSystemSyncAccessHandle` trên một tệp. Nếu cố mở các handle tiếp theo trước khi handle đầu tiên được đóng, một ngoại lệ `NoModificationAllowedError` sẽ được ném ra. Sau khi mở, có thể gọi bất kỳ phương thức nào có sẵn trên handle.
        - `"readwrite-unsafe"`
          - : Có thể mở nhiều đối tượng `FileSystemSyncAccessHandle` cùng lúc trên một tệp, miễn là tất cả đều mở ở chế độ `"readwrite-unsafe"`. Sau khi mở, có thể gọi bất kỳ phương thức nào có sẵn trên handle.

### Giá trị trả về

Một {{jsxref('Promise')}} sẽ được resolve thành một đối tượng {{domxref('FileSystemSyncAccessHandle')}}.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref('PermissionStatus.state')}} của handle không phải là `granted` ở chế độ `readwrite`.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu đối tượng {{domxref('FileSystemSyncAccessHandle')}} không đại diện cho một tệp trong [origin private file system](/en-US/docs/Web/API/File_System_API/Origin_private_file_system).
- `NotFoundError` {{domxref("DOMException")}}
  - : Được ném ra nếu mục hiện tại không được tìm thấy.
- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu trình duyệt không thể giành được khóa trên tệp liên kết với file handle. Điều này có thể xảy ra khi `mode` được đặt thành `readwrite` và cố mở nhiều handle cùng lúc.

## Ví dụ

### Cách dùng cơ bản

Hàm xử lý sự kiện bất đồng bộ sau nằm bên trong một Web Worker. Đoạn mã bên trong nó tạo một access handle đồng bộ cho tệp.

```js
onmessage = async (e) => {
  // Lấy thông điệp được gửi đến worker từ script chính
  const message = e.data;

  // Lấy handle tới tệp nháp
  const root = await navigator.storage.getDirectory();
  const draftHandle = await root.getFileHandle("draft.txt", { create: true });
  // Lấy sync access handle
  const accessHandle = await draftHandle.createSyncAccessHandle();

  // …

  // Luôn đóng FileSystemSyncAccessHandle khi xong việc.
  accessHandle.close();
};
```

### Ví dụ đầy đủ với tùy chọn `mode`

Ví dụ [`createSyncAccessHandle()` mode test](https://mdn.github.io/dom-examples/file-system-api/createsyncaccesshandle-mode/) của chúng tôi (xem [mã nguồn](https://github.com/mdn/dom-examples/tree/main/file-system-api/createsyncaccesshandle-mode)) cung cấp một trường {{htmlelement("input")}} để nhập văn bản, và hai nút - một nút để ghi văn bản đã nhập vào cuối một tệp trong origin private file system, và một nút để làm trống tệp khi nó quá đầy.

Hãy thử khám phá bản demo ở trên với bảng điều khiển nhà phát triển của trình duyệt đang mở để xem điều gì đang xảy ra. Nếu bạn mở demo trong nhiều tab trình duyệt, bạn sẽ thấy có thể mở nhiều handle cùng lúc để ghi vào tệp. Đó là vì lời gọi `createSyncAccessHandle()` đặt `mode: "readwrite-unsafe"`.

Bên dưới, chúng ta sẽ xem mã.

#### HTML

Hai phần tử {{htmlelement("button")}} và trường {{htmlelement("input")}} kiểu text trông như sau:

```html
<ol>
  <li>
    <label for="file-text">Nhập văn bản để ghi vào tệp:</label>
    <input type="text" id="file-text" name="file-text" />
  </li>
  <li>
    Ghi văn bản của bạn vào tệp: <button class="write">Write text</button>
  </li>
  <li>
    Làm trống tệp nếu nó quá đầy:
    <button class="empty">Empty file</button>
  </li>
</ol>
```

#### Main JavaScript

Mã JavaScript ở luồng chính trong file HTML được hiển thị bên dưới. Chúng ta lấy tham chiếu tới nút ghi văn bản, nút làm trống tệp và trường nhập text, rồi tạo một web worker mới bằng constructor {{domxref("Worker.Worker", "Worker()")}}. Sau đó chúng ta định nghĩa hai hàm và gắn chúng làm trình xử lý sự kiện cho các nút:

- `writeToOPFS()` chạy khi nút ghi văn bản được bấm. Hàm này gửi giá trị đã nhập của trường text tới worker trong một object bằng phương thức {{domxref("Worker.postMessage()")}}, rồi xóa trường text để chuẩn bị cho lần nhập tiếp theo. Lưu ý object được truyền cũng bao gồm thuộc tính `command: "write"` để chỉ ra rằng chúng ta muốn kích hoạt hành động ghi với thông điệp này.
- `emptyOPFS()` chạy khi nút làm trống tệp được bấm. Hàm này gửi một object chứa thuộc tính `command: "empty"` tới worker để chỉ định rằng tệp cần được làm trống.

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

#### Worker JavaScript

Mã JavaScript trong worker được hiển thị bên dưới.

Trước hết, chúng ta chạy một hàm tên `initOPFS()` để lấy tham chiếu tới gốc OPFS bằng {{domxref("StorageManager.getDirectory()")}}, tạo một tệp và trả về handle của nó bằng {{domxref("FileSystemDirectoryHandle.getFileHandle()")}}, rồi trả về một {{domxref("FileSystemSyncAccessHandle")}} bằng `createSyncAccessHandle()`. Lời gọi này bao gồm thuộc tính `mode: "readwrite-unsafe"`, cho phép nhiều handle truy cập cùng một tệp cùng lúc.

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

Trong hàm xử lý [message event](/en-US/docs/Web/API/Worker/message_event) của worker, trước tiên chúng ta lấy kích thước hiện tại của tệp bằng {{domxref("FileSystemSyncAccessHandle.getSize", "getSize()")}}. Sau đó chúng ta kiểm tra xem dữ liệu nhận được có thuộc tính `command` bằng `"empty"` hay không. Nếu có, chúng ta làm trống tệp bằng {{domxref("FileSystemSyncAccessHandle.truncate", "truncate()")}} với giá trị `0`, rồi cập nhật lại kích thước lưu trong biến `size`.

Nếu dữ liệu thông điệp là thứ khác, chúng ta:

- Tạo một {{domxref("TextEncoder")}} và {{domxref("TextDecoder")}} mới để xử lý mã hóa và giải mã nội dung văn bản sau này.
- Mã hóa dữ liệu thông điệp và ghi kết quả vào cuối tệp bằng {{domxref("FileSystemSyncAccessHandle.write", "write()")}}, rồi cập nhật lại biến `size`.
- Tạo một {{jsxref("DataView")}} để chứa nội dung tệp và đọc nội dung vào đó bằng {{domxref("FileSystemSyncAccessHandle.read", "read()")}}.
- Giải mã nội dung `DataView` và ghi nó ra console.

```js
onmessage = function (e) {
  console.log("Worker: Message received from main script");

  // Lấy kích thước hiện tại của tệp
  let size = accessHandle.getSize();

  if (e.data.command === "empty") {
    // Cắt tệp xuống 0 byte
    accessHandle.truncate(0);

    // Lấy kích thước hiện tại của tệp
    size = accessHandle.getSize();
  } else {
    const textEncoder = new TextEncoder();
    const textDecoder = new TextDecoder();

    // Mã hóa nội dung sẽ ghi vào tệp
    const content = textEncoder.encode(e.data.content);
    // Ghi nội dung vào cuối tệp
    accessHandle.write(content, { at: size });

    // Lấy kích thước hiện tại của tệp
    size = accessHandle.getSize();

    // Chuẩn bị một data view với độ dài của tệp
    const dataView = new DataView(new ArrayBuffer(size));

    // Đọc toàn bộ tệp vào data view
    accessHandle.read(dataView, { at: 0 });

    // Ghi nội dung hiện tại của tệp ra console
    console.log(`File contents: ${textDecoder.decode(dataView)}`);

    // Flush các thay đổi
    accessHandle.flush();
  }

  // Ghi kích thước của tệp ra console
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
