---
title: "RTCDtlsTransport: statechange event"
short-title: statechange
slug: Web/API/RTCDtlsTransport/statechange_event
page-type: web-api-event
browser-compat: api.RTCDtlsTransport.statechange_event
---

{{APIRef("WebRTC")}}

Sự kiện **`statechange`** xảy ra khi {{domxref("RTCDtlsTransport")}} thay đổi trạng thái. Thuộc tính {{domxref("RTCDtlsTransport.state", "state")}} có thể được sử dụng để xác định trạng thái hiện tại của transport Datagram Transport Layer Security (DTLS) cơ bản.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("statechange", (event) => { })

onstatechange = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

Cho một {{domxref("RTCPeerConnection")}}, `pc`, đoạn mã sau tạo một trình xử lý sự kiện gọi hàm có tên `handleFailure()` nếu DTLS transport vào trạng thái thất bại.

```js
const dtlsTransport = pc.getSenders()[0].transport;

dtlsTransport.addEventListener("statechange", (ev) => {
  if (dtlsTransport.state === "failed") {
    handleFailure(pc);
  }
});
```

Cùng một mã, sử dụng thuộc tính xử lý sự kiện `onstatechange`, trông như sau:

```js
const dtlsTransport = pc.getSenders()[0].transport;

dtlsTransport.onstatechange = (ev) => {
  if (dtlsTransport.state === "failed") {
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
- {{domxref("RTCDtlsTransport.state")}}
- {{domxref("RTCDtlsTransport.error_event", "error")}}
