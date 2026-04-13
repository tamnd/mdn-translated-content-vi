---
title: XRWebGLDepthInformation
slug: Web/API/XRWebGLDepthInformation
page-type: web-api-interface
status:
  - experimental
browser-compat: api.XRWebGLDepthInformation
---

{{APIRef("WebXR Device API")}} {{secureContext_header}}{{SeeCompatTable}}

Giao diện **`XRWebGLDepthInformation`** chứa thông tin độ sâu từ GPU/WebGL (được trả về bởi {{domxref("XRWebGLBinding.getDepthInformation()")}}).

{{InheritanceDiagram}}

Giao diện này kế thừa các thuộc tính từ cha của nó, {{domxref("XRDepthInformation")}}.

## Thuộc tính phiên bản

- {{domxref("XRDepthInformation.height")}} {{ReadOnlyInline}}
  - : Chứa chiều cao của bộ đệm độ sâu (số hàng).
- {{domxref("XRDepthInformation.normDepthBufferFromNormView")}} {{ReadOnlyInline}}
  - : Một {{domxref("XRRigidTransform")}} cần được áp dụng khi lập chỉ mục vào bộ đệm độ sâu. Phép biến đổi mà ma trận đại diện thay đổi hệ tọa độ từ tọa độ góc nhìn chuẩn hóa sang tọa độ bộ đệm độ sâu chuẩn hóa, có thể được nhân với `width` và `height` của bộ đệm độ sâu để lấy tọa độ bộ đệm độ sâu tuyệt đối.
- {{domxref("XRDepthInformation.rawValueToMeters")}} {{ReadOnlyInline}}
  - : Chứa hệ số tỷ lệ mà các giá trị độ sâu thô phải được nhân với để có được độ sâu tính bằng mét.
- {{domxref("XRWebGLDepthInformation.texture")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một {{domxref("WebGLTexture")}} chứa thông tin bộ đệm độ sâu dưới dạng texture mờ đục.
- {{domxref("XRDepthInformation.width")}} {{ReadOnlyInline}}
  - : Chứa chiều rộng của bộ đệm độ sâu (số cột).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRDepthInformation")}}
- {{domxref("XRCPUDepthInformation")}}
- {{domxref("XRWebGLBinding.getDepthInformation()")}}
