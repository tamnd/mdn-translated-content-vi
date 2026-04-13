---
title: XRBoundedReferenceSpace
slug: Web/API/XRBoundedReferenceSpace
page-type: web-api-interface
status:
  - experimental
browser-compat: api.XRBoundedReferenceSpace
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}{{SeeCompatTable}}

Giao diện **`XRBoundedReferenceSpace`** của [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API) mô tả một [không gian tham chiếu](/en-US/docs/Web/API/WebXR_Device_API/Geometry) thế giới ảo có ranh giới được định sẵn. Giao diện này mở rộng {{domxref("XRReferenceSpace")}}, vốn mô tả một không gian về cơ bản không bị giới hạn xung quanh vị trí của người xem. Các ranh giới này được xác định bằng một mảng các điểm, mỗi điểm xác định một đỉnh trong đa giác mà bên trong đó người dùng được phép di chuyển.

Giao diện này thường được dùng khi hệ thống XR có khả năng theo dõi chuyển động vật lý của người dùng trong phạm vi giới hạn từ vị trí xuất phát của họ. Các ranh giới được chỉ định có thể mô tả hình dạng và kích thước của phòng mà người dùng đang ở, nhằm giúp trang web hoặc ứng dụng WebXR ngăn người dùng va chạm với tường hoặc các vật cản khác trong thế giới thực. Ít nhất thì ranh giới chỉ ra khu vực mà thiết bị XR có thể theo dõi chuyển động của người dùng. Xem bài viết [Sử dụng không gian tham chiếu có giới hạn](/en-US/docs/Web/API/WebXR_Device_API/Bounded_reference_spaces) để biết chi tiết về cách hoạt động của không gian có giới hạn và lý do chúng hữu ích.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Ngoài các thuộc tính của {{domxref("XRReferenceSpace")}}, `XRBoundedReferenceSpace` bao gồm những thuộc tính sau:_

- {{domxref("XRBoundedReferenceSpace.boundsGeometry", "boundsGeometry")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một mảng các đối tượng {{domxref("DOMPointReadOnly")}}, mỗi đối tượng xác định một đỉnh trong đa giác xác định ranh giới mà người dùng phải ở trong đó. Các đỉnh này phải được sắp xếp sao cho chúng di chuyển theo chiều kim đồng hồ quanh vị trí của người xem.

## Phương thức phiên bản

_`XRBoundedReferenceSpace` kế thừa các phương thức của giao diện cha, {{domxref("XRReferenceSpace")}}. Nó không có phương thức riêng._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API)
- [Hình học và không gian tham chiếu trong WebXR](/en-US/docs/Web/API/WebXR_Device_API/Geometry)
- [Điểm nhìn và người xem: mô phỏng camera trong WebXR](/en-US/docs/Web/API/WebXR_Device_API/Cameras)
