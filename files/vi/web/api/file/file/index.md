---
title: "File: File() constructor"
short-title: File()
slug: Web/API/File/File
page-type: web-api-constructor
browser-compat: api.File.File
---

{{APIRef("File API")}}{{AvailableInWorkers}}

Hàm khởi tạo **`File()`** tạo một phiên bản đối tượng {{domxref("File")}} mới.

## Cú pháp

```js-nolint
new File(fileBits, fileName)
new File(fileBits, fileName, options)
```

### Tham số

- `fileBits`
  - : Một đối tượng [có thể lặp](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol) như {{jsxref("Array")}}, chứa {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, {{jsxref("DataView")}}, {{domxref("Blob")}}, chuỗi hoặc kết hợp bất kỳ các phần tử đó, sẽ được đưa vào {{domxref("File")}}. Lưu ý rằng các chuỗi ở đây được mã hóa theo {{glossary("UTF-8")}}, khác với chuỗi JavaScript thông thường dùng {{glossary("UTF-16")}}.
- `fileName`
  - : Một chuỗi đại diện cho tên tệp hoặc đường dẫn đến tệp.
- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn chứa các thuộc tính tùy chọn cho tệp. Các tùy chọn có sẵn bao gồm:
    - `type` {{optional_inline}}
      - : Một chuỗi đại diện cho kiểu MIME của nội dung sẽ được đưa vào tệp. Mặc định là `""`.
    - `endings` {{optional_inline}}
      - : Cách diễn giải các ký tự xuống dòng (`\n`) trong nội dung, nếu dữ liệu là văn bản. Giá trị mặc định `transparent` sao chép ký tự xuống dòng vào blob mà không thay đổi. Để chuyển đổi xuống dòng theo quy ước của hệ thống máy chủ, hãy chỉ định giá trị `native`.
    - `lastModified` {{optional_inline}}
      - : Một số đại diện cho số mili giây giữa epoch Unix và thời điểm tệp được sửa đổi lần cuối. Mặc định là giá trị của {{jsxref("Date.now()")}}.

## Ví dụ

```js
const file = new File(["foo"], "foo.txt", {
  type: "text/plain",
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("FileReader")}}
- {{domxref("Blob")}}
