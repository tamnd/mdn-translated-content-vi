---
title: "DevicePosture: sự kiện change"
short-title: change
slug: Web/API/DevicePosture/change_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.DevicePosture.change_event
---

{{APIRef("Device Posture API")}}{{SeeCompatTable}}

Sự kiện **`change`** của giao diện {{domxref("DevicePosture")}} được kích hoạt khi tư thế của thiết bị thay đổi, ví dụ khi một thiết bị có thể gập từ tư thế `folded` sang tư thế `continuous`.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("change", (event) => { })

onchange = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} tổng quát.

## Ví dụ

```js
const postureOutput = document.getElementById("currentPosture");

function reportPostureOutput() {
  // type property returns "continuous" or "folded"
  postureOutput.textContent = `Device posture: ${navigator.devicePosture.type}`;
}

navigator.devicePosture.addEventListener("change", reportPostureOutput);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- CSS {{cssxref("@media/device-posture", "device-posture")}} `@media` feature
- [Device Posture API](/en-US/docs/Web/API/Device_Posture_API)
- [Origin trial for Foldable APIs](https://developer.chrome.com/blog/foldable-apis-ot) on developer.chrome.com (2024)
