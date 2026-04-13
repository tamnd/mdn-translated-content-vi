---
title: "FileReader: phương thức readAsDataURL()"
short-title: readAsDataURL()
slug: Web/API/FileReader/readAsDataURL
page-type: web-api-instance-method
browser-compat: api.FileReader.readAsDataURL
---

{{APIRef("File API")}}{{AvailableInWorkers}}

Phương thức **`readAsDataURL()`** của giao diện {{domxref("FileReader")}} được dùng để đọc nội dung của {{domxref("Blob")}} hoặc {{domxref("File")}} được chỉ định. Khi thao tác đọc hoàn tất, thuộc tính {{domxref("FileReader.readyState","readyState")}} trở thành `DONE` và sự kiện {{domxref("FileReader/loadend_event", "loadend")}} được kích hoạt. Lúc đó, thuộc tính {{domxref("FileReader.result","result")}} chứa dữ liệu dưới dạng [URL data:](/en-US/docs/Web/URI/Reference/Schemes/data) đại diện cho dữ liệu tệp được mã hóa base64.

> [!NOTE]
> Kết quả blob's {{domxref("FileReader.result","result")}} không thể được giải mã trực tiếp dưới dạng Base64 mà không cần xóa phần khai báo Data-URL đứng trước dữ liệu mã hóa Base64. Để chỉ lấy chuỗi Base64, trước tiên cần xóa `data:*/*;base64,` khỏi kết quả.

## Cú pháp

```js-nolint
readAsDataURL(blob)
```

### Tham số

- `blob`
  - : {{domxref("Blob")}} hoặc {{domxref("File")}} cần đọc.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Đọc một tệp đơn

#### HTML

```html
<input type="file" /><br />
<img src="" height="200" alt="Image preview" />
```

#### JavaScript

```js
const preview = document.querySelector("img");
const fileInput = document.querySelector("input[type=file]");

fileInput.addEventListener("change", previewFile);

function previewFile() {
  const file = fileInput.files[0];
  const reader = new FileReader();

  reader.addEventListener("load", () => {
    // chuyển tệp hình ảnh sang chuỗi base64
    preview.src = reader.result;
  });

  if (file) {
    reader.readAsDataURL(file);
  }
}
```

#### Kết quả

{{EmbedLiveSample("Reading a single file", "100%", 240)}}

### Đọc nhiều tệp

#### HTML

```html
<input id="browse" type="file" multiple />
<div id="preview"></div>
```

#### JavaScript

```js
function previewFiles() {
  const preview = document.querySelector("#preview");
  const files = document.querySelector("input[type=file]").files;

  function readAndPreview(file) {
    // Đảm bảo `file.name` khớp với tiêu chí phần mở rộng
    if (/\.(?:jpe?g|png|gif)$/i.test(file.name)) {
      const reader = new FileReader();

      reader.addEventListener("load", () => {
        const image = new Image();
        image.height = 100;
        image.title = file.name;
        image.src = reader.result;
        preview.appendChild(image);
      });

      reader.readAsDataURL(file);
    }
  }

  if (files) {
    Array.prototype.forEach.call(files, readAndPreview);
  }
}

const picker = document.querySelector("#browse");
picker.addEventListener("change", previewFiles);
```

#### Kết quả

{{EmbedLiveSample("Reading multiple files", "100%", 240)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("FileReader")}}
- {{domxref("URL.createObjectURL_static", "URL.createObjectURL()")}}
