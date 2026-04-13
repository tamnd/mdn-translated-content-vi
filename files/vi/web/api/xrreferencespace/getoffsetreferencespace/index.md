---
title: "XRReferenceSpace: phương thức getOffsetReferenceSpace()"
short-title: getOffsetReferenceSpace()
slug: Web/API/XRReferenceSpace/getOffsetReferenceSpace
page-type: web-api-instance-method
browser-compat: api.XRReferenceSpace.getOffsetReferenceSpace
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}

Phương thức **`getOffsetReferenceSpace()`** của giao diện {{domxref("XRReferenceSpace")}} trả về một đối tượng không gian tham chiếu mới mô tả sự khác biệt tương đối về vị trí giữa đối tượng mà phương thức được gọi và một điểm cho trước trong không gian 3D. Đối tượng được trả về bởi `getOffsetReferenceSpace()` là một {{domxref("XRReferenceSpace")}} nếu được gọi trên một `XRReferenceSpace`, hoặc là một {{domxref("XRBoundedReferenceSpace")}} nếu được gọi trên một đối tượng của kiểu đó.

Nói cách khác, khi bạn có một đối tượng trong không gian 3D và cần định vị một đối tượng khác tương đối so với đối tượng đó, bạn có thể gọi `getOffsetReferenceSpace()`, truyền vào đó vị trí và hướng bạn muốn đối tượng thứ hai có _so với vị trí và hướng của đối tượng mà bạn gọi `getOffsetReferenceSpace()`_.

