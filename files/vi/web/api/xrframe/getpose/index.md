---
title: "XRFrame: phương thức getPose()"
short-title: getPose()
slug: Web/API/XRFrame/getPose
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRFrame.getPose
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`getPose()`** của {{domxref("XRFrame")}} trả về vị trí và hướng tương đối, tức là tư thế, của một {{domxref("XRSpace")}} so với không gian khác. Qua đó, bạn có thể quan sát chuyển động của các đối tượng tương đối với nhau và tương đối với các vị trí cố định trong cảnh.

Ví dụ, để lấy vị trí của bộ điều khiển so với đầu người xem, bạn sẽ so sánh {{domxref("XRInputSource.gripSpace", "gripSpace")}} của bộ điều khiển với {{domxref("XRReferenceSpace")}} kiểu `viewer`.

## Cú pháp

```js-nolint
getPose(space, baseSpace)
```

### Tham số

- `space`
  - : Một {{domxref("XRSpace")}} chỉ định không gian cần lấy {{domxref("XRPose")}} mô tả vị trí và hướng của mục.
- `baseSpace`
  - : Một {{domxref("XRSpace")}} được dùng làm cơ sở hoặc gốc tọa độ để tính toán vị trí và hướng tương đối.

### Giá trị trả về

Một đối tượng {{domxref("XRPose")}} chỉ định vị trí và hướng, tương đối với {{domxref("XRSpace")}} được chỉ định bởi `baseSpace`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
