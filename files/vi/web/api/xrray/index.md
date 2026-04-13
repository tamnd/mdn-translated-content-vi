---
title: XRRay
slug: Web/API/XRRay
page-type: web-api-interface
status:
  - experimental
browser-compat: api.XRRay
---

{{APIRef("WebXR Device API")}} {{secureContext_header}}{{SeeCompatTable}}

Giao diện **`XRRay`** của [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API) là một tia hình học được mô tả bởi một điểm gốc và một vectơ hướng.

Các đối tượng `XRRay` có thể được truyền vào {{domxref("XRSession.requestHitTestSource()")}} hoặc {{domxref("XRSession.requestHitTestSourceForTransientInput()")}} để thực hiện kiểm tra va chạm (hit testing).

## Hàm khởi tạo

- {{domxref("XRRay.XRRay", "XRRay()")}} {{Experimental_Inline}}
  - : Tạo một đối tượng `XRRay` mới.

## Thuộc tính phiên bản

- {{domxref("XRRay.direction")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một {{domxref("DOMPointReadOnly")}} biểu diễn vectơ hướng 3 chiều của tia.
- {{domxref("XRRay.matrix")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một phép biến đổi có thể được sử dụng để đặt vị trí các đối tượng dọc theo `XRRay`. Đây là ma trận 4x4 được cho dưới dạng {{jsxref("Float32Array")}} 16 phần tử theo thứ tự cột chính.
- {{domxref("XRRay.origin")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một {{domxref("DOMPointReadOnly")}} biểu diễn điểm 3 chiều trong không gian mà tia xuất phát từ đó, tính bằng mét.

## Phương thức phiên bản

Không có.

## Ví dụ

### Sử dụng `XRRay` để yêu cầu nguồn kiểm tra va chạm

Phương thức {{domxref("XRSession.requestHitTestSource()")}} nhận một đối tượng `XRRay` cho tùy chọn `offsetRay`. Trong ví dụ này, nguồn kiểm tra va chạm được đặt hơi cao hơn so với người xem vì ứng dụng có một số phần tử UI ở phía dưới nhưng vẫn muốn duy trì cảm giác con trỏ ở giữa màn hình.

```js
const xrSession = navigator.xr.requestSession("immersive-ar", {
  requiredFeatures: ["local", "hit-test"],
});

let hitTestSource = null;

xrSession
  .requestHitTestSource({
    space: viewerSpace, // obtained from xrSession.requestReferenceSpace("viewer");
    offsetRay: new XRRay({ y: 0.5 }),
  })
  .then((viewerHitTestSource) => {
    hitTestSource = viewerHitTestSource;
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRSession.requestHitTestSource()")}}
- {{domxref("XRHitTestResult")}}
