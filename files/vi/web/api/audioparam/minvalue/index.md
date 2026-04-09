---
title: "AudioParam: thuộc tính minValue"
short-title: minValue
slug: Web/API/AudioParam/minValue
page-type: web-api-instance-property
browser-compat: api.AudioParam.minValue
---

{{APIRef("Web Audio API")}}

Thuộc tính chỉ đọc **`minValue`** của giao diện {{domxref("AudioParam")}} biểu diễn giá trị nhỏ nhất có thể có đối với phạm vi danh nghĩa (hiệu dụng) của tham số.

## Giá trị

Một {{jsxref("Number")}} dấu chấm động chỉ ra giá trị nhỏ nhất được phép đối với phạm vi danh nghĩa của tham số.

Giá trị mặc định của `minValue` là giá trị dấu chấm động đơn chính xác âm nhỏ nhất (-340,282,346,638,528,859,811,704,183,484,516,925,440).

## Ví dụ

```js
const audioCtx = new AudioContext();
const gainNode = audioCtx.createGain();
console.log(gainNode.gain.minValue); // -3.4028234663852886e38
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("AudioParam.maxValue")}}
