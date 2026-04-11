---
title: RTCIceTransport
slug: Web/API/RTCIceTransport
page-type: web-api-interface
browser-compat: api.RTCIceTransport
---

{{APIRef("WebRTC")}}

Giao diện **`RTCIceTransport`** cung cấp quyền truy cập vào thông tin về lớp truyền tải {{Glossary("ICE")}} qua đó dữ liệu được gửi và nhận.
Điều này đặc biệt hữu ích khi bạn cần truy cập thông tin trạng thái về kết nối.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện `RTCIceTransport` kế thừa các thuộc tính từ lớp cha {{domxref("EventTarget")}}. Nó cũng cung cấp các thuộc tính sau:_

- {{domxref("RTCIceTransport.component", "component")}} {{ReadOnlyInline}}
  - : Thành phần ICE đang được truyền tải sử dụng. Giá trị là một trong các chuỗi từ kiểu liệt kê `RTCIceTransport`: `{{Glossary("RTP", '"RTP"')}}` hoặc `"RTSP"`.
- {{domxref("RTCIceTransport.gatheringState", "gatheringState")}} {{ReadOnlyInline}}
  - : Chuỗi cho biết trạng thái thu thập hiện tại của tác nhân ICE: `"new"`, `"gathering"`, hoặc `"complete"`.
- {{domxref("RTCIceTransport.role", "role")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi có giá trị là `"controlling"` hoặc `"controlled"`; giá trị này cho biết liệu tác nhân ICE có phải là bên đưa ra quyết định cuối cùng về cặp ứng cử viên cần sử dụng hay không.
- {{domxref("RTCIceTransport.state", "state")}} {{ReadOnlyInline}}
  - : Chuỗi cho biết trạng thái hiện tại của tác nhân ICE. Giá trị của `state` có thể được dùng để xác định liệu tác nhân ICE đã thiết lập kết nối ban đầu bằng cặp ứng cử viên khả thi (`"connected"`), đã hoàn thành lựa chọn cặp ứng cử viên (`"completed"`), hay đang ở trạng thái lỗi (`"failed"`), cùng các trạng thái khác.

## Phương thức phiên bản

_Cũng bao gồm các phương thức từ {{domxref("EventTarget")}}, giao diện cha._

- {{domxref("RTCIceTransport.getLocalCandidates", "getLocalCandidates()")}}
  - : Trả về một mảng các đối tượng {{domxref("RTCIceCandidate")}}, mỗi đối tượng mô tả một trong các ứng cử viên ICE đã được thu thập đến nay cho thiết bị cục bộ. Đây là những ứng cử viên đã được gửi đến đối tác từ xa bằng cách gửi sự kiện {{domxref("RTCPeerConnection.icecandidate_event", "icecandidate")}} đến {{domxref("RTCPeerConnection")}} để truyền đi.
- {{domxref("RTCIceTransport.getLocalParameters", "getLocalParameters()")}}
  - : Trả về đối tượng {{domxref("RTCIceParameters")}} mô tả các tham số ICE được thiết lập bởi lần gọi phương thức {{domxref("RTCPeerConnection.setLocalDescription()")}}. Trả về `null` nếu các tham số chưa được nhận.
- {{domxref("RTCIceTransport.getRemoteCandidates", "getRemoteCandidates()")}}
  - : Trả về một mảng các đối tượng {{domxref("RTCIceCandidate")}}, mỗi đối tượng cho một ứng cử viên ICE của thiết bị từ xa đã được đầu cục bộ của {{domxref("RTCPeerConnection")}} nhận và chuyển đến ICE bằng cách gọi {{domxref("RTCPeerConnection.addIceCandidate()", "addIceCandidate()")}}.
- {{domxref("RTCIceTransport.getRemoteParameters", "getRemoteParameters()")}}
  - : Trả về đối tượng {{domxref("RTCIceParameters")}} chứa các tham số ICE cho thiết bị từ xa, được thiết lập bởi lần gọi {{domxref("RTCPeerConnection.setRemoteDescription()")}}. Nếu `setRemoteDescription()` chưa được gọi, giá trị trả về là `null`.
- {{domxref("RTCIceTransport.getSelectedCandidatePair", "getSelectedCandidatePair()")}}
  - : Trả về đối tượng {{domxref("RTCIceCandidatePair")}} xác định hai ứng cử viên, mỗi ứng cử viên cho một đầu của kết nối, đã được chọn đến nay. Có thể có một cặp tốt hơn được tìm thấy và chọn sau; nếu bạn cần theo dõi điều này, hãy chú ý sự kiện {{domxref("RTCIceTransport.selectedcandidatepairchange_event", "selectedcandidatepairchange")}}. Nếu chưa có cặp ứng cử viên nào được chọn, giá trị trả về là `null`.

## Sự kiện

Lắng nghe các sự kiện này bằng {{domxref("EventTarget.addEventListener", "addEventListener()")}} hoặc bằng cách gán trình xử lý sự kiện vào thuộc tính `oneventname` của giao diện này.

- {{domxref("RTCIceTransport.gatheringstatechange_event", "gatheringstatechange")}}
  - : Được gửi đến đối tượng `RTCIceTransport` để cho biết giá trị của thuộc tính {{domxref("RTCIceTransport.gatheringState", "gatheringState")}} đã thay đổi, biểu thị sự thay đổi trong quá trình thương lượng ứng cử viên ICE của truyền tải này.
    Cũng có thể truy cập thông qua thuộc tính trình xử lý sự kiện {{domxref("RTCIceTransport.gatheringstatechange_event", "ongatheringstatechange")}}.
- {{domxref("RTCIceTransport.selectedcandidatepairchange_event", "selectedcandidatepairchange")}}
  - : Được gửi đến `RTCIceTransport` khi một cặp ứng cử viên tốt hơn được chọn để mô tả khả năng kết nối giữa hai đối tác. Điều này xảy ra trong quá trình thương lượng hoặc tái thương lượng, kể cả sau khi khởi động lại ICE, vốn tái sử dụng các đối tượng `RTCIceTransport` hiện có. Cặp ứng cử viên hiện tại có thể được lấy bằng {{domxref("RTCIceTransport.getSelectedCandidatePair", "getSelectedCandidatePair()")}}.
    Cũng có thể truy cập bằng thuộc tính trình xử lý sự kiện {{domxref("RTCIceTransport.selectedcandidatepairchange_event", "onselectedcandidatepairchange")}}.
- {{domxref("RTCIceTransport.statechange_event", "statechange")}}
  - : Được gửi đến phiên bản `RTCIceTransport` khi giá trị của thuộc tính {{domxref("RTCIceTransport.state", "state")}} đã thay đổi, cho biết quá trình thu thập ICE đã thay đổi trạng thái.
    Cũng có thể truy cập thông qua thuộc tính trình xử lý sự kiện {{domxref("RTCIceTransport.statechange_event", "onstatechange")}}.

## Ví dụ

Sẽ cập nhật sau.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
