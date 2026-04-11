---
title: "RTCIceCandidate: thuộc tính usernameFragment"
short-title: usernameFragment
slug: Web/API/RTCIceCandidate/usernameFragment
page-type: web-api-instance-property
browser-compat: api.RTCIceCandidate.usernameFragment
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`usernameFragment`** trên giao diện {{domxref("RTCIceCandidate")}} là một chuỗi cho biết
phân đoạn tên người dùng ("ufrag") xác định duy nhất một phiên tương tác ICE đơn lẻ.

Giá trị này được chỉ định bằng thuộc tính `usernameFragment` trong đối tượng tùy chọn `candidateInfo` được truyền vào constructor {{domxref("RTCIceCandidate.RTCIceCandidate", "RTCIceCandidate()")}}.
Nếu bạn gọi hàm khởi tạo với chuỗi m-line thay vì đối tượng tùy chọn, giá trị của `usernameFragment` được trích xuất từ chuỗi m-line candidate được chỉ định.

Lưu ý rằng 24 bit của phân đoạn tên người dùng được yêu cầu phải được trình duyệt sinh ngẫu nhiên. Xem [Ngẫu nhiên hóa](#ngẫu-nhiên-hóa) bên dưới để biết chi tiết.

## Giá trị

Một chuỗi chứa phân đoạn tên người dùng (thường được viết tắt
là "ufrag" hoặc "ice-ufrag"), cùng với mật khẩu ICE ("ice-pwd"),
xác định duy nhất một tương tác ICE đang diễn ra, bao gồm cả giao tiếp
với máy chủ {{Glossary("STUN")}}. Chuỗi có thể dài tới 256 ký tự và
không có giá trị mặc định.

### Ngẫu nhiên hóa

Ít nhất 24 bit của văn bản trong `ufrag` được yêu cầu phải được tầng ICE chọn ngẫu nhiên
vào đầu phiên ICE. Các chi tiết cụ thể về các bit nào là ngẫu nhiên và
phần còn lại của văn bản `ufrag` là gì tùy thuộc vào việc triển khai trình duyệt.
Ví dụ, một trình duyệt có thể luôn sử dụng `ufrag` dài 24 ký tự trong đó bit 4 của mỗi ký tự được chọn ngẫu nhiên
giữa 0 và 1. Một ví dụ khác: nó có thể lấy một chuỗi do người dùng định nghĩa và nối thêm ba byte ngẫu nhiên 8-bit vào cuối. Hoặc có thể mỗi ký tự hoàn toàn ngẫu nhiên.

## Ghi chú sử dụng

ICE sử dụng `usernameFragment` và mật khẩu để đảm bảo tính toàn vẹn thông điệp.
Điều này tránh sự xuyên nhiễu giữa nhiều phiên ICE đang diễn ra, nhưng quan trọng hơn là giúp
bảo mật các giao dịch ICE (và toàn bộ WebRTC theo đó) chống lại các cuộc tấn công có thể cố gắng chen vào trao đổi ICE.

> [!NOTE]
> Không có API để lấy mật khẩu ICE, vì lý do bảo mật khá rõ ràng.

Cả `usernameFragment` lẫn mật khẩu đều thay đổi mỗi khi [ICE restart](/en-US/docs/Web/API/WebRTC_API/Session_lifetime#ice_restart) xảy ra.

## Ví dụ

Mặc dù cơ sở hạ tầng WebRTC sẽ lọc các candidate lỗi thời cho bạn sau khi
khởi động lại ICE, bạn có thể tự làm điều đó nếu bạn đang cố gắng tối đa hóa số lượng tối thiểu
các thông điệp gửi đi.

Để làm vậy, bạn có thể so sánh giá trị của `usernameFragment` với
`usernameFragment` hiện tại đang được sử dụng cho kết nối sau khi nhận
candidate từ máy chủ báo hiệu và trước khi gọi
{{domxref("RTCPeerConnection.addIceCandidate", "addIceCandidate()")}} để thêm nó vào
tập hợp các candidate có thể.

Khi ứng dụng web nhận được thông điệp từ máy chủ báo hiệu bao gồm một candidate
cần được thêm vào {{domxref("RTCPeerConnection")}}, bạn có thể (và thường
_nên_) gọi `addIceCandidate()`. Thường không cần
phải tự lọc candidate.

Tuy nhiên, hãy tưởng tượng chúng ta cần tối thiểu hóa lưu lượng. Hàm bên dưới,
`ssNewCandidate()`, được gọi khi một thông điệp, `signalMsg`, đến
từ máy chủ báo hiệu chứa một ICE candidate cần được thêm vào
`RTCPeerConnection`. Để tránh bao gồm các candidate đã lỗi thời do ICE restart, chúng ta có thể sử dụng mã như thế này:

```js
const ssNewCandidate = (signalMsg) => {
  const candidate = new RTCIceCandidate(signalMsg.candidate);
  const receivers = pc.getReceivers();

  for (const receiver of receivers) {
    const parameters = receiver.transport.iceTransport.getRemoteParameters();

    if (parameters.usernameFragment === candidate.usernameFragment) {
      return;
    }
  }

  pc.addIceCandidate(candidate).catch(window.reportError);
};
```

Hàm này duyệt qua danh sách các đối tượng {{domxref("RTCRtpReceiver")}} đang được dùng để
nhận dữ liệu ICE, và tìm xem `usernameFragment` được chỉ ra trong
candidate có khớp với bất kỳ đối tượng nào không. Nếu có, `ssNewCandidate()` sẽ dừng lại.
Ngược lại, sau khi kiểm tra mọi receiver, nó thêm candidate mới vào kết nối.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
