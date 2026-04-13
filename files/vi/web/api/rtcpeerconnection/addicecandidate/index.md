---
title: "RTCPeerConnection: phương thức addIceCandidate()"
short-title: addIceCandidate()
slug: Web/API/RTCPeerConnection/addIceCandidate
page-type: web-api-instance-method
browser-compat: api.RTCPeerConnection.addIceCandidate
---

{{APIRef("WebRTC")}}

Phương thức **`addIceCandidate()`** của giao diện {{domxref("RTCPeerConnection")}} thêm một candidate từ xa mới vào `remoteDescription` của kết nối, mô tả trạng thái của đầu từ xa.

Khi một trang web hoặc ứng dụng dùng {{domxref("RTCPeerConnection")}} nhận được một ICE candidate mới từ máy ngang hàng từ xa qua kênh báo hiệu, nó sẽ chuyển candidate vừa nhận cho bộ máy {{Glossary("ICE")}} của trình duyệt bằng cách gọi **`RTCPeerConnection.addIceCandidate()`**.

Nếu tham số `candidate` bị thiếu hoặc có giá trị `null` khi gọi `addIceCandidate()`, ICE candidate được thêm sẽ là tín hiệu "end-of-candidates".
Điều tương tự cũng xảy ra nếu thuộc tính {{domxref("RTCIceCandidate.candidate", "candidate")}} của đối tượng được chỉ định bị thiếu hoặc là một chuỗi rỗng (`""`), điều đó cho biết rằng tất cả các candidate từ xa đã được gửi xong.

Trong quá trình thương lượng, ứng dụng của bạn thường sẽ nhận được nhiều candidate và chuyển chúng cho bộ máy ICE theo cách này, cho phép nó xây dựng danh sách các phương thức kết nối tiềm năng.
Điều này được trình bày chi tiết hơn trong các bài viết [Kết nối WebRTC](/en-US/docs/Web/API/WebRTC_API/Connectivity) và [Báo hiệu và gọi video](/en-US/docs/Web/API/WebRTC_API/Signaling_and_video_calling).

## Cú pháp

```js-nolint
addIceCandidate(candidate)

addIceCandidate(candidate, successCallback) // deprecated
addIceCandidate(candidate, successCallback, failureCallback) // deprecated
```

### Tham số

