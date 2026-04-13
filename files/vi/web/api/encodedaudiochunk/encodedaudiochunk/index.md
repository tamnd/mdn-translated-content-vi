---
title: "EncodedAudioChunk: EncodedAudioChunk() constructor"
short-title: EncodedAudioChunk()
slug: Web/API/EncodedAudioChunk/EncodedAudioChunk
page-type: web-api-constructor
browser-compat: api.EncodedAudioChunk.EncodedAudioChunk
---

{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Hàm khởi tạo **`EncodedAudioChunk()`** tạo một đối tượng {{domxref("EncodedAudioChunk")}} mới đại diện cho một chunk âm thanh đã mã hóa.

## Cú pháp

```js-nolint
new EncodedAudioChunk(options)
```

### Tham số

- `options`
  - : Một đối tượng chứa các thành viên sau:
    - `type`
      - : Cho biết chunk có phải là key chunk không phụ thuộc vào các frame khác để mã hóa không. Một trong:
        - `"key"`: Dữ liệu là key chunk.
        - `"delta"`: Dữ liệu không phải là key chunk.
    - `timestamp`
      - : Một số nguyên đại diện cho timestamp của âm thanh tính bằng micro giây.
    - `duration`
      - : Một số nguyên đại diện cho độ dài của âm thanh tính bằng micro giây.
    - `data`
      - : Một {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, hoặc {{jsxref("DataView")}} chứa dữ liệu âm thanh.
    - `transfer`
      - : Một mảng các {{jsxref("ArrayBuffer")}} mà `EncodedAudioChunk` sẽ tách ra và lấy quyền sở hữu. Nếu mảng chứa {{jsxref("ArrayBuffer")}} sao lưu `data`, `EncodedAudioChunk` sẽ sử dụng trực tiếp buffer đó thay vì sao chép từ nó.

## Ví dụ

Trong ví dụ dưới đây, một `EncodedAudioChunk` mới được tạo.

```js
const init = {
  type: "key",
  data: audioBuffer,
  timestamp: 23000000,
  duration: 2000000,
  transfer: [audioBuffer],
};
chunk = new EncodedAudioChunk(init);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
