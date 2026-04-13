---
title: "XRBoundedReferenceSpace: thuộc tính boundsGeometry"
short-title: boundsGeometry
slug: Web/API/XRBoundedReferenceSpace/boundsGeometry
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRBoundedReferenceSpace.boundsGeometry
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`boundsGeometry`** của {{domxref("XRBoundedReferenceSpace")}} là một mảng các đối tượng {{domxref("DOMPointReadOnly")}} xác định các điểm tạo nên đa giác mà bên trong đó người xem được phép di chuyển. Mỗi điểm được xử lý như một điểm hai chiều và phải nằm ở mặt đất (tức là tọa độ `y` phải bằng 0).

Ranh giới này thường được người dùng cấu hình thông qua phần mềm điều khiển thiết bị XR của họ. Việc này có thể được thực hiện bằng cách đi dọc theo biên của không gian mà họ muốn sử dụng, hoặc bằng cách vẽ hình dạng phòng của họ bằng thiết bị đầu vào XR. Về lý thuyết, một hệ thống tiên tiến hơn có thể sử dụng cảm biến hoặc các phương pháp phát hiện khác để xác định ranh giới của phòng XR chuyên dụng.

## Giá trị

Thuộc tính `boundsGeometry` là một mảng các đối tượng {{domxref("DOMPointReadOnly")}}, mỗi đối tượng xác định một đỉnh trong đa giác mà bên trong đó người xem phải ở. Mỗi điểm phải ở mức sàn, với giá trị tọa độ `y` được đặt thành 0. Ngoài ra, giá trị `w` luôn là 1 tại mọi điểm trong mảng. Các điểm cũng phải được liệt kê theo thứ tự chiều kim đồng hồ.

Mỗi mục trong `boundsGeometry` tương đương với một mục trong danh sách các điểm hình học ranh giới gốc của phòng, nhân trước với nghịch đảo của độ lệch gốc. Nói cách khác, ranh giới là các giới hạn vật lý của không gian khả dụng, được dịch chuyển sao cho tất cả các điểm ranh giới của không gian tham chiếu đều được xác định tương đối với gốc hiệu dụng của `XRBoundedReferenceSpace`.

## Ghi chú sử dụng

Không gian tham chiếu có giới hạn luôn có gốc tọa độ đặt ở mặt đất, trong đó `y` bằng 0. Thông thường, gốc tọa độ cho `x` và `z` nằm ở gần trung tâm của không gian, với hướng được đặt theo chiều tiến logic phù hợp với nền tảng hoặc phần cứng XR.

Để giảm nguy cơ ranh giới phòng bị sử dụng cho mục đích [lấy dấu vân tay (fingerprinting)](/en-US/docs/Glossary/Fingerprinting), mỗi điểm trong mảng `boundsGeometry` có thể được làm tròn hoặc điều chỉnh một lượng nhất định. Đặc tả khuyến nghị rằng các trình duyệt dịch chuyển các điểm đến gần nhất 5 cm (trong khi tránh vượt ra ngoài giới hạn vật lý của phần cứng).

### Kích thước ranh giới

`XRBoundedReferenceSpace` không được thiết kế để dùng cho các vùng giới hạn rất lớn. Thay vào đó, nó được thiết kế cho các không gian một phòng với không quá khoảng 15 mét không gian di chuyển khả dụng theo bất kỳ hướng nào từ gốc gốc. Tuy nhiên, ranh giới mở rộng lên vô tận vì ranh giới chỉ được xác định trong hai chiều.

Nếu bạn cần tạo không gian nhiều phòng hoặc không gian rất lớn hay cần có mức sàn thay đổi, bạn nên sử dụng {{domxref("XRReferenceSpace")}} không giới hạn và tự mình thực thi các giới hạn theo cách phù hợp.

### Hình dạng ranh giới

Hình dạng được xác định bởi `boundsGeometry` có thể đơn giản như hình vuông hoặc phức tạp tùy theo nhu cầu, có thể bao gồm các phần lõm và/hoặc lồi. Tuy nhiên, bạn không thể biểu diễn các không gian có mức sàn không đều bằng `XRBoundedReferenceSpace`. Mặt đất luôn ở `y` = 0.

Điều quan trọng là nội dung của bạn không được yêu cầu người dùng thoát ra khỏi ranh giới được chỉ định bởi `boundsGeometry`. Tuy nhiên, nếu môi trường xung quanh người dùng cho phép họ di chuyển theo cách thoát ra khỏi ranh giới đã xác định, nội dung của bạn phải có khả năng xử lý tình huống đó một cách linh hoạt, vì đây không được coi là điều kiện lỗi.

Mặc dù một số ví dụ hiển thị lưới hoặc hình dạng khác để thể hiện ranh giới cho người dùng, trong ứng dụng thực tế bạn không nên làm như vậy. Tuy nhiên, trình duyệt nên cung cấp các cảnh báo thích hợp cho người dùng về bất kỳ rủi ro nào (chẳng hạn như nguy cơ họ có thể đụng vào tường vật lý nếu tiếp tục di chuyển).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
