---
title: "InputDeviceInfo: phương thức getCapabilities()"
short-title: getCapabilities()
slug: Web/API/InputDeviceInfo/getCapabilities
page-type: web-api-instance-method
browser-compat: api.InputDeviceInfo.getCapabilities
---

{{APIRef("Media Capture and Streams")}}{{securecontext_header}}

Phương thức **`getCapabilities()`** của giao diện {{domxref("InputDeviceInfo")}} trả về một đối tượng `MediaTrackCapabilities` mô tả track âm thanh hoặc video chính của {{domxref("MediaStream")}} của thiết bị.

## Cú pháp

```js-nolint
getCapabilities()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng `MediaTrackCapabilities` chỉ định giá trị hoặc phạm vi giá trị được hỗ trợ cho mỗi thuộc tính có thể ràng buộc được hỗ trợ bởi user agent. Nó được yêu cầu trả về thông tin giống hệt như được trả về khi gọi `getCapabilities()` trên {{domxref("MediaStreamTrack")}} đầu tiên cùng `kind` với thiết bị này (video hoặc audio) trong `MediaStream` được trả về bởi `getUserMedia({ deviceId: deviceInfo.deviceId })`.

Xem {{domxref("MediaStreamTrack.getCapabilities()")}} để biết danh sách các thuộc tính thường được hỗ trợ và kiểu của chúng.

> [!NOTE]
> Nếu người dùng chưa cấp quyền truy cập vào thiết bị đầu vào, một đối tượng rỗng sẽ được trả về.

## Ví dụ

Trong ví dụ sau, chúng ta yêu cầu quyền truy cập vào các thiết bị âm thanh và video với {{domxref("mediaDevices.getUserMedia()")}}, vì để sử dụng `getCapabilities()` chúng ta cần quyền truy cập vào các thiết bị.

Nếu `device` là đối tượng `InputDeviceInfo`, thì `getCapabilities()` sẽ trả về một đối tượng với các thành viên đại diện cho khả năng của nó. Luồng video sẽ không bao gồm các thuộc tính tự động như `noiseSuppression`, ví dụ.

```js
// Lấy quyền truy cập thiết bị âm thanh hoặc video
navigator.mediaDevices
  .getUserMedia({ audio: true, video: true })
  // Liệt kê các thiết bị media
  .then(() => navigator.mediaDevices.enumerateDevices())
  .then((devices) => {
    devices.forEach((device) => {
      if (typeof device.getCapabilities === "function") {
        console.log("Capabilities:", device.getCapabilities()); // Một đối tượng MediaTrackCapabilities.
      } else {
        console.log("Device does not support getCapabilities:", device);
      }
    });
  })
  .catch((mediaError) => {
    console.error("Error accessing media devices:", mediaError);
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("MediaStreamTrack.getCapabilities()")}}, cũng trả về một đối tượng `MediaTrackCapabilities`.
