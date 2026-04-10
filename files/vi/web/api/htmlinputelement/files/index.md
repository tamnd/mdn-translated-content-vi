---
title: "HTMLInputElement: thuộc tính files"
short-title: files
slug: Web/API/HTMLInputElement/files
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.files
---

{{APIRef("File and Directory Entries API")}}

Thuộc tính **`HTMLInputElement.files`** cho phép bạn truy cập {{domxref("FileList")}} được chọn bằng phần tử [`<input type="file">`](/en-US/docs/Web/HTML/Reference/Elements/input/file).

## Giá trị

Một đối tượng {{domxref("FileList")}} liệt kê các tệp đã chọn, nếu có, hoặc `null` nếu **`HTMLInputElement`** không thuộc loại `type="file"`.

## Ví dụ

Ví dụ dưới đây cho thấy cách bạn có thể truy cập thuộc tính **`HTMLInputElement.files`** và ghi lại tên, ngày sửa đổi, kích thước và loại của mỗi tệp do người dùng chọn.

### HTML

```html
<input id="files" type="file" multiple />
```

### JavaScript

Lưu ý rằng **`HTMLInputElement.files`** vẫn trả về một thể hiện của {{domxref("FileList")}} ngay cả khi không có tệp nào được chọn.
Do đó, an toàn khi lặp qua nó bằng {{JSxref("Statements/for...of", "for...of")}} mà không cần kiểm tra xem có tệp nào được chọn hay không.

```js
const fileInput = document.getElementById("files");

console.log(fileInput.files instanceof FileList); // true ngay cả khi trống

for (const file of fileInput.files) {
  console.log(file.name); // in tên tệp
  let fileDate = new Date(file.lastModified);
  console.log(fileDate.toLocaleDateString()); // in ngày dễ đọc
  console.log(
    file.size < 1000 ? file.size : `${Math.round(file.size / 1000)}KB`,
  );
  console.log(file.type); // in kiểu MIME
}
```

## Đặc tả kỹ thuật

{{ Specifications }}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DataTransfer.files")}}
