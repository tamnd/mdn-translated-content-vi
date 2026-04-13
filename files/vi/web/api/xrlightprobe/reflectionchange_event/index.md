---
title: "XRLightProbe: sự kiện reflectionchange"
short-title: reflectionchange
slug: Web/API/XRLightProbe/reflectionchange_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.XRLightProbe.reflectionchange_event
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Sự kiện WebXR **`reflectionchange`** kích hoạt mỗi khi bản đồ khối phản chiếu ước tính thay đổi. Điều này xảy ra do người dùng di chuyển qua các điều kiện ánh sáng khác nhau hoặc do thay đổi trực tiếp chính ánh sáng. Sự kiện này không thể hủy.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("reflectionchange", (event) => { })

onreflectionchange = (event) => { }
```

## Loại sự kiện

{{domxref("Event")}}.

## Ví dụ

### Sử dụng sự kiện `reflectionchange`

Bất cứ khi nào sự kiện `reflectionchange` kích hoạt trên một light probe, bạn có thể truy xuất một bản đồ khối cập nhật bằng cách gọi {{domxref("XRWebGLBinding.getReflectionCubeMap()")}}. Điều này ít tốn kém hơn so với việc truy xuất thông tin ánh sáng với mỗi {{domxref("XRFrame")}}.

```js
const glBinding = new XRWebGLBinding(xrSession, gl);
const lightProbe = await xrSession.requestLightProbe();
let glCubeMap = glBinding.getReflectionCubeMap(lightProbe);

lightProbe.addEventListener("reflectionchange", () => {
  glCubeMap = glBinding.getReflectionCubeMap(lightProbe);
});
```

### Thuộc tính xử lý sự kiện `onreflectionchange`

Sự kiện `reflectionchange` cũng có sẵn bằng cách sử dụng thuộc tính xử lý sự kiện `onreflectionchange`.

```js
lightProbe.onreflectionchange = (event) => {
  glCubeMap = glBinding.getReflectionCubeMap(lightProbe);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("EventTarget.addEventListener", "addEventListener()")}}
