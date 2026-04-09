---
title: "Blob: thuộc tính size"
short-title: size
slug: Web/API/Blob/size
page-type: web-api-instance-property
browser-compat: api.Blob.size
---

{{APIRef("File API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`size`** của giao diện {{domxref("Blob")}} trả về kích thước của {{domxref("Blob")}} hoặc {{domxref("File")}} tính bằng byte.

## Giá trị

Số byte dữ liệu chứa trong `Blob` (hoặc đối tượng dựa trên `Blob`, chẳng hạn như {{domxref("File")}}).

## Ví dụ

Ví dụ này dùng một phần tử {{HTMLElement("input")}} kiểu `file` để yêu cầu người dùng chọn một nhóm tệp, rồi lặp qua các tệp đó để xuất ra tên và độ dài của chúng tính theo byte.

### HTML

```html
<input type="file" id="input" multiple /> <output id="output">Chọn tệp…</output>
```

```css hidden
output {
  display: block;
  margin-top: 16px;
}
```

### JavaScript

```js
const input = document.getElementById("input");
const output = document.getElementById("output");

input.addEventListener("change", (event) => {
  output.innerText = "";

  for (const file of event.target.files) {
    output.innerText += `${file.name} có kích thước ${file.size} byte.\n`;
  }
});
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Blob")}}
- [Sử dụng tệp từ ứng dụng web](/en-US/docs/Web/API/File_API/Using_files_from_web_applications)
