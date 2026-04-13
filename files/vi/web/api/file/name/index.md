---
title: "File: name property"
short-title: name
slug: Web/API/File/name
page-type: web-api-instance-property
browser-compat: api.File.name
---

{{APIRef("File API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`name`** của giao diện {{domxref("File")}} trả về tên của tệp được đại diện bởi đối tượng {{domxref("File")}}. Vì lý do bảo mật, đường dẫn không được đưa vào thuộc tính này.

## Giá trị

Một chuỗi chứa tên tệp không có đường dẫn, chẳng hạn như "My Resume.rtf".

## Ví dụ

### HTML

```html
<input type="file" id="file-picker" multiple />
<div>
  <p>List of selected files:</p>
  <ul id="output"></ul>
</div>
```

### JavaScript

```js
const output = document.getElementById("output");
const filePicker = document.getElementById("file-picker");

filePicker.addEventListener("change", (event) => {
  const files = event.target.files;
  output.textContent = "";

  for (const file of files) {
    const li = document.createElement("li");
    li.textContent = file.name;
    output.appendChild(li);
  }
});
```

### Kết quả

{{EmbedLiveSample('Examples')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng tệp từ ứng dụng web](/en-US/docs/Web/API/File_API/Using_files_from_web_applications)
