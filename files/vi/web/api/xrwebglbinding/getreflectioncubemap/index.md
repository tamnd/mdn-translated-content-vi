---
title: "XRWebGLBinding: phương thức getReflectionCubeMap()"
short-title: getReflectionCubeMap()
slug: Web/API/XRWebGLBinding/getReflectionCubeMap
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRWebGLBinding.getReflectionCubeMap
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Phương thức **`getReflectionCubeMap()`** của giao diện {{domxref("XRWebGLBinding")}} trả về đối tượng {{domxref("WebGLTexture")}} chứa kết cấu bản đồ khối phản chiếu.

Định dạng kết cấu được xác định bởi `reflectionFormat` của phiên. Xem tham số `options` trên {{domxref("XRSession.requestLightProbe()")}} và {{domxref("XRSession.preferredReflectionFormat")}} để biết thêm chi tiết. Theo mặc định, định dạng `srgba8` được sử dụng. Khi sử dụng định dạng `rgba16f`, bạn cần phải nằm trong ngữ cảnh WebGL 2.0 hoặc kích hoạt phần mở rộng {{domxref("OES_texture_half_float")}} trong các ngữ cảnh WebGL 1.0.

## Cú pháp

```js-nolint
getReflectionCubeMap(lightProbe)
```

### Tham số

- `lightProbe`
  - : Đối tượng {{domxref("XRLightProbe")}} được trả về khi gọi {{domxref("XRSession.requestLightProbe()")}}.

### Giá trị trả về

Đối tượng {{domxref("WebGLTexture")}}.

## Ví dụ

Thông thường bạn gọi `getReflectionCubeMap()` bất cứ khi nào sự kiện `reflectionchange` được kích hoạt trên một light probe để lấy bản đồ khối được cập nhật. Điều này ít tốn kém hơn so với việc lấy thông tin ánh sáng với mỗi {{domxref("XRFrame")}}.

Nếu định dạng `rgba16f` được sử dụng, hãy kích hoạt phần mở rộng {{domxref("OES_texture_half_float")}} trong các ngữ cảnh WebGL 1.0.

```js
const glBinding = new XRWebGLBinding(xrSession, gl);
gl.getExtension("OES_texture_half_float"); // nếu rgba16f là preferredReflectionFormat

xrSession.requestLightProbe().then((lightProbe) => {
  lightProbe.addEventListener("reflectionchange", () => {
    glBinding.getReflectionCubeMap(lightProbe);
  });
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRLightProbe")}}
- {{domxref("OES_texture_half_float")}}
