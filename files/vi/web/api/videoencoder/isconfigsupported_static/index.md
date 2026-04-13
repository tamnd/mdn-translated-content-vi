---
title: "VideoEncoder: phương thức tĩnh isConfigSupported()"
short-title: isConfigSupported()
slug: Web/API/VideoEncoder/isConfigSupported_static
page-type: web-api-static-method
browser-compat: api.VideoEncoder.isConfigSupported_static
---

{{APIRef("WebCodecs API")}}{{SecureContext_Header}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức tĩnh **`isConfigSupported()`** của giao diện {{domxref("VideoEncoder")}} kiểm tra xem {{domxref("VideoEncoder")}} có thể được cấu hình thành công với cấu hình đã cho không.

## Cú pháp

```js-nolint
VideoEncoder.isConfigSupported(config)
```

### Tham số

- `config`
  - : Đối tượng dictionary được chấp nhận bởi {{domxref("VideoEncoder.configure")}}

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với một đối tượng chứa các thành viên sau:

- `supported`
  - : Một giá trị boolean là `true` nếu cấu hình đã cho được bộ mã hóa hỗ trợ.
- `config`
  - : Một bản sao của cấu hình đã cho với tất cả các trường được bộ mã hóa nhận ra.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Ném ra nếu `config` được cung cấp không hợp lệ; tức là không có các giá trị bắt buộc (như trường `codec` trống) hoặc có giá trị không hợp lệ (như `width` âm).

## Ví dụ

Ví dụ sau đây kiểm tra xem trình duyệt có hỗ trợ các phiên bản tăng tốc và không tăng tốc của một số codec video không.

```js
const codecs = [
  "avc1.420034",
  "hvc1.1.6.L123.00",
  "vp8",
  "vp09.00.10.08",
  "av01.0.04M.08",
];
const accelerations = ["prefer-hardware", "prefer-software"];

const configs = [];
for (const codec of codecs) {
  for (const acceleration of accelerations) {
    configs.push({
      codec,
      hardwareAcceleration: acceleration,
      width: 1280,
      height: 720,
      bitrate: 2_000_000,
      bitrateMode: "constant",
      framerate: 30,
      not_supported_field: 123,
    });
  }
}

for (const config of configs) {
  const support = await VideoEncoder.isConfigSupported(config);
  console.log(
    `VideoEncoder's config ${JSON.stringify(support.config)} support: ${
      support.supported
    }`,
  );
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("VideoEncoder.configure()")}}
- [Codec String Support Table](https://webcodecsfundamentals.org/datasets/codec-support-table/)
