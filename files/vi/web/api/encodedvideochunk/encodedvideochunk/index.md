---
title: "EncodedVideoChunk: EncodedVideoChunk() constructor"
short-title: EncodedVideoChunk()
slug: Web/API/EncodedVideoChunk/EncodedVideoChunk
page-type: web-api-constructor
browser-compat: api.EncodedVideoChunk.EncodedVideoChunk
---

{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Hàm khởi tạo **`EncodedVideoChunk()`** tạo một đối tượng {{domxref("EncodedVideoChunk")}} mới đại diện cho một chunk video đã mã hóa.

## Cú pháp

```js-nolint
new EncodedVideoChunk(options)
```

### Tham số

- `options`
  - : Một đối tượng chứa các thành viên sau:
    - `type`
      - : Cho biết chunk có phải là key chunk không phụ thuộc vào các frame khác để mã hóa không. Một trong:
        - `"key"`: Dữ liệu là key chunk.
        - `"delta"`: Dữ liệu không phải là key chunk.
    - `timestamp`
      - : Một số nguyên đại diện cho timestamp của video tính bằng micro giây.
    - `duration`
      - : Một số nguyên đại diện cho độ dài của video tính bằng micro giây.
    - `data`
      - : Một {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, hoặc {{jsxref("DataView")}} chứa dữ liệu video.
    - `transfer`
      - : Một mảng các {{jsxref("ArrayBuffer")}} mà `EncodedVideoChunk` sẽ tách ra và lấy quyền sở hữu. Nếu mảng chứa {{jsxref("ArrayBuffer")}} sao lưu `data`, `EncodedVideoChunk` sẽ sử dụng trực tiếp buffer đó thay vì sao chép từ nó.

## Ví dụ

Trong ví dụ dưới đây, một `EncodedVideoChunk` mới được tạo.

```js
const init = {
  type: "key",
  data: videoBuffer,
  timestamp: 23000000,
  duration: 2000000,
  transfer: [videoBuffer],
};
chunk = new EncodedVideoChunk(init);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
