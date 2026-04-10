---
title: "FileSystemFileHandle: phương thức createWritable()"
short-title: createWritable()
slug: Web/API/FileSystemFileHandle/createWritable
page-type: web-api-instance-method
browser-compat: api.FileSystemFileHandle.createWritable
---

{{securecontext_header}}{{APIRef("File System API")}}{{AvailableInWorkers}}

Phương thức **`createWritable()`** của giao diện {{domxref("FileSystemFileHandle")}} tạo ra một {{domxref('FileSystemWritableFileStream')}} có thể dùng để ghi vào một tệp. Phương thức này trả về một {{jsxref('Promise')}} sẽ được resolve thành stream vừa tạo.

Bất kỳ thay đổi nào được thực hiện qua stream sẽ chưa được phản ánh vào tệp do file handle biểu diễn cho đến khi stream được đóng.
Thông thường việc này được triển khai bằng cách ghi dữ liệu vào một tệp tạm, rồi chỉ thay thế tệp do file handle biểu diễn bằng tệp tạm khi writable file stream đã được đóng.

## Cú pháp

```js-nolint
createWritable()
createWritable(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một object với các thuộc tính sau:
    - `keepExistingData` {{optional_inline}}
      - : Một {{jsxref('Boolean')}}. Mặc định là `false`.
        Khi đặt thành `true` nếu tệp đã tồn tại, nội dung tệp hiện có sẽ được sao chép vào tệp tạm trước khi bắt đầu ghi.
        Nếu không, tệp tạm sẽ bắt đầu trống.
    - `mode` {{optional_inline}} {{non-standard_inline}}
      - : Một chuỗi chỉ định chế độ khóa cho writable file stream. Giá trị mặc định là `"siloed"`.
        Các giá trị có thể là:
        - `"exclusive"`
          - : Chỉ có thể mở một writer `FileSystemWritableFileStream`. Nếu cố mở các writer tiếp theo trước khi writer đầu tiên đóng, một ngoại lệ `NoModificationAllowedError` sẽ được ném ra.
        - `"siloed"`
          - : Có thể mở nhiều writer `FileSystemWritableFileStream` cùng lúc, mỗi writer có một swap file riêng, ví dụ khi dùng cùng một ứng dụng trong nhiều tab. Writer được mở sau cùng sẽ có dữ liệu được ghi, vì dữ liệu được flush khi mỗi writer được đóng.

### Giá trị trả về

Một {{jsxref('Promise')}} sẽ được resolve thành một đối tượng {{domxref('FileSystemWritableFileStream')}}.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref('PermissionStatus.state')}} của handle không phải là `'granted'` ở chế độ `readwrite`.
- `NotFoundError` {{domxref("DOMException")}}
  - : Được ném ra nếu mục hiện tại không được tìm thấy.
- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu trình duyệt không thể giành được khóa trên tệp gắn với file handle. Điều này có thể xảy ra khi `mode` được đặt thành `exclusive` và cố mở nhiều writer cùng lúc.
- `AbortError` {{domxref("DOMException")}}
  - : Được ném ra nếu các lần quét malware và kiểm tra safe-browsing do cài đặt của hệ thống thực hiện thất bại.

## Ví dụ

### Cách dùng cơ bản

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

### Cách dùng mở rộng với tùy chọn

Ví dụ [`createWritable()` mode test](https://mdn.github.io/dom-examples/file-system-api/createwritable-mode/) của chúng tôi (xem [mã nguồn](https://github.com/mdn/dom-examples/tree/main/file-system-api/createwritable-mode)) cung cấp một phần tử {{htmlelement("button")}} để chọn tệp cần ghi, một trường {{htmlelement("input")}} kiểu text để nhập văn bản sẽ ghi vào tệp, và một `<button>` thứ hai để ghi văn bản vào tệp.

Trong bản demo ở trên, hãy thử chọn một tệp văn bản trên hệ thống tệp của bạn, nhập một đoạn văn bản vào trường input, rồi ghi văn bản đó vào tệp. Mở tệp trên hệ thống của bạn để kiểm tra việc ghi có thành công hay không.

Ngoài ra, hãy thử mở trang trong hai tab trình duyệt cùng lúc. Chọn một tệp để ghi ở tab đầu tiên, rồi ngay lập tức thử chọn cùng tệp đó ở tab thứ hai. Bạn sẽ nhận được một thông báo lỗi vì chúng ta đặt `mode: "exclusive"` trong lời gọi `createWritable()`.

Bên dưới, chúng ta sẽ xem mã.

#### HTML

Hai phần tử {{htmlelement("button")}} và trường {{htmlelement("input")}} kiểu text trông như sau:

```html
<ol>
  <li>Chọn một tệp để ghi: <button class="select">Select file</button></li>
  <li>
    <label for="file-text">Nhập văn bản để ghi vào tệp:</label>
    <input type="text" id="file-text" name="file-text" disabled />
  </li>
  <li>
    Ghi văn bản của bạn vào tệp:
    <button class="write" disabled>Write text</button>
  </li>
