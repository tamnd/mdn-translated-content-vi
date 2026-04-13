---
title: Sử dụng tệp từ ứng dụng web
slug: Web/API/File_API/Using_files_from_web_applications
page-type: guide
---

{{DefaultAPISidebar("File API")}}{{AvailableInWorkers}}

Sử dụng File API, nội dung web có thể yêu cầu người dùng chọn tệp cục bộ và sau đó đọc nội dung của các tệp đó. Việc chọn này có thể được thực hiện bằng cách sử dụng phần tử HTML `{{HTMLElement("input/file", '&lt;input type="file"&gt;')}}` hoặc bằng kéo và thả.

## Truy cập tệp được chọn

Xem xét HTML này:

```html
<input type="file" id="input" multiple />
```

File API cho phép truy cập {{DOMxRef("FileList")}} chứa các đối tượng {{DOMxRef("File")}} đại diện cho các tệp được người dùng chọn.

Thuộc tính `multiple` trên phần tử `input` cho phép người dùng chọn nhiều tệp.

Truy cập tệp được chọn đầu tiên bằng bộ chọn DOM thông thường:

```js
const selectedFile = document.getElementById("input").files[0];
```

### Truy cập tệp được chọn trên sự kiện change

Cũng có thể (nhưng không bắt buộc) truy cập {{DOMxRef("FileList")}} thông qua sự kiện `change`. Bạn cần sử dụng {{DOMxRef("EventTarget.addEventListener()")}} để thêm trình lắng nghe sự kiện `change`, như sau:

```js
const inputElement = document.getElementById("input");
inputElement.addEventListener("change", handleFiles);
function handleFiles() {
  const fileList = this.files; /* now you can work with the file list */
}
```

## Lấy thông tin về tệp được chọn

Đối tượng {{DOMxRef("FileList")}} được cung cấp bởi DOM liệt kê tất cả các tệp được người dùng chọn, mỗi tệp được chỉ định là đối tượng {{DOMxRef("File")}}. Bạn có thể xác định có bao nhiêu tệp người dùng đã chọn bằng cách kiểm tra giá trị của thuộc tính `length` của danh sách tệp:

```js
const numFiles = fileList.length;
```

Các đối tượng {{DOMxRef("File")}} riêng lẻ có thể được truy xuất bằng cách truy cập danh sách dưới dạng mảng.

Có ba thuộc tính được cung cấp bởi đối tượng {{DOMxRef("File")}} chứa thông tin hữu ích về tệp.

- `name`
  - : Tên tệp dưới dạng chuỗi chỉ đọc. Đây chỉ là tên tệp, không bao gồm bất kỳ thông tin đường dẫn nào.
- `size`
  - : Kích thước của tệp tính bằng byte dưới dạng số nguyên 64-bit chỉ đọc.
- `type`
  - : Loại MIME của tệp dưới dạng chuỗi chỉ đọc hoặc `""` nếu không thể xác định loại.

### Ví dụ: Hiển thị kích thước tệp

Ví dụ sau đây cho thấy việc sử dụng thuộc tính `size`:

```html
<form name="uploadForm">
  <div>
    <input id="uploadInput" type="file" multiple />
    <label for="fileNum">Selected files:</label>
    <output id="fileNum">0</output>;
    <label for="fileSize">Total size:</label>
    <output id="fileSize">0</output>
  </div>
  <div><input type="submit" value="Send file" /></div>
</form>
```

```js
const uploadInput = document.getElementById("uploadInput");
uploadInput.addEventListener("change", () => {
  // Calculate total size
  let numberOfBytes = 0;
  for (const file of uploadInput.files) {
    numberOfBytes += file.size;
  }

  // Approximate to the closest prefixed unit
  const units = ["B", "KiB", "MiB", "GiB", "TiB", "PiB", "EiB", "ZiB", "YiB"];
  const exponent = Math.min(
    Math.floor(Math.log(numberOfBytes) / Math.log(1024)),
    units.length - 1,
  );
  const approx = numberOfBytes / 1024 ** exponent;
  const output =
    exponent === 0
      ? `${numberOfBytes} bytes`
      : `${approx.toFixed(3)} ${units[exponent]} (${numberOfBytes} bytes)`;

  document.getElementById("fileNum").textContent = uploadInput.files.length;
  document.getElementById("fileSize").textContent = output;
});
```

