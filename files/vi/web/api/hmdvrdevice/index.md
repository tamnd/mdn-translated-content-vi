---
title: HMDVRDevice
slug: Web/API/HMDVRDevice
page-type: web-api-interface
status:
  - deprecated
  - non-standard
browser-compat: api.HMDVRDevice
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Giao diện **`HMDVRDevice`** của [WebVR API](/en-US/docs/Web/API/WebVR_API) đại diện cho một màn hình đội đầu, cung cấp quyền truy cập thông tin về mỗi mắt và cho phép chúng ta sửa đổi trường nhìn hiện tại.

## Phương thức phiên bản

- {{domxref("HMDVRDevice.getEyeParameters()")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Trả về các tham số hiện tại cho mắt được chỉ định trong tham số của nó ("left" hoặc "right"), chẳng hạn như thông tin trường nhìn, được lưu trong một đối tượng {{domxref("VREyeParameters")}}.
- {{domxref("HMDVRDevice.setFieldOfView()")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Đặt trường nhìn cho cả hai mắt.

## Thuộc tính phiên bản

_Giao diện này không định nghĩa bất kỳ thuộc tính riêng nào, nhưng nó kế thừa các thuộc tính của giao diện cha, {{domxref("VRDisplay")}}._

- `VRDisplay.hardwareUnitId` {{ReadOnlyInline}}
  - : Trả về ID phần cứng riêng biệt cho đơn vị phần cứng tổng thể mà `VRDevice` này là một phần. Tất cả các thiết bị là một phần của cùng một phần cứng vật lý sẽ có cùng `hardwareUnitId`.
- {{domxref("VRDisplay.displayId")}} {{ReadOnlyInline}}
  - : Trả về ID cho `VRDevice` cụ thể này. ID không nên thay đổi qua các lần khởi động lại trình duyệt, cho phép lưu dữ liệu cấu hình dựa trên nó.
- {{domxref("VRDisplay.displayName")}} {{ReadOnlyInline}}
  - : Tên có thể đọc được của con người để nhận dạng `VRDevice`.

## Ví dụ

Ví dụ sau, lấy từ thông số kỹ thuật WebVR, tìm `HMDVRDevice` đầu tiên có sẵn và {{domxref("PositionSensorVRDevice")}} liên quan của nó, nếu có.

```js
navigator.getVRDevices().then((devices) => {
  for (const device of devices) {
    if (device instanceof HMDVRDevice) {
      gHMD = device;
      break;
    }
  }

  if (gHMD) {
    for (const device of devices) {
      if (
        device instanceof PositionSensorVRDevice &&
        device.hardwareUnitId === gHMD.hardwareUnitId
      ) {
        gPositionSensor = devices[i];
        break;
      }
    }
  }
});
```

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
