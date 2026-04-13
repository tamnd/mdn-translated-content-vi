---
title: "Blob: thuộc tính type"
short-title: type
slug: Web/API/Blob/type
page-type: web-api-instance-property
browser-compat: api.Blob.type
---

{{APIRef("File API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`type`** của giao diện {{domxref("Blob")}} trả về {{Glossary("MIME type")}} của tệp.

> [!NOTE]
> Dựa trên cách triển khai hiện tại, trình duyệt thực tế sẽ không đọc luồng byte của tệp để xác định kiểu phương tiện.
> Kiểu được giả định dựa trên phần mở rộng của tệp; một tệp hình ảnh PNG bị đổi tên thành `.txt` sẽ cho ra "_text/plain_" chứ không phải "_image/png_". Hơn nữa, `blob.type` nhìn chung chỉ đáng tin cậy với các kiểu tệp phổ biến như hình ảnh, tài liệu HTML, âm thanh và video.
> Các phần mở rộng tệp không phổ biến sẽ trả về chuỗi rỗng.
> Cấu hình phía máy khách (chẳng hạn Windows Registry) có thể dẫn đến những giá trị ngoài dự kiến ngay cả với kiểu phổ biến. **Nhà phát triển được khuyến nghị không nên dựa vào riêng thuộc tính này như một cơ chế xác thực duy nhất.**

## Giá trị

Một chuỗi chứa MIME type của tệp, hoặc chuỗi rỗng nếu không xác định được kiểu.

## Ví dụ

Ví dụ này yêu cầu người dùng chọn một số tệp, sau đó kiểm tra từng tệp để bảo đảm nó thuộc một trong các kiểu tệp hình ảnh được cho phép.

### HTML

```html
<input type="file" id="input" multiple />
<output id="output">Chọn tệp hình ảnh…</output>
```

```css hidden
output {
  display: block;
  margin-top: 16px;
}
```

### JavaScript

```js
// Ứng dụng của chúng ta chỉ cho phép ảnh GIF, PNG và JPEG
const allowedFileTypes = ["image/png", "image/jpeg", "image/gif"];

const input = document.getElementById("input");
const output = document.getElementById("output");

input.addEventListener("change", (event) => {
  const files = event.target.files;

  if (files.length === 0) {
    output.innerText = "Chọn tệp hình ảnh…";
    return;
  }

  const allAllowed = Array.from(files).every((file) =>
    allowedFileTypes.includes(file.type),
  );
  output.innerText = allAllowed
    ? "Tất cả tệp đều hợp lệ!"
    : "Vui lòng chỉ chọn tệp hình ảnh.";
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
