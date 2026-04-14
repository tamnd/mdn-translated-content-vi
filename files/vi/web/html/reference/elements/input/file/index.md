---
title: <input type="file">
slug: Web/HTML/Reference/Elements/input/file
page-type: html-attribute-value
browser-compat: html.elements.input.type_file
sidebar: htmlsidebar
---

Các phần tử {{HTMLElement("input")}} với **`type="file"`** cho phép người dùng chọn một hoặc nhiều tệp từ bộ lưu trữ thiết bị. Sau khi chọn, các tệp có thể được tải lên máy chủ bằng [gửi biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms), hoặc thao tác bằng mã JavaScript và [File API](/en-US/docs/Web/API/File_API/Using_files_from_web_applications).

{{InteractiveExample("HTML Demo: &lt;input type=&quot;file&quot;&gt;", "tabbed-shorter")}}

```html interactive-example
<label for="avatar">Choose a profile picture:</label>

<input type="file" id="avatar" name="avatar" accept="image/png, image/jpeg" />
```

```css interactive-example
label {
  display: block;
  font:
    1rem "Fira Sans",
    sans-serif;
}

input,
label {
  margin: 0.4rem 0;
}
```

## Giá trị

Thuộc tính [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) của đầu vào file chứa chuỗi đại diện cho đường dẫn đến (các) tệp đã chọn. Nếu chưa có tệp nào được chọn, giá trị là chuỗi rỗng (`""`). Khi người dùng chọn nhiều tệp, `value` đại diện cho tệp đầu tiên trong danh sách các tệp họ đã chọn. Các tệp khác có thể được xác định bằng [thuộc tính `HTMLInputElement.files` của đầu vào](/en-US/docs/Web/API/File_API/Using_files_from_web_applications#getting_information_about_selected_files).

> [!NOTE]
> Giá trị [luôn là tên tệp có tiền tố `C:\fakepath\`](https://html.spec.whatwg.org/multipage/input.html#fakepath-srsly), không phải đường dẫn thực sự của tệp. Điều này để ngăn phần mềm độc hại đoán cấu trúc tệp của người dùng.

## Thuộc tính bổ sung

Ngoài các thuộc tính chung được chia sẻ bởi tất cả các phần tử {{HTMLElement("input")}}, đầu vào kiểu `file` cũng hỗ trợ các thuộc tính sau.

### accept

Giá trị thuộc tính [`accept`](/en-US/docs/Web/HTML/Reference/Attributes/accept) là chuỗi xác định các loại tệp mà đầu vào file nên chấp nhận. Chuỗi này là danh sách **[bộ chỉ định loại tệp duy nhất](#unique_file_type_specifiers)** phân tách bằng dấu phẩy. Vì một loại tệp nhất định có thể được xác định theo nhiều cách, nên hữu ích khi cung cấp bộ chỉ định kiểu đầy đủ khi bạn cần tệp theo định dạng nhất định.

Chẳng hạn, có nhiều cách để xác định các tệp Microsoft Word, vì vậy một trang chấp nhận tệp Word có thể dùng `<input>` như thế này:

```html
<input
  type="file"
  id="docpicker"
  accept=".doc,.docx,.xml,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document" />
```

### capture

Giá trị thuộc tính [`capture`](/en-US/docs/Web/HTML/Reference/Attributes/capture) là chuỗi chỉ định camera nào sẽ sử dụng để chụp dữ liệu hình ảnh hoặc video, nếu thuộc tính [`accept`](/en-US/docs/Web/HTML/Reference/Attributes/accept) cho biết đầu vào nên là một trong các loại đó. Giá trị `user` cho biết nên sử dụng camera và/hoặc microphone hướng về phía người dùng. Giá trị `environment` chỉ định nên sử dụng camera và/hoặc microphone hướng ra ngoài. Nếu thuộc tính này bị thiếu, {{Glossary("user agent")}} tự do quyết định. Nếu chế độ hướng mặt được yêu cầu không có sẵn, user agent có thể quay lại chế độ mặc định ưu tiên của nó.

> [!NOTE]
> `capture` trước đây là thuộc tính Boolean mà nếu có, yêu cầu sử dụng các thiết bị thu phương tiện của thiết bị như camera hoặc microphone thay vì yêu cầu đầu vào tệp.

### multiple

Khi thuộc tính Boolean [`multiple`](/en-US/docs/Web/HTML/Reference/Attributes/multiple) được chỉ định, đầu vào file cho phép người dùng chọn nhiều hơn một tệp.

## Thuộc tính không chuẩn

Ngoài các thuộc tính được liệt kê ở trên, các thuộc tính không chuẩn sau đây có sẵn trên một số trình duyệt. Bạn nên tránh sử dụng chúng khi có thể, vì làm như vậy sẽ hạn chế khả năng mã của bạn hoạt động trong các trình duyệt không triển khai chúng.

### `webkitdirectory`

Thuộc tính Boolean `webkitdirectory`, nếu có, cho biết chỉ các thư mục mới có thể được chọn bởi người dùng trong giao diện bộ chọn tệp. Xem {{domxref("HTMLInputElement.webkitdirectory")}} để biết thêm chi tiết và ví dụ.

## Bộ chỉ định loại tệp duy nhất

**Bộ chỉ định loại tệp duy nhất** là chuỗi mô tả loại tệp có thể được người dùng chọn trong phần tử {{HTMLElement("input")}} kiểu `file`. Mỗi bộ chỉ định loại tệp duy nhất có thể có một trong các dạng sau:

- Phần mở rộng tên tệp hợp lệ không phân biệt chữ hoa chữ thường, bắt đầu bằng ký tự dấu chấm ("."). Ví dụ: `.jpg`, `.pdf`, hoặc `.doc`.
- Chuỗi kiểu MIME hợp lệ, không có phần mở rộng.
- Chuỗi `audio/*` có nghĩa là "bất kỳ tệp âm thanh nào".
- Chuỗi `video/*` có nghĩa là "bất kỳ tệp video nào".
- Chuỗi `image/*` có nghĩa là "bất kỳ tệp hình ảnh nào".

Thuộc tính `accept` nhận một chuỗi chứa một hoặc nhiều bộ chỉ định loại tệp duy nhất này làm giá trị, phân tách bằng dấu phẩy. Ví dụ: bộ chọn tệp cần nội dung có thể được trình bày dưới dạng hình ảnh, bao gồm cả định dạng hình ảnh tiêu chuẩn và tệp PDF, có thể trông như thế này:

```html
<input type="file" accept="image/*,.pdf" />
```

## Sử dụng đầu vào file

### Ví dụ cơ bản

```html
<form method="post" enctype="multipart/form-data">
  <div>
    <label for="file">Choose file to upload</label>
    <input type="file" id="file" name="file" multiple />
  </div>
  <div>
    <button>Submit</button>
  </div>
</form>
```

```css hidden
div {
  margin-bottom: 10px;
}
```

Điều này tạo ra kết quả sau:

{{EmbedLiveSample('A_basic_example', 650, 90)}}

> [!NOTE]
> Bạn cũng có thể tìm thấy ví dụ này trên GitHub — xem [mã nguồn](https://github.com/mdn/learning-area/blob/main/html/forms/file-examples/simple-file.html), và cũng [xem nó chạy trực tiếp](https://mdn.github.io/learning-area/html/forms/file-examples/simple-file.html).

Bất kể thiết bị hoặc hệ điều hành của người dùng là gì, đầu vào file cung cấp nút mở hộp thoại bộ chọn tệp cho phép người dùng chọn tệp.

Bao gồm thuộc tính [`multiple`](#multiple), như đã thấy ở trên, chỉ định rằng có thể chọn nhiều tệp cùng một lúc. Người dùng có thể chọn nhiều tệp từ bộ chọn tệp theo bất kỳ cách nào mà nền tảng đã chọn của họ cho phép (ví dụ: bằng cách giữ <kbd>Shift</kbd> hoặc <kbd>Control</kbd> rồi nhấp). Nếu bạn chỉ muốn người dùng chọn một tệp duy nhất cho mỗi `<input>`, hãy bỏ thuộc tính `multiple`.

### Lấy thông tin về các tệp đã chọn

Các tệp đã chọn được trả về bởi thuộc tính `HTMLInputElement.files` của phần tử, là đối tượng {{domxref("FileList")}} chứa danh sách các đối tượng {{domxref("File")}}. `FileList` hoạt động như mảng, vì vậy bạn có thể kiểm tra thuộc tính `length` của nó để lấy số lượng tệp đã chọn.

Mỗi đối tượng `File` chứa thông tin sau:

- `name`
  - : Tên tệp.
- `lastModified`
  - : Số chỉ định ngày và giờ tệp được sửa đổi lần cuối, tính bằng mili giây kể từ Unix epoch (1 tháng 1 năm 1970, lúc nửa đêm).
- `lastModifiedDate` {{deprecated_inline}}
  - : Đối tượng {{jsxref("Date")}} đại diện cho ngày và giờ tệp được sửa đổi lần cuối. _Điều này đã lỗi thời và không nên sử dụng. Dùng `lastModified` thay thế._
- `size`
  - : Kích thước tệp theo byte.
- `type`
  - : [Kiểu MIME](/en-US/docs/Web/HTTP/Guides/MIME_types) của tệp.
- `webkitRelativePath` {{non-standard_inline}}
  - : Chuỗi chỉ định đường dẫn của tệp tương đối với thư mục cơ sở được chọn trong bộ chọn thư mục (tức là bộ chọn `file` trong đó thuộc tính [`webkitdirectory`](#webkitdirectory) được đặt). _Đây là không chuẩn và nên được dùng cẩn thận._

### Giới hạn các loại tệp được chấp nhận

Thường thì bạn không muốn người dùng có thể chọn bất kỳ loại tệp tùy ý nào; thay vào đó, bạn thường muốn họ chọn các tệp thuộc loại hoặc các loại cụ thể. Ví dụ: nếu đầu vào file cho phép người dùng tải lên ảnh hồ sơ, bạn có thể muốn họ chọn các định dạng hình ảnh tương thích web, chẳng hạn như {{Glossary("JPEG")}} hoặc {{Glossary("PNG")}}.

Các loại tệp được chấp nhận có thể được chỉ định với thuộc tính [`accept`](#accept), nhận danh sách các phần mở rộng tệp được phép hoặc kiểu MIME phân tách bằng dấu phẩy. Một số ví dụ:

- `accept="image/png"` hoặc `accept=".png"` — Chấp nhận tệp PNG.
- `accept="image/png, image/jpeg"` hoặc `accept=".png, .jpg, .jpeg"` — Chấp nhận tệp PNG hoặc JPEG.
- `accept="image/*"` — Chấp nhận bất kỳ tệp nào có kiểu MIME `image/*`. (Nhiều thiết bị di động cũng cho phép người dùng chụp ảnh bằng camera khi điều này được sử dụng.)
- `accept=".doc,.docx,.xml,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document"` — chấp nhận bất cứ thứ gì trông giống tài liệu MS Word.

Hãy xem một ví dụ hoàn chỉnh hơn:

```html
<form method="post" enctype="multipart/form-data">
  <div>
    <label for="profile_pic">Choose file to upload</label>
    <input
      type="file"
      id="profile_pic"
      name="profile_pic"
      accept=".jpg, .jpeg, .png" />
  </div>
  <div>
    <button>Submit</button>
  </div>
</form>
```

```css hidden
div {
  margin-bottom: 10px;
}
```

Điều này tạo ra kết quả tương tự với ví dụ trước:

{{EmbedLiveSample('Limiting_accepted_file_types', 650, 90)}}

> [!NOTE]
> Bạn cũng có thể tìm thấy ví dụ này trên GitHub — xem [mã nguồn](https://github.com/mdn/learning-area/blob/main/html/forms/file-examples/file-with-accept.html), và cũng [xem nó chạy trực tiếp](https://mdn.github.io/learning-area/html/forms/file-examples/file-with-accept.html).

Có thể trông tương tự, nhưng nếu bạn thử chọn tệp với đầu vào này, bạn sẽ thấy bộ chọn tệp chỉ cho phép bạn chọn các loại tệp được chỉ định trong giá trị `accept` (giao diện chính xác khác nhau giữa các trình duyệt và hệ điều hành).

Thuộc tính `accept` không xác thực các loại tệp đã chọn; nó cung cấp gợi ý cho trình duyệt hướng dẫn người dùng chọn đúng loại tệp. Vẫn có thể (trong hầu hết các trường hợp) người dùng chuyển sang tùy chọn trong bộ chọn tệp cho phép ghi đè điều này và chọn bất kỳ tệp nào họ muốn, và sau đó chọn các loại tệp không đúng.

Do đó, bạn nên đảm bảo thuộc tính `accept` được hỗ trợ bởi xác thực phù hợp ở phía máy chủ.

### Phát hiện hủy

Sự kiện `cancel` được kích hoạt khi người dùng không thay đổi lựa chọn của họ, chọn lại các tệp đã chọn trước đó. Sự kiện `cancel` cũng được kích hoạt khi hộp thoại bộ chọn tệp được đóng hoặc hủy, thông qua nút "cancel" hoặc phím <kbd>escape</kbd>.

Ví dụ: mã sau sẽ ghi vào console nếu người dùng đóng popup mà không chọn tệp:

```js
const elem = document.createElement("input");
elem.type = "file";
elem.addEventListener("cancel", () => {
  console.log("Cancelled.");
});
elem.addEventListener("change", () => {
  if (elem.files.length === 1) {
    console.log("File selected: ", elem.files[0]);
  }
});
elem.click();
```

### Lưu ý

1. Bạn không thể đặt giá trị của bộ chọn tệp từ script — làm điều gì đó như sau không có tác dụng:

   ```js
   const input = document.querySelector("input[type=file]");
   input.value = "foo";
   ```

2. Khi tệp được chọn bằng `<input type="file">`, đường dẫn thực tế đến tệp nguồn không được hiển thị trong thuộc tính `value` của đầu vào vì lý do bảo mật rõ ràng. Thay vào đó, tên tệp được hiển thị, với `C:\fakepath\` được thêm vào phía trước. Có một số lý do lịch sử cho sự kỳ quặc này, nhưng nó được hỗ trợ trên tất cả các trình duyệt hiện đại, và thực sự [được định nghĩa trong đặc tả](https://html.spec.whatwg.org/multipage/forms.html#fakepath-srsly).

## Ví dụ

Trong ví dụ này, chúng ta sẽ trình bày bộ chọn tệp hơi nâng cao hơn tận dụng thông tin tệp có sẵn trong thuộc tính `HTMLInputElement.files`, cũng như trình bày một vài thủ thuật thú vị.

> [!NOTE]
> Bạn có thể xem mã nguồn hoàn chỉnh cho ví dụ này trên GitHub — [file-example.html](https://github.com/mdn/learning-area/blob/main/html/forms/file-examples/file-example.html) ([xem nó trực tiếp cũng được](https://mdn.github.io/learning-area/html/forms/file-examples/file-example.html)). Chúng ta sẽ không giải thích CSS; JavaScript là trọng tâm chính.

Trước tiên, hãy xem HTML:

```html
<form method="post" enctype="multipart/form-data">
  <div>
    <label for="image_uploads">Choose images to upload (PNG, JPG)</label>
    <input
      type="file"
      id="image_uploads"
      name="image_uploads"
      accept=".jpg, .jpeg, .png"
      multiple />
  </div>
  <div class="preview">
    <p>No files currently selected for upload</p>
  </div>
  <div>
    <button>Submit</button>
  </div>
</form>
```

```css hidden
html {
  font-family: sans-serif;
}

form {
  background: #cccccc;
  margin: 0 auto;
  padding: 20px;
  border: 1px solid black;
}

form ol {
  padding-left: 0;
}

form li,
div > p {
  background: #eeeeee;
  display: flex;
  justify-content: space-between;
  margin-bottom: 10px;
  list-style-type: none;
  border: 1px solid black;
}

form img {
  height: 64px;
  order: 1;
}

form p {
  line-height: 32px;
  padding-left: 10px;
}

form label,
form button {
  background-color: #7f9ccb;
  padding: 5px 10px;
  border-radius: 5px;
  border: 1px ridge black;
  font-size: 0.8rem;
  height: auto;
}

form label:hover,
form button:hover {
  background-color: #2d5ba3;
  color: white;
}

form label:active,
form button:active {
  background-color: #0d3f8f;
  color: white;
}
```

Điều này tương tự với những gì chúng ta thấy trước đây — không có gì đặc biệt cần nhận xét.

Tiếp theo, hãy xem qua JavaScript.

Trong các dòng đầu tiên của script, chúng ta lấy tham chiếu đến chính đầu vào biểu mẫu và phần tử {{htmlelement("div")}} có class `.preview`. Tiếp theo, chúng ta ẩn phần tử {{htmlelement("input")}} — chúng ta làm điều này vì đầu vào file thường xấu, khó tạo kiểu và không nhất quán trong thiết kế trên các trình duyệt. Bạn có thể kích hoạt phần tử `input` bằng cách nhấp vào {{htmlelement("label")}} của nó, vì vậy tốt hơn là ẩn `input` về mặt hình thức và tạo kiểu cho nhãn như một nút, để người dùng biết phải tương tác với nó nếu họ muốn tải tệp lên.

```js
const input = document.querySelector("input");
const preview = document.querySelector(".preview");

input.style.opacity = 0;
```

> [!NOTE]
> {{cssxref("opacity")}} được dùng để ẩn đầu vào file thay vì {{cssxref("visibility", "visibility: hidden")}} hoặc {{cssxref("display", "display: none")}}, vì công nghệ hỗ trợ diễn giải hai kiểu sau có nghĩa là đầu vào file không tương tác.

Tiếp theo, chúng ta thêm [event listener](/en-US/docs/Web/API/EventTarget/addEventListener) vào đầu vào để lắng nghe các thay đổi đối với giá trị đã chọn của nó (trong trường hợp này, khi tệp được chọn). Event listener gọi hàm `updateImageDisplay()` tùy chỉnh của chúng ta.

```js
input.addEventListener("change", updateImageDisplay);
```

Bất cứ khi nào hàm `updateImageDisplay()` được gọi, chúng ta:

- Dùng vòng lặp {{jsxref("Statements/while", "while")}} để xóa nội dung trước đó của preview `<div>`.
- Lấy đối tượng {{domxref("FileList")}} chứa thông tin về tất cả các tệp đã chọn và lưu vào biến `curFiles`.
- Kiểm tra xem có tệp nào được chọn không bằng cách kiểm tra xem `curFiles.length` có bằng 0 không. Nếu có, in thông báo vào preview `<div>` cho biết không có tệp nào được chọn.
- Nếu tệp _đã_ được chọn, chúng ta lặp qua từng tệp, in thông tin về nó vào preview `<div>`. Những điều cần lưu ý ở đây:
- Chúng ta dùng hàm `validFileType()` tùy chỉnh để kiểm tra xem tệp có đúng loại không (ví dụ: các loại hình ảnh được chỉ định trong thuộc tính `accept`).
- Nếu có, chúng ta:
  - In tên và kích thước tệp vào mục danh sách bên trong `<div>` trước đó (lấy từ `file.name` và `file.size`). Hàm `returnFileSize()` tùy chỉnh trả về phiên bản định dạng đẹp của kích thước theo byte/KB/MB (theo mặc định trình duyệt báo cáo kích thước theo byte tuyệt đối).
  - Tạo xem trước thumbnail của hình ảnh bằng cách gọi {{domxref("URL/createObjectURL_static", "URL.createObjectURL(file)")}}. Sau đó, chèn hình ảnh vào mục danh sách bằng cách tạo {{htmlelement("img")}} mới và đặt [`src`](/en-US/docs/Web/HTML/Reference/Elements/img#src) của nó thành thumbnail.

- Nếu loại tệp không hợp lệ, chúng ta hiển thị thông báo trong mục danh sách cho người dùng biết họ cần chọn loại tệp khác.

```js
function updateImageDisplay() {
  while (preview.firstChild) {
    preview.removeChild(preview.firstChild);
  }

  const curFiles = input.files;
  if (curFiles.length === 0) {
    const para = document.createElement("p");
    para.textContent = "No files currently selected for upload";
    preview.appendChild(para);
  } else {
    const list = document.createElement("ol");
    preview.appendChild(list);

    for (const file of curFiles) {
      const listItem = document.createElement("li");
      const para = document.createElement("p");
      if (validFileType(file)) {
        para.textContent = `File name ${file.name}, file size ${returnFileSize(
          file.size,
        )}.`;
        const image = document.createElement("img");
        image.src = URL.createObjectURL(file);
        image.alt = image.title = file.name;

        listItem.appendChild(image);
        listItem.appendChild(para);
      } else {
        para.textContent = `File name ${file.name}: Not a valid file type. Update your selection.`;
        listItem.appendChild(para);
      }

      list.appendChild(listItem);
    }
  }
}
```

Hàm `validFileType()` tùy chỉnh nhận đối tượng {{domxref("File")}} làm tham số, sau đó dùng {{jsxref("Array.prototype.includes()")}} để kiểm tra xem có giá trị nào trong `fileTypes` khớp với thuộc tính `type` của tệp không. Nếu tìm thấy khớp, hàm trả về `true`. Nếu không tìm thấy khớp, trả về `false`.

```js
// https://developer.mozilla.org/en-US/docs/Web/Media/Guides/Formats/Image_types
const fileTypes = [
  "image/apng",
  "image/bmp",
  "image/gif",
  "image/jpeg",
  "image/pjpeg",
  "image/png",
  "image/svg+xml",
  "image/tiff",
  "image/webp",
  "image/x-icon",
];

function validFileType(file) {
  return fileTypes.includes(file.type);
}
```

Hàm `returnFileSize()` nhận một số (byte, lấy từ thuộc tính `size` của tệp hiện tại) và chuyển đổi nó thành kích thước được định dạng đẹp theo byte/KB/MB.

```js
function returnFileSize(number) {
  if (number < 1e3) {
    return `${number} bytes`;
  } else if (number >= 1e3 && number < 1e6) {
    return `${(number / 1e3).toFixed(1)} KB`;
  }
  return `${(number / 1e6).toFixed(1)} MB`;
}
```

> [!NOTE]
> Các đơn vị "KB" và "MB" ở đây sử dụng quy ước [tiền tố SI](https://en.wikipedia.org/wiki/Binary_prefix) là 1KB = 1000B, tương tự như macOS. Các hệ thống khác đại diện kích thước tệp theo cách khác nhau — ví dụ: Ubuntu sử dụng tiền tố IEC nơi 1KiB = 1024B, trong khi thông số RAM thường sử dụng tiền tố SI để biểu diễn lũy thừa của hai (1KB = 1024B). Vì lý do này, chúng ta đã dùng `1e3` (`1000`) và `1e6` (`100000`) thay vì `1024` và `1048576`. Trong ứng dụng của bạn, bạn nên truyền đạt rõ ràng hệ thống đơn vị cho người dùng nếu kích thước chính xác quan trọng.

```js hidden
const button = document.querySelector("form button");
button.addEventListener("click", (e) => {
  e.preventDefault();
  const para = document.createElement("p");
  para.append("Image uploaded!");
  preview.replaceChildren(para);
});
```

Ví dụ trông như thế này; hãy thử nghiệm:

{{EmbedLiveSample('Examples', '100%', 200)}}

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <td><strong><a href="#value">Giá trị</a></strong></td>
      <td>
        Một chuỗi đại diện cho đường dẫn đến tệp đã chọn.
      </td>
    </tr>
    <tr>
      <td><strong>Sự kiện</strong></td>
      <td>
        {{domxref("HTMLElement/change_event", "change")}},
        {{domxref("Element/input_event", "input")}} và
        {{domxref("HTMLInputElement/cancel_event", "cancel")}}
      </td>
    </tr>
    <tr>
      <td><strong>Thuộc tính chung được hỗ trợ</strong></td>
      <td><a href="/en-US/docs/Web/HTML/Reference/Elements/input#required"><code>required</code></a></td>
    </tr>
    <tr>
      <td><strong>Thuộc tính bổ sung</strong></td>
      <td>
        <a href="#accept" aria-current="page"><code>accept</code></a>,
        <a href="#capture" aria-current="page"><code>capture</code></a>,
        <a href="#multiple" aria-current="page"><code>multiple</code></a>
      </td>
    </tr>
    <tr>
      <td><strong>Thuộc tính IDL</strong></td>
      <td><code>files</code> và <code>value</code></td>
    </tr>
    <tr>
      <td><strong>Giao diện DOM</strong></td>
      <td><p>{{domxref("HTMLInputElement")}}</p></td>
    </tr>
    <tr>
      <td><strong>Phương thức</strong></td>
      <td>
        {{domxref("HTMLInputElement.select", "select()")}}
      </td>
    </tr>
    <tr>
      <td><strong>Vai trò ARIA ngầm định</strong></td>
      <td><a href="https://w3c.github.io/html-aria/#dfn-no-corresponding-role">không có vai trò tương ứng</a></td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng tệp từ ứng dụng web](/en-US/docs/Web/API/File_API/Using_files_from_web_applications) — chứa một số ví dụ hữu ích khác liên quan đến `<input type="file">` và [File API](/en-US/docs/Web/API/File).
