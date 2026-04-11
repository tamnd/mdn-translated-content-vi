---
title: RTCIceCandidatePairStats
slug: Web/API/RTCIceCandidatePairStats
page-type: web-api-interface
browser-compat: api.RTCStatsReport.type_candidate-pair
---

{{APIRef("WebRTC")}}

Từ điển **`RTCIceCandidatePairStats`** trong [WebRTC API](/en-US/docs/Web/API/WebRTC_API) được dùng để báo cáo các thống kê cung cấp thông tin về chất lượng và hiệu suất của một {{domxref("RTCPeerConnection")}} khi đang kết nối và được cấu hình theo cặp ứng viên {{Glossary("ICE")}} đã chỉ định.

Bạn có thể lấy các thống kê bằng cách duyệt qua {{domxref("RTCStatsReport")}} do {{domxref("RTCPeerConnection.getStats()")}} trả về cho đến khi tìm được mục có [`type`](/en-US/docs/Web/API/RTCIceCandidatePairStats/type) là `"candidate-pair"`.

## Thuộc tính phiên bản

- {{domxref("RTCIceCandidatePairStats.availableIncomingBitrate", "availableIncomingBitrate")}} {{optional_inline}} <!-- Not in BCD but is in spec IDL. -->
  - : Một số biểu thị băng thông đến khả dụng của kết nối mạng. Thuộc tính này báo cáo tổng số bit mỗi giây khả dụng cho tất cả các luồng {{Glossary("RTP")}} đến của cặp ứng viên. Không tính kích thước phần overhead của giao thức IP, TCP hay UDP.
- {{domxref("RTCIceCandidatePairStats.availableOutgoingBitrate", "availableOutgoingBitrate")}} {{optional_inline}}
  - : Một số biểu thị băng thông đi xấp xỉ khả dụng của kết nối mạng. Thuộc tính này báo cáo tổng số bit mỗi giây khả dụng cho tất cả các luồng {{Glossary("RTP")}} đi của cặp ứng viên. Không tính kích thước phần overhead của giao thức IP, TCP hay UDP.
- {{domxref("RTCIceCandidatePairStats/bytesDiscardedOnSend", "bytesDiscardedOnSend")}} {{optional_inline}} {{experimental_inline}}
  - : Một số nguyên biểu thị tổng số byte bị loại bỏ do lỗi socket trên cặp ứng viên này.
- {{domxref("RTCIceCandidatePairStats/bytesReceived", "bytesReceived")}} {{optional_inline}}
  - : Một số nguyên biểu thị tổng số byte dữ liệu đã nhận trên cặp ứng viên này.
- {{domxref("RTCIceCandidatePairStats.bytesSent", "bytesSent")}} {{optional_inline}}
  - : Một số nguyên biểu thị tổng số byte dữ liệu đã gửi trên cặp ứng viên này (không bao gồm header, phần đệm hoặc overhead giao thức khác).
