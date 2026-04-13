---
title: XRDepthInformation
slug: Web/API/XRDepthInformation
page-type: web-api-interface
status:
  - experimental
browser-compat: api.XRDepthInformation
---

{{APIRef("WebXR Device API")}} {{secureContext_header}}{{SeeCompatTable}}

Giao diện **`XRDepthInformation`** chứa thông tin về khoảng cách từ thiết bị của người dùng đến hình học thế giới thực trong môi trường của người dùng.

Giao diện này là cha của:

- {{domxref("XRCPUDepthInformation")}}
  - : Thông tin độ sâu từ CPU (được trả về bởi {{domxref("XRFrame.getDepthInformation()")}}).
- {{domxref("XRWebGLDepthInformation")}}
  - : Thông tin độ sâu từ WebGL (được trả về bởi {{domxref("XRWebGLBinding.getDepthInformation()")}}).

Thông thường bạn sẽ tương tác với các giao diện con này. Tuy nhiên, `XRDepthInformation` cung cấp một số thuộc tính hữu ích được kế thừa:

## Thuộc tính phiên bản

- {{domxref("XRDepthInformation.height")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Chứa chiều cao của bộ đệm độ sâu (số hàng).
- {{domxref("XRDepthInformation.normDepthBufferFromNormView")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một {{domxref("XRRigidTransform")}} cần được áp dụng khi lập chỉ mục vào bộ đệm độ sâu. Phép biến đổi mà ma trận biểu diễn thay đổi hệ tọa độ từ tọa độ khung nhìn chuẩn hóa sang tọa độ bộ đệm độ sâu chuẩn hóa, sau đó có thể được chia tỷ lệ theo `width` và `height` của bộ đệm độ sâu để có được tọa độ bộ đệm độ sâu tuyệt đối.
- {{domxref("XRDepthInformation.rawValueToMeters")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Chứa hệ số tỷ lệ mà các giá trị độ sâu thô phải được nhân để có được độ sâu tính bằng mét.
- {{domxref("XRDepthInformation.width")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Chứa chiều rộng của bộ đệm độ sâu (số cột).

## Phương thức phiên bản

Không có.

## Ví dụ

Xem {{domxref("XRCPUDepthInformation")}} và {{domxref("XRWebGLDepthInformation")}} để biết các ví dụ mã.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRCPUDepthInformation")}}
- {{domxref("XRWebGLDepthInformation")}}
- {{domxref("XRFrame.getDepthInformation()")}}
