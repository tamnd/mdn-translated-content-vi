---
title: XRLightProbe
slug: Web/API/XRLightProbe
page-type: web-api-interface
status:
  - experimental
browser-compat: api.XRLightProbe
---

{{APIRef("WebXR Device API")}} {{secureContext_header}}{{SeeCompatTable}}

Giao diện **`XRLightProbe`** của [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API) chứa thông tin ánh sáng tại một điểm nhất định trong môi trường của người dùng. Bạn có thể lấy một đối tượng `XRLighting` bằng cách sử dụng phương thức {{domxref("XRSession.requestLightProbe()")}}.

Đối tượng này tự nó không chứa các giá trị ánh sáng, nhưng được sử dụng để thu thập trạng thái ánh sáng cho mỗi {{domxref("XRFrame")}}. Xem {{domxref("XRLightEstimate")}} để biết các giá trị ánh sáng ước tính cho một `XRLightProbe`.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- `XRLightProbe.onreflectionchange`
  - : Thuộc tính xử lý sự kiện cho sự kiện {{domxref("XRLightProbe.reflectionchange_event", "reflectionchange")}}.
- {{domxref("XRLightProbe.probeSpace")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một {{domxref("XRSpace")}} theo dõi vị trí và hướng mà các ước tính ánh sáng có liên quan đến.

## Phương thức phiên bản

Không có.

## Sự kiện

- {{domxref("XRLightProbe.reflectionchange_event", "reflectionchange")}} {{Experimental_Inline}}
  - : Được kích hoạt mỗi khi bản đồ khối phản chiếu ước tính thay đổi. (Điều này xảy ra khi người dùng di chuyển xung quanh và ánh sáng của môi trường thay đổi.)

## Ví dụ

### Lấy đối tượng `XRLightProbe` cho một phiên

Sử dụng phương thức {{domxref("XRSession.requestLightProbe()")}} để lấy một light probe.

```js
const lightProbe = await xrSession.requestLightProbe();
```

### Lấy tư thế probe trong một `XRFrame`

Truyền `probeSpace` của light probe vào {{domxref("XRFrame.getPose()")}} để lấy một light probe cho một tư thế.

```js
const probePose = xrFrame.getPose(lightProbe.probeSpace, xrReferenceSpace);
```

### Sử dụng sự kiện `reflectionchange`

Truyền `XRLightProbe` để lấy một bản đồ khối phản chiếu bất cứ khi nào sự kiện {{domxref("XRLightProbe.reflectionchange_event", "reflectionchange")}} kích hoạt. Xem thêm {{domxref("XRWebGLBinding.getReflectionCubeMap()")}}.

```js
const glBinding = new XRWebGLBinding(xrSession, gl);
const lightProbe = await xrSession.requestLightProbe();
let glCubeMap = glBinding.getReflectionCubeMap(lightProbe);

lightProbe.addEventListener("reflectionchange", () => {
  glCubeMap = glBinding.getReflectionCubeMap(lightProbe);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRSession.requestLightProbe()")}}
