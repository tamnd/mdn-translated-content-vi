---
title: "AudioEncoder: phương thức tĩnh isConfigSupported()"
short-title: isConfigSupported()
slug: Web/API/AudioEncoder/isConfigSupported_static
page-type: web-api-static-method
browser-compat: api.AudioEncoder.isConfigSupported_static
---

{{APIRef("WebCodecs API")}}{{SecureContext_Header}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức tĩnh **`isConfigSupported()`** của giao diện {{domxref("AudioEncoder")}} kiểm tra liệu cấu hình đã cho có được hỗ trợ hay không (tức là liệu các đối tượng {{domxref("AudioEncoder")}} có thể được cấu hình thành công bằng cấu hình đó hay không).

## Cú pháp

```js-nolint
AudioEncoder.isConfigSupported(config)
```

### Tham số

- `config`
  - : Đối tượng từ điển được chấp nhận bởi {{domxref("AudioEncoder.configure")}}

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với một đối tượng chứa các thành viên sau:

- `supported`
  - : Một giá trị boolean là `true` nếu cấu hình đã cho được bộ mã hóa hỗ trợ.
- `config`
  - : Một bản sao của cấu hình đã cho với mọi trường được bộ mã hóa nhận biết.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `config` được cung cấp không hợp lệ; tức là không có các giá trị bắt buộc (chẳng hạn trường `codec` rỗng) hoặc có các giá trị không hợp lệ (chẳng hạn `sampleRate` âm).

## Ví dụ

Ví dụ sau kiểm tra xem trình duyệt có hỗ trợ một số codec âm thanh hay không.

```js
const codecs = ["mp4a.40.2", "mp3", "alaw", "ulaw"];
const configs = [];
for (const codec of codecs) {
  configs.push({
    codec,
    sampleRate: 48000,
    numberOfChannels: 1,
    not_supported_field: 123,
  });
}
for (const config of configs) {
  const support = await AudioEncoder.isConfigSupported(config);
  console.log(
    `AudioEncoder's config ${JSON.stringify(support.config)} support: ${
      support.supported
    }`,
  );
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
