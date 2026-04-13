---
title: "FileSystemFileHandle: phương thức createWritable()"
short-title: createWritable()
slug: Web/API/FileSystemFileHandle/createWritable
page-type: web-api-instance-method
browser-compat: api.FileSystemFileHandle.createWritable
---

{{securecontext_header}}{{APIRef("File System API")}}{{AvailableInWorkers}}

Phương thức **`createWritable()`** của giao diện {{domxref("FileSystemFileHandle")}} tạo ra một {{domxref('FileSystemWritableFileStream')}} có thể dùng để ghi vào file. Phương thức này trả về một {{jsxref('Promise')}} được thực thi thành stream vừa được tạo.

Bất kỳ thay đổi nào được thực hiện thông qua stream sẽ không phản ánh vào file được đại diện bởi file handle cho đến khi stream được đóng. Thông thường, điều này được triển khai bằng cách ghi dữ liệu vào một file tạm thời, và chỉ thay thế file do file handle đại diện bằng file tạm thời khi writable file stream được đóng.

## Cú pháp

```js-nolint
createWritable()
createWritable(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng có các thuộc tính sau:
    - `keepExistingData` {{optional_inline}}
      - : Một {{jsxref('Boolean')}}. Mặc định là `false`.
        Khi đặt thành `true` và file đã tồn tại, nội dung file hiện có sẽ được sao chép vào file tạm thời trước khi bắt đầu ghi.
        Nếu không, file tạm thời sẽ bắt đầu rỗng.
    - `mode` {{optional_inline}} {{non-standard_inline}}
      - : Một chuỗi chỉ định chế độ khóa cho writable file stream. Giá trị mặc định là `"siloed"`.
        Các giá trị có thể có là:
        - `"exclusive"`
          - : Chỉ có một writer `FileSystemWritableFileStream` có thể mở. Nếu cố mở writer tiếp theo trước khi writer đầu tiên được đóng, một ngoại lệ `NoModificationAllowedError` sẽ được ném ra.
        - `"siloed"`
          - : Có thể mở nhiều writer `FileSystemWritableFileStream` cùng lúc, mỗi writer có swap file riêng, ví dụ khi dùng cùng một ứng dụng trong nhiều tab. Writer được mở cuối cùng sẽ ghi dữ liệu của nó, vì dữ liệu được xả xuống khi mỗi writer được đóng.

### Giá trị trả về

Một {{jsxref('Promise')}} được thực thi thành một đối tượng {{domxref('FileSystemWritableFileStream')}}.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu trạng thái {{domxref('PermissionStatus.state')}} của handle không phải là `'granted'` ở chế độ `readwrite`.
- `NotFoundError` {{domxref("DOMException")}}
  - : Được ném ra nếu mục hiện tại không được tìm thấy.
- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu trình duyệt không thể lấy khóa trên file liên kết với file handle. Điều này có thể xảy ra vì `mode` được đặt là `exclusive` và có nỗ lực mở nhiều writer cùng lúc.
- `AbortError` {{domxref("DOMException")}}
  - : Được ném ra nếu các kiểm tra phần mềm độc hại và an toàn duyệt web do cài đặt triển khai xác định thất bại.

## Ví dụ

### Cách dùng cơ bản

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

### Cách dùng mở rộng với tùy chọn

Ví dụ [`createWritable()` mode test](https://mdn.github.io/dom-examples/file-system-api/createwritable-mode/) của chúng tôi (xem [mã nguồn](https://github.com/mdn/dom-examples/tree/main/file-system-api/createwritable-mode)) cung cấp một trường {{htmlelement("button")}} để chọn file cần ghi, một trường văn bản {{htmlelement("input")}} để nhập nội dung cần ghi vào file, và một nút `<button>` thứ hai để ghi văn bản vào file.

Trong demo ở trên, hãy thử chọn một file văn bản trong hệ thống tệp của bạn (hoặc nhập tên file mới), nhập một đoạn văn bản vào trường đầu vào và ghi văn bản đó vào file. Mở file trong hệ thống tệp của bạn để kiểm tra việc ghi có thành công hay không.

Hãy thử mở trang trong hai tab trình duyệt cùng lúc. Chọn một file để ghi trong tab đầu tiên, rồi ngay lập tức thử chọn cùng file đó trong tab thứ hai. Bạn sẽ nhận được thông báo lỗi vì chúng ta đã đặt `mode: "exclusive"` trong lời gọi `createWritable()`.

Phía dưới, chúng ta sẽ xem xét mã nguồn.

#### HTML

Hai phần tử {{htmlelement("button")}} và trường văn bản {{htmlelement("input")}} trông như sau:

```html
<ol>
  <li>
    Select a file to write to: <button class="select">Select file</button>
  </li>
  <li>
    <label for="file-text">Enter text to write to the file:</label>
    <input type="text" id="file-text" name="file-text" disabled />
  </li>
  <li>
    Write your text to the file:
    <button class="write" disabled>Write text</button>
  </li>
