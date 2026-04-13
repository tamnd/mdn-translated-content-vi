---
title: "XRRigidTransform: XRRigidTransform() constructor"
short-title: XRRigidTransform()
slug: Web/API/XRRigidTransform/XRRigidTransform
page-type: web-api-constructor
browser-compat: api.XRRigidTransform.XRRigidTransform
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}

Hàm khởi tạo **`XRRigidTransform()`** tạo một đối tượng {{domxref("XRRigidTransform")}} mới, đại diện cho vị trí và hướng của một điểm hoặc đối tượng. Trong số những thứ khác, `XRRigidTransform` được sử dụng khi cung cấp một phép biến đổi để dịch chuyển giữa các hệ tọa độ trong không gian.

## Cú pháp

```js-nolint
new XRRigidTransform()
new XRRigidTransform(position)
new XRRigidTransform(position, orientation)
```

### Tham số

- `position` {{optional_inline}}
  - : Một đối tượng chỉ định các tọa độ tại đó điểm hoặc đối tượng được đặt. Các kích thước này được chỉ định bằng mét. Nếu tham số này bị bỏ qua hoặc không hợp lệ, vị trí được sử dụng được giả định là `{x: 0, y: 0, z: 0, w: 1}`. `w` phải _luôn luôn_ là 1.
- `orientation` {{optional_inline}}
  - : Một đối tượng chỉ định hướng mà đối tượng đang nhìn về phía. Giá trị mặc định cho `orientation` là `{x: 0, y: 0, z: 0, w: 1}`. Hướng được chỉ định sẽ được chuẩn hóa nếu chưa được chuẩn hóa.

### Giá trị trả về

Một đối tượng {{domxref("XRRigidTransform")}} mới đã được khởi tạo để đại diện cho một ma trận biến đổi sẽ điều chỉnh vị trí và hướng của một đối tượng từ gốc tọa độ đến `position` được chỉ định và hướng về phía được chỉ định bởi `orientation`.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Ném ra nếu giá trị của tọa độ `w` trong `position` được chỉ định không phải là 1.0.

## Ví dụ

Trong ví dụ này, phần đầu của quá trình hoạt hình một cảnh được hiển thị, bắt đầu bằng yêu cầu một không gian tham chiếu của một loại nhất định, sau đó dịch chuyển hệ tọa độ dựa trên một phép biến đổi trước khi yêu cầu khung hình động đầu tiên.

```js
let animationFrameRequestID = 0;

xrSession.requestReferenceSpace("local-floor").then((refSpace) => {
  xrReferenceSpace = refSpace.getOffsetReferenceSpace(
    new XRRigidTransform(viewerPosition, viewerOrientation),
  );
  animationFrameRequestID = xrSession.requestAnimationFrame(drawFrame);
});
```

Sau khi yêu cầu một không gian tham chiếu loại `local-floor`, promise được trả về cuối cùng được giải quyết, tại thời điểm đó chúng ta nhận được một đối tượng không gian tham chiếu mới, `refSpace`. Sau khi tạo một `XRRigidTransform` từ vị trí và hướng ban đầu của người xem, chúng ta truyền phép biến đổi mới vào {{domxref("XRReferenceSpace.getOffsetReferenceSpace", "getOffsetReferenceSpace()")}} để tạo _một_ không gian tham chiếu khác, nay được dịch chuyển sao cho gốc tọa độ của nó nằm ở cùng vị trí trong không gian như các tọa độ được cung cấp bởi `viewerPosition`, với hướng cũng được điều chỉnh theo cách tương tự.

Sau đó {{domxref("XRSession.requestAnimationFrame", "requestAnimationFrame()")}} được gọi để yêu cầu một khung hình động mới để vẽ vào. Callback `drawFrame()` sẽ được thực thi khi hệ thống sẵn sàng vẽ khung hình tiếp theo.

Bạn có thể tìm thêm ví dụ trong [Chuyển động, hướng và chuyển vị](/en-US/docs/Web/API/WebXR_Device_API/Movement_and_motion).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
