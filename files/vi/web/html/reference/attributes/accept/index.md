---
title: "HTML attribute: accept"
short-title: accept
slug: Web/HTML/Reference/Attributes/accept
page-type: html-attribute
browser-compat: html.elements.input.accept
sidebar: htmlsidebar
---

Thuộc tính **`accept`** nhận một danh sách phân cách bằng dấu phẩy gồm một hoặc nhiều kiểu tệp, hoặc [bộ chỉ định kiểu tệp duy nhất](#unique_file_type_specifiers), mô tả các kiểu tệp được cho phép.

{{InteractiveExample("HTML Demo: accept", "tabbed-shorter")}}

```html interactive-example
<label for="movie">Choose a movie to upload:</label>

<input type="file" id="movie" name="movie" accept="video/*" />

<label for="poster">Choose a poster:</label>

<input type="file" id="poster" name="poster" accept="image/png, image/jpeg" />
```

```css interactive-example
label {
  display: block;
  margin-top: 1rem;
}

input {
  margin-bottom: 1rem;
}
```

## Tổng quan

Thuộc tính accept là một thuộc tính của kiểu {{HTMLElement("input/file", "file")}} {{htmlelement("input")}}. Nó được hỗ trợ trên phần tử {{htmlelement("form")}}, nhưng đã bị loại bỏ để sử dụng {{HTMLElement("input/file", "file")}} thay thế.

Vì một kiểu tệp nhất định có thể được xác định theo nhiều cách, nên việc cung cấp một tập hợp đầy đủ các bộ chỉ định kiểu rất hữu ích khi bạn cần các tệp thuộc kiểu cụ thể, hoặc sử dụng ký tự đại diện để biểu thị rằng kiểu bất kỳ của một định dạng nào đó đều được chấp nhận.

Ví dụ, có nhiều cách để xác định tệp Microsoft Word, vì vậy một trang web chấp nhận tệp Word có thể sử dụng `<input>` như sau:

```html
<input
  type="file"
  id="docpicker"
  accept=".doc,.docx,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document" />
```

Trong khi đó nếu bạn đang chấp nhận một tệp phương tiện, bạn có thể muốn bao gồm bất kỳ định dạng nào của kiểu phương tiện đó:

```html
<input type="file" id="soundFile" accept="audio/*" />
<input type="file" id="videoFile" accept="video/*" />
<input type="file" id="imageFile" accept="image/*" />
```

Thuộc tính `accept` không xác nhận kiểu của các tệp đã chọn; nó cung cấp gợi ý cho trình duyệt để hướng dẫn người dùng chọn đúng kiểu tệp. Người dùng vẫn có thể (trong hầu hết các trường hợp) chuyển đổi một tùy chọn trong bộ chọn tệp cho phép ghi đè điều này và chọn bất kỳ tệp nào họ muốn, và sau đó chọn kiểu tệp không chính xác.

Do đó, bạn nên đảm bảo rằng yêu cầu mong đợi được xác nhận phía máy chủ.

## Ví dụ

Khi được đặt trên kiểu input tệp, bộ chọn tệp gốc mở ra chỉ nên cho phép chọn các tệp có kiểu tệp đúng. Hầu hết các hệ điều hành làm mờ các tệp không khớp tiêu chí và không thể chọn được.

```html
<p>
  <label for="soundFile">Select an audio file:</label>
  <input type="file" id="soundFile" accept="audio/*" />
</p>
<p>
  <label for="videoFile">Select a video file:</label>
  <input type="file" id="videoFile" accept="video/*" />
</p>
<p>
  <label for="imageFile">Select some images:</label>
  <input type="file" id="imageFile" accept="image/*" multiple />
</p>
```

{{EmbedLiveSample('Examples', '100%', 200)}}

Lưu ý rằng ví dụ cuối cùng cho phép bạn chọn nhiều hình ảnh. Xem thuộc tính [`multiple`](/en-US/docs/Web/HTML/Reference/Elements/input#multiple) để biết thêm thông tin.

## Bộ chỉ định kiểu tệp duy nhất

Một **bộ chỉ định kiểu tệp duy nhất** là một chuỗi mô tả kiểu tệp có thể được chọn bởi người dùng trong phần tử {{HTMLElement("input")}} kiểu `file`. Mỗi bộ chỉ định kiểu tệp duy nhất có thể có một trong các dạng sau:

- Phần mở rộng tên tệp hợp lệ không phân biệt hoa thường, bắt đầu bằng dấu chấm ("."). Ví dụ: `.jpg`, `.pdf`, hoặc `.doc`.
- Chuỗi MIME type hợp lệ, không có phần mở rộng.
- Chuỗi `audio/*` có nghĩa là "bất kỳ tệp âm thanh nào".
- Chuỗi `video/*` có nghĩa là "bất kỳ tệp video nào".
- Chuỗi `image/*` có nghĩa là "bất kỳ tệp hình ảnh nào".

Thuộc tính `accept` nhận một chuỗi chứa một hoặc nhiều bộ chỉ định kiểu tệp duy nhất này, được phân tách bằng dấu phẩy. Ví dụ, bộ chọn tệp cần nội dung có thể được trình bày dưới dạng hình ảnh, bao gồm cả các định dạng hình ảnh tiêu chuẩn và tệp PDF, có thể trông như thế này:

```html
<input type="file" accept="image/*,.pdf" />
```

## Sử dụng input tệp

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

{{EmbedLiveSample('A_basic_example', 650, 60)}}

> [!NOTE]
> Bạn cũng có thể tìm thấy ví dụ này trên GitHub — xem [mã nguồn](https://github.com/mdn/learning-area/blob/main/html/forms/file-examples/simple-file.html), và cũng [xem nó chạy trực tiếp](https://mdn.github.io/learning-area/html/forms/file-examples/simple-file.html).

Bất kể thiết bị hoặc hệ điều hành của người dùng, input tệp cung cấp một nút mở hộp thoại chọn tệp cho phép người dùng chọn một tệp.

Bao gồm thuộc tính [`multiple`](/en-US/docs/Web/HTML/Reference/Elements/input#multiple), như được hiển thị ở trên, chỉ định rằng có thể chọn nhiều tệp cùng một lúc. Người dùng có thể chọn nhiều tệp từ bộ chọn tệp theo bất kỳ cách nào mà nền tảng của họ cho phép (ví dụ: bằng cách giữ <kbd>Shift</kbd> hoặc <kbd>Control</kbd> và sau đó nhấp). Nếu bạn chỉ muốn người dùng chọn một tệp duy nhất mỗi `<input>`, hãy bỏ thuộc tính `multiple`.

### Giới hạn kiểu tệp được chấp nhận

Thường thì bạn không muốn người dùng có thể chọn bất kỳ kiểu tệp tùy ý nào; thay vào đó, bạn thường muốn họ chọn các tệp có kiểu cụ thể. Ví dụ: nếu input tệp của bạn cho phép người dùng tải lên ảnh hồ sơ, bạn có thể muốn họ chọn các định dạng hình ảnh tương thích web, chẳng hạn như {{Glossary("JPEG")}} hoặc {{Glossary("PNG")}}.

Các kiểu tệp có thể chấp nhận được có thể được chỉ định với thuộc tính [`accept`](/en-US/docs/Web/HTML/Reference/Elements/input/file#accept), nhận danh sách phân cách bằng dấu phẩy các phần mở rộng tệp hoặc MIME type được phép. Một số ví dụ:

- `accept="image/png"` hoặc `accept=".png"` — Chấp nhận tệp PNG.
- `accept="image/png, image/jpeg"` hoặc `accept=".png, .jpg, .jpeg"` — Chấp nhận tệp PNG hoặc JPEG.
- `accept="image/*"` — Chấp nhận bất kỳ tệp nào có MIME type `image/*`. (Nhiều thiết bị di động cũng cho phép người dùng chụp ảnh bằng camera khi tính năng này được sử dụng.)
- `accept=".doc,.docx,.xml,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document"` — chấp nhận bất cứ thứ gì trông như tài liệu MS Word.

Hãy xem một ví dụ đầy đủ hơn:

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

{{EmbedLiveSample('Limiting_accepted_file_types', 650, 60)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng tệp từ các ứng dụng web](/en-US/docs/Web/API/File_API/Using_files_from_web_applications)
- [File API](/en-US/docs/Web/API/File)
