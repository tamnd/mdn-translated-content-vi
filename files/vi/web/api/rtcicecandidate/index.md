---
title: RTCIceCandidate
slug: Web/API/RTCIceCandidate
page-type: web-api-interface
browser-compat: api.RTCIceCandidate
---

{{APIRef("WebRTC")}}

Giao diện **`RTCIceCandidate`** - một phần của [WebRTC API](/en-US/docs/Web/API/WebRTC_API) - đại diện cho một cấu hình ứng cử viên Interactive Connectivity Establishment ({{Glossary("ICE")}}) có thể được dùng để thiết lập một {{domxref("RTCPeerConnection")}}.

Một ICE candidate mô tả các giao thức và đường định tuyến cần có để WebRTC có thể giao tiếp với một thiết bị từ xa. Khi bắt đầu một kết nối ngang hàng WebRTC, thông thường mỗi đầu của kết nối sẽ đề xuất một số candidate, cho đến khi hai bên thống nhất được một candidate mô tả kết nối mà họ cho là phù hợp nhất. Sau đó, WebRTC dùng chi tiết của candidate đó để khởi tạo kết nối.

Để xem chi tiết về cách quy trình ICE hoạt động, hãy xem [Lifetime of a WebRTC session](/en-US/docs/Web/API/WebRTC_API/Session_lifetime). Bài viết [WebRTC connectivity](/en-US/docs/Web/API/WebRTC_API/Connectivity) cung cấp thêm thông tin hữu ích.

## Constructor

- {{domxref("RTCIceCandidate.RTCIceCandidate()","RTCIceCandidate()")}}
  - : Tạo một đối tượng `RTCIceCandidate` để biểu diễn một ICE candidate đơn lẻ, và có thể được cấu hình bằng một đối tượng cấu hình.

    > [!NOTE]
    > Để tương thích ngược, constructor cũng chấp nhận một chuỗi chứa giá trị của thuộc tính {{domxref("RTCIceCandidate.candidate", "candidate")}} thay cho đối tượng cấu hình.

## Thuộc tính instance

- {{domxref("RTCIceCandidate.address", "address")}} {{ReadOnlyInline}}
  - : Một chuỗi chứa địa chỉ IP của candidate.
- {{domxref("RTCIceCandidate.candidate", "candidate")}} {{ReadOnlyInline}}
  - : Một chuỗi biểu diễn địa chỉ truyền tải của candidate có thể dùng cho các phép kiểm tra kết nối. Định dạng của địa chỉ này là một `candidate-attribute` như được định nghĩa trong {{RFC(5245)}}. Chuỗi này rỗng (`""`) nếu `RTCIceCandidate` là chỉ báo "end of candidates".
- {{domxref("RTCIceCandidate.component", "component")}} {{ReadOnlyInline}}
  - : Một chuỗi cho biết candidate là RTP hay RTCP; giá trị của nó là `rtp` hoặc `rtcp`, và được suy ra từ trường `"component-id"` trong chuỗi a-line `candidate`.
- {{domxref("RTCIceCandidate.foundation", "foundation")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi chứa định danh duy nhất, giống nhau cho mọi candidate cùng loại, cùng nền tảng cơ sở (địa chỉ mà ICE agent đã gửi candidate từ đó), và đến từ cùng một máy chủ {{Glossary("STUN")}}. Thuộc tính này giúp tối ưu hóa hiệu năng ICE khi ưu tiên và đối chiếu các candidate xuất hiện trên nhiều đối tượng {{domxref("RTCIceTransport")}}.
- {{domxref("RTCIceCandidate.port", "port")}} {{ReadOnlyInline}}
  - : Một giá trị số nguyên cho biết cổng của candidate.
- {{domxref("RTCIceCandidate.priority", "priority")}} {{ReadOnlyInline}}
  - : Một giá trị số nguyên dài cho biết độ ưu tiên của candidate.
- {{domxref("RTCIceCandidate.protocol", "protocol")}} {{ReadOnlyInline}}
  - : Một chuỗi cho biết giao thức của candidate là `"tcp"` hay `"udp"`.
- {{domxref("RTCIceCandidate.relatedAddress", "relatedAddress")}} {{ReadOnlyInline}}
  - : Nếu candidate được suy ra từ một candidate khác, `relatedAddress` là chuỗi chứa địa chỉ IP của candidate host đó. Với candidate host, giá trị này là `null`.
- {{domxref("RTCIceCandidate.relatedPort", "relatedPort")}} {{ReadOnlyInline}}
  - : Với candidate được suy ra từ một candidate khác, chẳng hạn relay hoặc reflexive, `relatedPort` là số chỉ cổng của candidate mà candidate này được suy ra từ đó. Với candidate host, thuộc tính `relatedPort` là `null`.
- {{domxref("RTCIceCandidate.sdpMid", "sdpMid")}} {{ReadOnlyInline}}
  - : Một chuỗi chỉ định thẻ định danh media stream của candidate, giúp xác định duy nhất media stream trong component mà candidate được gắn với, hoặc `null` nếu không có liên kết như vậy.
- {{domxref("RTCIceCandidate.sdpMLineIndex", "sdpMLineIndex")}} {{ReadOnlyInline}}
  - : Nếu không phải `null`, `sdpMLineIndex` cho biết chỉ số bắt đầu từ 0 của media description (như được định nghĩa trong [RFC 4566](https://datatracker.ietf.org/doc/html/rfc4566)) trong {{Glossary("SDP")}} mà candidate được gắn với.
- {{domxref("RTCIceCandidate.tcpType", "tcpType")}} {{ReadOnlyInline}}
  - : Nếu `protocol` là `"tcp"`, `tcpType` biểu diễn loại TCP candidate. Ngược lại, `tcpType` là `null`.
- {{domxref("RTCIceCandidate.type", "type")}} {{ReadOnlyInline}}
  - : Một chuỗi cho biết loại candidate, là một trong các chuỗi được liệt kê ở [`RTCIceCandidate.type`](/en-US/docs/Web/API/RTCIceCandidate/type#value).
- {{domxref("RTCIceCandidate.usernameFragment", "usernameFragment")}} {{ReadOnlyInline}}
  - : Một chuỗi chứa phân đoạn tên người dùng được sinh ngẫu nhiên ("ice-ufrag"), mà ICE dùng cho toàn vẹn thông điệp cùng với mật khẩu được sinh ngẫu nhiên ("ice-pwd"). Bạn có thể dùng chuỗi này để kiểm tra các thế hệ ICE; mỗi thế hệ của cùng một tiến trình ICE sẽ dùng cùng `usernameFragment`, kể cả sau khi ICE khởi động lại.

## Phương thức instance

- {{domxref("RTCIceCandidate.toJSON", "toJSON()")}}
  - : Trả về một biểu diễn {{Glossary("JSON")}} của cấu hình hiện tại của `RTCIceCandidate`.
    Định dạng của biểu diễn này giống với đối tượng `candidateInfo` có thể được truyền tùy chọn vào constructor {{domxref("RTCIceCandidate.RTCIceCandidate()","RTCIceCandidate()")}} để cấu hình candidate.

## Ví dụ

Xem bài viết [Signaling and video calling](/en-US/docs/Web/API/WebRTC_API/Signaling_and_video_calling), bài này minh họa toàn bộ quy trình.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
