---
title: "Navigator: thuộc tính devicePosture"
short-title: devicePosture
slug: Web/API/Navigator/devicePosture
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.Navigator.devicePosture
---

{{APIRef("Device Posture API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`Navigator.devicePosture`** trả về đối tượng {{domxref("DevicePosture")}} của trình duyệt, cho phép nhà phát triển truy vấn tư thế hiện tại của thiết bị (nghĩa là, khung nhìn ở trạng thái phẳng hay gập) và chạy mã để phản hồi các thay đổi về tư thế.

## Giá trị

Đối tượng {{domxref("DevicePosture")}}.

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

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DevicePosture")}}
- {{domxref("devicePosture.type")}}
- [Device Posture API](/en-US/docs/Web/API/Device_Posture_API)
- Tính năng CSS {{cssxref("@media/device-posture", "device-posture")}} `@media`
