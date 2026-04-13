---
title: File System API
slug: Web/API/File_System_API
page-type: web-api-overview
browser-compat:
  - api.FileSystemHandle
  - api.FileSystemFileHandle
  - api.FileSystemDirectoryHandle
  - api.FileSystemWritableFileStream
  - api.FileSystemSyncAccessHandle
spec-urls:
  - https://fs.spec.whatwg.org/
  - https://wicg.github.io/file-system-access/
---

{{securecontext_header}}{{DefaultAPISidebar("File System API")}}{{AvailableInWorkers}}

**File System API** — với các phần mở rộng được cung cấp qua [**File System Access API**](https://wicg.github.io/file-system-access/) để truy cập tệp trên hệ thống tệp thiết bị — cho phép đọc, ghi và quản lý tệp.

Xem [Mối quan hệ với các API liên quan đến tệp khác](/en-US/docs/Web/API/File_API#relationship_to_other_file-related_apis) để so sánh giữa API này, [File and Directory Entries API](/en-US/docs/Web/API/File_and_Directory_Entries_API), và [File API](/en-US/docs/Web/API/File_API).

## Khái niệm và cách sử dụng

API này cho phép tương tác với các tệp trên thiết bị cục bộ của người dùng, hoặc trên hệ thống tệp mạng mà người dùng có thể truy cập. Chức năng cốt lõi của API này bao gồm đọc tệp, ghi hoặc lưu tệp, và truy cập cấu trúc thư mục.

Hầu hết các tương tác với tệp và thư mục được thực hiện thông qua các handle. Lớp cha {{domxref('FileSystemHandle')}} giúp xác định hai lớp con: {{domxref('FileSystemFileHandle')}} và {{domxref('FileSystemDirectoryHandle')}}, cho tệp và thư mục tương ứng.

Các handle đại diện cho tệp hoặc thư mục trên hệ thống của người dùng. Bạn có thể truy cập chúng đầu tiên bằng cách hiển thị cho người dùng một bộ chọn tệp hoặc thư mục bằng các phương thức như {{domxref('window.showOpenFilePicker()')}} và {{domxref('window.showDirectoryPicker()')}}. Sau khi được gọi, bộ chọn tệp xuất hiện và người dùng chọn tệp hoặc thư mục. Khi điều này xảy ra thành công, một handle được trả về.

Bạn cũng có thể truy cập các handle tệp qua:

- Phương thức {{domxref('DataTransferItem.getAsFileSystemHandle()')}} của {{domxref('HTML Drag and Drop API', '', '', 'nocode')}}.
- [File Handling API](https://developer.chrome.com/docs/capabilities/web-apis/file-handling).

Mỗi handle cung cấp chức năng riêng của nó và có một số khác biệt tùy thuộc vào loại bạn đang sử dụng (xem phần [giao diện](#interfaces) để biết chi tiết cụ thể). Sau đó bạn có thể truy cập dữ liệu tệp, hoặc thông tin (bao gồm con) của thư mục đã chọn. API này mở ra chức năng tiềm năng mà web còn thiếu. Tuy nhiên, bảo mật luôn là mối quan tâm hàng đầu khi thiết kế API, và quyền truy cập dữ liệu tệp/thư mục bị từ chối trừ khi người dùng cho phép cụ thể (lưu ý rằng đây không phải trường hợp với [Hệ thống tệp riêng tư nguồn gốc](#origin_private_file_system), vì nó không hiển thị với người dùng).

> [!NOTE]
> Các ngoại lệ khác nhau có thể được ném ra khi sử dụng các tính năng của API này được liệt kê trên các trang liên quan như được xác định trong spec. Tuy nhiên, tình huống trở nên phức tạp hơn do sự tương tác của API và hệ điều hành cơ bản. Đã có đề xuất [liệt kê các ánh xạ lỗi trong spec](https://github.com/whatwg/fs/issues/57), bao gồm thông tin liên quan hữu ích.

> [!NOTE]
> Các đối tượng dựa trên {{domxref("FileSystemHandle")}} cũng có thể được tuần tự hóa vào đối tượng cơ sở dữ liệu {{domxref("IndexedDB API", "IndexedDB", "", "nocode")}}, hoặc được chuyển qua {{domxref("window.postMessage", "postMessage()")}}.

### Hệ thống tệp riêng tư nguồn gốc

Hệ thống tệp riêng tư nguồn gốc (OPFS) là một điểm lưu trữ được cung cấp như một phần của File System API, riêng tư với nguồn gốc của trang và không hiển thị với người dùng như hệ thống tệp thông thường. Nó cung cấp quyền truy cập vào một loại tệp đặc biệt được tối ưu hóa cao cho hiệu suất và cung cấp quyền truy cập ghi tại chỗ vào nội dung của nó.

Sau đây là một số trường hợp sử dụng có thể:

- Ứng dụng với bộ tải lên liên tục
  - Khi tệp hoặc thư mục được chọn để tải lên, bạn có thể sao chép tệp vào sandbox cục bộ và tải lên từng phần một lúc.
  - Ứng dụng có thể khởi động lại quá trình tải lên sau sự gián đoạn, chẳng hạn trình duyệt bị đóng hoặc gặp sự cố, kết nối bị gián đoạn, hoặc máy tính bị tắt.

- Trò chơi video hoặc ứng dụng khác có nhiều tài sản phương tiện
  - Ứng dụng tải xuống một hoặc nhiều tệp tarball lớn và giải nén chúng cục bộ vào cấu trúc thư mục.
  - Ứng dụng tải trước tài sản ở chế độ nền, để người dùng có thể chuyển sang nhiệm vụ tiếp theo hoặc cấp độ trò chơi mà không cần chờ tải xuống.

- Trình chỉnh sửa âm thanh hoặc ảnh với quyền truy cập ngoại tuyến hoặc bộ nhớ đệm cục bộ (tuyệt vời cho hiệu suất và tốc độ)
  - Ứng dụng có thể ghi vào tệp tại chỗ (ví dụ, ghi đè chỉ các thẻ ID3/EXIF và không ghi vào toàn bộ tệp).

- Trình xem video ngoại tuyến
  - Ứng dụng có thể tải xuống các tệp lớn (>1GB) để xem sau.
  - Ứng dụng có thể truy cập các tệp được tải xuống một phần.

- Ứng dụng thư điện tử web ngoại tuyến
  - Ứng dụng tải xuống tệp đính kèm và lưu trữ cục bộ.
  - Ứng dụng lưu vào bộ nhớ đệm các tệp đính kèm để tải lên sau.

Đọc [Hệ thống tệp riêng tư nguồn gốc](/en-US/docs/Web/API/File_System_API/Origin_private_file_system) để biết hướng dẫn cách sử dụng.

### Lưu tệp

- Trong trường hợp các handle không đồng bộ, hãy sử dụng giao diện {{domxref('FileSystemWritableFileStream')}}. Khi dữ liệu bạn muốn lưu ở định dạng {{domxref('Blob')}}, đối tượng {{jsxref("String")}}, chuỗi ký tự hoặc {{jsxref('ArrayBuffer', 'buffer')}}, bạn có thể mở một luồng và lưu dữ liệu vào tệp. Đây có thể là tệp hiện có hoặc tệp mới.
- Trong trường hợp {{domxref('FileSystemSyncAccessHandle')}} đồng bộ, bạn ghi các thay đổi vào tệp bằng phương thức {{domxref('FileSystemSyncAccessHandle.write', 'write()')}}. Bạn cũng có thể gọi tùy chọn {{domxref('FileSystemSyncAccessHandle.flush', 'flush()')}} nếu bạn cần các thay đổi được xác nhận vào đĩa tại một thời điểm cụ thể (nếu không, bạn có thể để hệ điều hành cơ bản xử lý điều này khi thấy phù hợp, điều này thường ổn trong hầu hết các trường hợp).

## Giao diện

- {{domxref("FileSystemChangeRecord")}} {{experimental_inline}}
  - : Chứa chi tiết của một thay đổi duy nhất được quan sát bởi {{domxref("FileSystemObserver")}}.
- {{domxref("FileSystemHandle")}}
  - : Đối tượng đại diện cho mục nhập tệp hoặc thư mục. Nhiều handle có thể đại diện cho cùng một mục nhập. Trong hầu hết các trường hợp, bạn không làm việc trực tiếp với `FileSystemHandle` mà thay vào đó là các giao diện con {{domxref('FileSystemFileHandle')}} và {{domxref('FileSystemDirectoryHandle')}}.
- {{domxref("FileSystemFileHandle")}}
  - : Cung cấp handle cho mục nhập hệ thống tệp.
- {{domxref("FileSystemDirectoryHandle")}}
  - : Cung cấp handle cho thư mục hệ thống tệp.
- {{domxref("FileSystemObserver")}} {{experimental_inline}}
  - : Cung cấp cơ chế để quan sát các thay đổi đối với các tệp hoặc thư mục được chọn.
- {{domxref("FileSystemSyncAccessHandle")}}
  - : Cung cấp handle đồng bộ cho mục nhập hệ thống tệp, hoạt động tại chỗ trên một tệp duy nhất trên đĩa. Tính chất đồng bộ của việc đọc và ghi tệp cho phép hiệu suất cao hơn cho các phương thức quan trọng trong các ngữ cảnh mà các thao tác không đồng bộ có chi phí cao, ví dụ [WebAssembly](/en-US/docs/WebAssembly). Lớp này chỉ có thể truy cập bên trong [Web Workers](/en-US/docs/Web/API/Web_Workers_API) chuyên dụng cho các tệp trong [hệ thống tệp riêng tư nguồn gốc](#origin_private_file_system).
- {{domxref("FileSystemWritableFileStream")}}
  - : Đối tượng {{domxref('WritableStream')}} với các phương thức tiện ích bổ sung, hoạt động trên một tệp duy nhất trên đĩa.

### Phần mở rộng cho các giao diện khác

- {{domxref("Window.showDirectoryPicker()")}}
  - : Hiển thị bộ chọn thư mục cho phép người dùng chọn thư mục.
- {{domxref("Window.showOpenFilePicker()")}}
  - : Hiển thị bộ chọn tệp cho phép người dùng chọn một tệp hoặc nhiều tệp.
- {{domxref("Window.showSaveFilePicker()")}}
  - : Hiển thị bộ chọn tệp cho phép người dùng lưu tệp.
- {{domxref("DataTransferItem.getAsFileSystemHandle()")}}
  - : Trả về {{jsxref('Promise')}} giải quyết với {{domxref('FileSystemFileHandle')}} nếu mục kéo là tệp, hoặc giải quyết với {{domxref('FileSystemDirectoryHandle')}} nếu mục kéo là thư mục.
- {{domxref("StorageManager.getDirectory()")}}
  - : Được sử dụng để lấy tham chiếu đến đối tượng {{domxref("FileSystemDirectoryHandle")}} cho phép truy cập vào thư mục và nội dung của nó, được lưu trữ trong [hệ thống tệp riêng tư nguồn gốc](/en-US/docs/Web/API/File_System_API/Origin_private_file_system). Trả về {{jsxref('Promise')}} giải quyết với đối tượng {{domxref("FileSystemDirectoryHandle")}}.

## Ví dụ

### Truy cập tệp

Mã dưới đây cho phép người dùng chọn tệp từ bộ chọn tệp.

```js
async function getFile() {
  // Mở bộ chọn tệp và giải cấu trúc kết quả handle đầu tiên
  const [fileHandle] = await window.showOpenFilePicker();
  const file = await fileHandle.getFile();
  return file;
}
```

Hàm không đồng bộ sau hiển thị bộ chọn tệp và khi tệp được chọn, sử dụng phương thức `getFile()` để lấy nội dung.

```js
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

async function getTheFile() {
  // Mở bộ chọn tệp và giải cấu trúc kết quả handle đầu tiên
  const [fileHandle] = await window.showOpenFilePicker(pickerOpts);

  // lấy nội dung tệp
  const fileData = await fileHandle.getFile();
}
```

### Truy cập thư mục

Ví dụ sau trả về handle thư mục với tên được chỉ định. Nếu thư mục không tồn tại, nó sẽ được tạo.

```js
const dirName = "directoryToGetName";

// assuming we have a directory handle: 'currentDirHandle'
const subDir = await currentDirHandle.getDirectoryHandle(dirName, {
  create: true,
});
```

Hàm không đồng bộ sau sử dụng `resolve()` để tìm đường dẫn đến tệp đã chọn, tương đối với handle thư mục được chỉ định.

```js
async function returnPathDirectories(directoryHandle) {
  // Lấy handle tệp bằng cách hiển thị bộ chọn tệp:
  const [handle] = await self.showOpenFilePicker();
  if (!handle) {
    // Người dùng đã hủy, hoặc không thể mở tệp.
    return;
  }

  // Kiểm tra xem handle có tồn tại bên trong handle thư mục của chúng ta không
  const relativePaths = await directoryHandle.resolve(handle);

  if (relativePaths === null) {
    // Không nằm bên trong handle thư mục
  } else {
    // relativePaths là một mảng tên, cung cấp đường dẫn tương đối

    for (const name of relativePaths) {
      // ghi nhật ký từng mục
      console.log(name);
    }
  }
}
```

### Ghi vào tệp

Hàm không đồng bộ sau mở bộ chọn lưu tệp, trả về {{domxref('FileSystemFileHandle')}} khi tệp được chọn. Sau đó một luồng có thể ghi được tạo bằng phương thức {{domxref('FileSystemFileHandle.createWritable()')}}.

Một {{domxref('Blob')}} do người dùng xác định sau đó được ghi vào luồng, sau đó luồng được đóng.

```js
async function saveFile() {
  // tạo handle mới
  const newHandle = await window.showSaveFilePicker();

  // tạo FileSystemWritableFileStream để ghi vào
  const writableStream = await newHandle.createWritable();

  // ghi tệp của chúng ta
  await writableStream.write(imgBlob);

  // đóng tệp và ghi nội dung vào đĩa.
  await writableStream.close();
}
```

Sau đây hiển thị các ví dụ khác nhau về các tùy chọn có thể được truyền vào phương thức `write()`.

```js
// chỉ truyền dữ liệu vào (không có tùy chọn)
writableStream.write(data);

// ghi dữ liệu vào luồng từ vị trí đã xác định
writableStream.write({ type: "write", position, data });

// cập nhật độ lệch con trỏ tệp hiện tại sang vị trí được chỉ định
writableStream.write({ type: "seek", position });

// thay đổi kích thước tệp thành size byte
writableStream.write({ type: "truncate", size });
```

### Đọc và ghi tệp đồng bộ trong OPFS

Ví dụ này đọc và ghi tệp đồng bộ vào [hệ thống tệp riêng tư nguồn gốc](#origin_private_file_system).

Hàm xử lý sự kiện không đồng bộ sau được chứa bên trong Web Worker. Khi nhận được thông báo từ luồng chính, nó:

- Tạo handle truy cập tệp đồng bộ.
- Lấy kích thước tệp và tạo {{jsxref("ArrayBuffer")}} để chứa nó.
- Đọc nội dung tệp vào bộ đệm.
- Mã hóa thông báo và ghi nó vào cuối tệp.
- Lưu các thay đổi vào đĩa và đóng handle truy cập.

```js
onmessage = async (e) => {
  // lấy thông báo được gửi đến worker từ script chính
  const message = e.data;

  // Lấy handle cho tệp nháp trong OPFS
  const root = await navigator.storage.getDirectory();
  const draftHandle = await root.getFileHandle("draft.txt", { create: true });
  // Lấy handle truy cập đồng bộ
  const accessHandle = await draftHandle.createSyncAccessHandle();

  // Lấy kích thước của tệp.
  const fileSize = accessHandle.getSize();
  // Đọc nội dung tệp vào bộ đệm.
  const buffer = new DataView(new ArrayBuffer(fileSize));
  const readBuffer = accessHandle.read(buffer, { at: 0 });

  // Ghi thông báo vào cuối tệp.
  const encoder = new TextEncoder();
  const encodedMessage = encoder.encode(message);
  const writeBuffer = accessHandle.write(encodedMessage, { at: readBuffer });

  // Lưu thay đổi vào đĩa.
  accessHandle.flush();

  // Luôn đóng FileSystemSyncAccessHandle khi xong.
  accessHandle.close();
};
```

> [!NOTE]
> Trong các phiên bản trước của spec, {{domxref("FileSystemSyncAccessHandle.close()", "close()")}}, {{domxref("FileSystemSyncAccessHandle.flush()", "flush()")}}, {{domxref("FileSystemSyncAccessHandle.getSize()", "getSize()")}}, và {{domxref("FileSystemSyncAccessHandle.truncate()", "truncate()")}} được chỉ định không phù hợp dưới dạng các phương thức không đồng bộ. Điều này đã được [sửa đổi](https://github.com/whatwg/fs/issues/7), nhưng một số trình duyệt vẫn hỗ trợ các phiên bản không đồng bộ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File System Access API: đơn giản hóa quyền truy cập vào tệp cục bộ](https://developer.chrome.com/docs/capabilities/web-apis/file-system-access)
- [Hệ thống tệp riêng tư nguồn gốc](https://web.dev/articles/origin-private-file-system)
