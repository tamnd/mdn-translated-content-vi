---
title: "Blob: hàm tạo Blob()"
short-title: Blob()
slug: Web/API/Blob/Blob
page-type: web-api-constructor
browser-compat: api.Blob.Blob
---

{{APIRef("File API")}}{{AvailableInWorkers}}

Hàm tạo **`Blob()`** trả về một đối tượng {{domxref("Blob")}} mới. Nội dung của blob là phần nối của các giá trị được cung cấp trong tham số `blobParts`.

## Cú pháp

```js-nolint
new Blob(blobParts)
new Blob(blobParts, options)
```

### Tham số

- `blobParts` {{optional_inline}}
  - : Một đối tượng [iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol) chẳng hạn như {{jsxref("Array")}}, chứa các {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, {{jsxref("DataView")}}, {{domxref("Blob")}}, chuỗi, hoặc pha trộn bất kỳ kiểu phần tử nào như vậy; các phần tử này sẽ được đưa vào trong {{domxref("Blob")}}. Chuỗi phải là Unicode hợp lệ và các surrogate đơn lẻ sẽ được làm sạch bằng cùng thuật toán như {{jsxref("String.prototype.toWellFormed()")}}.

- `options` {{optional_inline}}
  - : Một đối tượng có thể chỉ định bất kỳ thuộc tính nào sau đây:
    - `type` {{optional_inline}}
      - : {{Glossary("MIME type")}} của dữ liệu sẽ được lưu vào blob. Giá trị mặc định là chuỗi rỗng (`""`).
    - `endings` {{optional_inline}}
      - : Cách diễn giải ký tự xuống dòng (`\n`) trong nội dung nếu dữ liệu là văn bản. Giá trị mặc định là `transparent`, sao chép các ký tự xuống dòng vào blob mà không thay đổi. Để chuyển các ký tự xuống dòng sang quy ước gốc của hệ thống máy chủ, chỉ định giá trị `native`.

### Giá trị trả về

Một đối tượng {{domxref("Blob")}} mới chứa dữ liệu được chỉ định.

## Ví dụ

```js
const blobParts = ['<q id="a"><span id="b">hey!</span></q>']; // một mảng chỉ gồm một chuỗi
const blob = new Blob(blobParts, { type: "text/html" }); // blob
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
