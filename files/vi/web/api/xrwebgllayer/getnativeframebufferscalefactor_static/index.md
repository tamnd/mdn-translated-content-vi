---
title: "XRWebGLLayer: getNativeFramebufferScaleFactor() static method"
short-title: getNativeFramebufferScaleFactor()
slug: Web/API/XRWebGLLayer/getNativeFramebufferScaleFactor_static
page-type: web-api-static-method
status:
  - experimental
browser-compat: api.XRWebGLLayer.getNativeFramebufferScaleFactor_static
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức tĩnh **`XRWebGLLayer.getNativeFramebufferScaleFactor()`** trả về hệ số tỷ lệ dấu phẩy động mà người ta có thể nhân độ phân giải của {{domxref("XRSession")}} đã chỉ định để lấy độ phân giải gốc của framebuffer của thiết bị WebXR.

Thông tin này có thể được sử dụng khi tạo một `XRWebGLLayer` mới để cấu hình `framebufferScaleFactor` trong đối tượng cấu hình `layerInit` được chỉ định khi gọi hàm khởi tạo `XRWebGLLayer()`. Xem [Ghi chú sử dụng](#usage_notes) và [Ví dụ](#examples) để biết chi tiết.

Nếu hệ số tỷ lệ là 1.0, thì các pixel framebuffer và các pixel hiển thị gốc có cùng kích thước. Nếu hệ số tỷ lệ lớn hơn không, thì framebuffer nhỏ hơn kích thước gốc của màn hình, dẫn đến đầu ra được phóng to khi hiển thị trên màn hình sau khi hiển thị vào framebuffer. Nếu hệ số tỷ lệ nhỏ hơn không, framebuffer _lớn hơn_ độ phân giải gốc của màn hình, dẫn đến nội dung framebuffer được thu nhỏ để hiển thị lên thiết bị XR. Điều này có thể xảy ra với các môi trường hiển thị sử dụng kỹ thuật superscaling hoặc khử răng cưa để cải thiện chất lượng hình ảnh cảm nhận.

## Cú pháp

```js-nolint
XRWebGLLayer.getNativeFramebufferScaleFactor(session)
```

### Tham số

- `session`
  - : {{domxref("XRSession")}} để trả về hệ số tỷ lệ framebuffer gốc.

### Giá trị trả về

Một giá trị dấu phẩy động mà khi nhân với kích thước framebuffer được đề xuất của {{domxref("XRSession")}}, kết quả là độ phân giải framebuffer gốc của thiết bị XR. Nếu phiên đã kết thúc, hàm này trả về 0.0.

## Ghi chú sử dụng

Hệ số tỷ lệ được trả về bởi hàm này sẽ là 1.0 nếu độ phân giải gốc của thiết bị XR và độ phân giải của thiết bị XR khớp với nhau. Trong mọi trường hợp, nhân độ phân giải được đề xuất như được xác định bởi `XRSession` với giá trị này sẽ cho kết quả là độ phân giải gốc thực tế của phần cứng XR.

Độ phân giải framebuffer WebGL được đề xuất là ước tính tốt nhất về độ phân giải cần thiết để chứa tất cả các {{domxref("XRView")}} mà thiết bị cần trong khi cung cấp cho các ứng dụng thông thường sự cân bằng chấp nhận được giữa chất lượng hình ảnh và hiệu suất.

## Ví dụ

Trong ví dụ này, chúng ta yêu cầu một framebuffer ở độ phân giải gốc của thiết bị, bất kể các mối lo ngại về hiệu suất:

```js
function requestNativeScaleWebGLLayer(gl, xrSession) {
  return gl.makeXRCompatible().then(() => {
    let scaleFactor = XRWebGLLayer.getNativeFramebufferScaleFactor(xrSession);
    let glLayer = new XRWebGLLayer(xrSession, gl, {
      framebufferScaleFactor: scaleFactor,
    });
    xrSession.updateRenderState({ baseLayer: glLayer });
  });
}
```

Điều này bắt đầu bằng cách gọi hàm {{domxref("WebGLRenderingContext.makeXRCompatible", "makeXRCompatible()")}} của [ngữ cảnh hiển thị WebGL](/en-US/docs/Web/API/WebGLRenderingContext). Khi {{jsxref("promise")}} được trả về giải quyết, chúng ta tiến hành bằng cách gọi hàm tĩnh `getNativeFramebufferScaleFactor()` của `XRWebGLLayer` để lấy hệ số tỷ lệ cần thiết để đạt độ phân giải gốc, và sau đó truyền nó vào hàm khởi tạo {{domxref("XRWebGLLayer.XRWebGLLayer", "WebGLLayer()")}} làm giá trị của thuộc tính `framebufferScaleFactor` trong đối tượng cấu hình `layerInit`.

Điều đó cho chúng ta một đối tượng {{domxref("XRWebGLLayer")}} mới đại diện cho bề mặt hiển thị mà chúng ta có thể sử dụng cho {{domxref("XRSession")}}; chúng ta đặt nó làm bề mặt hiển thị cho `xrSession` bằng cách gọi phương thức {{domxref("XRSession.updateRenderState", "updateRenderState()")}} của nó, truyền `glLayer` mới vào bằng thuộc tính {{domxref("XRRenderState.baseLayer")}} của từ điển {{domxref("XRRenderState")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API)
- [WebXR performance guide](/en-US/docs/Web/API/WebXR_Device_API/Performance)