- `candidate` {{optional_inline}}
  - : Một đối tượng {{domxref("RTCIceCandidate")}}, hoặc một đối tượng có các thuộc tính sau:
    - `candidate` {{optional_inline}}
      - : Chuỗi mô tả các thuộc tính của candidate, lấy trực tiếp từ thuộc tính [SDP](/en-US/docs/Web/API/WebRTC_API/Protocols#sdp) `"candidate"`.
        Chuỗi candidate chỉ định thông tin kết nối mạng của candidate.
        Nếu `candidate` là chuỗi rỗng (`""`), danh sách candidate đã tới cuối; candidate này được gọi là dấu hiệu "end-of-candidates".

        Cú pháp của chuỗi candidate được mô tả trong {{RFC(5245, "", 15.1)}}.
        Với một a-line (attribute line) như sau:

        ```plain
        a=candidate:4234997325 1 udp 2043278322 192.0.2.172 44323 typ host
        ```

        giá trị chuỗi `candidate` tương ứng sẽ là:

        ```plain
        "candidate:4234997325 1 udp 2043278322 192.0.2.172 44323 typ host"
        ```

        {{Glossary("user agent")}} luôn ưu tiên candidate có {{domxref("RTCIceCandidate.priority", "priority")}} cao nhất, nếu các yếu tố khác như nhau.
        Trong ví dụ trên, priority là `2043278322`.
        Các thuộc tính được phân tách bằng một dấu cách đơn và theo một thứ tự cụ thể.
        Danh sách đầy đủ của candidate ví dụ này là:
        - {{domxref("RTCIceCandidate.foundation", "foundation")}} = 4234997325
        - {{domxref("RTCIceCandidate.component", "component")}} = `"rtp"` (số 1 được mã hóa thành chuỗi này; 2 trở thành `"rtcp"`)
        - {{domxref("RTCIceCandidate.protocol", "protocol")}} = `"udp"`
        - {{domxref("RTCIceCandidate.priority", "priority")}} = 2043278322
        - {{domxref("RTCIceCandidate/address", "ip")}} = `"192.0.2.172"`
        - {{domxref("RTCIceCandidate.port", "port")}} = 44323
        - {{domxref("RTCIceCandidate.type", "type")}} = `"host"`

        Thông tin bổ sung có thể xem ở {{domxref("RTCIceCandidate.candidate")}}.

        > [!NOTE]
        > Để tương thích ngược với các phiên bản cũ của đặc tả WebRTC, hàm tạo cũng chấp nhận trực tiếp chuỗi này làm đối số.

    - `sdpMid` {{optional_inline}}
      - : Chuỗi chứa thẻ nhận dạng của media stream mà candidate được gắn với, hoặc `null` nếu không có media stream liên quan. Mặc định là `null`.

        Thông tin bổ sung có thể xem ở {{domxref("RTCIceCandidate.sdpMid")}}.

    - `sdpMLineIndex` {{optional_inline}}
      - : Thuộc tính số chứa chỉ số bắt đầu từ 0 của m-line mà candidate được gắn với, bên trong [SDP](/en-US/docs/Web/API/WebRTC_API/Protocols#sdp) của mô tả media, hoặc `null` nếu không có liên kết nào như vậy. Mặc định là `null`.

        Thông tin bổ sung có thể xem ở {{domxref("RTCIceCandidate.sdpMLineIndex")}}.

    - `usernameFragment` {{optional_inline}}
      - : Chuỗi xác định một phần `ufrag` của candidate.

    Đối tượng được tạo từ dữ liệu nhận qua kênh báo hiệu, mô tả một ICE candidate mới sẵn sàng được chuyển cho bộ máy ICE cục bộ.

    Nếu không chỉ định đối tượng `candidate`, hoặc giá trị của nó là `null`, một tín hiệu end-of-candidates sẽ được gửi tới máy ngang hàng từ xa bằng a-line `end-of-candidates`, có dạng:

    ```plain
    a=end-of-candidates
    ```

### Tham số lỗi thời

Trong mã và tài liệu cũ, bạn có thể thấy một phiên bản dựa trên callback của hàm này.
Cách này đã bị loại bỏ và **rất không nên** dùng.
Bạn nên cập nhật mọi mã hiện có để dùng phiên bản dựa trên {{jsxref("Promise")}} của `addIceCandidate()` thay thế.
Các tham số của dạng cũ được mô tả dưới đây để hỗ trợ cập nhật mã hiện có.

- `successCallback` {{deprecated_inline}}
  - : Hàm được gọi khi ICE candidate đã được thêm thành công.
    Hàm này không nhận tham số đầu vào và không trả về giá trị.
- `failureCallback` {{deprecated_inline}}
  - : Hàm được gọi nếu việc cố gắng thêm ICE candidate thất bại.
    Nó nhận vào một đối tượng {{domxref("DOMException")}} mô tả lý do lỗi.

### Giá trị trả về

Một {{jsxref("Promise")}} được thực thi khi candidate đã được thêm thành công vào mô tả của máy ngang hàng từ xa bởi bộ máy ICE.
Promise này không nhận tham số đầu vào.

### Ngoại lệ

Khi xảy ra lỗi trong lúc cố gắng thêm ICE candidate, {{jsxref("Promise")}} được trả về bởi phương thức này sẽ bị từ chối và trả về một trong các lỗi dưới đây dưới dạng thuộc tính {{domxref("DOMException.name", "name")}} của đối tượng {{domxref("DOMException")}} được chuyển tới trình xử lý từ chối.

- {{jsxref("TypeError")}}
  - : Trả về nếu {{domxref("RTCIceCandidate.sdpMid", "sdpMid")}} và {{domxref("RTCIceCandidate.sdpMLineIndex", "sdpMLineIndex")}} của candidate được chỉ định đều là `null`.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Trả về nếu `RTCPeerConnection` hiện không có máy ngang hàng từ xa nào được thiết lập ({{domxref("RTCPeerConnection.remoteDescription", "remoteDescription")}} là `null`).
- `OperationError` {{domxref("DOMException")}}
  - : Trả về trong một trong các trường hợp sau:
    - Giá trị được chỉ định cho {{domxref("RTCIceCandidate.sdpMid", "sdpMid")}} không phải `null` và không khớp với ID của bất kỳ mô tả media nào trong {{domxref("RTCPeerConnection.remoteDescription", "remoteDescription")}}.
    - Giá trị được chỉ định của {{domxref("RTCIceCandidate.sdpMLineIndex", "sdpMLineIndex")}} lớn hơn hoặc bằng số mô tả media có trong mô tả từ xa.
    - {{domxref("RTCIceCandidate.usernameFragment", "ufrag")}} được chỉ định không khớp với trường `ufrag` trong bất kỳ mô tả từ xa nào đang được xem xét.
    - Một hay nhiều giá trị trong chuỗi {{domxref("RTCIceCandidate", "candidate")}} không hợp lệ hoặc không thể phân tích.
    - Việc cố gắng thêm candidate thất bại vì bất kỳ lý do nào.

## Ví dụ

Đoạn mã này cho thấy cách báo hiệu ICE candidate qua một kênh báo hiệu bất kỳ.

```js
// Ví dụ này giả định máy ngang hàng còn lại đang dùng kênh báo hiệu như sau:
//
// pc.onicecandidate = (event) => {
//   if (event.candidate) {
//     signalingChannel.send(JSON.stringify({ice: event.candidate})); // "ice" là tùy ý
//   } else {
//     // Tất cả ICE candidate đã được gửi
//   }
// }

signalingChannel.onmessage = (receivedString) => {
  const message = JSON.parse(receivedString);
  if (message.ice) {
    // Một giá trị điển hình của ice ở đây có thể trông như sau:
    //
    // {candidate: "candidate:0 1 UDP 2122154243 192.0.2.43 53421 typ host", sdpMid: "0", …}
    //
    // Chuyển toàn bộ đối tượng này cho addIceCandidate:

    pc.addIceCandidate(message.ice).catch((e) => {
      console.log(`Lỗi trong quá trình addIceCandidate(): ${e.name}`);
    });
  } else {
    // xử lý những thứ khác bạn có thể đang báo hiệu, như sdp
  }
};
```

Candidate cuối cùng được máy ngang hàng từ xa báo hiệu theo cách này sẽ là một candidate đặc biệt biểu thị end-of-candidates.
Nếu muốn, bạn có thể chỉ ra end-of-candidates thủ công như sau:

```js
pc.addIceCandidate({ candidate: "" });
```

Tuy nhiên, trong hầu hết các trường hợp bạn sẽ không cần kiểm tra điều này một cách rõ ràng, vì các sự kiện điều khiển {{domxref("RTCPeerConnection")}} sẽ xử lý việc này cho bạn và gửi các sự kiện phù hợp.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC API](/en-US/docs/Web/API/WebRTC_API)
- [Báo hiệu và gọi video](/en-US/docs/Web/API/WebRTC_API/Signaling_and_video_calling)
- [Giới thiệu về các giao thức WebRTC](/en-US/docs/Web/API/WebRTC_API/Protocols)
- [Kết nối WebRTC](/en-US/docs/Web/API/WebRTC_API/Connectivity)
- [Thời gian tồn tại của một phiên WebRTC](/en-US/docs/Web/API/WebRTC_API/Session_lifetime)
