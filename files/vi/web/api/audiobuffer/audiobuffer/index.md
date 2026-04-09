---
title: "AudioBuffer: bộ khởi tạo AudioBuffer()"
short-title: AudioBuffer()
slug: Web/API/AudioBuffer/AudioBuffer
page-type: web-api-constructor
browser-compat: api.AudioBuffer.AudioBuffer
---

{{APIRef("Web Audio API")}}

Bộ khởi tạo **`AudioBuffer()`** của [Web Audio API](/en-US/docs/Web/API/Web_Audio_API) tạo một đối tượng {{domxref("AudioBuffer")}} mới.

## Cú pháp

```js-nolint
new AudioBuffer(options)
```

### Tham số

- `options`
  - : Các tùy chọn như sau:
    - `length`
      - : Kích thước của bộ đệm âm thanh tính theo khung mẫu. Để xác định giá trị `length` dùng cho một số giây âm thanh cụ thể, hãy dùng `numSeconds * sampleRate`.
    - `numberOfChannels`
      - : Số lượng kênh của bộ đệm. Giá trị mặc định là 1, và mọi user agent đều bắt buộc phải hỗ trợ ít nhất 32 kênh.
    - `sampleRate`
      - : Tần số lấy mẫu tính bằng Hz cho bộ đệm. Giá trị mặc định là tần số lấy mẫu của `context` được dùng khi xây dựng đối tượng này. User agent bắt buộc phải hỗ trợ các tần số lấy mẫu từ 8.000 Hz đến 96.000 Hz (nhưng được phép hỗ trợ vượt ra ngoài khoảng này).

### Ngoại lệ

- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu một hoặc nhiều tùy chọn có giá trị âm hoặc có giá trị không hợp lệ theo cách khác (chẳng hạn `numberOfChannels` cao hơn mức được hỗ trợ, hoặc `sampleRate` nằm ngoài khoảng danh nghĩa).
- {{jsxref("RangeError")}}
  - : Được ném ra nếu không có đủ bộ nhớ khả dụng để cấp phát bộ đệm.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