Sau đó, khi vẽ cảnh, bạn có thể sử dụng không gian tham chiếu độ lệch để không chỉ định vị các đối tượng tương đối với nhau, mà còn áp dụng các biến đổi cần thiết để kết xuất các đối tượng đúng cách dựa trên vị trí của người xem. Điều này được minh họa trong ví dụ [Triển khai xoay dựa trên đầu vào không phải XR](#implementing_rotation_based_on_non-xr_inputs), minh họa cách sử dụng phương thức này để cho phép người dùng dùng chuột để nghiêng và xoay góc nhìn của họ.

## Cú pháp

```js-nolint
getOffsetReferenceSpace(originOffset)
```

### Tham số

- `originOffset`
  - : Một {{domxref("XRRigidTransform")}} chỉ định độ lệch đến gốc tọa độ của không gian tham chiếu mới. Các giá trị này được thêm vào vị trí và hướng của không gian tham chiếu hiện tại, sau đó kết quả được sử dụng làm vị trí và hướng của {{domxref("XRReferenceSpace")}} mới được tạo.

### Giá trị trả về

Một đối tượng {{domxref("XRReferenceSpace")}} mới mô tả một không gian tham chiếu có cùng gốc tọa độ gốc với không gian tham chiếu mà phương thức được gọi, nhưng với một độ lệch gốc tọa độ chỉ ra khoảng cách từ đối tượng đến điểm được cho bởi `originOffset`.

Nếu đối tượng mà bạn gọi phương thức này là một {{domxref("XRBoundedReferenceSpace")}}, thì đối tượng được trả về cũng vậy. {{domxref("XRBoundedReferenceSpace.boundsGeometry", "boundsGeometry")}} của không gian tham chiếu mới được đặt thành `boundsGeometry` của đối tượng gốc với mỗi điểm của nó nhân với nghịch đảo của `originOffset`.

## Ví dụ

Dưới đây là một số ví dụ cho thấy cách sử dụng `getOffsetReferenceSpace()`.

### Dịch chuyển hoặc đặt vị trí người xem

Khi lần đầu tiên tạo cảnh, bạn có thể cần đặt vị trí người dùng trong thế giới 3D. Bạn có thể làm điều đó bằng cách sử dụng `getOffsetReferenceSpace()`.

```js
xrSession.requestReferenceSpace("local").then((refSpace) => {
  xrReferenceSpace = refSpace;
  xrReferenceSpace = xrReferenceSpace.getOffsetReferenceSpace(
    new XRRigidTransform(startPosition, { x: 0, y: 0, z: 1.0, w: 1.0 }),
  );
  xrSession.requestAnimationFrame(drawFrame);
});
```

Trong đoạn mã này, chúng ta lấy một không gian tham chiếu local, sau đó sử dụng `getOffsetReferenceSpace()` để tạo một không gian mới có gốc tọa độ được điều chỉnh đến một vị trí được cho bởi `startPosition` và có hướng nhìn thẳng dọc theo trục Z. Sau đó khung hoạt ảnh đầu tiên được yêu cầu bằng cách sử dụng {{domxref("XRSession.requestAnimationFrame", "requestAnimationFrame()")}} của {{domxref("XRSession")}}.

### Triển khai xoay dựa trên đầu vào không phải XR

Các điều khiển đầu vào được WebXR hỗ trợ trực tiếp đều là các thiết bị đầu vào VR hoặc AR chuyên dụng. Để sử dụng chuột, bàn phím hoặc các thiết bị đầu vào khác để di chuyển hoặc biến đổi các đối tượng trong không gian 3D, hoặc để cho phép người dùng di chuyển qua không gian, bạn cần viết một số mã để đọc đầu vào và thực hiện các chuyển động.

Đây là một trường hợp sử dụng tốt khác cho `getOffsetReferenceSpace()`. Trong ví dụ này, chúng ta sẽ hiển thị mã cho phép người dùng nhìn xung quanh bằng cách nhấp chuột phải và di chuyển chuột để thay đổi góc nhìn.

Đầu tiên, chúng ta thêm một trình xử lý sự kiện cho các sự kiện {{domxref("Element.mousemove_event", "mousemove")}}, gọi mã của chúng ta để thực hiện việc xoay nếu nút chuột phải đang được nhấn. Lưu ý rằng chúng ta cũng thiết lập {{domxref("Element.contextmenu_event", "oncontextmenu")}} để bị bỏ qua bằng cách gọi {{domxref("Event.preventDefault", "preventDefault()")}} trên các sự kiện đó. Điều này ngăn các nhấp chuột phải làm xuất hiện menu ngữ cảnh trong trình duyệt.

```js
canvas.oncontextmenu = (event) => {
  event.preventDefault();
};
canvas.addEventListener("mousemove", (event) => {
  if (event.buttons & 2) {
    rotateViewBy(event.movementX, event.movementY);
  }
});
```

Tiếp theo, hàm `rotateViewBy()` cập nhật hướng nhìn chuột theo yaw và pitch dựa trên các giá trị delta chuột từ sự kiện `mousemove`. Pitch bị giới hạn để bạn không thể nhìn vượt quá thẳng lên và thẳng xuống. Mỗi lần hàm này được gọi, các độ lệch mới được sử dụng để cập nhật các giá trị hiện tại của `mousePitch` và `mouseYaw`.

```js
let mouseYaw = 0.0;
let mousePitch = 0.0;
const inverseOrientation = quat.create();
const MOUSE_SPEED = 0.003;

function rotateViewBy(dx, dy) {
  mouseYaw += dx * MOUSE_SPEED;
  mousePitch += dy * MOUSE_SPEED;

  if (mousePitch < -Math.PI * 0.5) {
    mousePitch = -Math.PI * 0.5;
  } else if (mousePitch > Math.PI * 0.5) {
    mousePitch = Math.PI * 0.5;
  }
}
```

Cuối cùng, chúng ta cần mã thực sự áp dụng yaw và pitch được tính toán vào hướng của người xem. Hàm `applyMouseMovement()` xử lý điều đó:

```js
function applyMouseMovement(refSpace) {
  if (!mouseYaw && !mousePitch) {
    return refSpace;
  }

  quat.identity(inverseOrientation);
  quat.rotateX(inverseOrientation, inverseOrientation, -mousePitch);
  quat.rotateY(inverseOrientation, inverseOrientation, -mouseYaw);

  let newTransform = new XRRigidTransform(
    { x: 0, y: 0, z: 0 },
    {
      x: inverseOrientation[0],
      y: inverseOrientation[1],
      z: inverseOrientation[2],
      w: inverseOrientation[3],
    },
  );

  return refSpace.getOffsetReferenceSpace(newTransform);
}
```

Hàm này tạo một ma trận hướng nghịch đảo, được sử dụng để định hướng người xem, từ các giá trị pitch và yaw hiện tại, sau đó sử dụng ma trận đó làm nguồn hướng khi gọi {{domxref("XRRigidTransform.XRRigidTransform", "XRRigidTransform()")}}. Không gian tham chiếu của {{domxref("XRRigidTransform")}} mới sau đó được lấy và trả về cho người gọi.

Không gian tham chiếu mới này có vị trí người xem không thay đổi, nhưng hướng của họ đã được thay đổi dựa trên các giá trị pitch và yaw được tạo ra từ các đầu vào chuột tích lũy. `applyMouseMovement()` nên được gọi khi vẽ một khung, ngay trước khi lấy tư thế của người xem bằng cách sử dụng {{domxref("XRFrame.getViewerPose", "getViewerPose()")}}, và việc kết xuất nên được thực hiện trong không gian tham chiếu này.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
