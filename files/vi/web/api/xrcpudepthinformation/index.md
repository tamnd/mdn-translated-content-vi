---
title: XRCPUDepthInformation
slug: Web/API/XRCPUDepthInformation
page-type: web-api-interface
status:
  - experimental
browser-compat: api.XRCPUDepthInformation
---

{{APIRef("WebXR Device API")}} {{secureContext_header}}{{SeeCompatTable}}

Giao diện **`XRCPUDepthInformation`** chứa thông tin độ sâu từ CPU (được trả về bởi {{domxref("XRFrame.getDepthInformation()")}}).

{{InheritanceDiagram}}

Giao diện này kế thừa các thuộc tính từ lớp cha {{domxref("XRDepthInformation")}}.

## Thuộc tính phiên bản

- {{domxref("XRCPUDepthInformation.data")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một {{jsxref("ArrayBuffer")}} chứa thông tin bộ đệm độ sâu ở định dạng thô.
- {{domxref("XRDepthInformation.height")}} {{ReadOnlyInline}}
  - : Chứa chiều cao của bộ đệm độ sâu (số hàng).
- {{domxref("XRDepthInformation.normDepthBufferFromNormView")}} {{ReadOnlyInline}}
  - : Một {{domxref("XRRigidTransform")}} cần được áp dụng khi lập chỉ mục vào bộ đệm độ sâu. Phép biến đổi mà ma trận đại diện thay đổi hệ tọa độ từ tọa độ view chuẩn hóa sang tọa độ bộ đệm độ sâu chuẩn hóa, sau đó có thể được chia tỷ lệ theo `width` và `height` của bộ đệm độ sâu để lấy tọa độ bộ đệm độ sâu tuyệt đối.
- {{domxref("XRDepthInformation.rawValueToMeters")}} {{ReadOnlyInline}}
  - : Chứa hệ số tỷ lệ mà các giá trị độ sâu thô phải được nhân với để lấy độ sâu tính bằng mét.
- {{domxref("XRDepthInformation.width")}} {{ReadOnlyInline}}
  - : Chứa chiều rộng của bộ đệm độ sâu (số cột).

## Phương thức phiên bản

- {{domxref("XRCPUDepthInformation.getDepthInMeters()")}} {{Experimental_Inline}}
  - : Trả về độ sâu tính bằng mét tại (x, y) trong tọa độ view chuẩn hóa.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRDepthInformation")}}
- {{domxref("XRWebGLDepthInformation")}}
- {{domxref("XRFrame.getDepthInformation()")}}
