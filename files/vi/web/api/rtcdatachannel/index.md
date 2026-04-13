---
title: RTCDataChannel
slug: Web/API/RTCDataChannel
page-type: web-api-interface
browser-compat: api.RTCDataChannel
---

{{APIRef("WebRTC")}}

Giao diện **`RTCDataChannel`** đại diện cho một kênh mạng có thể được sử dụng để truyền dữ liệu tùy ý ngang hàng hai chiều. Mỗi kênh dữ liệu được liên kết với một {{DOMxRef("RTCPeerConnection")}} và mỗi kết nối ngang hàng có thể có tối đa theo lý thuyết là 65.534 kênh dữ liệu (giới hạn thực tế có thể khác nhau tùy theo trình duyệt).

Để tạo kênh dữ liệu và yêu cầu một thiết bị ngang hàng từ xa tham gia cùng bạn, hãy gọi phương thức {{DOMxRef("RTCPeerConnection.createDataChannel", "createDataChannel()")}} của {{DOMxRef("RTCPeerConnection")}}. Thiết bị ngang hàng được mời trao đổi dữ liệu sẽ nhận được sự kiện {{DOMxRef("RTCPeerConnection.datachannel_event", "datachannel")}} (có loại {{DOMxRef("RTCDataChannelEvent")}}) để cho nó biết kênh dữ liệu đã được thêm vào kết nối.

`RTCDataChannel` là một [vật có thể chuyển nhượng](/en-US/docs/Web/API/Web_Workers_API/Transferable_objects).

{{InheritanceDiagram}}


## Thuộc tính phiên bản

_Cũng kế thừa các thuộc tính từ {{DOMxRef("EventTarget")}}._

- {{DOMxRef("RTCDataChannel.binaryType", "binaryType")}}
  - : Một chuỗi xác định loại đối tượng
    nên được sử dụng để thể hiện dữ liệu nhị phân nhận được trên `RTCDataChannel`.
    Các giá trị giống như được phép trên thuộc tính {{DOMxRef("WebSocket.binaryType")}}:
    `blob` nếu đối tượng {{DOMxRef("Blob")}} đang được sử dụng,
    hoặc `arraybuffer` nếu đối tượng {{jsxref("ArrayBuffer")}} đang được sử dụng.
    Giá trị mặc định là `arraybuffer`.
- {{DOMxRef("RTCDataChannel.bufferedAmount", "bufferedAmount")}} {{ReadOnlyInline}}
  - : Trả về số byte dữ liệu
    hiện đang xếp hàng để được gửi qua kênh dữ liệu.
- {{DOMxRef("RTCDataChannel.bufferedAmountLowThreshold", "bufferedAmountLowThreshold")}}
  - : Chỉ định số byte dữ liệu gửi đi được lưu vào bộ đệm được coi là "thấp".
    Giá trị mặc định là 0.
- {{DOMxRef("RTCDataChannel.id", "id")}} {{ReadOnlyInline}}
  - : Trả về số ID (từ 0 đến 65.534)
    xác định duy nhất `RTCDataChannel`.
