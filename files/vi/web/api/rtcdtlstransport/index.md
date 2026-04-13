---
title: RTCDtlsTransport
slug: Web/API/RTCDtlsTransport
page-type: web-api-interface
browser-compat: api.RTCDtlsTransport
---

{{APIRef("WebRTC")}}

Giao diện **`RTCDtlsTransport`** cung cấp quyền truy cập thông tin về giao thức vận chuyển Datagram Transport Layer Security (**{{Glossary("DTLS")}}**) mà qua đó các gói {{Glossary("RTP")}} và {{Glossary("RTCP")}} của {{domxref("RTCPeerConnection")}} được gửi và nhận bởi các đối tượng {{domxref("RTCRtpSender")}} và {{domxref("RTCRtpReceiver")}} của nó.

Một đối tượng `RTCDtlsTransport` cũng được sử dụng để cung cấp thông tin về các gói {{Glossary("SCTP")}} được truyền và nhận bởi [các kênh dữ liệu](/en-US/docs/Web/API/RTCDataChannel) của kết nối.

Các tính năng của DTLS transport bao gồm việc thêm bảo mật vào transport cơ bản; giao diện `RTCDtlsTransport` có thể được sử dụng để lấy thông tin về transport cơ bản và bảo mật được thêm vào bởi lớp DTLS.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Cũng kế thừa thuộc tính từ {{DOMxRef("EventTarget")}}._

- {{DOMxRef("RTCDtlsTransport.iceTransport", "iceTransport")}} {{ReadOnlyInline}}
  - : Trả về một tham chiếu đến đối tượng {{DOMxRef("RTCIceTransport")}} cơ bản.
