---
title: "RTCIceTransport: sự kiện gatheringstatechange"
short-title: gatheringstatechange
slug: Web/API/RTCIceTransport/gatheringstatechange_event
page-type: web-api-event
browser-compat: api.RTCIceTransport.gatheringstatechange_event
---

{{APIRef("WebRTC")}}

Sự kiện **`gatheringstatechange`** được gửi đến {{domxref("RTCIceTransport")}} khi trạng thái thu thập ứng cử viên {{Glossary("ICE")}} của nó thay đổi.

Trạng thái thu thập, có thể tìm thấy trạng thái thực trong thuộc tính {{domxref("RTCIceTransport.gatheringState", "gatheringState")}} của đối tượng truyền tải, cho biết liệu tác nhân ICE đã bắt đầu thu thập ứng cử viên trên truyền tải này chưa, và nếu có, liệu nó đã hoàn thành chưa.

Sự kiện này không thể hủy và không nổi bong bóng.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("gatheringstatechange", (event) => { })

ongatheringstatechange = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

Ví dụ này tạo một trình xử lý cho các sự kiện `gatheringstatechange` trên mỗi {{domxref("RTCRtpSender")}} liên kết với một {{domxref("RTCPeerConnection")}} đã cho. Ở đây, phương thức {{domxref("EventTarget.addEventListener", "addEventListener()")}} được gọi để thêm một trình lắng nghe cho các sự kiện `gatheringstatechange`:

```js
pc.getSenders().forEach((sender) => {
  sender.transport.iceTransport.addEventListener(
    "gatheringstatechange",
    (ev) => {
      let transport = ev.target;

      if (transport.gatheringState === "complete") {
        /* truyền tải này đã hoàn thành thu thập ứng cử viên,
        nhưng các truyền tải khác có thể vẫn đang thực hiện */
      }
    },
  );
});
```

Tương tự, bạn có thể sử dụng thuộc tính trình xử lý sự kiện `ongatheringstatechange`:

```js
pc.getSenders().forEach((sender) => {
  sender.transport.iceTransport.ongatheringstatechange = (ev) => {
    let transport = ev.target;

    if (transport.gatheringState === "complete") {
      /* truyền tải này đã hoàn thành thu thập ứng cử viên,
         nhưng các truyền tải khác có thể vẫn đang thực hiện */
    }
  };
});
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
- {{domxref("RTCIceTransport.selectedcandidatepairchange_event", "selectedcandidatepairchange")}}

### Các sự kiện RTCPeerConnection liên quan

- {{domxref("RTCPeerConnection.negotiationneeded_event", "negotiationneeded")}}
- {{domxref("RTCPeerConnection.signalingstatechange_event", "signalingstatechange")}}
- {{domxref("RTCPeerConnection.iceconnectionstatechange_event", "iceconnectionstatechange")}}
- {{domxref("RTCPeerConnection.icegatheringstatechange_event", "icegatheringstatechange")}}
- {{domxref("RTCPeerConnection.connectionstatechange_event", "connectionstatechange")}}
