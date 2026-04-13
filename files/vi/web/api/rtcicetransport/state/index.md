---
title: "RTCIceTransport: thuộc tính state"
short-title: state
slug: Web/API/RTCIceTransport/state
page-type: web-api-instance-property
browser-compat: api.RTCIceTransport.state
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`state`** của giao diện {{domxref("RTCIceTransport")}} trả về trạng thái hiện tại của truyền tải ICE, cho phép bạn xác định trạng thái thu thập ICE mà tác nhân ICE hiện đang hoạt động.

Điều này khác với {{domxref("RTCIceTransport.gatheringState", "gatheringState")}}, vốn chỉ cho biết liệu quá trình thu thập ICE có đang diễn ra hay không.
Nó cũng khác với {{domxref("RTCPeerConnection.connectionState")}}, vốn tổng hợp các trạng thái trên mọi {{domxref("RTCIceTransport")}} được sử dụng bởi mọi {{domxref("RTCRtpSender")}} và mọi {{domxref("RTCRtpReceiver")}} trên toàn bộ kết nối.

## Giá trị

Một chuỗi có giá trị là một trong những giá trị sau:

- `"new"`
  - : {{domxref("RTCIceTransport")}} hiện đang thu thập ứng cử viên cục bộ, hoặc đang chờ thiết bị từ xa bắt đầu truyền các ứng cử viên từ xa, hoặc cả hai. Ở trạng thái này, việc kiểm tra ứng cử viên để tìm những cái có thể chấp nhận được chưa bắt đầu.
- `"checking"`
  - : Ít nhất một ứng cử viên từ xa đã được nhận, và `RTCIceTransport` đã bắt đầu kiểm tra các cặp ứng cử viên từ xa và cục bộ nhằm cố gắng xác định các cặp khả thi có thể được sử dụng để thiết lập kết nối. Hãy nhớ rằng việc thu thập ứng cử viên cục bộ có thể vẫn đang diễn ra, và tương tự, thiết bị từ xa cũng có thể vẫn đang thu thập ứng cử viên của riêng nó.
- `"connected"`
  - : Một cặp ứng cử viên khả thi đã được tìm thấy và chọn, và `RTCIceTransport` đã kết nối hai đối tác bằng cặp đó. Tuy nhiên, vẫn còn các cặp ứng cử viên cần xem xét, và có thể vẫn còn quá trình thu thập đang diễn ra trên một hoặc cả hai thiết bị.

    Truyền tải có thể quay trở lại từ trạng thái `"connected"` sang trạng thái `"checking"` nếu một trong hai đối tác quyết định hủy đồng ý sử dụng cặp ứng cử viên đã chọn, và có thể chuyển sang `"disconnected"` nếu không còn ứng cử viên nào để kiểm tra nhưng một hoặc cả hai máy khách vẫn đang thu thập ứng cử viên.

- `"completed"`
  - : Truyền tải đã hoàn thành việc thu thập ứng cử viên cục bộ và đã nhận thông báo từ đối tác từ xa rằng không có thêm ứng cử viên nào được gửi. Ngoài ra, tất cả các cặp ứng cử viên đã được xem xét và một cặp đã được chọn để sử dụng. Nếu kiểm tra đồng ý thất bại trên tất cả các cặp ứng cử viên thành công, trạng thái truyền tải sẽ thay đổi thành `"failed"`.
- `"disconnected"`
  - : Tác nhân ICE đã xác định rằng kết nối đã bị mất cho {{domxref("RTCIceTransport")}} này. Đây không phải là trạng thái lỗi (trạng thái đó là `"failed"`). Giá trị `"disconnected"` có nghĩa là một vấn đề tạm thời đã xảy ra làm gián đoạn kết nối, nhưng nên tự giải quyết mà không cần mã của bạn thực hiện bất kỳ hành động nào. Xem [Trạng thái disconnected](#the_disconnected_state) để biết thêm chi tiết.
- `"failed"`
  - : `RTCIceTransport` đã hoàn thành quá trình thu thập, đã nhận thông báo "không còn ứng cử viên" từ đối tác từ xa, và đã hoàn thành việc kiểm tra các cặp ứng cử viên, mà không tìm thấy cặp nào vừa hợp lệ vừa có thể lấy được sự đồng ý. _Đây là trạng thái cuối, cho biết rằng kết nối không thể được thiết lập hoặc duy trì._
- `"closed"`
  - : Truyền tải đã tắt và không còn phản hồi với các yêu cầu STUN nữa.

## Ghi chú sử dụng

Nếu xảy ra khởi động lại ICE, quá trình thu thập ứng cử viên và kiểm tra kết nối sẽ bắt đầu lại; điều này sẽ gây ra chuyển tiếp từ trạng thái `"connected"` nếu khởi động lại xảy ra khi trạng thái là `"completed"`. Nếu khởi động lại xảy ra trong trạng thái `"disconnected"` tạm thời, trạng thái chuyển sang `"checking"`.

### Trạng thái disconnected

`"disconnected"` là một trạng thái tạm thời xảy ra khi kết nối giữa hai đối tác thất bại theo cách mà cơ sở hạ tầng WebRTC có thể tự động sửa chữa khi kết nối lại khả dụng. Đây _không_ phải là trạng thái lỗi. Thay vào đó, bạn có thể nghĩ `"disconnected"` giống như `"checking"` nhưng với thông tin bổ sung rằng kết nối đã hoạt động nhưng hiện tại thì không.

Mọi {{Glossary("user agent")}} và nền tảng có thể có các tình huống riêng có thể kích hoạt trạng thái `"disconnected"`. Các nguyên nhân có thể bao gồm:

- Giao diện mạng được sử dụng bởi kết nối đã đi ngoại tuyến.
- Các yêu cầu {{Glossary("STUN")}} được gửi đến thiết bị từ xa liên tục không nhận được phản hồi.

Trạng thái `"disconnected"` cũng có thể xảy ra khi truyền tải đã kiểm tra xong tất cả các cặp ứng cử viên hiện có mà không tìm thấy cặp nào hoạt động, hoặc một cặp hợp lệ được tìm thấy nhưng bị từ chối do đồng ý sử dụng cặp đó bị từ chối. Trong trường hợp này, truyền tải vẫn tiếp tục thu thập ứng cử viên và/hoặc chờ ứng cử viên được đối tác từ xa gửi.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