</ol>
```

Trường nhập văn bản và nút ghi văn bản ban đầu được đặt là vô hiệu hóa bằng thuộc tính [`disabled`](/en-US/docs/Web/HTML/Reference/Attributes/disabled) - chúng không nên được dùng cho đến khi người dùng đã chọn tệp để ghi.

```css hidden
li {
  margin-bottom: 10px;
}
```

#### JavaScript

Trước hết, chúng ta lấy tham chiếu tới nút chọn tệp, nút ghi văn bản và trường nhập text. Chúng ta cũng khai báo một biến toàn cục `writableStream`, biến này sẽ lưu tham chiếu tới writable stream để ghi văn bản vào tệp, sau khi được tạo. Ban đầu nó được đặt là `null`.

```js
const selectBtn = document.querySelector(".select");
const writeBtn = document.querySelector(".write");
const fileText = document.querySelector("#file-text");

let writableStream = null;
```

Tiếp theo, chúng ta tạo một hàm bất đồng bộ tên `selectFile()`, và sẽ gọi nó khi nút chọn được bấm. Hàm này dùng phương thức {{domxref("Window.showSaveFilePicker()")}} để hiển thị hộp thoại chọn tệp cho người dùng và tạo một file handle cho tệp họ chọn. Trên file handle đó, chúng ta gọi phương thức `createWritable()` để tạo một stream dùng để ghi văn bản vào tệp đã chọn. Nếu lời gọi thất bại, chúng ta ghi lỗi ra console.

Chúng ta truyền cho `createWritable()` một object tùy chọn chứa các thiết lập sau:

- `keepExistingData: true`: nếu tệp đã chọn đã tồn tại, dữ liệu bên trong sẽ được sao chép vào tệp tạm trước khi việc ghi bắt đầu.
- `mode: "exclusive"`: chỉ ra rằng chỉ một writer duy nhất có thể mở trên file handle tại cùng thời điểm. Nếu người dùng thứ hai mở ví dụ này và cố chọn một tệp, họ sẽ nhận được lỗi.

Cuối cùng, chúng ta bật trường nhập và nút ghi văn bản vì chúng cần cho bước tiếp theo, và vô hiệu hóa nút chọn tệp (vì lúc này chưa cần dùng đến).

```js
async function selectFile() {
  // Tạo một handle mới
  const handle = await window.showSaveFilePicker();

  // Tạo một FileSystemWritableFileStream để ghi
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

  // Bật trường text và nút ghi, vô hiệu hóa nút chọn
  fileText.disabled = false;
  writeBtn.disabled = false;
  selectBtn.disabled = true;
}
```

Hàm tiếp theo, `writeFile()`, ghi văn bản nhập trong trường input vào tệp đã chọn bằng {{domxref("FileSystemWritableFileStream.write()")}}, rồi xóa nội dung trường nhập. Sau đó chúng ta đóng writable stream bằng {{domxref("WritableStream.close()")}}, và đặt lại demo để có thể chạy lại - trạng thái `disabled` của các điều khiển được trả về như ban đầu, và biến `writableStream` được đặt lại `null`.

```js
async function writeFile() {
  // Ghi văn bản vào tệp và xóa trường nhập
  await writableStream.write(fileText.value);
  fileText.value = "";

  // Đóng tệp và ghi nội dung xuống đĩa.
  await writableStream.close();

  // Vô hiệu hóa trường text và nút ghi, bật nút chọn
  fileText.disabled = true;
  writeBtn.disabled = true;
  selectBtn.disabled = false;

  // Đặt writableStream trở lại null
  writableStream = null;
}
```

Để cho demo chạy, chúng ta gắn các trình nghe sự kiện vào các nút để hàm tương ứng được gọi khi mỗi nút được bấm.

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
