---
title: "XRRigidTransform: position property"
short-title: position
slug: Web/API/XRRigidTransform/position
page-type: web-api-instance-property
browser-compat: api.XRRigidTransform.position
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`position`** của giao diện {{domxref("XRRigidTransform")}} là một đối tượng {{domxref("DOMPointReadOnly")}} cung cấp điểm 3D, tính bằng mét, mô tả thành phần dịch chuyển của phép biến đổi.

## Giá trị

Một {{domxref("DOMPointReadOnly")}} chỉ đọc chỉ ra thành phần vị trí 3D của ma trận biến đổi. Đơn vị là mét.

> [!NOTE]
> Thành phần `w` của điểm luôn là 1.0.

## Ví dụ

Để tạo một không gian tham chiếu có thể được sử dụng để đặt một đối tượng ở tầm mắt (giả sử tầm mắt là 1,5 mét):

```js
function onSessionStarted(xrSession) {
  xrSession.addEventListener("end", onSessionEnded);

  gl = initGraphics(xrSession);

  const glLayer = new XRWebGLLayer(xrSession, gl);
  xrSession.updateRenderState({ baseLayer: glLayer });

  if (immersiveSession) {
    xrSession
      .requestReferenceSpace("bounded-floor")
      .then((refSpace) => {
        refSpaceCreated(refSpace);
      })
      .catch(() => {
        session.requestReferenceSpace("local-floor").then(refSpaceCreated);
      });
  } else {
    session.requestReferenceSpace("viewer").then(refSpaceCreated);
  }
}

function refSpaceCreated(refSpace) {
  xrReferenceSpace = immersiveSession
    ? refSpace
    : refSpace.getOffsetReferenceSpace(new XRRigidTransform({ y: -1.5 }));
  xrSession.requestAnimationFrame(onFrame);
}
```

Sau khi thiết lập ngữ cảnh đồ họa để sử dụng WebXR, phần này bắt đầu bằng cách kiểm tra xem biến `immersiveSession` có phải là `true` không; nếu có, trước tiên chúng ta yêu cầu một không gian tham chiếu `bounded-floor`. Nếu điều đó thất bại (có thể vì `bounded-floor` không được hỗ trợ), chúng ta thử yêu cầu một không gian tham chiếu `local-floor`.

Nếu chúng ta không ở trong một phiên nhập vai, thay vào đó chúng ta yêu cầu một không gian tham chiếu `viewer`.

Trong tất cả các trường hợp, sau khi không gian đã được lấy, nó được truyền vào hàm `refSpaceCreated()`. Đối với các không gian nhập vai, không gian được chỉ định được lưu để sử dụng sau. Tuy nhiên, đối với các phiên inline, chúng ta biết rằng chúng ta đang ở trong một không gian không được điều chỉnh tự động theo mức sàn, vì vậy chúng ta yêu cầu một không gian tham chiếu offset để dịch chuyển chiều cao của người xem lên 1,5 mét so với mức sàn giả định là 0 mét. Không gian tham chiếu mới đó được sử dụng thay vì không gian nhận được ban đầu.

Cuối cùng, một yêu cầu khung hình động được gửi.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
