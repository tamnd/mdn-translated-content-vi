---
title: "DevicePosture: thuộc tính type"
short-title: type
slug: Web/API/DevicePosture/type
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.DevicePosture.type
---

{{APIRef("Device Posture API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`type`** của giao diện {{domxref("DevicePosture")}} trả về tư thế hiện tại của thiết bị.

## Giá trị

Một chuỗi đại diện cho tư thế hiện tại của thiết bị. Giá trị có thể là một trong các giá trị sau:

- `continuous`
  - : Chỉ ra tư thế màn hình phẳng, bao gồm thiết bị có thể gập khi đang sử dụng ở dạng phẳng, màn hình cong liền mạch, hoặc màn hình máy tính để bàn, laptop, máy tính bảng hoặc điện thoại thông thường.
- `folded`
  - : Chỉ ra tư thế màn hình gập, bao gồm thiết bị có thể gập đang được sử dụng ở dạng sách hoặc laptop.

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
