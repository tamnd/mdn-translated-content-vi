---
title: VRFieldOfView
slug: Web/API/VRFieldOfView
page-type: web-api-interface
status:
  - deprecated
  - non-standard
browser-compat: api.VRFieldOfView
---

{{APIRef("WebVR API")}}{{Deprecated_header}}{{Non-standard_header}}

Giao diện **`VRFieldOfView`** của [WebVR API](/en-US/docs/Web/API/WebVR_API) biểu diễn một trường nhìn được xác định bởi 4 giá trị góc khác nhau mô tả tầm nhìn từ một điểm trung tâm.

> [!NOTE]
> Giao diện này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ. Nó đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/).

## Thuộc tính phiên bản

- {{domxref("VRFieldOfView.upDegrees")}} {{deprecated_inline}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Số độ mà trường nhìn mở rộng lên trên.
- {{domxref("VRFieldOfView.rightDegrees")}} {{deprecated_inline}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Số độ mà trường nhìn mở rộng sang phải.
- {{domxref("VRFieldOfView.downDegrees")}} {{deprecated_inline}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Số độ mà trường nhìn mở rộng xuống dưới.
- {{domxref("VRFieldOfView.leftDegrees")}} {{deprecated_inline}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Số độ mà trường nhìn mở rộng sang trái.

## Ví dụ

```js
const info = document.querySelector("p");
const list = document.querySelector("ul");
let vrDisplay;

if (navigator.getVRDisplays) {
  reportFieldOfView();
} else {
  info.textContent = "WebVR API not supported by this browser.";
}

function reportFieldOfView() {
  navigator.getVRDisplays().then((displays) => {
    vrDisplay = displays[0];
    const lEye = vrDisplay.getEyeParameters("left");
    const rEye = vrDisplay.getEyeParameters("right");
    // lEye and rEye are VREyeParameters objects

    const lFOV = lEye.fieldOfView;
    const rFOV = rEye.fieldOfView;
    // lFOV and rFOV are VRFieldOfView objects

    const listitem1 = document.createElement("li");
    const listitem2 = document.createElement("li");

    listitem1.innerText = `
Offset: ${lEye.offset}
Render width: ${lEye.renderWidth}
Render height: ${lEye.renderHeight}
Up degrees: ${lFOV.upDegrees}
Right degrees: ${lFOV.rightDegrees}
Down degrees: ${lFOV.downDegrees}
Left degrees: ${lFOV.leftDegrees}`;
    listitem1.insertBefore(
      document.createElement("strong"),
      listitem1.firstChild,
    ).textContent = "Left eye parameters";

    listitem2.innerText = `
Offset: ${rEye.offset}
Render width: ${rEye.renderWidth}
Render height: ${rEye.renderHeight}
Up degrees: ${rFOV.upDegrees}
Right degrees: ${rFOV.rightDegrees}
Down degrees: ${rFOV.downDegrees}
Left degrees: ${rFOV.leftDegrees}`;
    listitem2.insertBefore(
      document.createElement("strong"),
      listitem2.firstChild,
    ).textContent = "Right eye parameters";

    list.appendChild(listitem1);
    list.appendChild(listitem2);
  });
}
```

## Thông số kỹ thuật

Giao diện này là một phần của [WebVR API](https://immersive-web.github.io/webvr/spec/1.1/) cũ đã được thay thế bởi [WebXR Device API](https://immersive-web.github.io/webxr/). Nó không còn được theo dõi để trở thành tiêu chuẩn.

Cho đến khi tất cả trình duyệt triển khai [WebXR APIs](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals) mới, nên dựa vào các framework như [A-Frame](https://aframe.io/), [Babylon.js](https://www.babylonjs.com/), hoặc [Three.js](https://threejs.org/), hoặc một [polyfill](https://github.com/immersive-web/webxr-polyfill), để phát triển ứng dụng WebXR hoạt động trên tất cả trình duyệt.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
