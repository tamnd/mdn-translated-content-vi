---
title: "FileList: item() method"
short-title: item()
slug: Web/API/FileList/item
page-type: web-api-instance-method
browser-compat: api.FileList.item
---

{{APIRef("File API")}}{{AvailableInWorkers}}

Phương thức **`item()`** của giao diện {{domxref("FileList")}} trả về đối tượng {{domxref("File")}} đại diện cho tệp tại chỉ mục được chỉ định trong danh sách tệp.

## Cú pháp

```js-nolint
item(index)
```

### Tham số

- `index`
  - : Chỉ mục dựa trên 0 của tệp cần lấy từ danh sách.

### Giá trị trả về

Đối tượng {{domxref("File")}} đại diện cho tệp được yêu cầu.

## Ví dụ

### In tên tệp

Trong ví dụ này, chúng ta sử dụng `item()` để chọn mục đầu tiên trong `FileList`.

#### HTML

```html
<input type="file" />
<div class="output"></div>
```

#### JavaScript

```js
const fileInput = document.querySelector("input[type=file]");
const output = document.querySelector(".output");

fileInput.addEventListener("change", () => {
  const fileList = fileInput.files;
  if (fileList.length > 0) {
    const file = fileList.item(0);
    output.textContent = `You selected: ${file.name}`;
  }
});
```

#### Kết quả

{{EmbedLiveSample("Printing the name of a file")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
