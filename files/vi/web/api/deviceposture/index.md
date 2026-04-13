---
title: DevicePosture
slug: Web/API/DevicePosture
page-type: web-api-interface
status:
  - experimental
browser-compat: api.DevicePosture
---

{{APIRef("Device Posture API")}}{{SeeCompatTable}}

Giao diện **`DevicePosture`** của {{domxref("Device Posture API", "Device Posture API", "", "nocode")}} đại diện cho tư thế của thiết bị, tức là liệu khung nhìn có ở trạng thái phẳng hay gập hay không.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ lớp cha {{DOMxRef("EventTarget")}}._

- {{domxref("DevicePosture.type", "type")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về tư thế hiện tại của thiết bị.

## Sự kiện

- {{domxref("DevicePosture.change_event", "change")}} {{Experimental_Inline}}
  - : Kích hoạt khi tư thế của thiết bị thay đổi.

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
