---
title: "RTCIceTransport: sự kiện statechange"
short-title: statechange
slug: Web/API/RTCIceTransport/statechange_event
page-type: web-api-event
browser-compat: api.RTCIceTransport.statechange_event
---

{{APIRef("WebRTC")}}

Sự kiện **`statechange`** xảy ra khi {{domxref("RTCIceTransport")}} thay đổi trạng thái. {{domxref("RTCIceTransport.state", "state")}} có thể được sử dụng để xác định tiến trình của quá trình kiểm tra, xác minh và chọn một cặp ứng cử viên hợp lệ trước khi kết nối thành công hai đối tác cho truyền thông WebRTC.

Sự kiện này không thể hủy và không nổi bong bóng.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("statechange", (event) => { })

onstatechange = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

Cho một {{domxref("RTCPeerConnection")}}, `pc`, đoạn mã sau tạo một trình xử lý sự kiện gọi hàm tên `handleFailure()` nếu truyền tải ICE vào trạng thái lỗi.

```js
let iceTransport = pc.getSenders()[0].transport.iceTransport;

iceTransport.addEventListener("statechange", (ev) => {
  if (iceTransport.state === "failed") {
    handleFailure(pc);
  }
});
```

Cùng đoạn mã đó, sử dụng thuộc tính trình xử lý sự kiện `onstatechange`, trông như thế này:

```js
let iceTransport = pc.getSenders()[0].transport.iceTransport;

iceTransport.onstatechange = (ev) => {
  if (iceTransport.state === "failed") {
    handleFailure(pc);
  }
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

- {{domxref("RTCIceTransport.gatheringstatechange_event", "gatheringstatechange")}}
- {{domxref("RTCIceTransport.selectedcandidatepairchange_event", "selectedcandidatepairchange")}}

### Các sự kiện RTCPeerConnection liên quan

- {{domxref("RTCPeerConnection.negotiationneeded_event", "negotiationneeded")}}
- {{domxref("RTCPeerConnection.signalingstatechange_event", "signalingstatechange")}}
- {{domxref("RTCPeerConnection.iceconnectionstatechange_event", "iceconnectionstatechange")}}
- {{domxref("RTCPeerConnection.icegatheringstatechange_event", "icegatheringstatechange")}}
- {{domxref("RTCPeerConnection.connectionstatechange_event", "connectionstatechange")}}