</ol>
```

Trường nhập văn bản và nút ghi văn bản ban đầu được đặt `disabled` thông qua thuộc tính [`disabled`](/en-US/docs/Web/HTML/Reference/Attributes/disabled) — chúng không nên được dùng cho đến khi người dùng đã chọn một file để ghi.

```css hidden
li {
  margin-bottom: 10px;
}
```

#### JavaScript

Trước tiên, chúng ta lấy tham chiếu đến nút chọn file, nút ghi văn bản, và trường nhập văn bản. Chúng ta cũng khai báo một biến toàn cục `writableStream`, biến này sẽ lưu tham chiếu tới writable stream dùng để ghi văn bản vào file sau khi được tạo. Ban đầu ta đặt nó là `null`.

```js
const selectBtn = document.querySelector(".select");
const writeBtn = document.querySelector(".write");
const fileText = document.querySelector("#file-text");

let writableStream = null;
```

Tiếp theo, chúng ta tạo một hàm bất đồng bộ tên `selectFile()`, sẽ được gọi khi nút chọn được nhấn. Hàm này dùng phương thức {{domxref("Window.showSaveFilePicker()")}} để hiển thị hộp thoại chọn file cho người dùng và tạo một file handle cho file họ chọn. Trên handle đó, chúng ta gọi phương thức `createWritable()` để tạo stream ghi văn bản vào file đã chọn. Nếu lời gọi thất bại, chúng ta ghi lỗi ra console.

Chúng ta truyền cho `createWritable()` một object tùy chọn chứa các thiết lập sau:

- `keepExistingData: true`: Nếu file đã chọn đã tồn tại, dữ liệu bên trong nó được sao chép sang file tạm thời trước khi bắt đầu ghi.
- `mode: "exclusive"`: Chỉ định rằng chỉ một writer có thể mở trên file handle tại cùng một thời điểm. Nếu một người dùng khác mở ví dụ này và cố chọn file, họ sẽ nhận được lỗi.

Cuối cùng, chúng ta bật trường nhập và nút ghi, vì chúng cần cho bước tiếp theo, và tắt nút chọn file (nó hiện không cần nữa).

```js
async function selectFile() {
  // Tạo một handle mới
  const handle = await window.showSaveFilePicker();

  // Tạo một FileSystemWritableFileStream để ghi vào
  try {
    writableStream = await handle.createWritable({
      keepExistingData: true,
      mode: "exclusive",
    });
  } catch (e) {
    if (e.name === "NoModificationAllowedError") {
      console.log(
        `You can't access that file right now; someone else is trying to modify it. Try again later.`,
      );
    } else {
      console.log(e.message);
    }
  }

  // Bật trường nhập và nút ghi, tắt nút chọn file
  fileText.disabled = false;
  writeBtn.disabled = false;
  selectBtn.disabled = true;
}
```

Hàm tiếp theo, `writeFile()`, ghi văn bản được nhập vào trường input vào file đã chọn bằng {{domxref("FileSystemWritableFileStream.write()")}}, rồi xóa trống trường nhập. Sau đó, chúng ta đóng writable stream bằng {{domxref("WritableStream.close()")}}, và đặt lại demo để có thể chạy lại — trạng thái `disabled` của các điều khiển được bật/tắt trở về như ban đầu, và biến `writableStream` được đặt lại `null`.

```js
async function writeFile() {
  // Ghi văn bản vào file của chúng ta rồi xóa trường văn bản
  await writableStream.write(fileText.value);
  fileText.value = "";

  // Đóng file và ghi nội dung ra đĩa.
  await writableStream.close();

  // Tắt trường nhập và nút ghi, bật nút chọn file
  fileText.disabled = true;
  writeBtn.disabled = true;
  selectBtn.disabled = false;

  // Đặt writableStream trở lại null
  writableStream = null;
}
```

Để chạy demo, chúng ta gán trình nghe sự kiện cho các nút để hàm tương ứng được chạy khi mỗi nút được nhấn.

```js
selectBtn.addEventListener("click", selectFile);
writeBtn.addEventListener("click", writeFile);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File System API](/en-US/docs/Web/API/File_System_API)
- [The File System Access API: simplifying access to local files](https://developer.chrome.com/docs/capabilities/web-apis/file-system-access)
