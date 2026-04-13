---
title: "RTCPeerConnection: thuộc tính connectionState"
short-title: connectionState
slug: Web/API/RTCPeerConnection/connectionState
page-type: web-api-instance-property
browser-compat: api.RTCPeerConnection.connectionState
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`connectionState`** của giao diện {{domxref("RTCPeerConnection")}} cho biết trạng thái hiện tại của kết nối ngang hàng bằng cách trả về một trong các giá trị chuỗi sau: `new`, `connecting`, `connected`, `disconnected`, `failed` hoặc `closed`.

Trạng thái này về cơ bản đại diện cho trạng thái tổng hợp của tất cả các luồng truyền tải ICE (thuộc kiểu {{domxref("RTCIceTransport")}} hoặc {{domxref("RTCDtlsTransport")}}) mà kết nối đang dùng.

Khi giá trị của thuộc tính này thay đổi, một sự kiện {{domxref("RTCPeerConnection.connectionstatechange_event", "connectionstatechange")}} sẽ được gửi tới thể hiện {{domxref("RTCPeerConnection")}}.

## Giá trị

Một chuỗi biểu diễn trạng thái hiện tại của kết nối.
Giá trị có thể là một trong các trạng thái sau:

- `new`
  - : Ít nhất một trong các luồng truyền tải {{Glossary("ICE")}} của kết nối (các đối tượng {{domxref("RTCIceTransport")}} hoặc {{domxref("RTCDtlsTransport")}}) đang ở trạng thái `new`, và không có luồng nào ở các trạng thái sau: `connecting`, `checking`, `failed`, `disconnected`, hoặc tất cả các luồng của kết nối đều ở trạng thái `closed`.
- `connecting`
  - : Một hay nhiều luồng truyền tải {{Glossary("ICE")}} hiện đang trong quá trình thiết lập kết nối;
    tức là {{DOMxRef("RTCPeerConnection.iceConnectionState", "iceConnectionState")}} của chúng là `checking` hoặc `connected`, và không có luồng nào ở trạng thái `failed`.
- `connected`
  - : Mọi luồng truyền tải {{Glossary("ICE")}} được dùng bởi kết nối đều hoặc đang được sử dụng (trạng thái `connected` hoặc `completed`) hoặc đã đóng (trạng thái `closed`);
    ngoài ra, ít nhất một luồng đang ở trạng thái `connected` hoặc `completed`.
- `disconnected`
  - : Ít nhất một trong các luồng truyền tải {{Glossary("ICE")}} của kết nối ở trạng thái `disconnected` và không có luồng nào khác ở các trạng thái: `failed`, `connecting` hoặc `checking`.
- `failed`
  - : Một hay nhiều luồng truyền tải {{Glossary("ICE")}} trên kết nối ở trạng thái `failed`.
- `closed`
  - : {{DOMxRef("RTCPeerConnection")}} đã đóng.

## Ví dụ

```js
const peerConnection = new RTCPeerConnection(configuration);

// …

const connectionState = peerConnection.connectionState;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Thời gian tồn tại của một phiên WebRTC](/en-US/docs/Web/API/WebRTC_API/Session_lifetime)
- {{domxref("RTCPeerConnection")}}
- {{domxref("RTCPeerConnection.connectionstatechange_event", "connectionstatechange")}}
- {{domxref("RTCIceTransport.state")}}
- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
