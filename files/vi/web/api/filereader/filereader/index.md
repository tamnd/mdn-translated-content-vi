---
title: "FileReader: hàm khởi tạo FileReader()"
short-title: FileReader()
slug: Web/API/FileReader/FileReader
page-type: web-api-constructor
browser-compat: api.FileReader.FileReader
---

{{APIRef("File API")}}{{AvailableInWorkers}}

Hàm khởi tạo **`FileReader()`** tạo ra một đối tượng `FileReader` mới.

Để biết cách sử dụng `FileReader`, xem [Sử dụng tệp từ ứng dụng web](/en-US/docs/Web/API/File_API/Using_files_from_web_applications).

## Cú pháp

```js-nolint
new FileReader()
```

### Tham số

Không có.

## Ví dụ

Đoạn mã sau minh họa cách tạo đối tượng {{domxref("FileReader")}} bằng hàm khởi tạo `FileReader()` và cách sử dụng đối tượng đó:

```js
function printFile(file) {
  const reader = new FileReader();
  reader.onload = (evt) => {
    console.log(evt.target.result);
  };
  reader.readAsText(file);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng tệp từ ứng dụng web](/en-US/docs/Web/API/File_API/Using_files_from_web_applications)
