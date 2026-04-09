---
title: "AudioParam: thuộc tính maxValue"
short-title: maxValue
slug: Web/API/AudioParam/maxValue
page-type: web-api-instance-property
browser-compat: api.AudioParam.maxValue
---

{{APIRef("Web Audio API")}}

Thuộc tính chỉ đọc **`maxValue`** của giao diện {{domxref("AudioParam")}} biểu diễn giá trị lớn nhất có thể có đối với phạm vi danh nghĩa (hiệu dụng) của tham số.

## Giá trị

Một {{jsxref("Number")}} dấu chấm động chỉ ra giá trị lớn nhất được phép đối với phạm vi danh nghĩa của tham số.

Giá trị mặc định của `maxValue` là giá trị dấu chấm động đơn chính xác dương lớn nhất (+340,282,346,638,528,859,811,704,183,484,516,925,440).

## Ví dụ

```js
const audioCtx = new AudioContext();
const gainNode = audioCtx.createGain();
console.log(gainNode.gain.maxValue); // 3.4028234663852886e38
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("AudioParam.minValue")}}
