---
title: "RTCIceCandidate: hàm khởi tạo RTCIceCandidate()"
short-title: RTCIceCandidate()
slug: Web/API/RTCIceCandidate/RTCIceCandidate
page-type: web-api-constructor
browser-compat: api.RTCIceCandidate.RTCIceCandidate
---

{{APIRef("WebRTC")}}

Hàm khởi tạo
**`RTCIceCandidate()`**
tạo và trả về một đối tượng {{domxref("RTCIceCandidate")}} mới, có thể
được cấu hình để biểu diễn một {{Glossary("ICE")}} candidate đơn lẻ.

## Cú pháp

```js-nolint
new RTCIceCandidate()
new RTCIceCandidate(candidateInfo)
```

### Tham số

- `candidateInfo` {{optional_inline}}
  - : Một đối tượng tùy chọn có thể được cung cấp để cấu hình candidate.
    Đối tượng có các thuộc tính sau:

    <!-- The spec calls this object an RTCIceCandidateInit -->
    - `candidate` {{optional_inline}}
      - : Một chuỗi mô tả các thuộc tính của candidate, lấy trực tiếp từ thuộc tính [SDP](/en-US/docs/Web/API/WebRTC_API/Protocols#sdp) `"candidate"`.
        Chuỗi candidate xác định thông tin kết nối mạng cho candidate.
        Nếu `candidate` là chuỗi rỗng (`""`), kết thúc danh sách candidate đã được đạt tới; candidate này được gọi là dấu hiệu "end-of-candidates".

        Cú pháp của chuỗi candidate được mô tả trong {{RFC(5245, "", 15.1)}}.
        Với một a-line (dòng thuộc tính) như thế này:

        ```plain
        a=candidate:4234997325 1 udp 2043278322 192.0.2.172 44323 typ host
        ```

        giá trị của chuỗi `candidate` tương ứng sẽ là
        `"candidate:4234997325 1 udp 2043278322 192.0.2.172 44323 typ host"`.

        {{Glossary("user agent")}} luôn ưu tiên các candidate có {{domxref("RTCIceCandidate.priority", "priority")}} cao nhất, khi các điều kiện khác bằng nhau.
        Trong ví dụ trên, độ ưu tiên là `2043278322`. Các thuộc tính đều được cách nhau bằng một ký tự khoảng trắng, và theo thứ tự cụ thể.
        Danh sách đầy đủ các thuộc tính cho candidate ví dụ này là:
        - {{domxref("RTCIceCandidate.foundation", "foundation")}} = 4234997325
        - {{domxref("RTCIceCandidate.component", "component")}} = `"rtp"` (số 1 được mã hóa thành chuỗi này; 2 thành `"rtcp"`)
        - {{domxref("RTCIceCandidate.protocol", "protocol")}} = `"udp"`
        - {{domxref("RTCIceCandidate.priority", "priority")}} = 2043278322
        - {{domxref("RTCIceCandidate/address", "ip")}} = `"192.0.2.172"`
        - {{domxref("RTCIceCandidate.port", "port")}} = 44323
        - {{domxref("RTCIceCandidate.type", "type")}} = `"host"`

        Thông tin bổ sung có thể được tìm thấy trong {{domxref("RTCIceCandidate.candidate")}}.

        > [!NOTE]
        > Để tương thích ngược với các phiên bản cũ hơn của đặc tả WebRTC, hàm khởi tạo cũng chấp nhận chuỗi này trực tiếp làm đối số.

    - `sdpMid` {{optional_inline}}
      - : Một chuỗi chứa thẻ định danh của media stream mà candidate được gắn với, hoặc `null` nếu không có media stream được gắn. Mặc định là `null`.

        Thông tin bổ sung có thể được tìm thấy trong {{domxref("RTCIceCandidate.sdpMid")}}.

    - `sdpMLineIndex` {{optional_inline}}
      - : Một thuộc tính số chứa chỉ số bắt đầu từ 0 của m-line mà candidate được gắn với, trong [SDP](/en-US/docs/Web/API/WebRTC_API/Protocols#sdp) của media description, hoặc `null` nếu không có liên kết như vậy. Mặc định là `null`.

        Thông tin bổ sung có thể được tìm thấy trong {{domxref("RTCIceCandidate.sdpMLineIndex")}}.

    - `usernameFragment` {{optional_inline}}
      - : Một chuỗi chứa phân đoạn tên người dùng (thường được viết tắt là "ufrag" hoặc "ice-ufrag").
        Phân đoạn này, cùng với mật khẩu ICE ("ice-pwd"), xác định duy nhất một tương tác ICE đang diễn ra (bao gồm cả giao tiếp với máy chủ {{Glossary("STUN")}}).

        Chuỗi được WebRTC tạo ra khi bắt đầu phiên.
        Nó có thể dài tới 256 ký tự, và ít nhất 24 bit phải chứa dữ liệu ngẫu nhiên.
        Nó không có giá trị mặc định và không có mặt trừ khi được đặt rõ ràng.

        Thông tin bổ sung có thể được tìm thấy trong {{domxref("RTCIceCandidate.usernameFragment")}}.

### Giá trị trả về

Một đối tượng {{domxref("RTCIceCandidate")}} mới được tạo ra.

Nếu `candidateInfo` được cung cấp, `RTCIceCandidate` mới được khởi tạo như sau:

- Mỗi thành viên của đối tượng `RTCIceCandidate` được khởi tạo thành giá trị của thuộc tính cùng tên từ `candidateInfo`.
  Điều này bao gồm các thuộc tính {{domxref("RTCIceCandidate.candidate", "candidate")}}, {{domxref("RTCIceCandidate.sdpMid", "sdpMid")}}, {{domxref("RTCIceCandidate.sdpMLineIndex", "sdpMLineIndex")}}, và {{domxref("RTCIceCandidate.usernameFragment", "usernameFragment")}}.
- Chuỗi `candidate` (là văn bản SDP) được phân tích; mỗi thuộc tính được tìm thấy được lưu vào trường tương ứng trong `RTCIceCandidate`.
  Nếu bất kỳ trường nào không hợp lệ, việc phân tích chuỗi sẽ dừng lại im lặng mà không ném ra ngoại lệ.
  Giá trị mặc định của `candidate` là chuỗi rỗng, cho biết candidate là thông điệp "end-of-candidates".
- Các trường sau được khởi tạo thành `null` nếu chúng không có trong thuộc tính {{domxref("RTCIceCandidate.candidate")}}:
  {{domxref("RTCIceCandidate.foundation", "foundation")}},
  {{domxref("RTCIceCandidate.component", "component")}},
  {{domxref("RTCIceCandidate.priority", "priority")}}, {{domxref("RTCIceCandidate/address","address")}}, {{domxref("RTCIceCandidate.protocol", "protocol")}},
  {{domxref("RTCIceCandidate.port", "port")}}, {{domxref("RTCIceCandidate.type", "type")}}, {{domxref("RTCIceCandidate.tcpType", "tcpType")}},
  {{domxref("RTCIceCandidate.relatedAddress", "relatedAddress")}}, và {{domxref("RTCIceCandidate.relatedPort", "relatedPort")}}.

> [!NOTE]
> Việc phân tích chuỗi `candidate` được thực hiện bằng cách sử dụng [candidate-attribute grammar](https://w3c.github.io/webrtc-pc/#candidate-attribute-grammar) từ Đặc tả WebRTC.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `candidateInfo` được chỉ định có giá trị `null` trong **cả hai** thuộc tính `sdpMid` và `sdpMLineIndex`.

## Ghi chú sử dụng

Hàm khởi tạo này không thực hiện xác nhận đầy đủ đối tượng hoặc chuỗi `candidateInfo` được chỉ định.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Introduction to WebRTC protocols](/en-US/docs/Web/API/WebRTC_API/Protocols#ice)
- [WebRTC connectivity](/en-US/docs/Web/API/WebRTC_API/Connectivity)
- [Lifetime of a WebRTC session](/en-US/docs/Web/API/WebRTC_API/Session_lifetime)
- [Signaling and video calling](/en-US/docs/Web/API/WebRTC_API/Signaling_and_video_calling)