- {{domxref("RTCIceCandidatePairStats/consentRequestsSent", "consentRequestsSent")}} {{optional_inline}} {{experimental_inline}}
  - : Một số nguyên biểu thị tổng số yêu cầu chấp thuận [STUN](/en-US/docs/Web/API/WebRTC_API/Protocols#stun) đã gửi trên cặp ứng viên này.
- {{domxref("RTCIceCandidatePairStats.currentRoundTripTime", "currentRoundTripTime")}} {{optional_inline}}
  - : Một số biểu thị tổng thời gian tính bằng giây đã trôi qua giữa lần gửi yêu cầu STUN gần nhất và nhận được phản hồi. Có thể dựa trên các yêu cầu liên quan đến xác nhận quyền mở kết nối.
- {{domxref("RTCIceCandidatePairStats.lastPacketReceivedTimestamp", "lastPacketReceivedTimestamp")}} {{optional_inline}}
  - : Giá trị {{domxref("DOMHighResTimeStamp")}} cho biết thời điểm gói dữ liệu cuối cùng được đầu cục bộ nhận từ đầu từ xa cho cặp ứng viên này. Không ghi lại dấu thời gian cho các gói STUN.
- {{domxref("RTCIceCandidatePairStats.lastPacketSentTimestamp", "lastPacketSentTimestamp")}} {{optional_inline}}
  - : Giá trị {{domxref("DOMHighResTimeStamp")}} cho biết thời điểm gói dữ liệu cuối cùng được đầu cục bộ gửi đến đầu từ xa cho cặp ứng viên này. Không ghi lại dấu thời gian cho các gói STUN.
- {{domxref("RTCIceCandidatePairStats.localCandidateId", "localCandidateId")}} {{optional_inline}}
  - : Một chuỗi biểu thị ID duy nhất tương ứng với {{domxref("RTCIceCandidate")}} từ dữ liệu trong đối tượng {{domxref("RTCIceCandidateStats")}} cung cấp thống kê cho ứng viên cục bộ của cặp ứng viên.
- {{domxref("RTCIceCandidatePairStats.nominated", "nominated")}} {{optional_inline}}
  - : Giá trị Boolean; nếu là `true`, cặp ứng viên được mô tả bởi đối tượng này đã được đề xuất để sử dụng và sẽ (hoặc đã) được dùng nếu mức ưu tiên của nó cao nhất trong số các cặp ứng viên được đề xuất. Xem {{RFC(5245, "", "7.1.3.2.4")}} để biết thêm chi tiết.
- {{domxref("RTCIceCandidatePairStats/packetsDiscardedOnSend", "packetsDiscardedOnSend")}} {{optional_inline}} {{experimental_inline}}
  - : Một số nguyên biểu thị tổng số gói dữ liệu bị loại bỏ do lỗi socket trên cặp ứng viên này.
- {{domxref("RTCIceCandidatePairStats/packetsReceived", "packetsReceived")}} {{optional_inline}} {{experimental_inline}}
  - : Một số nguyên biểu thị tổng số gói dữ liệu đã nhận trên cặp ứng viên này.
- {{domxref("RTCIceCandidatePairStats/packetsSent", "packetsSent")}} {{optional_inline}} {{experimental_inline}}
  - : Một số nguyên biểu thị tổng số gói dữ liệu đã gửi trên cặp ứng viên này.
- {{domxref("RTCIceCandidatePairStats.remoteCandidateId", "remoteCandidateId")}} {{optional_inline}}
  - : Một chuỗi chứa ID duy nhất tương ứng với ứng viên từ xa, là dữ liệu đã được dùng để xây dựng đối tượng `RTCIceCandidateStats` mô tả đầu từ xa của kết nối.
- {{domxref("RTCIceCandidatePairStats.requestsReceived", "requestsReceived")}} {{optional_inline}}
  - : Một số nguyên biểu thị tổng số yêu cầu kiểm tra kết nối đã nhận, bao gồm cả các lần truyền lại. Giá trị này bao gồm cả kiểm tra kết nối và kiểm tra chấp thuận STUN.
- {{domxref("RTCIceCandidatePairStats.requestsSent", "requestsSent")}} {{optional_inline}}
  - : Một số nguyên biểu thị tổng số yêu cầu kiểm tra kết nối đã gửi, _không_ bao gồm các lần truyền lại.
- {{domxref("RTCIceCandidatePairStats.responsesReceived", "responsesReceived")}} {{optional_inline}}
  - : Một số nguyên biểu thị tổng số phản hồi kiểm tra kết nối đã nhận.
- {{domxref("RTCIceCandidatePairStats.responsesSent", "responsesSent")}} {{optional_inline}}
  - : Một số nguyên biểu thị tổng số phản hồi kiểm tra kết nối đã gửi. Bao gồm cả phản hồi cho yêu cầu kiểm tra kết nối lẫn yêu cầu chấp thuận STUN.
- {{domxref("RTCIceCandidatePairStats.state", "state")}} {{optional_inline}}
  - : Một chuỗi cho biết trạng thái kết nối giữa hai ứng viên.
- {{domxref("RTCIceCandidatePairStats.totalRoundTripTime", "totalRoundTripTime")}} {{optional_inline}}
  - : Một số cho biết tổng thời gian tính bằng giây đã trôi qua giữa các lần gửi yêu cầu STUN và nhận phản hồi cho tất cả các yêu cầu đó từ trước đến nay trên cặp ứng viên này. Bao gồm cả kiểm tra kết nối và kiểm tra chấp thuận. Bạn có thể tính thời gian khứ hồi (RTT) trung bình bằng cách chia giá trị này cho {{domxref("RTCIceCandidatePairStats.responsesReceived", "responsesReceived")}}.
- {{domxref("RTCIceCandidatePairStats.transportId", "transportId")}} {{optional_inline}}
  - : Một chuỗi xác định duy nhất {{domxref("RTCIceTransport")}} đã được kiểm tra để lấy các thống kê liên quan đến truyền tải (như trong {{domxref("RTCTransportStats")}}) được dùng để tạo đối tượng này.

### Thuộc tính phiên bản chung

Các thuộc tính sau đây có ở tất cả đối tượng thống kê WebRTC.

<!-- RTCStats -->

- {{domxref("RTCIceCandidatePairStats.id", "id")}}
  - : Một chuỗi xác định duy nhất đối tượng đang được theo dõi để tạo ra tập hợp thống kê này.
- {{domxref("RTCIceCandidatePairStats.timestamp", "timestamp")}}
  - : Đối tượng {{domxref("DOMHighResTimeStamp")}} cho biết thời điểm mẫu được lấy cho đối tượng thống kê này.
- {{domxref("RTCIceCandidatePairStats.type", "type")}}
  - : Chuỗi có giá trị `"candidate-pair"`, cho biết loại thống kê mà đối tượng chứa.

### Thuộc tính đã lỗi thời

Các thuộc tính sau đây đã bị xóa khỏi đặc tả và không nên được sử dụng nữa. Bạn nên cập nhật code hiện có để tránh dùng chúng càng sớm càng tốt. Xem [bảng tương thích](#browser_compatibility) để biết chi tiết về trình duyệt nào hỗ trợ và trong phiên bản nào.

- {{domxref("RTCIceCandidatePairStats.priority", "priority")}} {{Deprecated_Inline}} {{optional_inline}} {{non-standard_inline}}
  - : Giá trị số nguyên cho biết mức ưu tiên của cặp ứng viên.
- {{domxref("RTCIceCandidatePairStats.readable", "readable")}} {{Deprecated_Inline}} {{optional_inline}} {{Non-standard_Inline}}
  - : Giá trị Boolean cho biết liệu có thể gửi dữ liệu qua kết nối được mô tả bởi cặp ứng viên hay không.
- {{domxref("RTCIceCandidatePairStats.writable", "writable")}} {{Deprecated_Inline}} {{optional_inline}} {{Non-standard_Inline}}
  - : Giá trị Boolean cho biết liệu có thể nhận dữ liệu trên kết nối được mô tả bởi cặp ứng viên hay không.

### Thuộc tính không chuẩn

- {{domxref("RTCIceCandidatePairStats.selected", "selected")}} {{Non-standard_Inline}} {{optional_inline}}
  - : Giá trị Boolean dành riêng cho Firefox; là `true` nếu cặp ứng viên được mô tả bởi đối tượng này đang được sử dụng. Cách chuẩn để xác định cặp ứng viên được chọn là tra cứu đối tượng thống kê có type là `transport` ({{domxref("RTCTransportStats")}}), rồi xem thuộc tính {{domxref("RTCTransportStats.selectedCandidatePairId", "selectedCandidatePairId")}} của đối tượng đó.

## Ghi chú sử dụng

Cặp ứng viên ICE đang hoạt động (nếu có) có thể được lấy bằng cách gọi phương thức {{domxref("RTCIceTransport.getSelectedCandidatePair", "getSelectedCandidatePair()")}} của {{domxref("RTCIceTransport")}}, phương thức này trả về đối tượng {{domxref("RTCIceCandidatePair")}} hoặc `null` nếu không có cặp nào được chọn. Cặp ứng viên đang hoạt động mô tả cấu hình hiện tại của hai đầu {{domxref("RTCPeerConnection")}}.

Mọi cặp ứng viên không phải cặp đang hoạt động của một transport sẽ bị xóa nếu {{domxref("RTCIceTransport")}} thực hiện khởi động lại ICE, lúc đó {{domxref("RTCIceTransport.state", "state")}} của transport ICE trở về `new` và quá trình đàm phán bắt đầu lại từ đầu. Để biết thêm thông tin, xem [Khởi động lại ICE](/en-US/docs/Web/API/WebRTC_API/Session_lifetime#ice_restart).

## Ví dụ

Ví dụ này tính thời gian trung bình đã trôi qua giữa các lần kiểm tra kết nối.

```js
if (rtcStats && rtcStats.type === "candidate-pair") {
  let elapsed =
    (rtcStats.lastRequestTimestamp - rtcStats.firstRequestTimestamp) /
    rtcStats.requestsSent;

  console.log(`Average time between ICE connectivity checks: ${elapsed} ms.`);
}
```

Đoạn code bắt đầu bằng cách kiểm tra `rtcStats` xem {{domxref("RTCIceCandidatePairStats.type", "type")}} của nó có phải là `candidate-pair` không. Nếu có, ta biết `rtcStats` là đối tượng `RTCIceCandidatePairStats`. Sau đó ta tính thời gian trung bình đã trôi qua giữa các lần kiểm tra kết nối STUN và ghi thông tin đó ra log.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
