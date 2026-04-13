---
title: DOMPoint
slug: Web/API/DOMPoint
page-type: web-api-interface
browser-compat: api.DOMPoint
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Một đối tượng **`DOMPoint`** đại diện cho một điểm 2D hoặc 3D trong hệ tọa độ; nó bao gồm các giá trị tọa độ theo tối đa ba chiều, cũng như giá trị phối cảnh tùy chọn. `DOMPoint` dựa trên {{domxref("DOMPointReadOnly")}} nhưng cho phép thay đổi giá trị của các thuộc tính.

Nói chung, thành phần `x` dương đại diện cho vị trí bên phải gốc tọa độ, thành phần `y` dương là hướng xuống từ gốc tọa độ, và thành phần `z` dương kéo dài ra phía trước màn hình (hướng về phía người dùng).

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("DOMPoint.DOMPoint","DOMPoint()")}}
  - : Tạo và trả về một đối tượng `DOMPoint` mới với giá trị của không hoặc nhiều thành phần tọa độ và giá trị phối cảnh `w` tùy chọn. Bạn cũng có thể dùng đối tượng `DOMPoint` hoặc `DOMPointReadOnly` hiện có, hoặc một đối tượng bất kỳ, để tạo điểm mới bằng cách gọi phương thức tĩnh {{domxref("DOMPoint.fromPoint_static", "DOMPoint.fromPoint()")}}.

## Thuộc tính phiên bản

_`DOMPoint` cũng có thể kế thừa các thuộc tính từ lớp cha, {{domxref("DOMPointReadOnly")}}._

- {{domxref("DOMPoint.x")}}
  - : Tọa độ `x` của `DOMPoint`.
- {{domxref("DOMPoint.y")}}
  - : Tọa độ `y` của `DOMPoint`.
- {{domxref("DOMPoint.z")}}
  - : Tọa độ `z` của `DOMPoint`.
- {{domxref("DOMPoint.w")}}
  - : Giá trị phối cảnh của `DOMPoint`.

## Phương thức phiên bản

_`DOMPoint` kế thừa các phương thức phiên bản từ lớp cha, {{domxref("DOMPointReadOnly")}}._

## Phương thức tĩnh

_`DOMPoint` cũng có thể kế thừa các phương thức tĩnh từ lớp cha, {{domxref("DOMPointReadOnly")}}._

- {{domxref("DOMPoint/fromPoint_static", "DOMPoint.fromPoint()")}}
  - : Tạo một đối tượng `DOMPoint` có thể thay đổi mới từ một điểm đã có (hoặc một đối tượng có các thuộc tính phù hợp), cung cấp các giá trị cho các thuộc tính của nó.

## Ví dụ

Trong [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API), các giá trị `DOMPointReadOnly` đại diện cho vị trí và hướng. Trong đoạn mã dưới đây, tư thế của thiết bị XR có thể được lấy bằng cách gọi {{domxref("XRFrame.getViewerPose()")}} trong animation frame của {{domxref("XRSession")}}.

```js
function onXRFrame(time, xrFrame) {
  let viewerPose = xrFrame.getViewerPose(xrReferenceSpace);

  if (viewerPose) {
    let position = viewerPose.transform.position;
    let orientation = viewerPose.transform.orientation;

    console.log(
      `XR Viewer Position: {x: ${roundToTwo(position.x)}, y: ${roundToTwo(
        position.y,
      )}, z: ${roundToTwo(position.z)}`,
    );

    console.log(
      `XR Viewer Orientation: {x: ${roundToTwo(orientation.x)}, y: ${roundToTwo(
        orientation.y,
      )}, z: ${roundToTwo(orientation.z)}, w: ${roundToTwo(orientation.w)}`,
    );
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMRect")}}
- {{domxref("DOMMatrix")}}
