---
title: XRRigidTransform
slug: Web/API/XRRigidTransform
page-type: web-api-interface
browser-compat: api.XRRigidTransform
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}

**`XRRigidTransform`** là một giao diện của [WebXR API](/en-US/docs/Web/API/WebXR_Device_API) đại diện cho phép biến đổi hình học 3D được mô tả bởi vị trí và hướng.

`XRRigidTransform` được sử dụng để chỉ định các phép biến đổi trong toàn bộ WebXR API, bao gồm:

- Độ lệch và hướng tương đối với không gian tham chiếu cha để sử dụng khi tạo một không gian tham chiếu mới với {{domxref("XRReferenceSpace.getOffsetReferenceSpace", "getOffsetReferenceSpace()")}}.
- {{domxref("XRView.transform", "transform")}} của một {{domxref("XRView")}}.
- {{domxref("XRPose.transform", "transform")}} của một {{domxref("XRPose")}}.
- Thuộc tính {{domxref("XRReferenceSpaceEvent.transform", "transform")}} của sự kiện {{domxref("XRReferenceSpaceEvent")}}, như được tìm thấy trong sự kiện {{domxref("XRReferenceSpace.reset_event", "reset")}} được nhận bởi một {{domxref("XRReferenceSpace")}}.

Sử dụng `XRRigidTransform` ở những nơi này thay vì các mảng thô cung cấp dữ liệu ma trận có một lợi thế. Nó tự động tính toán nghịch đảo của phép biến đổi và thậm chí lưu vào bộ nhớ đệm, làm cho các yêu cầu tiếp theo nhanh hơn đáng kể.

## Hàm khởi tạo

- {{domxref("XRRigidTransform.XRRigidTransform", "XRRigidTransform()")}}
  - : Tạo một đối tượng `XRRigidTransform` mới đại diện cho phép biến đổi áp dụng vị trí và/hoặc hướng được chỉ định.

## Thuộc tính phiên bản

- {{DOMxRef("XRRigidTransform.position")}} {{ReadOnlyInline}}
  - : Một {{DOMxRef("DOMPointReadOnly")}} chỉ định một điểm 3 chiều, tính bằng mét, mô tả thành phần dịch chuyển của phép biến đổi. Thuộc tính {{DOMxRef("DOMPointReadonly.w", "w")}} luôn là `1.0`.
- {{DOMxRef("XRRigidTransform.orientation")}} {{ReadOnlyInline}}
  - : Một {{DOMxRef("DOMPointReadOnly")}} chứa một quaternion đơn vị mô tả thành phần quay của phép biến đổi. Là một quaternion đơn vị, độ dài của nó luôn được chuẩn hóa về `1.0`.
- {{DOMxRef("XRRigidTransform.matrix")}} {{ReadOnlyInline}}
  - : Trả về ma trận biến đổi dưới dạng một {{jsxref("Float32Array")}} gồm 16 phần tử. Xem phần [Định dạng ma trận](/en-US/docs/Web/API/XRRigidTransform/matrix#matrix_format) để biết cách mảng được sử dụng để biểu diễn ma trận.
- {{DOMxRef("XRRigidTransform.inverse")}} {{ReadOnlyInline}}
  - : Trả về một `XRRigidTransform` là nghịch đảo của phép biến đổi này. Tức là, nếu áp dụng cho một đối tượng đã được biến đổi trước đó bởi phép biến đổi gốc, nó sẽ hoàn tác phép biến đổi và trả về đối tượng gốc.

## Ghi chú sử dụng

Khi một `XRRigidTransform` được diễn giải, hướng luôn được áp dụng cho đối tượng bị ảnh hưởng trước khi vị trí được áp dụng.

## Ví dụ

Đoạn mã này tạo một `XRRigidTransform` để chỉ định độ lệch và hướng so với không gian tham chiếu hiện tại để sử dụng khi tạo một không gian tham chiếu mới. Sau đó nó yêu cầu callback khung hình động đầu tiên bằng cách gọi phương thức {{domxref("XRSession.requestAnimationFrame", "requestAnimationFrame()")}} của phiên.

```js
xrSession.requestReferenceSpace(refSpaceType).then((refSpace) => {
  xrReferenceSpace = refSpace;
  xrReferenceSpace = xrReferenceSpace.getOffsetReferenceSpace(
    new XRRigidTransform(viewerStartPosition, cubeOrientation),
  );
  animationFrameRequestID = xrSession.requestAnimationFrame(drawFrame);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
