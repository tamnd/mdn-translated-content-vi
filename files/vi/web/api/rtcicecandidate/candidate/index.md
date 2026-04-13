---
title: "RTCIceCandidate: thuộc tính candidate"
short-title: candidate
slug: Web/API/RTCIceCandidate/candidate
page-type: web-api-instance-property
browser-compat: api.RTCIceCandidate.candidate
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`candidate`** trên giao diện {{domxref("RTCIceCandidate")}} trả về một chuỗi mô tả chi tiết về candidate.
Hầu hết các thuộc tính khác của `RTCIceCandidate` đều được trích xuất từ chuỗi này.

Thuộc tính này có thể được cấu hình bằng thuộc tính `candidate` của đối tượng được truyền vào constructor {{domxref("RTCIceCandidate.RTCIceCandidate", "RTCIceCandidate()")}} hoặc {{domxref("RTCPeerConnection.addIceCandidate()")}}.

## Giá trị

Một chuỗi mô tả các thuộc tính của candidate, lấy trực tiếp từ thuộc tính {{Glossary("SDP")}} `"candidate"`.
Chuỗi candidate xác định thông tin kết nối mạng cho candidate.
Nếu `candidate` là chuỗi rỗng (`""`), kết thúc danh sách candidate đã được đạt tới; candidate này được gọi là dấu hiệu "end-of-candidates".

Cú pháp của chuỗi candidate được mô tả trong {{RFC(5245, "", 15.1)}}. Với một a-line (dòng thuộc tính) như thế này:

```plain
a=candidate:4234997325 1 udp 2043278322 192.0.2.172 44323 typ host
```

giá trị của chuỗi `candidate` tương ứng sẽ là: `"candidate:4234997325 1 udp 2043278322 192.0.2.172 44323 typ host"`.

{{Glossary("user agent")}} luôn ưu tiên các candidate có
{{domxref("RTCIceCandidate.priority", "priority")}} cao nhất, khi các điều kiện khác bằng nhau. Trong
ví dụ trên, độ ưu tiên là `2043278322`. Các thuộc tính đều được cách nhau
bằng một ký tự khoảng trắng, và theo thứ tự cụ thể. Danh sách đầy đủ các thuộc tính
cho candidate ví dụ này là:

- {{domxref("RTCIceCandidate.foundation", "foundation")}} = 4234997325
- {{domxref("RTCIceCandidate.component", "component")}} = `"rtp"` (số 1 được mã hóa thành chuỗi này; 2 thành `"rtcp"`)
- {{domxref("RTCIceCandidate.protocol", "protocol")}} = `"udp"`
- {{domxref("RTCIceCandidate.priority", "priority")}} = 2043278322
- {{domxref("RTCIceCandidate/address", "ip")}} = `"192.0.2.172"`
- {{domxref("RTCIceCandidate.port", "port")}} = 44323
- {{domxref("RTCIceCandidate.type", "type")}} = `"host"`

## Ví dụ

Trong ví dụ này, chúng ta thấy một hàm nhận đầu vào là một chuỗi SDP chứa
ICE candidate nhận từ ngang hàng từ xa trong quá trình truyền hiệu.

```js
function handleNewIceCandidate(candidateSDP) {
  const candidateObj = new RTCIceCandidate(candidateSDP);

  myPeerConnection.addIceCandidate(candidateObj).catch({
    /* handle the error thrown by addIceCandidate() */
  });
}
```

Hàm `handleNewIceCandidate()` được hiển thị ở đây truyền văn bản SDP của candidate nhận được
vào {{domxref("RTCIceCandidate.RTCIceCandidate", "RTCIceCandidate()")}} để nhận lại một đối tượng {{domxref("RTCIceCandidate")}},
đại diện cho candidate.

Candidate mới sau đó được truyền vào {{domxref("RTCPeerConnection.addIceCandidate()")}} để thêm candidate vào danh sách
các candidate để WebRTC xem xét sử dụng cho kết nối đang được thiết lập.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
