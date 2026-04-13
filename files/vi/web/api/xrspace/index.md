---
title: XRSpace
slug: Web/API/XRSpace
page-type: web-api-interface
browser-compat: api.XRSpace
---

{{SecureContext_Header}}{{APIRef("WebXR Device API")}}

Giao diện **`XRSpace`** của [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API) là một giao diện trừu tượng cung cấp nền tảng chung cho mọi lớp đại diện cho một hệ tọa độ ảo trong thế giới ảo, trong đó điểm gốc của nó tương ứng với một vị trí vật lý. Dữ liệu không gian trong WebXR luôn được biểu thị tương đối với một đối tượng dựa trên một trong các giao diện kế thừa từ `XRSpace`, tại thời điểm một {{domxref("XRFrame")}} nhất định diễn ra.

Các giá trị số như vị trí pose là tọa độ trong `XRSpace` tương ứng, tương đối với gốc tọa độ của không gian đó.

> [!NOTE]
> Giao diện `XRSpace` không bao giờ được sử dụng trực tiếp; thay vào đó, tất cả các không gian được tạo bằng cách sử dụng một trong các giao diện dựa trên `XRSpace`. Hiện tại, các giao diện đó bao gồm {{domxref("XRReferenceSpace")}}, {{domxref("XRBoundedReferenceSpace")}}, và {{domxref("XRJointSpace")}}.

{{InheritanceDiagram}}

## Các giao diện dựa trên XRSpace

Dưới đây là danh sách các giao diện dựa trên giao diện `XRSpace`.

- {{domxref("XRBoundedReferenceSpace")}}
  - : Đại diện cho một không gian tham chiếu có thể di chuyển trong một vùng không gian mà ranh giới của nó được xác định bởi một mảng các điểm được sắp xếp theo chiều kim đồng hồ dọc theo sàn nhà để xác định vùng đi lại được của không gian. Điểm gốc của `XRBoundedReferenceSpace` luôn ở mức sàn, với tọa độ X và Z thường mặc định là vị trí gần trung tâm của phòng.
- {{domxref("XRReferenceSpace")}}
  - : Đại diện cho một không gian tham chiếu thường được mong đợi là tĩnh trong suốt thời gian của {{domxref("XRSession")}}. Mặc dù các đối tượng có thể di chuyển trong không gian, bản thân không gian vẫn cố định tại chỗ. Có những ngoại lệ đối với tính tĩnh này; phổ biến nhất là `XRReferenceSpace` có thể di chuyển để điều chỉnh dựa trên cấu hình lại của tai nghe hoặc thiết bị nhạy cảm với chuyển động khác của người dùng.
- {{domxref("XRJointSpace")}}
  - : Đại diện cho không gian của một khớp {{domxref("XRHand")}}.

## Thuộc tính phiên bản

_Giao diện `XRSpace` không định nghĩa thuộc tính riêng nào; tuy nhiên, nó kế thừa các thuộc tính của giao diện cha là {{domxref("EventTarget")}}._

## Phương thức phiên bản

_Giao diện `XRSpace` không cung cấp phương thức riêng nào. Tuy nhiên, nó kế thừa các phương thức của {{domxref("EventTarget")}}, giao diện cha của nó._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
