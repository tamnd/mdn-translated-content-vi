---
title: "ImageDecoder: hàm khởi tạo ImageDecoder()"
short-title: ImageDecoder()
slug: Web/API/ImageDecoder/ImageDecoder
page-type: web-api-constructor
browser-compat: api.ImageDecoder.ImageDecoder
---

{{securecontext_header}}{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Hàm khởi tạo **`ImageDecoder()`** tạo một đối tượng {{domxref("ImageDecoder")}} mới dùng để giải nén và giải mã dữ liệu hình ảnh.

## Cú pháp

```js-nolint
new ImageDecoder(init)
```

### Tham số

- `init`
  - : Một đối tượng chứa các thành viên sau:
    - `type`
      - : Một chuỗi chứa [kiểu MIME](/en-US/docs/Web/HTTP/Guides/MIME_types) của tệp hình ảnh cần giải mã.
    - `data`
      - : Một {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, {{jsxref("DataView")}}, hoặc {{domxref("ReadableStream")}} các byte biểu thị loại hình ảnh đã mã hóa như được mô tả bởi `type`.
    - `premultiplyAlpha` {{optional_inline}}
      - : Chỉ định liệu các kênh màu của hình ảnh đã giải mã có được nhân trước với kênh alpha không. Nếu không được cung cấp, đặt là `"default"`:
        - `"none"`
        - `"premultiply"`
        - `"default"`
    - `colorSpaceConversion` {{optional_inline}}
      - : Chỉ định liệu hình ảnh có được giải mã bằng cách chuyển đổi không gian màu không. Nếu không được cung cấp, đặt là `"default"`. Giá trị `"default"` chỉ ra rằng hành vi cụ thể của quá trình triển khai được sử dụng:
        - `"none"`
        - `"default"`
    - `desiredWidth` {{optional_inline}}
      - : Một số nguyên cho biết chiều rộng mong muốn của đầu ra giải mã. Không có hiệu lực trừ khi codec hình ảnh hỗ trợ giải mã độ phân giải biến đổi.
    - `desiredHeight` {{optional_inline}}
      - : Một số nguyên cho biết chiều cao mong muốn của đầu ra giải mã. Không có hiệu lực trừ khi codec hình ảnh hỗ trợ giải mã độ phân giải biến đổi.
    - `preferAnimation` {{optional_inline}}
      - : Một {{jsxref("Boolean")}} cho biết liệu việc chọn track ban đầu có ưu tiên track động không.
    - `transfer`
      - : Một mảng {{jsxref("ArrayBuffer")}} mà `ImageDecoder` sẽ tách ra và chiếm quyền sở hữu. Nếu mảng chứa {{jsxref("ArrayBuffer")}} hỗ trợ `data`, `ImageDecoder` sẽ sử dụng trực tiếp bộ đệm đó thay vì sao chép từ nó.

## Ví dụ

Ví dụ sau đây tạo một `ImageDecoder` mới với các tùy chọn bắt buộc.

```js
let init = {
  type: "image/png",
  data: imageByteStream,
};

let imageDecoder = new ImageDecoder(init);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
