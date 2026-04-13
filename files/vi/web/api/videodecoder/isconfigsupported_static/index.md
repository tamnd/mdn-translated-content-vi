---
title: "VideoDecoder: phương thức tĩnh isConfigSupported()"
short-title: isConfigSupported()
slug: Web/API/VideoDecoder/isConfigSupported_static
page-type: web-api-static-method
browser-compat: api.VideoDecoder.isConfigSupported_static
---

{{APIRef("WebCodecs API")}}{{SecureContext_Header}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức tĩnh **`isConfigSupported()`** của giao diện {{domxref("VideoDecoder")}} kiểm tra xem cấu hình đã cho có được hỗ trợ không (tức là liệu các đối tượng {{domxref("VideoDecoder")}} có thể được cấu hình thành công với cấu hình đã cho không).

## Cú pháp

```js-nolint
VideoDecoder.isConfigSupported(config)
```

### Tham số

- `config`
  - : Đối tượng dictionary được chấp nhận bởi {{domxref("VideoDecoder.configure")}}

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với một đối tượng chứa các thành viên sau:

- `supported`
  - : Một giá trị boolean là `true` nếu cấu hình đã cho được bộ giải mã hỗ trợ.
- `config`
  - : Một bản sao của cấu hình đã cho với tất cả các trường được bộ giải mã nhận ra.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Ném ra nếu `config` được cung cấp không hợp lệ; tức là không có các giá trị bắt buộc (như trường `codec` trống) hoặc có giá trị không hợp lệ (như `codedWidth` âm).

## Ví dụ

Ví dụ sau đây kiểm tra xem trình duyệt có hỗ trợ các phiên bản tăng tốc và không tăng tốc của một số codec video không.

```js
const codecs = [
  "avc1.42001E",
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
      codedWidth: 1280,
      codedHeight: 720,
      not_supported_field: 123,
    });
  }
}

for (const config of configs) {
  const support = await VideoDecoder.isConfigSupported(config);
  console.log(
    `VideoDecoder's config ${JSON.stringify(support.config)} support: ${
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

- {{domxref("VideoDecoder.configure()")}}
- [Codec String Support Table](https://webcodecsfundamentals.org/datasets/codec-support-table/)
