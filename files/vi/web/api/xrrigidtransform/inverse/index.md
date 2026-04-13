---
title: "XRRigidTransform: inverse property"
short-title: inverse
slug: Web/API/XRRigidTransform/inverse
page-type: web-api-instance-property
browser-compat: api.XRRigidTransform.inverse
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`inverse`** của giao diện {{domxref("XRRigidTransform")}} trả về một đối tượng {{domxref("XRRigidTransform")}} khác là nghịch đảo của phép biến đổi sở hữu nó. Tức là, bạn luôn có thể lấy nghịch đảo của bất kỳ `XRRigidTransform` nào bằng cách sử dụng thuộc tính `inverse` của nó, thay vì phải tạo rõ ràng.

## Giá trị

Một {{domxref("XRRigidTransform")}} chứa nghịch đảo của `XRRigidTransform` mà nó được truy cập.

Áp dụng nghịch đảo của một phép biến đổi cho bất kỳ đối tượng nào đã được biến đổi trước đó bởi `XRRigidTransform` cha luôn hoàn tác phép biến đổi, dẫn đến việc đối tượng quay trở về tư thế trước đó. Nói cách khác, cả vị trí lẫn hướng đều trở về cấu hình trước đó.

## Ví dụ

Trong ví dụ này, ma trận nhìn mô hình cho một đối tượng được tính bằng cách lấy ma trận nhìn và nhân với ma trận tư thế của đối tượng.

```js
const modelViewMatrix = mat4.create();

for (const view of pose.view) {
  const viewport = glLayer.getViewport(view);
  gl.viewport(viewport.x, viewport.y, viewport.width, viewport.height);

  // …

  mat4.multiply(modelViewMatrix, view.transform.inverse.matrix, objectMatrix);
  gl.uniformMatrix4fv(
    programInfo.uniformLocations.modelViewMatrix,
    false,
    modelViewMatrix,
  );

  // …
}
```

Phác thảo mã lõi của trình kết xuất này cho thấy cách tư thế nhìn được biểu diễn bằng cách lấy ma trận nghịch đảo của phép biến đổi của nó làm ma trận nhìn mô hình được sử dụng để biến đổi các đối tượng dựa trên vị trí và hướng của người xem. Ma trận nghịch đảo được nhân với ma trận của đối tượng để có được ma trận nhìn mô hình, sau đó được truyền vào chương trình đổ bóng bằng cách thiết lập một uniform chứa thông tin đó.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
