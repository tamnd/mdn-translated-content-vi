---
title: "RTCIceTransport: sự kiện selectedcandidatepairchange"
short-title: selectedcandidatepairchange
slug: Web/API/RTCIceTransport/selectedcandidatepairchange_event
page-type: web-api-event
browser-compat: api.RTCIceTransport.selectedcandidatepairchange_event
---

{{APIRef("WebRTC")}}

Sự kiện **`selectedcandidatepairchange`** được gửi đến {{domxref("RTCIceTransport")}} khi tác nhân {{Glossary("ICE")}} chọn một cặp ứng cử viên mới mô tả các điểm cuối của một kết nối khả thi.

Cặp ứng cử viên được mô tả bởi một đối tượng {{domxref("RTCIceCandidatePair")}} chứa một {{domxref("RTCIceCandidate")}} đại diện cho đầu cục bộ của kết nối và một đại diện cho đầu từ xa của kết nối.

Cùng nhau, các ứng cử viên có thể được sử dụng để thiết lập kết nối được dùng bởi {{domxref("RTCIceTransport")}}, và theo đó, bởi {{domxref("RTCPeerConnection")}}.

Sự kiện này không thể hủy và không nổi bong bóng.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("selectedcandidatepairchange", (event) => { })

onselectedcandidatepairchange = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

Ví dụ này tạo một trình xử lý sự kiện cho `selectedcandidatepairchange` để cập nhật màn hình cung cấp cho người dùng thông tin về tiến trình thương lượng ICE cho một {{domxref("RTCPeerConnection")}} gọi là `pc`.

```js
let iceTransport = pc.getSenders()[0].transport.iceTransport;
let localProtoElem = document.getElementById("local-protocol");
let remoteProtoElem = document.getElementById("remote-protocol");

iceTransport.addEventListener("selectedcandidatepairchange", (ev) => {
  let pair = iceTransport.getSelectedCandidatePair();
  localProtoElem.innerText = pair.local.protocol.toUpperCase();
  remoteProtoElem.innerText = pair.remote.protocol.toUpperCase();
});
```

Điều này cũng có thể được thực hiện bằng cách đặt trực tiếp thuộc tính trình xử lý sự kiện `onselectedcandidatepairchange`.

```js
let iceTransport = pc.getSenders()[0].transport.iceTransport;
let localProtoElem = document.getElementById("local-protocol");
let remoteProtoElem = document.getElementById("remote-protocol");

iceTransport.onselectedcandidatepairchange = (ev) => {
  let pair = iceTransport.getSelectedCandidatePair();
  localProtoElem.innerText = pair.local.protocol.toUpperCase();
  remoteProtoElem.innerText = pair.remote.protocol.toUpperCase();
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC API](/en-US/docs/Web/API/WebRTC_API)
- [Kết nối WebRTC](/en-US/docs/Web/API/WebRTC_API/Connectivity)

### Các sự kiện RTCIceTransport liên quan

- {{domxref("RTCIceTransport/statechange_event", "statechange")}}
- {{domxref("RTCIceTransport.gatheringstatechange_event", "gatheringstatechange")}}

### Các sự kiện RTCPeerConnection liên quan

- {{domxref("RTCPeerConnection.negotiationneeded_event", "negotiationneeded")}}
- {{domxref("RTCPeerConnection.signalingstatechange_event", "signalingstatechange")}}
- {{domxref("RTCPeerConnection.iceconnectionstatechange_event", "iceconnectionstatechange")}}
- {{domxref("RTCPeerConnection.icegatheringstatechange_event", "icegatheringstatechange")}}
- {{domxref("RTCPeerConnection.connectionstatechange_event", "connectionstatechange")}}
