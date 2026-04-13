---
title: "InputDeviceCapabilities: firesTouchEvents property"
short-title: firesTouchEvents
slug: Web/API/InputDeviceCapabilities/firesTouchEvents
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.InputDeviceCapabilities.firesTouchEvents
---

{{APIRef("Input Device Capabilities API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`firesTouchEvents`** của giao diện {{domxref("InputDeviceCapabilities")}} trả về một giá trị boolean cho biết thiết bị có gửi sự kiện cảm ứng không.

Bạn có thể dùng thuộc tính này để phát hiện các sự kiện chuột đại diện cho một hành động có thể đã được xử lý bởi các trình xử lý sự kiện cảm ứng. Điều này không nhất thiết có nghĩa là thiết bị là màn hình cảm ứng. Ví dụ, bút stylus và thiết bị chuột thường tạo ra sự kiện cảm ứng trên trình duyệt di động.

## Giá trị

Một {{jsxref('Boolean')}}

## Ví dụ

```js
myButton.addEventListener("mousedown", (e) => {
  if (!e.sourceCapabilities.firesTouchEvents) myButton.classList.add("pressed");
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
