---
title: InputDeviceInfo
slug: Web/API/InputDeviceInfo
page-type: web-api-interface
browser-compat: api.InputDeviceInfo
---

{{APIRef("Media Capture and Streams")}}{{securecontext_header}}

Giao diện **`InputDeviceInfo`** của {{domxref("Media Capture and Streams API", "", "", "nocode")}} cung cấp quyền truy cập vào các khả năng của thiết bị đầu vào mà nó đại diện.

Các đối tượng `InputDeviceInfo` được trả về bởi {{domxref("MediaDevices.enumerateDevices()")}} nếu thiết bị được trả về là thiết bị đầu vào âm thanh hoặc video.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Cũng kế thừa các thuộc tính từ giao diện cha, {{DOMxRef("MediaDeviceInfo")}}._

## Phương thức phiên bản

_Cũng kế thừa các phương thức từ giao diện cha, {{DOMxRef("MediaDeviceInfo")}}._

- {{domxref("InputDeviceInfo.getCapabilities()")}}
  - : Trả về một đối tượng `MediaTrackCapabilities` mô tả track âm thanh hoặc video chính của `MediaStream` của thiết bị.

## Ví dụ

Ví dụ sau lấy tất cả các thiết bị media với {{domxref("MediaDevices.enumerateDevices()")}}. Nếu bất kỳ thiết bị nào là thiết bị đầu vào, `console.log(device)` sẽ in một đối tượng `InputDeviceInfo` vào bảng điều khiển.

```js
navigator.mediaDevices.enumerateDevices().then((devices) => {
  devices.forEach((device) => {
    console.log(device); // một đối tượng InputDeviceInfo nếu thiết bị là thiết bị đầu vào, ngược lại là đối tượng MediaDeviceInfo.
  });
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
