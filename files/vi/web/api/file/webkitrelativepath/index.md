---
title: "File: webkitRelativePath property"
short-title: webkitRelativePath
slug: Web/API/File/webkitRelativePath
page-type: web-api-instance-property
browser-compat: api.File.webkitRelativePath
---

{{APIRef("File and Directory Entries API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`webkitRelativePath`** của giao diện {{domxref("File")}} chứa một chuỗi xác định đường dẫn của tệp tương đối với thư mục được người dùng chọn trong phần tử {{HTMLElement("input")}} có thuộc tính [`webkitdirectory`](/en-US/docs/Web/HTML/Reference/Elements/input#webkitdirectory) được đặt.

## Giá trị

Một chuỗi chứa đường dẫn của tệp tương đối với thư mục gốc mà người dùng đã chọn.

## Ví dụ

Trong ví dụ này, một bộ chọn thư mục được hiển thị cho phép người dùng chọn một hoặc nhiều thư mục. Khi sự kiện {{domxref("HTMLElement/change_event", "change")}} xảy ra, danh sách tất cả các tệp trong cấu trúc thư mục đã chọn được tạo và hiển thị.

### HTML

```html
<input type="file" id="file-picker" name="fileList" webkitdirectory multiple />
<output id="output"></output>
```

```css hidden
output {
  display: block;
  white-space: pre-wrap;
}
```

### JavaScript

```js
const output = document.getElementById("output");
const filePicker = document.getElementById("file-picker");

filePicker.addEventListener("change", (event) => {
  const files = event.target.files;

  for (const file of files) {
    output.textContent += `${file.webkitRelativePath}\n`;
  }
});
```

### Kết quả

{{EmbedLiveSample('Example')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File and Directory Entries API](/en-US/docs/Web/API/File_and_Directory_Entries_API)
- {{domxref("HTMLInputElement.webkitEntries")}}
- {{domxref("HTMLInputElement.webkitdirectory")}}
