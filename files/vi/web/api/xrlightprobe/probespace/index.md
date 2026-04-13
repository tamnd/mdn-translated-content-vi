---
title: "XRLightProbe: thuộc tính probeSpace"
short-title: probeSpace
slug: Web/API/XRLightProbe/probeSpace
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRLightProbe.probeSpace
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính _chỉ đọc_ **`probeSpace`** của giao diện {{DOMxRef("XRLightProbe")}} trả về một {{domxref("XRSpace")}} theo dõi vị trí và hướng mà các ước tính ánh sáng có liên quan đến.

## Giá trị

Một đối tượng {{domxref("XRSpace")}}.

## Ví dụ

Thuộc tính `probeSpace` trả về vị trí và hướng trong không gian mà ước tính ánh sáng có liên quan đến. Nó có thể cập nhật theo thời gian khi người dùng di chuyển xung quanh. Sử dụng phương thức {{domxref("XRFrame.getPose()")}} để lấy trạng thái ánh sáng hiện tại với mỗi khung.

```js
const lightProbe = await xrSession.requestLightProbe();
const probePose = xrFrame.getPose(lightProbe.probeSpace, xrReferenceSpace);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRSpace()")}}
- {{domxref("XRFrame.getPose()")}}
