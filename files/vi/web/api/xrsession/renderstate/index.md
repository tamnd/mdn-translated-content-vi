---
title: "XRSession: thuộc tính renderState"
short-title: renderState
slug: Web/API/XRSession/renderState
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRSession.renderState
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`renderState`** của một đối tượng {{DOMxRef("XRSession")}} cho biết trả về một đối tượng {{DOMxRef("XRRenderState")}} mô tả cách môi trường của người dùng nên được kết xuất. Thông tin được cung cấp bao gồm khoảng cách tối thiểu và tối đa để kết xuất các đối tượng, trường nhìn dọc để sử dụng khi kết xuất ở chế độ phiên `inline`, và {{domxref("XRWebGLLayer")}} để kết xuất vào cho lớp phủ nội tuyến.

Mặc dù thuộc tính này là chỉ đọc, bạn có thể gọi phương thức {{domxref("XRSession")}} {{domxref("XRSession.updateRenderState", "updateRenderState()")}} để thực hiện thay đổi.

## Giá trị

Một đối tượng {{DOMxRef("XRRenderState")}} mô tả cách kết xuất cảnh.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
