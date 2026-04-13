---
title: "HMDVRDevice: getEyeParameters() method"
short-title: getEyeParameters()
slug: Web/API/HMDVRDevice/getEyeParameters
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.HMDVRDevice.getEyeParameters
---

{{deprecated_header}}{{APIRef("WebVR API")}}{{Non-standard_header}}

Phương thức **`getEyeParameters()`** của giao diện {{domxref("HMDVRDevice")}} trả về các tham số hiện tại cho mắt được chỉ định trong tham số của nó ("left" hoặc "right"), được lưu trong một đối tượng {{domxref("VREyeParameters")}}.

Bao gồm thông tin trường nhìn và nhiều hơn nữa.

## Cú pháp

```js-nolint
getEyeParameters(whichEye)
```

### Tham số

- `whichEye`
  - : Một chuỗi đại diện cho mắt mà bạn muốn trả về thông tin. Giá trị có thể là `left` hoặc `right`.

### Giá trị trả về

Một đối tượng {{domxref("VREyeParameters")}}.

## Ví dụ

Ví dụ sau được lấy từ code [threejs-vr-boilerplate](https://github.com/MozillaReality/vr-web-examples/tree/master/threejs-vr-boilerplate) của Mozilla VR Team, cụ thể là [tệp VREffect.js](https://github.com/MozillaReality/vr-web-examples/blob/master/threejs-vr-boilerplate/js/VREffect.js). Đầu code, phương thức `getEyeParameters()` được dùng để truy cập thông tin về từng mắt, sau đó được dùng cho các tính toán kết xuất.

```js
if (vrHMD.getEyeParameters !== undefined) {
  const eyeParamsL = vrHMD.getEyeParameters("left");
  const eyeParamsR = vrHMD.getEyeParameters("right");

  eyeTranslationL = eyeParamsL.eyeTranslation;
  eyeTranslationR = eyeParamsR.eyeTranslation;
  eyeFOVL = eyeParamsL.recommendedFieldOfView;
  eyeFOVR = eyeParamsR.recommendedFieldOfView;
} else {
  // …
}
```

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVR API](/en-US/docs/Web/API/WebVR_API)
