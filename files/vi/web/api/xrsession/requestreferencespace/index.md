---
title: "XRSession: phương thức requestReferenceSpace()"
short-title: requestReferenceSpace()
slug: Web/API/XRSession/requestReferenceSpace
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRSession.requestReferenceSpace
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`requestReferenceSpace()`** của giao diện {{DOMxRef("XRSession")}} trả về một {{JSxRef("promise")}} resolve với một thể hiện của {{DOMxRef("XRReferenceSpace")}} hoặc {{DOMxRef("XRBoundedReferenceSpace")}} tùy thuộc vào loại không gian tham chiếu được yêu cầu.

## Cú pháp

```js-nolint
requestReferenceSpace(referenceSpaceType)
```

### Tham số

- `type`
  - : Một chuỗi chỉ định loại không gian tham chiếu mà một thể hiện sẽ được trả về. Chuỗi phải là một trong các giá trị bên dưới.

### Giá trị trả về

Một {{JSxRef("Promise")}} resolve với một đối tượng {{DOMxRef("XRReferenceSpace")}}.

Các loại không gian tham chiếu được liệt kê bên dưới, với thông tin ngắn gọn về trường hợp sử dụng và giao diện nào được sử dụng để triển khai chúng.

- `bounded-floor`
  - : Một {{domxref("XRBoundedReferenceSpace")}} tương tự như loại `local`, ngoại trừ người dùng không dự kiến di chuyển nhiều ra ngoài một ranh giới được xác định trước, được cho bởi {{domxref("XRBoundedReferenceSpace.boundsGeometry", "boundsGeometry")}} trong đối tượng được trả về.
- `local`
  - : Một {{domxref("XRReferenceSpace")}} không gian theo dõi có nguồn gốc gốc nằm gần vị trí của người xem tại thời điểm phiên được tạo. Vị trí chính xác phụ thuộc vào nền tảng và triển khai cơ bản. Người dùng không dự kiến di chuyển nhiều nếu có ra ngoài vị trí bắt đầu của họ và việc theo dõi được tối ưu hóa cho trường hợp sử dụng này. Đối với các thiết bị có theo dõi sáu bậc tự do (6DoF), không gian tham chiếu `local` cố gắng giữ nguồn gốc ổn định so với môi trường.
- `local-floor`
  - : Một {{domxref("XRReferenceSpace")}} tương tự như loại `local`, ngoại trừ vị trí bắt đầu được đặt ở vị trí an toàn để người dùng đứng, trong đó giá trị trục y là 0 ở mức sàn. Nếu mức sàn đó không được biết, {{Glossary("user agent")}} sẽ ước tính mức sàn. Nếu mức sàn ước tính khác không, trình duyệt được mong đợi làm tròn nó theo cách tránh [fingerprinting](/en-US/docs/Glossary/Fingerprinting) (có thể đến centimet gần nhất).
- `unbounded`
  - : Một {{domxref("XRReferenceSpace")}} không gian theo dõi cho phép người dùng tự do di chuyển hoàn toàn, có thể qua khoảng cách cực kỳ dài từ điểm gốc của họ. Người xem không được theo dõi; theo dõi được tối ưu hóa cho sự ổn định xung quanh vị trí hiện tại của người dùng, vì vậy nguồn gốc gốc có thể trôi khi cần để đáp ứng nhu cầu đó.
- `viewer`
  - : Một {{domxref("XRReferenceSpace")}} không gian theo dõi có nguồn gốc gốc theo dõi vị trí và hướng của người xem. Điều này được sử dụng cho các môi trường mà người dùng có thể di chuyển vật lý xung quanh và được hỗ trợ bởi tất cả các thể hiện của {{domxref("XRSession")}}, cả nhập vai và nội tuyến, mặc dù nó hữu ích nhất cho các phiên nội tuyến. Nó đặc biệt hữu ích khi xác định khoảng cách giữa người xem và đầu vào, hoặc khi làm việc với các không gian lệch. Nếu không, thông thường, một trong các loại không gian tham chiếu khác sẽ được sử dụng thường xuyên hơn.

### Ngoại lệ

Thay vì ném ngoại lệ thực sự, `requestReferenceSpace()` từ chối promise được trả về với một {{domxref("DOMException")}} có tên được tìm thấy trong danh sách bên dưới:

- `NotSupportedError`
  - : Không gian tham chiếu được yêu cầu không được hỗ trợ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
