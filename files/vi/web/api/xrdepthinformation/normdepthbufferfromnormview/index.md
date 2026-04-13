---
title: "XRDepthInformation: normDepthBufferFromNormView property"
short-title: normDepthBufferFromNormView
slug: Web/API/XRDepthInformation/normDepthBufferFromNormView
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRDepthInformation.normDepthBufferFromNormView
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`normDepthBufferFromNormView`** của giao diện {{DOMxRef("XRDepthInformation")}} chứa phép biến đổi hình học 3D cần được áp dụng khi lập chỉ mục vào bộ đệm độ sâu.

## Giá trị

Một {{domxref("XRRigidTransform")}} cần được áp dụng khi lập chỉ mục vào bộ đệm độ sâu. Phép biến đổi mà ma trận biểu diễn thay đổi hệ tọa độ từ tọa độ khung nhìn chuẩn hóa sang tọa độ bộ đệm độ sâu chuẩn hóa, sau đó có thể được chia tỷ lệ theo `width` và `height` của bộ đệm độ sâu để có được tọa độ bộ đệm độ sâu tuyệt đối.

## Ví dụ

Sử dụng {{domxref("XRFrame.getDepthInformation()")}} (CPU) hoặc {{domxref("XRWebGLBinding.getDepthInformation()")}} (WebGL) để lấy thông tin độ sâu. Các đối tượng được trả về sẽ chứa `normDepthBufferFromNormView` của bộ đệm độ sâu, bạn có thể sử dụng để tính toán thêm.

```js
const normDepthFromNormViewMatrix =
  depthData.normDepthBufferFromNormView.matrix;
const normViewFromNormDepth =
  depthData.normDepthBufferFromNormView.inverse.matrix;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
