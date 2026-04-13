---
title: "VRDisplay: thuộc tính isPresenting"
short-title: isPresenting
slug: Web/API/VRDisplay/isPresenting
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.VRDisplay.isPresenting
---

{{APIRef("WebVR API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Thuộc tính chỉ đọc **`isPresenting`** của giao diện {{domxref("VRDisplay")}} trả về một giá trị boolean cho biết `VRDisplay` hiện có đang trình chiếu nội dung hay không.

> [!NOTE]
> Thuộc tính này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ. Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

## Giá trị

Một giá trị boolean; `true` nghĩa là màn hình đang trình chiếu; `false` nghĩa là không.

## Ví dụ

```js
function onVRExitPresent() {
  // No sense in exiting presentation if we're not actually presenting.
  // (This may happen if we get an event like vrdisplaydeactivate when
  // we weren't presenting.)
  if (!vrDisplay.isPresenting) return;
  vrDisplay.exitPresent().then(
    () => {
      // Nothing to do because we're handling things in onVRPresentChange.
    },
    (err) => {
      let errMsg = "exitPresent failed.";
      if (err && err.message) {
        errMsg += `<br/>${err.message}`;
      }
      VRSamplesUtil.addError(errMsg, 2000);
    },
  );
}
```

> [!NOTE]
> Đoạn mã được lấy từ [demo VR Presentation của Google](https://github.com/toji/webvr.info/blob/master/samples/03-vr-presentation.html).

## Thông số kỹ thuật

Thuộc tính này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn trên đường trở thành tiêu chuẩn nữa.

Cho đến khi tất cả các trình duyệt đã triển khai [WebXR API](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals) mới, khuyến nghị sử dụng các framework như [A-Frame](https://aframe.io/), [Babylon.js](https://www.babylonjs.com/), hoặc [Three.js](https://threejs.org/), hay một [polyfill](https://github.com/immersive-web/webxr-polyfill), để phát triển ứng dụng WebXR hoạt động trên tất cả các trình duyệt. Đọc hướng dẫn [Porting from WebVR to WebXR của Meta](https://developers.meta.com/horizon/documentation/web/port-vr-xr/) để biết thêm thông tin.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
