---
title: "VRDisplay: phương thức getEyeParameters()"
short-title: getEyeParameters()
slug: Web/API/VRDisplay/getEyeParameters
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.VRDisplay.getEyeParameters
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Phương thức **`getEyeParameters()`** của giao diện {{domxref("VRDisplay")}} trả về đối tượng {{domxref("VREyeParameters")}} chứa các tham số mắt cho mắt được chỉ định.

> [!NOTE]
> Phương thức này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ. Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

## Cú pháp

```js-nolint
getEyeParameters(whichEye)
```

### Tham số

- `whichEye`
  - : Một chuỗi đại diện cho mắt mà bạn muốn lấy tham số. Các giá trị khả dụng là `left` và `right` (được định nghĩa trong [enum VREye](https://w3c.github.io/webvr/spec/1.1/#interface-vreye)).

### Giá trị trả về

Một đối tượng {{domxref("VREyeParameters")}}, hoặc null nếu VR không thể trình chiếu nội dung (ví dụ: {{domxref("VRDisplayCapabilities.canPresent")}} trả về `false`).

## Ví dụ

Xem [`VREyeParameters`](/en-US/docs/Web/API/VREyeParameters#examples) để tham khảo mã ví dụ.

## Thông số kỹ thuật

Phương thức này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn trên đường trở thành tiêu chuẩn nữa.

Cho đến khi tất cả các trình duyệt đã triển khai [WebXR API](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals) mới, khuyến nghị sử dụng các framework như [A-Frame](https://aframe.io/), [Babylon.js](https://www.babylonjs.com/), hoặc [Three.js](https://threejs.org/), hay một [polyfill](https://github.com/immersive-web/webxr-polyfill), để phát triển ứng dụng WebXR hoạt động trên tất cả các trình duyệt. Đọc hướng dẫn [Porting from WebVR to WebXR của Meta](https://developers.meta.com/horizon/documentation/web/port-vr-xr/) để biết thêm thông tin.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
