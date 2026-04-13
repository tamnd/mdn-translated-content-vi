---
title: "FileReader: phương thức readAsBinaryString()"
short-title: readAsBinaryString()
slug: Web/API/FileReader/readAsBinaryString
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.FileReader.readAsBinaryString
---

{{APIRef("File API")}}{{AvailableInWorkers}}{{Deprecated_Header}}

> [!NOTE]
> Phương thức này đã lỗi thời, nên dùng {{DOMxRef("FileReader.readAsArrayBuffer","readAsArrayBuffer()")}} thay thế.

Phương thức **`readAsBinaryString()`** của giao diện {{domxref("FileReader")}} được dùng để bắt đầu đọc nội dung của {{domxref("Blob")}} hoặc {{domxref("File")}} được chỉ định. Khi thao tác đọc hoàn tất, thuộc tính {{domxref("FileReader.readyState","readyState")}} trở thành `DONE` và sự kiện {{domxref("FileReader/loadend_event", "loadend")}} được kích hoạt. Lúc đó, thuộc tính {{domxref("FileReader.result","result")}} chứa dữ liệu nhị phân thô từ tệp.

Lưu ý rằng phương thức này đã từng bị xóa khỏi đặc tả File API, nhưng được đưa lại để đảm bảo tương thích ngược. Nên dùng {{domxref("FileReader.readAsArrayBuffer()")}} thay thế.

## Cú pháp

```js-nolint
readAsBinaryString(blob)
```

### Tham số

- `blob`
  - : {{domxref("Blob")}} hoặc {{domxref("File")}} cần đọc.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
const canvas = document.createElement("canvas");
const height = 200;
const width = 200;

canvas.width = width;
canvas.height = height;

const ctx = canvas.getContext("2d");

ctx.strokeStyle = "#009900";
ctx.beginPath();
ctx.arc(width / 2, height / 2, width / 2 - width / 10, 0, Math.PI * 2);
ctx.stroke();

canvas.toBlob((blob) => {
  const reader = new FileReader();

  reader.onload = () => {
    console.log(reader.result);
  };

  reader.readAsBinaryString(blob);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("FileReader")}}
