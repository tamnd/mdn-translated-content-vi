---
title: "XRWebGLLayer: ignoreDepthValues property"
short-title: ignoreDepthValues
slug: Web/API/XRWebGLLayer/ignoreDepthValues
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRWebGLLayer.ignoreDepthValues
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`ignoreDepthValues`** của {{domxref("XRWebGLLayer")}} là một giá trị Boolean là `true` nếu phiên được cấu hình để bỏ qua các giá trị trong bộ đệm độ sâu khi hiển thị cảnh. Nếu bộ đệm độ sâu được sử dụng để xác định vị trí của các đỉnh, thuộc tính này là `false`.

Giá trị của `ignoreDepthValues` chỉ có thể được đặt khi {{domxref("XRWebGLLayer")}} được khởi tạo, bằng cách đặt giá trị tương ứng trong tham số `options` của [hàm khởi tạo](/en-US/docs/Web/API/XRWebGLLayer/XRWebGLLayer).

## Giá trị

Một giá trị Boolean là `true` nếu bộ đệm độ sâu của ngữ cảnh WebGL đang được sử dụng khi tính toán vị trí của các điểm trong thế giới 3D. Ngược lại, nếu giá trị này là `true`, các giá trị của bộ đệm độ sâu đang được sử dụng để hỗ trợ đặt các đối tượng trong cảnh. Vì [XR compositor](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals#the_webxr_compositor) sử dụng bộ đệm độ sâu theo mặc định, giá trị này là `false` trừ khi được đặt rõ ràng khi tạo {{domxref("XRWebGLLayer")}} bằng hàm khởi tạo của nó, {{domxref("XRWebGLLayer.XRWebGLLayer", "XRWebGLLayer()")}}.

## Ghi chú sử dụng

Khi thuộc tính `ignoreDepthValues` là `false`, XR compositor sử dụng các giá trị tìm thấy trong bộ đệm độ sâu, nên chính xác cho cảnh, để có thể cải thiện chất lượng hoặc đầu ra cũng như mức độ thoải mái cho người xem.

Bộ đệm độ sâu có {{domxref("XRWebGLLayer.framebufferWidth", "framebufferWidth")}} mục rộng và {{domxref("XRWebGLLayer.framebufferHeight", "framebuffer")}} mục cao. Mỗi mục trong bộ đệm xác định độ sâu tại đó pixel tương ứng nằm, và có giá trị từ 0.0 đến 1.0.

Giá trị pixel bộ đệm độ sâu 0.0 tương ứng với độ sâu được cho bởi {{domxref("XRRenderState.depthNear", "depthNear")}} của phiên và giá trị 1.0 tương ứng với độ sâu được cho bởi {{domxref("XRRenderState.depthFar", "depthFar")}}.

Độ sâu, kết hợp với các tọa độ của mỗi điểm được hiển thị, giúp thể hiện cảnh chính xác hơn trong không gian 3D.

## Ví dụ

Nếu ứng dụng Web sử dụng WeXR đang hiển thị nội dung của nó mà không sử dụng bộ đệm độ sâu, hoặc nếu nội dung của bộ đệm độ sâu không hợp lệ, bạn nên tắt việc sử dụng bộ đệm độ sâu cho hiển thị WebXR bằng cách đặt `ignoreDepthValues` thành true khi tạo {{domxref("XRWebGLLayer")}}. Điều này được minh họa trong đoạn mã dưới đây:

```js
const glLayerOptions = {
  ignoreDepthValues: true,
};

let glLayer = new XRWebGLLayer(xrSession, gl, glLayerOptions);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API)
- Các phương thức liên quan đến bộ đệm độ sâu WebGL: {{domxref("WebGLRenderingContext.depthFunc", "depthFunc()")}}, {{domxref("WebGLRenderingContext.clearDepth", "clearDepth()")}}
