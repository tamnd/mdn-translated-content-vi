---
title: "XRDepthInformation: height property"
short-title: height
slug: Web/API/XRDepthInformation/height
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRDepthInformation.height
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`height`** của giao diện {{DOMxRef("XRDepthInformation")}} chứa chiều cao của bộ đệm độ sâu (số hàng).

## Giá trị

Một số nguyên không dấu.

## Ví dụ

Sử dụng {{domxref("XRFrame.getDepthInformation()")}} (CPU) hoặc {{domxref("XRWebGLBinding.getDepthInformation()")}} (WebGL) để lấy thông tin độ sâu. Các đối tượng được trả về sẽ chứa `height` của bộ đệm độ sâu, bạn có thể sử dụng để tính toán thêm.

```js
const smallerDepthDimension = Math.min(depthInfo.width, depthInfo.height);
const largerDepthDimension = Math.max(depthInfo.width, depthInfo.height);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
