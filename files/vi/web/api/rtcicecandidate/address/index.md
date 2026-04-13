---
title: "RTCIceCandidate: thuộc tính address"
short-title: address
slug: Web/API/RTCIceCandidate/address
page-type: web-api-instance-property
browser-compat: api.RTCIceCandidate.address
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`address`** của giao diện **{{domxref("RTCIceCandidate")}}** là một chuỗi cung cấp địa chỉ IP của thiết bị là nguồn của candidate.
`address` mặc định là `null` nếu không được chỉ định.

Giá trị của trường `address` được đặt từ đối tượng tùy chọn `candidateInfo` được truyền vào constructor {{domxref("RTCIceCandidate.RTCIceCandidate", "RTCIceCandidate()")}}.
Bạn không thể chỉ định trực tiếp giá trị của `address` trong đối tượng tùy chọn, nhưng giá trị của nó được tự động trích xuất từ chuỗi a-line `candidate` của đối tượng, nếu nó được định dạng đúng cách.

## Giá trị

Một chuỗi cung cấp địa chỉ IP mà candidate xuất phát từ đó.

> [!NOTE]
> Nếu `port` là `null` và
> `port` được {{Glossary("user agent")}} hỗ trợ, việc truyền
> candidate vào {{domxref("RTCPeerConnection.addIceCandidate", "addIceCandidate()")}}
> sẽ thất bại, ném ra ngoại lệ `OperationError`.

## Ghi chú bảo mật

Cần lưu ý rằng mặc dù WebRTC không yêu cầu hai ngang hàng trên
{{domxref("RTCPeerConnection")}} phải biết địa chỉ IP thực của nhau, thuộc tính
`address` trên `RTCIceCandidate` _có thể_ tiết lộ nhiều thông tin
hơn về nguồn gốc của ngang hàng từ xa so với những gì người dùng mong đợi. Địa chỉ IP
có thể được dùng để suy ra thông tin về vị trí, cấu trúc mạng của thiết bị từ xa, v.v.
Nó cũng có thể được dùng cho mục đích [lấy dấu vân tay](/en-US/docs/Glossary/Fingerprinting).

Địa chỉ IP của candidate _luôn_ được hiển thị cho ứng dụng thông qua
`address`, và các ứng dụng không lành mạnh có thể tiết lộ địa chỉ cho người dùng.
Điều này có thể xảy ra mà không cần sự đồng ý của ngang hàng từ xa.

Các ứng dụng được xây dựng với quyền riêng tư và bảo mật người dùng trong tâm trí có thể chọn giới hạn
các candidate được phép chỉ là relay candidate. Làm vậy ngăn địa chỉ của người dùng từ xa
bị lộ ra, nhưng giảm bộ candidate có sẵn để lựa chọn.
Để làm điều này, hãy cấu hình chính sách truyền tải ICE của ICE agent với một đối tượng xác nhận thuộc tính `configuration` được mô tả trong {{domxref("RTCPeerConnection.setConfiguration")}}, như sau:

```js
const rtcConfig = {
  iceServers: [
    {
      urls: "turn:my-turn.server.ip",
      username: "username",
      credential: "password",
    },
  ],
  iceTransportPolicy: "relay",
};
```

Bằng cách đặt `iceTransportPolicy` thành `"relay"`,
bất kỳ host candidate nào (candidate mà địa chỉ IP là địa chỉ IP thực của ngang hàng) đều bị
loại khỏi bộ candidate, cũng như bất kỳ candidate nào không phải relay candidate.

## Ghi chú sử dụng

Hãy xem xét dòng thuộc tính {{Glossary("SDP")}} (a-line) mô tả một ICE candidate:

```plain
a=candidate:4234997325 1 udp 2043278322 192.0.2.172 44323 typ host
```

Trường thứ năm, `"192.0.2.172"` là địa chỉ IP trong chuỗi a-line của candidate này.

## Ví dụ

Đoạn mã này dùng giá trị của `address` để thực hiện tính năng chặn dựa trên địa chỉ IP.

```js
if (ipBanList.includes(candidate.address)) {
  rejectCandidate(candidate);
} else {
  acceptCandidate(candidate);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
