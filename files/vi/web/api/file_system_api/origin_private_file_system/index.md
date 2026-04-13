---
title: Origin private file system
slug: Web/API/File_System_API/Origin_private_file_system
page-type: guide
browser-compat: api.StorageManager.getDirectory
---

{{securecontext_header}}{{DefaultAPISidebar("File System API")}}{{AvailableInWorkers}}

**Hệ thống tệp riêng tư nguồn gốc** (OPFS) là một điểm lưu trữ được cung cấp như một phần của [File System API](/en-US/docs/Web/API/File_System_API), riêng tư với nguồn gốc của trang và không hiển thị với người dùng như hệ thống tệp thông thường. Nó cung cấp quyền truy cập vào một loại tệp đặc biệt được tối ưu hóa cao cho hiệu suất và cung cấp quyền truy cập ghi tại chỗ vào nội dung của nó.

## Làm việc với tệp bằng File System Access API

[File System Access API](https://wicg.github.io/file-system-access/), mở rộng [File System API](/en-US/docs/Web/API/File_System_API), cung cấp quyền truy cập vào tệp bằng các phương thức bộ chọn. Ví dụ:

1. {{domxref("Window.showOpenFilePicker()")}} cho phép người dùng chọn tệp để truy cập, kết quả là đối tượng {{domxref("FileSystemFileHandle")}} được trả về.
2. {{domxref("FileSystemFileHandle.getFile()")}} được gọi để truy cập nội dung tệp, nội dung được sửa đổi bằng {{domxref("FileSystemFileHandle.createWritable()")}} / {{domxref("FileSystemWritableFileStream.write()")}}.
3. {{domxref("FileSystemHandle.requestPermission()", "FileSystemHandle.requestPermission({mode: 'readwrite'})")}} được sử dụng để yêu cầu quyền của người dùng để lưu các thay đổi.
4. Nếu người dùng chấp nhận yêu cầu quyền, các thay đổi sẽ được lưu lại vào tệp gốc.

Điều này hoạt động, nhưng có một số hạn chế. Những thay đổi này đang được thực hiện đối với hệ thống tệp hiển thị với người dùng, vì vậy có nhiều kiểm tra bảo mật được thực hiện (ví dụ, [duyệt web an toàn](https://developers.google.com/safe-browsing) trong Chrome) để bảo vệ chống lại nội dung độc hại được ghi vào hệ thống tệp đó. Những lần ghi này không tại chỗ và thay vào đó sử dụng tệp tạm thời. Bản gốc không được sửa đổi trừ khi nó vượt qua tất cả các kiểm tra bảo mật.

Do đó, các thao tác này khá chậm. Điều này không quá đáng chú ý khi bạn đang thực hiện các cập nhật văn bản nhỏ, nhưng hiệu suất bị ảnh hưởng khi thực hiện các cập nhật tệp lớn hơn, đáng kể hơn như sửa đổi cơ sở dữ liệu [SQLite](https://sqlite.org/wasm).

## OPFS giải quyết những vấn đề đó như thế nào?

OPFS cung cấp quyền truy cập tệp ở mức thấp, từng byte, riêng tư với nguồn gốc của trang và không hiển thị với người dùng. Do đó, nó không yêu cầu cùng một loạt kiểm tra bảo mật và cấp quyền và do đó nhanh hơn các lệnh gọi File System Access API. Nó cũng có một tập hợp các lệnh gọi đồng bộ có sẵn (các lệnh gọi File System API khác là không đồng bộ) có thể chạy bên trong web workers mà không chặn luồng chính.

Tóm tắt cách OPFS khác với hệ thống tệp hiển thị với người dùng:

- OPFS phụ thuộc vào [giới hạn quota lưu trữ trình duyệt](/en-US/docs/Web/API/Storage_API/Storage_quotas_and_eviction_criteria), giống như bất kỳ cơ chế lưu trữ được phân vùng theo nguồn gốc nào khác (ví dụ {{domxref("IndexedDB API", "IndexedDB API", "", "nocode")}}). Bạn có thể truy cập lượng không gian lưu trữ mà OPFS đang sử dụng qua {{domxref("StorageManager.estimate()", "navigator.storage.estimate()")}}.
- Việc xóa dữ liệu lưu trữ cho trang web sẽ xóa OPFS.
- Không yêu cầu lời nhắc quyền và kiểm tra bảo mật để truy cập tệp trong OPFS.
- Trình duyệt lưu nội dung của OPFS vào đĩa ở đâu đó, nhưng bạn không thể mong đợi tìm thấy các tệp được tạo tương ứng một-một. OPFS không được thiết kế để hiển thị với người dùng.

## Làm thế nào để truy cập OPFS?

Để truy cập OPFS, trước tiên bạn gọi phương thức {{domxref("StorageManager.getDirectory()", "navigator.storage.getDirectory()")}}. Điều này trả về tham chiếu đến đối tượng {{domxref("FileSystemDirectoryHandle")}} đại diện cho gốc của OPFS.

## Thao tác OPFS từ luồng chính

Khi truy cập OPFS từ luồng chính, bạn sẽ sử dụng các API không đồng bộ dựa trên {{jsxref("Promise")}}. Bạn có thể truy cập các handle tệp ({{domxref("FileSystemFileHandle")}}) và thư mục ({{domxref("FileSystemDirectoryHandle")}}) bằng cách gọi {{domxref("FileSystemDirectoryHandle.getFileHandle()")}} và {{domxref("FileSystemDirectoryHandle.getDirectoryHandle()")}} tương ứng trên đối tượng {{domxref("FileSystemDirectoryHandle")}} đại diện cho gốc OPFS (và các thư mục con, khi chúng được tạo).

> [!NOTE]
> Truyền `{ create: true }` vào các phương thức trên sẽ tạo tệp hoặc thư mục nếu nó không tồn tại.

```js
// Tạo hệ thống phân cấp tệp và thư mục
const fileHandle = await opfsRoot.getFileHandle("my first file", {
  create: true,
});
const directoryHandle = await opfsRoot.getDirectoryHandle("my first folder", {
  create: true,
});
const nestedFileHandle = await directoryHandle.getFileHandle(
  "my first nested file",
  { create: true },
);
const nestedDirectoryHandle = await directoryHandle.getDirectoryHandle(
  "my first nested folder",
  { create: true },
);

// Truy cập tệp và thư mục hiện có theo tên
const existingFileHandle = await opfsRoot.getFileHandle("my first file");
const existingDirectoryHandle =
  await opfsRoot.getDirectoryHandle("my first folder");
```

### Đọc tệp

1. Thực hiện lệnh gọi {{domxref("FileSystemDirectoryHandle.getFileHandle()")}} để trả về đối tượng {{domxref("FileSystemFileHandle")}}.
2. Gọi đối tượng {{domxref("FileSystemFileHandle.getFile()")}} để trả về đối tượng {{domxref("File")}}. Đây là loại chuyên biệt của {{domxref("Blob")}}, và do đó có thể được thao tác giống như bất kỳ `Blob` nào khác. Ví dụ, bạn có thể truy cập nội dung văn bản trực tiếp qua {{domxref("Blob.text()")}}.

### Ghi tệp

1. Thực hiện lệnh gọi {{domxref("FileSystemDirectoryHandle.getFileHandle()")}} để trả về đối tượng {{domxref("FileSystemFileHandle")}}.
2. Gọi {{domxref("FileSystemFileHandle.createWritable()")}} để trả về đối tượng {{domxref("FileSystemWritableFileStream")}}, là loại chuyên biệt của {{domxref("WritableStream")}}.
3. Ghi nội dung vào nó bằng lệnh gọi {{domxref("FileSystemWritableFileStream.write()")}}.
4. Đóng luồng bằng {{domxref("WritableStream.close()")}}.

### Xóa tệp hoặc thư mục

Bạn có thể gọi {{domxref("FileSystemDirectoryHandle.removeEntry()")}} trên thư mục cha, truyền cho nó tên của mục bạn muốn xóa:

```js
directoryHandle.removeEntry("my first nested file");
```

Bạn cũng có thể gọi {{domxref("FileSystemHandle.remove()")}} trên {{domxref("FileSystemFileHandle")}} hoặc {{domxref("FileSystemDirectoryHandle")}} đại diện cho mục bạn muốn xóa. Để xóa thư mục bao gồm tất cả thư mục con, hãy truyền tùy chọn `{ recursive: true }`.

```js
await fileHandle.remove();
await directoryHandle.remove({ recursive: true });
```

Cách sau đây cung cấp cách nhanh để xóa toàn bộ OPFS:

```js
await (await navigator.storage.getDirectory()).remove({ recursive: true });
```

### Liệt kê nội dung thư mục

{{domxref("FileSystemDirectoryHandle")}} là một [trình lặp không đồng bộ](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_async_iterator_and_async_iterable_protocols). Do đó, bạn có thể lặp qua nó với vòng lặp [`for await...of`](/en-US/docs/Web/JavaScript/Reference/Statements/for-await...of) và các phương thức tiêu chuẩn như [`entries()`](/en-US/docs/Web/API/FileSystemDirectoryHandle/entries), [`values()`](/en-US/docs/Web/API/FileSystemDirectoryHandle/entries), và [`keys()`](/en-US/docs/Web/API/FileSystemDirectoryHandle/entries).

Ví dụ:

```js
for await (let [name, handle] of directoryHandle) {
}
for await (let [name, handle] of directoryHandle.entries()) {
}
for await (let handle of directoryHandle.values()) {
}
for await (let name of directoryHandle.keys()) {
}
```

## Thao tác OPFS từ web worker

Web Workers không chặn luồng chính, có nghĩa là bạn có thể sử dụng các API truy cập tệp đồng bộ trong ngữ cảnh này. Các API đồng bộ nhanh hơn vì chúng tránh phải xử lý các promise.

Bạn có thể truy cập đồng bộ một tệp bằng cách gọi {{domxref("FileSystemFileHandle.createSyncAccessHandle()")}} trên {{domxref("FileSystemFileHandle")}} thông thường:

> [!NOTE]
> Mặc dù có "Sync" trong tên, chính phương thức `createSyncAccessHandle()` là không đồng bộ.

```js
const opfsRoot = await navigator.storage.getDirectory();
const fileHandle = await opfsRoot.getFileHandle("my-high-speed-file.txt", {
  create: true,
});
const syncAccessHandle = await fileHandle.createSyncAccessHandle();
```

Có một số phương thức _đồng bộ_ có sẵn trên {{domxref("FileSystemSyncAccessHandle")}} được trả về:

- {{domxref("FileSystemSyncAccessHandle.getSize", "getSize()")}}: Trả về kích thước tệp theo byte.
- {{domxref("FileSystemSyncAccessHandle.write", "write()")}}: Ghi nội dung của bộ đệm vào tệp, tùy chọn tại độ lệch đã cho, và trả về số byte đã ghi.
- {{domxref("FileSystemSyncAccessHandle.read", "read()")}}: Đọc nội dung tệp vào bộ đệm, tùy chọn tại độ lệch đã cho.
- {{domxref("FileSystemSyncAccessHandle.truncate", "truncate()")}}: Thay đổi kích thước tệp về kích thước đã cho.
- {{domxref("FileSystemSyncAccessHandle.flush", "flush()")}}: Đảm bảo nội dung tệp chứa tất cả các sửa đổi đã thực hiện qua `write()`.
- {{domxref("FileSystemSyncAccessHandle.close", "close()")}}: Đóng handle truy cập.

Đây là ví dụ sử dụng tất cả các phương thức được đề cập ở trên:

```js
const opfsRoot = await navigator.storage.getDirectory();
const fileHandle = await opfsRoot.getFileHandle("fast", { create: true });
const accessHandle = await fileHandle.createSyncAccessHandle();

const textEncoder = new TextEncoder();
const textDecoder = new TextDecoder();

// Khởi tạo biến này cho kích thước tệp.
let size;
// Kích thước hiện tại của tệp, ban đầu là `0`.
size = accessHandle.getSize();
// Mã hóa nội dung để ghi vào tệp.
const content = textEncoder.encode("Some text");
// Ghi nội dung vào đầu tệp.
accessHandle.write(content, { at: size });
// Xả các thay đổi.
accessHandle.flush();
// Kích thước hiện tại của tệp, bây giờ là `9` (độ dài của "Some text").
size = accessHandle.getSize();

// Mã hóa thêm nội dung để ghi vào tệp.
const moreContent = textEncoder.encode("More content");
// Ghi nội dung vào cuối tệp.
accessHandle.write(moreContent, { at: size });
// Xả các thay đổi.
accessHandle.flush();
// Kích thước hiện tại của tệp, bây giờ là `21` (độ dài của
// "Some textMore content").
size = accessHandle.getSize();

// Chuẩn bị data view có độ dài bằng tệp.
const dataView = new DataView(new ArrayBuffer(size));

// Đọc toàn bộ tệp vào data view.
accessHandle.read(dataView, { at: 0 });
// Ghi nhật ký `"Some textMore content"`.
console.log(textDecoder.decode(dataView));

// Đọc bắt đầu từ độ lệch 9 vào data view.
accessHandle.read(dataView, { at: 9 });
// Ghi nhật ký `"More content"`.
console.log(textDecoder.decode(dataView));

// Cắt tệp sau 4 byte.
accessHandle.truncate(4);
```

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Hệ thống tệp riêng tư nguồn gốc](https://web.dev/articles/origin-private-file-system) trên web.dev
