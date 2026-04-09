---
title: "AudioParam: thuộc tính defaultValue"
short-title: defaultValue
slug: Web/API/AudioParam/defaultValue
page-type: web-api-instance-property
browser-compat: api.AudioParam.defaultValue
---

{{APIRef("Web Audio API")}}

Thuộc tính chỉ đọc **`defaultValue`** của giao diện {{ domxref("AudioParam") }} biểu diễn giá trị ban đầu của các thuộc tính như được định nghĩa bởi {{domxref("AudioNode")}} cụ thể đã tạo ra `AudioParam`.

## Giá trị

Một {{jsxref("Number")}} dấu chấm động.

## Ví dụ

```js
const audioCtx = new AudioContext();
const gainNode = audioCtx.createGain();
const defaultVal = gainNode.gain.defaultValue;
console.log(defaultVal); // 1
console.log(defaultVal === gainNode.gain.value); // true
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
