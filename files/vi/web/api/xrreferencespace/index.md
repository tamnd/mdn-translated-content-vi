---
title: XRReferenceSpace
slug: Web/API/XRReferenceSpace
page-type: web-api-interface
browser-compat: api.XRReferenceSpace
---

{{APIRef("WebXR Device API")}}{{secureContext_header}}

Giao diện **`XRReferenceSpace`** của WebXR Device API mô tả hệ tọa độ cho một thực thể hoặc đối tượng được theo dõi cụ thể trong thế giới ảo bằng cách sử dụng hành vi theo dõi được chỉ định. Hành vi theo dõi được xác định bởi [loại không gian tham chiếu](#reference_space_types) được chọn. Nó mở rộng lớp cơ sở {{domxref("XRSpace")}}, bổ sung hỗ trợ cho một số hành vi theo dõi khác nhau cũng như yêu cầu một không gian tham chiếu mới mô tả phép biến đổi độ lệch giữa đối tượng được theo dõi và một vị trí khác trong thế giới.

Tất cả không gian tham chiếu, với ngoại lệ duy nhất là không gian tham chiếu có giới hạn, đều được mô tả bằng kiểu `XRReferenceSpace`. Không gian có giới hạn được triển khai dưới dạng các đối tượng {{domxref("XRBoundedReferenceSpace")}}. Đây là các không gian đặc biệt cho phép bạn thiết lập một phạm vi trong đó "an toàn" cho người xem di chuyển. Đối với các hệ thống XR cho phép người dùng di chuyển vật lý, chẳng hạn như những hệ thống theo dõi chuyển động bằng camera thực tế, ranh giới này xác định các cạnh của khu vực người dùng có thể di chuyển, dù do vật cản vật lý hay do giới hạn phần cứng XR. Xem bài viết [Sử dụng không gian tham chiếu có giới hạn để bảo vệ người xem](/en-US/docs/Web/API/WebXR_Device_API/Bounded_reference_spaces) để biết thêm về việc sử dụng ranh giới để giữ người dùng không va chạm với các vật cản vật lý và ảo.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_`XRReferenceSpace` kế thừa các thuộc tính của {{domxref("EventTarget")}} nhưng không định nghĩa thêm thuộc tính nào._

## Phương thức phiên bản

_`XRReferenceSpace` cũng kế thừa các phương thức từ {{domxref("EventTarget")}} ngoài các phương thức sau._

- {{domxref("XRReferenceSpace.getOffsetReferenceSpace", "getOffsetReferenceSpace()")}}
  - : Tạo và trả về một đối tượng không gian tham chiếu mới cùng loại với đối tượng mà bạn gọi phương thức này (do đó là `XRReferenceSpace` hoặc {{domxref("XRBoundedReferenceSpace")}}). Không gian tham chiếu mới có thể được sử dụng để biến đổi một tọa độ từ không gian tham chiếu của đối tượng mà phương thức được gọi thành một không gian tọa độ khác. Điều này hữu ích để định vị các đối tượng khi kết xuất và thực hiện các biến đổi cần thiết khi thay đổi vị trí và/hoặc hướng của người xem trong không gian 3D.

## Sự kiện

- {{domxref("XRReferenceSpace.reset_event", "reset")}}
  - : Sự kiện `reset` được gửi đến đối tượng `XRReferenceSpace` khi trình duyệt phát hiện ra sự gián đoạn giữa gốc tọa độ của đối tượng được theo dõi và môi trường hoặc vị trí của người dùng. Điều này có thể xảy ra, ví dụ, sau khi người dùng hiệu chỉnh lại thiết bị XR của mình, hoặc nếu thiết bị tự động điều chỉnh gốc tọa độ sau khi mất và lấy lại tín hiệu theo dõi.

## Các loại không gian tham chiếu

Các loại không gian tham chiếu được liệt kê trong bảng dưới đây, với thông tin ngắn gọn về trường hợp sử dụng và giao diện nào được dùng để triển khai chúng.

- `bounded-floor`
  - : Một {{domxref("XRBoundedReferenceSpace")}} tương tự như loại `local`, ngoại trừ người dùng không được phép di chuyển ra ngoài ranh giới được xác định trước, được cho bởi {{domxref("XRBoundedReferenceSpace.boundsGeometry", "boundsGeometry")}} trong đối tượng được trả về.
- `local`
  - : Một không gian theo dõi `XRReferenceSpace` có gốc tọa độ gốc đặt gần vị trí của người xem tại thời điểm phiên được tạo. Vị trí chính xác phụ thuộc vào nền tảng và triển khai cơ bản. Người dùng không được mong đợi di chuyển nhiều hơn so với vị trí bắt đầu, và việc theo dõi được tối ưu hóa cho trường hợp sử dụng này. Đối với các thiết bị có theo dõi sáu bậc tự do (6DoF), không gian tham chiếu `local` cố gắng giữ gốc ổn định so với môi trường.
- `local-floor`
  - : Một `XRReferenceSpace` tương tự như loại `local`, ngoại trừ vị trí bắt đầu được đặt ở vị trí an toàn để người xem đứng, nơi giá trị của trục y là 0 ở mức sàn. Nếu mức sàn đó không được biết, {{Glossary("user agent")}} sẽ ước tính mức sàn. Nếu mức sàn ước tính khác không, trình duyệt dự kiến sẽ làm tròn nó theo cách để tránh [fingerprinting](/en-US/docs/Glossary/Fingerprinting) (thường đến centimet gần nhất).
- `unbounded`
  - : Một không gian theo dõi `XRReferenceSpace` cho phép người dùng hoàn toàn tự do di chuyển, có thể trên khoảng cách rất xa từ điểm gốc. Người xem không được theo dõi chút nào; việc theo dõi được tối ưu hóa cho sự ổn định xung quanh vị trí hiện tại của người dùng, do đó gốc tọa độ gốc có thể trôi dạt khi cần để đáp ứng nhu cầu đó.
- `viewer`
  - : Một không gian theo dõi `XRReferenceSpace` có gốc tọa độ gốc theo dõi vị trí và hướng của người xem. Điều này được sử dụng cho các môi trường trong đó người dùng có thể di chuyển vật lý và được hỗ trợ bởi tất cả các phiên bản {{domxref("XRSession")}}, cả immersive và inline, mặc dù nó hữu ích nhất cho các phiên inline. Nó đặc biệt hữu ích khi xác định khoảng cách giữa người xem và đầu vào, hoặc khi làm việc với các không gian độ lệch. Nếu không, thường thì một trong các loại không gian tham chiếu khác sẽ được sử dụng thường xuyên hơn.

## Ghi chú sử dụng

### Tạo một XRReferenceSpace

Có hai tình huống khi bạn cần lấy một `XRReferenceSpace`. Đầu tiên là khi bạn thiết lập cảnh của mình và cần lấy một không gian tham chiếu để đại diện cho góc nhìn của người dùng về thế giới trong suốt {{domxref("XRSession")}}. Để làm điều đó, hãy gọi phương thức {{domxref("XRSession.requestReferenceSpace", "requestReferenceSpace()")}} của {{domxref("XRSession")}}, chỉ định loại không gian tham chiếu bạn muốn lấy.

```js
xrSession.requestReferenceSpace("local").then((refSpace) => {
  xrReferenceSpace = refSpace;
  // …
});
```

Tình huống khác khi bạn có thể cần lấy một không gian tham chiếu mới là nếu bạn cần di chuyển gốc tọa độ đến một vị trí mới; điều này thường được thực hiện, ví dụ, khi dự án của bạn cho phép người dùng di chuyển qua môi trường bằng cách sử dụng các thiết bị đầu vào như bàn phím, chuột, touchpad hoặc tay cầm game không được kết nối qua thiết bị XR. Vì gốc tọa độ thường là vị trí của người dùng trong không gian, bạn cần thay đổi gốc tọa độ để phản ánh chuyển động của họ và bất kỳ thay đổi hướng nào họ thực hiện.

Để di chuyển hoặc xoay góc nhìn của người dùng về thế giới, bạn cần thay đổi `XRReferenceSpace` được sử dụng để đại diện cho góc nhìn đó. Tuy nhiên, `XRReferenceSpace` là bất biến, vì vậy bạn cần tạo một không gian tham chiếu mới đại diện cho góc nhìn đã thay đổi. Điều này dễ dàng thực hiện bằng cách sử dụng phương thức {{domxref("XRReferenceSpace.getOffsetReferenceSpace", "getOffsetReferenceSpace()")}}.

```js
let offsetTransform = new XRRigidTransform(
  { x: 2, y: 0, z: 1 },
  { x: 0, y: 0, z: 0, w: 1 },
);
xrReferenceSpace = xrReferenceSpace.getOffsetReferenceSpace(offsetTransform);
```

Điều này thay thế `XRReferenceSpace` bằng một cái mới có gốc tọa độ và hướng được điều chỉnh để đặt gốc tọa độ mới tại (2, 0, 1) so với gốc tọa độ hiện tại và xoay theo một {{Glossary("quaternion")}} đơn vị hướng không gian để người xem nhìn thẳng lên so với hướng thế giới trước đó.

### Hình học

Gốc tọa độ gốc của bất kỳ `XRReferenceSpace` nào luôn được cấu hình sao cho +X được coi là bên phải, +Y là hướng lên và +Z là "ra sau" hay về phía người dùng.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Cơ bản về WebXR](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals)
- [Hình học và không gian tham chiếu trong WebXR](/en-US/docs/Web/API/WebXR_Device_API/Geometry)
- [Góc nhìn và người xem: Mô phỏng camera trong WebXR](/en-US/docs/Web/API/WebXR_Device_API/Cameras)
- [Toán học ma trận cho web](/en-US/docs/Web/API/WebGL_API/Matrix_math_for_the_web)
- [Chuyển động, hướng và vận động](/en-US/docs/Web/API/WebXR_Device_API/Movement_and_motion)
- [Sử dụng không gian tham chiếu có giới hạn để bảo vệ người dùng](/en-US/docs/Web/API/WebXR_Device_API/Bounded_reference_spaces)
