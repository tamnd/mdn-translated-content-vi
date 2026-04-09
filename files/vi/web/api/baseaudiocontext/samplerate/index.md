---
title: "BaseAudioContext: thuộc tính sampleRate"
short-title: sampleRate
slug: Web/API/BaseAudioContext/sampleRate
page-type: web-api-instance-property
browser-compat: api.BaseAudioContext.sampleRate
---

{{ APIRef("Web Audio API") }}

Thuộc tính `sampleRate` của giao diện {{domxref("BaseAudioContext")}} trả về một số dấu phẩy động biểu diễn tốc độ lấy mẫu, tính theo số mẫu mỗi giây, được dùng bởi mọi node trong audio context này.
Hạn chế này có nghĩa là các bộ chuyển đổi tốc độ lấy mẫu không được hỗ trợ.

## Giá trị

Một số dấu phẩy động biểu thị tốc độ lấy mẫu của audio context, tính theo số mẫu mỗi giây.

## Ví dụ

> [!NOTE]
> Để xem ví dụ triển khai Web Audio đầy đủ, hãy xem một trong các
> Web Audio Demo trên [repo GitHub của MDN](https://github.com/mdn/webaudio-examples). Hãy thử nhập
> `audioCtx.sampleRate` vào console của trình duyệt.

```js
const audioCtx = new AudioContext();
// Các trình duyệt webkit/blink cũ yêu cầu tiền tố

// …

console.log(audioCtx.sampleRate);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
