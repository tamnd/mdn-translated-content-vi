---
title: "FileReader: phương thức readAsText()"
short-title: readAsText()
slug: Web/API/FileReader/readAsText
page-type: web-api-instance-method
browser-compat: api.FileReader.readAsText
---

{{APIRef("File API")}}{{AvailableInWorkers}}

Phương thức **`readAsText()`** của giao diện {{domxref("FileReader")}} được dùng để đọc nội dung của {{domxref("Blob")}} hoặc {{domxref("File")}} được chỉ định. Khi thao tác đọc hoàn tất, thuộc tính {{domxref("FileReader.readyState","readyState")}} thay đổi thành `DONE`, sự kiện {{domxref("FileReader/loadend_event", "loadend")}} được kích hoạt, và thuộc tính {{domxref("FileReader.result","result")}} chứa nội dung tệp dưới dạng chuỗi văn bản.

> [!NOTE]
> Phương thức {{domxref("Blob.text()")}} là một API mới hơn dựa trên Promise để đọc tệp dưới dạng văn bản.

> [!NOTE]
> Phương thức này tải toàn bộ nội dung tệp vào bộ nhớ và không phù hợp với các tệp lớn. Nên dùng {{domxref("FileReader.readAsArrayBuffer", "readAsArrayBuffer()")}} cho các tệp lớn.

## Cú pháp

```js-nolint
readAsText(blob)
readAsText(blob, encoding)
```

### Tham số

- `blob`
  - : {{domxref("Blob")}} hoặc {{domxref("File")}} cần đọc.
- `encoding` {{optional_inline}}
  - : Chuỗi chỉ định mã hóa dùng cho dữ liệu trả về. Mặc định là UTF-8 nếu tham số này không được chỉ định.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### HTML

```html
<input type="file" /><br />
<p class="content"></p>
```

### JavaScript

```js
const content = document.querySelector(".content");
const fileInput = document.querySelector("input[type=file]");

fileInput.addEventListener("change", previewFile);

function previewFile() {
  const file = fileInput.files[0];
  const reader = new FileReader();

  reader.addEventListener("load", () => {
    // hiển thị nội dung tệp văn bản
    content.innerText = reader.result;
  });

  if (file) {
    reader.readAsText(file);
  }
}
```

### Kết quả

{{EmbedLiveSample("Examples", "100%", 240)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("FileReader")}}