- {{DOMxRef("RTCDtlsTransport.state", "state")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi mô tả trạng thái transport Datagram Transport Layer Security (**{{Glossary("DTLS")}}**) cơ bản. Nó có thể là một trong các giá trị sau: `new`, `connecting`, `connected`, `closed`, hoặc `failed`.

## Phương thức phiên bản

_Cũng kế thừa phương thức từ {{DOMxRef("EventTarget")}}._

- {{DOMxRef("RTCDtlsTransport.getRemoteCertificates", "getRemoteCertificates()")}}
  - : Trả về một mảng {{jsxref("ArrayBuffer")}} chứa chứng chỉ của peer từ xa của kết nối.

## Sự kiện

- {{DOMxRef("RTCDtlsTransport.error_event", "error")}}
  - : Được gửi khi xảy ra lỗi cấp transport trên {{domxref("RTCPeerConnection")}}.

- {{DOMxRef("RTCDtlsTransport.statechange_event", "statechange")}}
  - : Được gửi khi {{DOMxRef("RTCDtlsTransport.state", "state")}} của DTLS transport thay đổi.

## Mô tả

### Phân bổ DTLS transports

Các đối tượng `RTCDtlsTransport` được tạo ra khi ứng dụng gọi {{domxref("RTCPeerConnection.setLocalDescription", "setLocalDescription()")}} hoặc {{domxref("RTCPeerConnection.setRemoteDescription", "setRemoteDescription()")}}. Số lượng DTLS transport được tạo và cách chúng được sử dụng phụ thuộc vào chế độ bundling được sử dụng khi tạo {{domxref("RTCPeerConnection")}}.

Việc sử dụng bundling hay không phụ thuộc vào những gì endpoint kia có thể thỏa thuận. Tất cả các trình duyệt hỗ trợ bundling, vì vậy khi cả hai endpoint là trình duyệt, bạn có thể yên tâm rằng bundling sẽ được sử dụng.

Một số endpoint legacy không phải trình duyệt, tuy nhiên, có thể không hỗ trợ bundle. Để có thể thỏa thuận với các endpoint như vậy (hoặc để loại trừ chúng hoàn toàn), thuộc tính `bundlePolicy` có thể được cung cấp khi tạo kết nối. Chính sách mặc định là `"balanced"`, cung cấp sự cân bằng giữa hiệu suất và khả năng tương thích.

Ví dụ, để tạo kết nối sử dụng mức bundling cao nhất:

```js
const rtcConfig = {
  bundlePolicy: "max-bundle",
};

const pc = new RTCPeerConnection(rtcConfig);
```

[Bundling](https://datatracker.ietf.org/doc/rfc8843/) cho phép bạn sử dụng một `RTCDtlsTransport` để mang dữ liệu cho nhiều transport cấp cao hơn, chẳng hạn như nhiều {{domxref("RTCRtpTransceiver")}}.

#### Khi không sử dụng BUNDLE

Khi kết nối được tạo mà không sử dụng BUNDLE, mỗi thành phần RTP hoặc RTCP của mỗi {{domxref("RTCRtpTransceiver")}} có `RTCDtlsTransport` riêng; tức là, mỗi {{domxref("RTCRtpSender")}} và {{domxref("RTCRtpReceiver")}}, có transport riêng của nó, và tất cả các đối tượng {{domxref("RTCDataChannel")}} chia sẻ một transport dành riêng cho SCTP.

#### Khi sử dụng BUNDLE

Khi kết nối đang sử dụng BUNDLE, mỗi đối tượng `RTCDtlsTransport` đại diện cho một nhóm các đối tượng {{domxref("RTCRtpTransceiver")}}. Nếu kết nối được tạo bằng chế độ `max-compat`, mỗi transport chịu trách nhiệm xử lý tất cả thông tin liên lạc cho một loại phương tiện nhất định (âm thanh, video, hoặc kênh dữ liệu). Do đó, một kết nối với bất kỳ số lượng kênh âm thanh và video nào sẽ luôn có đúng một DTLS transport cho âm thanh và một cho liên lạc video.

### Các kênh dữ liệu

Các {{domxref("RTCDataChannel")}} sử dụng {{Glossary("SCTP")}} để giao tiếp. Tất cả các kênh dữ liệu của kết nối peer chia sẻ một {{domxref("RTCSctpTransport")}} đơn, được tìm thấy trong thuộc tính {{domxref("RTCPeerConnection.sctp", "sctp")}} của kết nối.

Bạn có thể xác định `RTCDtlsTransport` được sử dụng để bảo mật bọc giao tiếp SCTP của các kênh dữ liệu bằng cách nhìn vào thuộc tính {{domxref("RTCSctpTransport.transport", "transport")}} của đối tượng `RTCSctpTransport`.

## Ví dụ

Ví dụ này trình bày một hàm, `tallySenders()`, lặp qua các {{domxref("RTCRtpSender")}} của `RTCPeerConnection`, đếm xem có bao nhiêu cái đang ở các trạng thái khác nhau. Hàm trả về một đối tượng chứa các thuộc tính có giá trị cho biết bao nhiêu sender đang ở mỗi trạng thái.

```js
let pc = new RTCPeerConnection({ bundlePolicy: "max-bundle" });

// …

function tallySenders(pc) {
  let results = {
    transportMissing: 0,
    connectionPending: 0,
    connected: 0,
    closed: 0,
    failed: 0,
    unknown: 0,
  };

  let senderList = pc.getSenders();
  senderList.forEach((sender) => {
    let transport = sender.transport;

    if (!transport) {
      results.transportMissing++;
    } else {
      switch (transport.state) {
        case "new":
        case "connecting":
          results.connectionPending++;
          break;
        case "connected":
          results.connected++;
          break;
        case "closed":
          results.closed++;
          break;
        case "failed":
          results.failed++;
          break;
        default:
          results.unknown++;
          break;
      }
    }
  });
  return results;
}
```

Lưu ý rằng trong mã này, các trạng thái `new` và `connecting` đang được xử lý như một trạng thái `connectionPending` đơn trong đối tượng được trả về.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCRtpSender.transport")}} và {{domxref("RTCRtpReceiver.transport")}}
- {{DOMxRef("RTCSctpTransport.transport")}}
