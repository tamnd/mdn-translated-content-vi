---
title: "XRSession: phương thức updateRenderState()"
short-title: updateRenderState()
slug: Web/API/XRSession/updateRenderState
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRSession.updateRenderState
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức `updateRenderState()` của giao diện {{DOMxRef("XRSession")}} trong [WebXR API](/en-US/docs/Web/API/WebXR_Device_API) lên lịch các thay đổi được áp dụng cho trạng thái kết xuất đang hoạt động ({{domxref("XRRenderState")}}) trước khi kết xuất khung hình tiếp theo.

## Cú pháp

```js-nolint
updateRenderState()
updateRenderState(state)
```

### Tham số

- `state` {{Optional_Inline}}
  - : Một đối tượng tùy chọn để cấu hình {{domxref("XRRenderState")}}. Nếu không cung cấp, cấu hình mặc định sẽ được sử dụng.
    - `baseLayer` {{Optional_Inline}}: Một đối tượng {{domxref("XRWebGLLayer")}} mà bộ tổng hợp WebXR sẽ lấy hình ảnh từ đó. Mặc định là `null`. Để chỉ định các lớp khác (hoặc nhiều lớp), xem tùy chọn `layers`.
    - `depthFar` {{Optional_Inline}}: Một giá trị dấu phẩy động chỉ định khoảng cách tính bằng mét từ người xem đến mặt phẳng cắt xa, là một mặt phẳng song song với bề mặt hiển thị mà ngoài ra không có kết xuất nào khác sẽ xảy ra. Tất cả kết xuất sẽ diễn ra giữa các khoảng cách được chỉ định bởi `depthNear` và `depthFar`. Mặc định là 1000 mét (1 kilômét).
    - `depthNear` {{Optional_Inline}}: Một giá trị dấu phẩy động cho biết khoảng cách tính bằng mét từ người xem đến một mặt phẳng song song với bề mặt hiển thị làm **mặt phẳng cắt gần**. Không có phần nào của cảnh ở phía người dùng của mặt phẳng này sẽ được kết xuất. Mặc định là 0.1 mét (10 xentimét).
    - `inlineVerticalFieldOfView` {{Optional_Inline}}: Một giá trị dấu phẩy động cho biết trường nhìn mặc định, tính bằng radian, để sử dụng khi tính toán ma trận chiếu cho một {{domxref("XRSession")}} `inline`. Tính toán ma trận chiếu cũng tính đến {{glossary("aspect ratio")}} của canvas đầu ra. Thuộc tính này _không được_ chỉ định cho các phiên nhập vai, do đó, giá trị là `null` mặc định cho các phiên nhập vai. Giá trị mặc định là π \* 0.5 (một nửa giá trị của pi).
    - `layers` {{Optional_Inline}}: Một mảng có thứ tự của các đối tượng {{domxref("XRLayer")}} chỉ định các lớp sẽ được trình bày cho thiết bị XR. Đặt `layers` sẽ ghi đè `baseLayer` nếu có, với `baseLayer` báo cáo `null`. Thứ tự của các lớp đã cho là "sau-trước". Để biết về hòa trộn alpha của các lớp, xem thuộc tính {{domxref("XRCompositionLayer.blendTextureSourceAlpha")}}.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném trong bất kỳ tình huống nào sau đây:
    - {{domxref("XRSession")}} đã kết thúc, vì vậy bạn không thể thay đổi trạng thái kết xuất của nó.
    - `baseLayer` được tạo bởi một `XRSession` khác với phiên mà `updateRenderState()` được gọi.
    - Tùy chọn `inlineVerticalFieldOfView` được đặt, nhưng phiên là nhập vai và do đó không cho phép sử dụng thuộc tính này.

- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném trong bất kỳ tình huống nào sau đây:
    - Tùy chọn `layers` được sử dụng trong một phiên đã được tạo mà không có tính năng `layers`.
    - Cả hai tùy chọn `baseLayer` và `layers` đều được chỉ định.

- {{jsxref("TypeError")}}
  - : Được ném nếu tùy chọn `layers` chứa các bản sao trùng lặp.

## Ví dụ

### Thêm một `baseLayer`

Ví dụ này tạo một ngữ cảnh WebGL tương thích với thiết bị XR nhập vai và sau đó sử dụng nó để tạo một {{DOMxRef("XRWebGLLayer")}}. Phương thức `updateRenderState()` sau đó được gọi để liên kết `XRWebGLLayer` mới.

```js
function onXRSessionStarted(xrSession) {
  let glCanvas = document.createElement("canvas");
  let gl = glCanvas.getContext("webgl", { xrCompatible: true });

  loadWebGLResources();

  xrSession.updateRenderState({
    baseLayer: new XRWebGLLayer(xrSession, gl),
  });
}
```

### Đặt mảng `layers`

Để sử dụng các lớp WebXR, phiên XR cần được tạo với bộ mô tả tính năng `layers` (xem {{domxref("XRSystem.requestSession()")}}). Sau đó, bạn có thể tạo các lớp WebXR khác nhau như

- {{domxref("XREquirectLayer")}}
- {{domxref("XRCubeLayer")}}
- {{domxref("XRCylinderLayer")}}
- {{domxref("XRQuadLayer")}}

Các lớp khác, chẳng hạn như {{domxref("XRProjectionLayer")}} hoặc {{domxref("XRWebGLLayer")}} cũng có sẵn.

Các lớp sẽ được trình bày theo thứ tự chúng được cung cấp trong mảng `layers`, với các lớp được cung cấp theo thứ tự "sau-trước".

```js
const xrSession = navigator.xr.requestSession("immersive-ar", {
  optionalFeatures: ["layers"],
});

function onXRSessionStarted(xrSession) {
  const glCanvas = document.createElement("canvas");
  const gl = glCanvas.getContext("webgl", { xrCompatible: true });
  const xrGlBinding = new XRWebGLBinding(xrSession, gl);
  const projectionLayer = new XRWebGLLayer(xrSession, gl);
  const quadLayer = xrGlBinding.createQuadLayer({
    pixelWidth: 1024,
    pixelHeight: 1024,
  });

  xrSession.updateRenderState({
    layers: [projectionLayer, quadLayer],
  });
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API)
- {{domxref("XRRenderState")}}
- {{domxref("XRSession.renderState")}}
