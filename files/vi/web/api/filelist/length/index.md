---
title: "FileList: length property"
short-title: length
slug: Web/API/FileList/length
page-type: web-api-instance-property
browser-compat: api.FileList.length
---

{{APIRef("File API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`length`** của giao diện {{domxref("FileList")}} trả về số lượng tệp trong `FileList`.

## Giá trị

Một số cho biết số lượng tệp trong danh sách.

## Ví dụ

### In số lượng tệp được chọn

Trong ví dụ này, chúng ta sử dụng `length` để tìm số mục trong `FileList`.

#### HTML

```html
<input type="file" multiple />
<div class="output"></div>
```

#### JavaScript

```js
const fileInput = document.querySelector("input[type=file]");
const output = document.querySelector(".output");

fileInput.addEventListener("change", () => {
  const fileList = fileInput.files;
  output.textContent = `You've selected: ${fileList.length} file(s)`;
});
```

#### Kết quả

{{EmbedLiveSample("Printing the number of files selected")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