- {{DOMxRef("RTCDataChannel.label", "label")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi chứa tên mô tả kênh dữ liệu.
    Những nhãn này không bắt buộc phải là duy nhất.
- {{DOMxRef("RTCDataChannel.maxPacketLifeTime", "maxPacketLifeTime")}} {{ReadOnlyInline}}
  - : Trả về lượng thời gian,
    tính bằng mili giây,
    trình duyệt được phép thực hiện để cố gắng truyền tải tin nhắn,
    như được đặt khi kênh dữ liệu được tạo,
    hoặc `null`.
- {{DOMxRef("RTCDataChannel.maxRetransmits", "maxRetransmits")}} {{ReadOnlyInline}}
  - : Trả về số lần tối đa
    trình duyệt nên cố gắng truyền lại tin nhắn trước khi từ bỏ,
    như được đặt khi kênh dữ liệu được tạo,
    hoặc `null`, cho biết không có mức tối đa.
- {{DOMxRef("RTCDataChannel.negotiated", "negotiated")}} {{ReadOnlyInline}}
  - : Biểu thị
    liệu kết nối của `RTCDataChannel` có được ứng dụng Web thương lượng hay không
    (`true`)
    hoặc bởi lớp WebRTC (`false`).
    Giá trị mặc định là `false`.
- {{DOMxRef("RTCDataChannel.ordered", "ordered")}} {{ReadOnlyInline}}
  - : Cho biết kênh dữ liệu có đảm bảo gửi tin nhắn theo thứ tự hay không;
    mặc định là `true`, cho biết kênh dữ liệu thực sự đã được sắp xếp.
- {{DOMxRef("RTCDataChannel.priority", "priority")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Trả về một chuỗi biểu thị mức độ ưu tiên của kênh dữ liệu,
    như được đặt khi kênh dữ liệu được tạo hoặc do tác nhân người dùng chỉ định.
    Các giá trị có thể là `"very-low"`, `"low"`, `"medium"` hoặc `"high"`.
- {{DOMxRef("RTCDataChannel.protocol", "protocol")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi chứa tên của giao thức con đang sử dụng.
    Nếu không có giao thức nào được chỉ định
    khi kênh dữ liệu được tạo,
    thì giá trị của thuộc tính này là chuỗi trống (`""`).
- {{DOMxRef("RTCDataChannel.readyState", "readyState")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi
    cho biết trạng thái kết nối dữ liệu cơ bản của kênh dữ liệu.
    Nó có thể có một trong các giá trị sau:
    `connecting`, `open`, `closing` hoặc `closed`.


### Thuộc tính lỗi thời

- {{DOMxRef("RTCDataChannel.reliable", "reliable")}} {{ReadOnlyInline}} {{Deprecated_Inline}} {{Non-standard_Inline}}

  - : Cho biết kênh dữ liệu có _đáng tin cậy_ hay không.


## Các phương thức thực thể

_Cũng kế thừa các phương thức từ {{DOMxRef("EventTarget")}}._- {{DOMxRef("RTCDataChannel.close", "close()")}}

- : Đóng `RTCDataChannel`.
  Một trong hai ngang hàng được phép gọi phương thức này

  để bắt đầu đóng kênh.
- {{DOMxRef("RTCDataChannel.send", "send()")}}
  - : Gửi dữ liệu qua kênh dữ liệu đến thiết bị ngang hàng từ xa.

## Sự kiện

- {{domxref("RTCDataChannel.bufferedamountlow_event", "bufferedamountlow")}}
  - : Đã gửi
    khi số byte dữ liệu trong bộ đệm dữ liệu đi
    giảm xuống dưới giá trị được chỉ định bởi {{domxref("RTCDataChannel.bufferedAmountLowThreshold", "bufferedAmountLowThreshold")}}.
- {{domxref("RTCDataChannel.close_event", "close")}}
  - : Được gửi khi quá trình vận chuyển dữ liệu cơ bản đóng lại.
- {{domxref("RTCDataChannel.closing_event", "closing")}}
  - : Được gửi khi quá trình truyền dữ liệu cơ bản sắp bắt đầu đóng.
- {{domxref("RTCDataChannel.error_event", "error")}}
  - : Được gửi khi xảy ra lỗi trên kênh dữ liệu.
- {{domxref("RTCDataChannel.message_event", "message")}}
  - : Được gửi khi nhận được tin nhắn từ thiết bị ngang hàng ở xa.
    Nội dung tin nhắn có thể được tìm thấy

    trong thuộc tính {{domxref("MessageEvent.data", "data")}} của sự kiện.
- {{domxref("RTCDataChannel.open_event", "open")}}
  - : Được gửi khi kênh dữ liệu được mở lần đầu tiên,

    hoặc khi kết nối cơ bản của kênh dữ liệu hiện có mở lại.

## Định dạng dữ liệu

Định dạng dữ liệu cơ bản được xác định bởi đặc tả IEEE [Thủ tục trả lời/đề nghị SDP cho SCTP qua truyền tải DTLS (RFC 8841)](https://datatracker.ietf.org/doc/rfc8841/). Định dạng hiện tại chỉ định giao thức của nó là `"UDP/DTLS/SCTP"` (UDP mang DTLS mang SCTP) hoặc `"TCP/DTLS/SCTP"` (TCP mang DTLS mang SCTP). Các trình duyệt cũ hơn chỉ có thể chỉ định `"DTLS/SCTP"`.

## Ví dụ

```js
const pc = new RTCPeerConnection();
const dc = pc.createDataChannel("my channel");

dc.onmessage = (event) => {
  console.log(`received: ${event.data}`);
};

dc.onopen = () => {
  console.log("datachannel open");

};

dc.onclose = () => {

  console.log("datachannel close");
};
```



## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [API WebRTC](/en-US/docs/Web/API/WebRTC_API)