## Sử dụng phần tử input tệp ẩn bằng phương thức click()

Bạn có thể ẩn phần tử {{HTMLElement("input")}} tệp trông không đẹp và trình bày giao diện của riêng bạn để mở trình chọn tệp và hiển thị tệp hoặc các tệp người dùng đã chọn. Bạn có thể làm điều này bằng cách tạo kiểu cho phần tử input với `display:none` và gọi phương thức {{DOMxRef("HTMLElement.click","click()")}} trên phần tử {{HTMLElement("input")}}.

Xem xét HTML này:

```html
<input type="file" id="fileElem" multiple accept="image/*" />
<button id="fileSelect" type="button">Select some files</button>
```

```css
#fileElem {
  display: none;
}
```

Mã xử lý sự kiện `click` có thể trông như sau:

```js
const fileSelect = document.getElementById("fileSelect");
const fileElem = document.getElementById("fileElem");

fileSelect.addEventListener("click", (e) => {
  if (fileElem) {
    fileElem.click();
  }
});
```

Bạn có thể tạo kiểu cho {{HTMLElement("button")}} theo cách bạn muốn.

## Sử dụng phần tử label để kích hoạt phần tử input tệp ẩn

Để cho phép mở trình chọn tệp mà không cần dùng JavaScript (phương thức click()), có thể sử dụng phần tử {{HTMLElement("label")}}. Lưu ý rằng trong trường hợp này phần tử input không được ẩn bằng `display: none` (cũng không phải `visibility: hidden`), nếu không nhãn sẽ không thể truy cập bằng bàn phím. Thay vào đó hãy sử dụng [kỹ thuật visually-hidden](https://www.a11yproject.com/posts/how-to-hide-content/).

Xem xét HTML này:

```html
<input
  type="file"
  id="fileElem"
  multiple
  accept="image/*"
  class="visually-hidden" />
<label for="fileElem">Select some files</label>
```

và CSS này:

```css
.visually-hidden {
  clip: rect(0 0 0 0);
  clip-path: inset(50%);
  height: 1px;
  overflow: hidden;
  position: absolute;
  white-space: nowrap;
  width: 1px;
}

input.visually-hidden:is(:focus, :focus-within) + label {
  outline: thin dotted;
}
```

Không cần thêm mã JavaScript để gọi `fileElem.click()`. Ngoài ra, trong trường hợp này bạn có thể tạo kiểu cho phần tử nhãn theo cách bạn muốn. Bạn cần cung cấp dấu hiệu trực quan cho trạng thái focus của trường input ẩn trên nhãn của nó, có thể là đường viền như hiển thị ở trên, hoặc màu nền hoặc box-shadow.

## Chọn tệp bằng kéo và thả

Bạn cũng có thể để người dùng kéo và thả tệp vào ứng dụng web của bạn.

Bước đầu tiên là thiết lập vùng thả. Chính xác phần nào trong nội dung của bạn sẽ chấp nhận thả có thể thay đổi tùy theo thiết kế ứng dụng của bạn, nhưng việc làm cho một phần tử nhận sự kiện thả rất dễ dàng:

```js
let dropbox;

dropbox = document.getElementById("dropbox");
dropbox.addEventListener("dragenter", dragenter);
dropbox.addEventListener("dragover", dragover);
dropbox.addEventListener("drop", drop);
```

Trong ví dụ này, chúng ta đang biến phần tử có ID `dropbox` thành vùng thả. Điều này được thực hiện bằng cách thêm trình lắng nghe cho các sự kiện {{domxref("HTMLElement/dragenter_event", "dragenter")}}, {{domxref("HTMLElement/dragover_event", "dragover")}} và {{domxref("HTMLElement/drop_event", "drop")}}.

Chúng ta thực sự không cần làm gì với các sự kiện `dragenter` và `dragover` trong trường hợp của chúng ta, vì vậy các hàm này đều đơn giản. Chúng chỉ dừng lan truyền sự kiện và ngăn hành động mặc định xảy ra:

```js
function dragenter(e) {
  e.stopPropagation();
  e.preventDefault();
}

function dragover(e) {
  e.stopPropagation();
  e.preventDefault();
}
```

Điều kỳ diệu thực sự xảy ra trong hàm `drop()`:

```js
function drop(e) {
  e.stopPropagation();
  e.preventDefault();

  const dt = e.dataTransfer;
  const files = dt.files;

  handleFiles(files);
}
```

Ở đây, chúng ta lấy trường `dataTransfer` từ sự kiện, lấy danh sách tệp từ đó, sau đó truyền cho `handleFiles()`. Từ điểm này trở đi, xử lý tệp là như nhau cho dù người dùng sử dụng phần tử `input` hay kéo và thả.

## Ví dụ: Hiển thị hình thu nhỏ của ảnh do người dùng chọn

Giả sử bạn đang phát triển trang web chia sẻ ảnh và muốn sử dụng HTML để hiển thị bản xem trước thu nhỏ của ảnh trước khi người dùng thực sự tải chúng lên. Bạn có thể thiết lập phần tử input hoặc vùng thả như đã thảo luận trước đó và để chúng gọi hàm như hàm `handleFiles()` bên dưới.

```js
function handleFiles(files) {
  for (const file of files) {
    if (!file.type.startsWith("image/")) {
      continue;
    }

    const img = document.createElement("img");
    img.classList.add("obj");
    img.file = file;
    preview.appendChild(img); // Assuming that "preview" is the div output where the content will be displayed.

    const reader = new FileReader();
    reader.onload = (e) => {
      img.src = e.target.result;
    };
    reader.readAsDataURL(file);
  }
}
```

Ở đây vòng lặp xử lý các tệp do người dùng chọn xem xét thuộc tính `type` của mỗi tệp để xem loại MIME của nó có bắt đầu bằng `image/` không. Đối với mỗi tệp là hình ảnh, chúng ta tạo phần tử `img` mới. CSS có thể được sử dụng để thiết lập các đường viền hoặc bóng đẹp và để chỉ định kích thước của hình ảnh, vì vậy điều đó không cần phải làm ở đây.

Mỗi hình ảnh có lớp CSS `obj` được thêm vào, giúp dễ dàng tìm thấy trong cây DOM. Chúng ta cũng thêm thuộc tính `file` vào mỗi hình ảnh chỉ định {{DOMxRef("File")}} cho hình ảnh; điều này sẽ cho phép chúng ta tải các hình ảnh để tải lên thực tế sau này. Chúng ta sử dụng {{DOMxRef("Node.appendChild()")}} để thêm hình thu nhỏ mới vào vùng xem trước của tài liệu.

Tiếp theo, chúng ta thiết lập {{DOMxRef("FileReader")}} để xử lý tải ảnh bất đồng bộ và đính kèm vào phần tử `img`. Sau khi tạo đối tượng `FileReader` mới, chúng ta thiết lập hàm `onload` của nó và sau đó gọi `readAsDataURL()` để bắt đầu thao tác đọc ở chạy nền. Khi toàn bộ nội dung của tệp ảnh được tải, chúng được chuyển đổi thành URL `data:` được truyền cho callback `onload`. Triển khai của chúng ta đặt thuộc tính `src` của phần tử `img` thành ảnh đã tải dẫn đến việc ảnh xuất hiện trong hình thu nhỏ trên màn hình người dùng.

## Sử dụng object URL

Các phương thức DOM {{DOMxref("URL.createObjectURL_static", "URL.createObjectURL()")}} và {{DOMxref("URL.revokeObjectURL_static", "URL.revokeObjectURL()")}} cho phép bạn tạo chuỗi URL đơn giản có thể được sử dụng để tham chiếu đến bất kỳ dữ liệu nào có thể được tham chiếu bằng đối tượng DOM {{DOMxRef("File")}}, bao gồm các tệp cục bộ trên máy tính của người dùng.

Khi bạn có đối tượng {{DOMxRef("File")}} bạn muốn tham chiếu bằng URL từ HTML, bạn có thể tạo object URL cho nó như sau:

```js
const objectURL = window.URL.createObjectURL(fileObj);
```

Object URL là chuỗi xác định đối tượng {{DOMxRef("File")}}. Mỗi lần bạn gọi {{DOMxref("URL.createObjectURL_static", "URL.createObjectURL()")}}, một object URL duy nhất được tạo ra ngay cả khi bạn đã tạo object URL cho tệp đó rồi. Mỗi object URL này phải được giải phóng. Mặc dù chúng được giải phóng tự động khi tài liệu bị dỡ tải, nếu trang của bạn sử dụng chúng động thì bạn nên giải phóng chúng một cách rõ ràng bằng cách gọi {{DOMxref("URL.revokeObjectURL_static", "URL.revokeObjectURL()")}}:

```js
URL.revokeObjectURL(objectURL);
```

## Ví dụ: Sử dụng object URL để hiển thị ảnh

Ví dụ này sử dụng object URL để hiển thị hình thu nhỏ ảnh. Ngoài ra, nó hiển thị thông tin tệp khác bao gồm tên và kích thước của chúng.

HTML trình bày giao diện trông như sau:

```html
<input type="file" id="fileElem" multiple accept="image/*" />
<a href="#" id="fileSelect">Select some files</a>
<div id="fileList">
  <p>No files selected!</p>
</div>
```

```css
#fileElem {
  display: none;
}
```

Phương thức `handleFiles()` như sau:

```js
const fileSelect = document.getElementById("fileSelect"),
  fileElem = document.getElementById("fileElem"),
  fileList = document.getElementById("fileList");

fileSelect.addEventListener("click", (e) => {
  if (fileElem) {
    fileElem.click();
  }
  e.preventDefault(); // prevent navigation to "#"
});

fileElem.addEventListener("change", handleFiles);

function handleFiles() {
  fileList.textContent = "";
  if (!this.files.length) {
    const p = document.createElement("p");
    p.textContent = "No files selected!";
    fileList.appendChild(p);
  } else {
    const list = document.createElement("ul");
    fileList.appendChild(list);
    for (const file of this.files) {
      const li = document.createElement("li");
      list.appendChild(li);

      const img = document.createElement("img");
      img.src = URL.createObjectURL(file);
      img.height = 60;
      li.appendChild(img);
      const info = document.createElement("span");
      info.textContent = `${file.name}: ${file.size} bytes`;
      li.appendChild(info);
    }
  }
}
```

Đây bắt đầu bằng cách lấy URL của {{HTMLElement("div")}} với ID `fileList`. Đây là khối mà chúng ta sẽ chèn danh sách tệp, bao gồm các hình thu nhỏ.

Nếu đối tượng {{DOMxRef("FileList")}} được truyền vào `handleFiles()` trống, chúng ta đặt HTML bên trong của khối để hiển thị "No files selected!". Nếu không, chúng ta bắt đầu xây dựng danh sách tệp như sau:

1. Tạo phần tử danh sách không có thứ tự ({{HTMLElement("ul")}}) mới.
2. Phần tử danh sách mới được chèn vào khối {{HTMLElement("div")}} bằng cách gọi phương thức {{DOMxRef("Node.appendChild()")}} của nó.
3. Đối với mỗi {{DOMxRef("File")}} trong {{DOMxRef("FileList")}} được đại diện bởi `files`:
   1. Tạo phần tử mục danh sách ({{HTMLElement("li")}}) mới và chèn vào danh sách.
   2. Tạo phần tử hình ảnh ({{HTMLElement("img")}}) mới.
   3. Đặt nguồn của hình ảnh thành object URL mới đại diện cho tệp, sử dụng {{DOMxref("URL.createObjectURL_static", "URL.createObjectURL()")}} để tạo blob URL.
   4. Đặt chiều cao của hình ảnh là 60 pixel.
   5. Thêm mục danh sách mới vào danh sách.

Đây là bản demo trực tiếp của mã trên:

{{EmbedLiveSample('Example_Using_object_URLs_to_display_images', '100%', '300px')}}

Lưu ý rằng chúng ta không thu hồi object URL ngay sau khi hình ảnh được tải, vì làm như vậy sẽ khiến hình ảnh không thể sử dụng cho các tương tác của người dùng (chẳng hạn như nhấp chuột phải để lưu hình ảnh hoặc mở nó trong tab mới). Đối với các ứng dụng tồn tại lâu, bạn nên thu hồi object URL khi chúng không còn cần thiết nữa (chẳng hạn khi hình ảnh bị xóa khỏi DOM) để giải phóng bộ nhớ bằng cách gọi phương thức {{DOMxref("URL.revokeObjectURL_static", "URL.revokeObjectURL()")}} và truyền chuỗi object URL vào.

## Ví dụ: Tải lên tệp do người dùng chọn

Ví dụ này cho thấy cách để người dùng tải tệp lên (chẳng hạn như các ảnh được chọn trong ví dụ trước) lên máy chủ.

> [!NOTE]
> Thông thường nên thực hiện yêu cầu HTTP bằng [Fetch API](/en-US/docs/Web/API/Fetch_API) thay vì {{domxref("XMLHttpRequest")}}. Tuy nhiên, trong trường hợp này chúng ta muốn hiển thị cho người dùng tiến trình tải lên, và tính năng này vẫn chưa được Fetch API hỗ trợ, vì vậy ví dụ sử dụng `XMLHttpRequest`.
>
> Công việc theo dõi tiêu chuẩn hóa thông báo tiến trình sử dụng Fetch API tại <https://github.com/whatwg/fetch/issues/607>.

### Tạo các tác vụ tải lên

Tiếp tục với mã đã xây dựng hình thu nhỏ trong ví dụ trước, hãy nhớ rằng mọi hình ảnh thu nhỏ đều nằm trong lớp CSS `obj` với {{DOMxRef("File")}} tương ứng được đính kèm trong thuộc tính `file`. Điều này cho phép chúng ta chọn tất cả các hình ảnh người dùng đã chọn để tải lên bằng {{DOMxRef("Document.querySelectorAll()")}}, như sau:

```js
function sendFiles() {
  const imgs = document.querySelectorAll(".obj");

  for (const img of imgs) {
    new FileUpload(img, img.file);
  }
}
```

`document.querySelectorAll` lấy {{DOMxRef("NodeList")}} của tất cả các phần tử trong tài liệu có lớp CSS `obj`. Trong trường hợp của chúng ta, đây sẽ là tất cả các hình thu nhỏ. Khi có danh sách đó, việc duyệt qua và tạo phiên bản `FileUpload` mới cho mỗi ảnh là đơn giản. Mỗi phiên bản xử lý việc tải lên tệp tương ứng.

### Xử lý quá trình tải lên cho một tệp

Hàm `FileUpload` nhận hai đầu vào: phần tử hình ảnh và tệp từ đó đọc dữ liệu hình ảnh.

```js
function FileUpload(img, file) {
  const reader = new FileReader();
  this.ctrl = createThrobber(img);
  const xhr = new XMLHttpRequest();
  this.xhr = xhr;

  this.xhr.upload.addEventListener("progress", (e) => {
    if (e.lengthComputable) {
      const percentage = Math.round((e.loaded * 100) / e.total);
      this.ctrl.update(percentage);
    }
  });

  xhr.upload.addEventListener("load", (e) => {
    this.ctrl.update(100);
    const canvas = this.ctrl.ctx.canvas;
    canvas.parentNode.removeChild(canvas);
  });
  xhr.open(
    "POST",
    "https://demos.hacks.mozilla.org/paul/demos/resources/webservices/devnull.php",
  );
  xhr.overrideMimeType("text/plain; charset=x-user-defined-binary");
  reader.onload = (evt) => {
    xhr.send(evt.target.result);
  };
  reader.readAsBinaryString(file);
}

function createThrobber(img) {
  const throbberWidth = 64;
  const throbberHeight = 6;
  const throbber = document.createElement("canvas");
  throbber.classList.add("upload-progress");
  throbber.setAttribute("width", throbberWidth);
  throbber.setAttribute("height", throbberHeight);
  img.parentNode.appendChild(throbber);
  throbber.ctx = throbber.getContext("2d");
  throbber.ctx.fillStyle = "orange";
  throbber.update = (percent) => {
    throbber.ctx.fillRect(
      0,
      0,
      (throbberWidth * percent) / 100,
      throbberHeight,
    );
    if (percent === 100) {
      throbber.ctx.fillStyle = "green";
    }
  };
  throbber.update(0);
  return throbber;
}
```

Hàm `FileUpload()` hiển thị ở trên tạo ra một throbber, được sử dụng để hiển thị thông tin tiến trình, sau đó tạo {{DOMxRef("XMLHttpRequest")}} để xử lý tải lên dữ liệu.

Trước khi thực sự truyền dữ liệu, một số bước chuẩn bị được thực hiện:

1. Trình lắng nghe `progress` tải lên của `XMLHttpRequest` được đặt để cập nhật throbber với thông tin phần trăm mới để khi tải lên tiến triển, throbber sẽ được cập nhật dựa trên thông tin mới nhất.
2. Trình xử lý sự kiện `load` tải lên của `XMLHttpRequest` được đặt để cập nhật thông tin tiến trình throbber lên 100% để đảm bảo chỉ số tiến trình thực sự đạt 100% (trong trường hợp có sự kỳ lạ về độ chi tiết trong quá trình). Sau đó nó xóa throbber vì nó không còn cần thiết nữa. Điều này khiến throbber biến mất sau khi tải lên hoàn tất.
3. Yêu cầu tải lên tệp hình ảnh được mở bằng cách gọi phương thức `open()` của `XMLHttpRequest` để bắt đầu tạo yêu cầu POST.
4. Loại MIME cho tải lên được đặt bằng cách gọi hàm `overrideMimeType()` của `XMLHttpRequest`. Trong trường hợp này, chúng ta đang sử dụng loại MIME chung; bạn có thể cần hoặc không cần đặt loại MIME tùy thuộc vào trường hợp sử dụng của bạn.
5. Đối tượng `FileReader` được sử dụng để chuyển đổi tệp thành chuỗi nhị phân.
6. Cuối cùng, khi nội dung được tải, hàm `send()` của `XMLHttpRequest` được gọi để tải lên nội dung của tệp.

### Xử lý bất đồng bộ quá trình tải lên tệp

Ví dụ này, sử dụng PHP ở phía máy chủ và JavaScript ở phía máy khách, minh họa tải lên tệp bất đồng bộ.

```php
<?php
if (isset($_FILES["myFile"])) {
  // Example:
  move_uploaded_file($_FILES["myFile"]["tmp_name"], "uploads/" . $_FILES["myFile"]["name"]);
  exit;
}
?><!doctype html>
<html lang="en-US">
  <head>
    <meta charset="UTF-8" />
    <title>dnd binary upload</title>
  </head>
  <body>
    <div>
      <div
        id="dropzone"
        style="margin:30px; width:500px; height:300px; border:1px dotted grey;">
        Drag & drop your file here
      </div>
    </div>
    <script>
      function sendFile(file) {
        const uri = "/index.php";
        const xhr = new XMLHttpRequest();
        const fd = new FormData();

        xhr.open("POST", uri, true);
        xhr.onreadystatechange = () => {
          if (xhr.readyState === 4 && xhr.status === 200) {
            alert(xhr.responseText); // handle response.
          }
        };
        fd.append("myFile", file);
        // Initiate a multipart/form-data upload
        xhr.send(fd);
      }

      const dropzone = document.getElementById("dropzone");
      dropzone.addEventListener("dragover", (event) => {
        event.stopPropagation();
        event.preventDefault();
      });

      dropzone.addEventListener("drop", (event) => {
        event.preventDefault();

        const filesArray = event.dataTransfer.files;
        for (let i = 0; i < filesArray.length; i++) {
          sendFile(filesArray[i]);
        }
      });
    </script>
  </body>
</html>
```

## Ví dụ: Sử dụng object URL để hiển thị PDF

Object URL có thể được sử dụng cho những thứ khác ngoài hình ảnh! Chúng có thể được sử dụng để hiển thị các tệp PDF nhúng hoặc bất kỳ tài nguyên nào khác có thể được hiển thị bởi trình duyệt.

Trong Firefox, để PDF xuất hiện nhúng trong iframe (thay vì được đề xuất như tệp đã tải xuống), tùy chọn `pdfjs.disabled` phải được đặt thành `false`.

```html
<iframe id="viewer"></iframe>
```

Và đây là sự thay đổi của thuộc tính `src`:

```js
const objURL = URL.createObjectURL(blob);
const iframe = document.getElementById("viewer");
iframe.setAttribute("src", objURL);

// Later:
URL.revokeObjectURL(objURL);
```

## Ví dụ: Sử dụng object URL với các loại tệp khác

Bạn có thể thao tác các tệp có định dạng khác theo cách tương tự. Đây là cách xem trước video đã tải lên:

```js
const video = document.getElementById("video");
const objURL = URL.createObjectURL(blob);
video.src = objURL;
video.play();

// Later:
URL.revokeObjectURL(objURL);
```

## Xem thêm

- {{DOMxRef("File")}}
- {{DOMxRef("FileList")}}
- {{DOMxRef("FileReader")}}
- {{DOMxRef("URL")}}
- {{DOMxRef("XMLHttpRequest")}}
- [Sử dụng XMLHttpRequest](/en-US/docs/Web/API/XMLHttpRequest_API/Using_XMLHttpRequest)
