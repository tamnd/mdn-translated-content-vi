---
title: "RTCDataChannel: sự kiện lỗi"
short-title: error
slug: Web/API/RTCDataChannel/error_event
page-type: web-api-event
browser-compat: api.RTCDataChannel.error_event
---

{{APIRef("WebRTC")}}

Sự kiện WebRTC `error` được gửi đến trình xử lý sự kiện `onerror` của đối tượng `onerror` khi xảy ra lỗi trên kênh dữ liệu.

Đối tượng {{domxref("RTCErrorEvent")}} cung cấp thông tin chi tiết về lỗi đã xảy ra; xem bài viết đó để biết chi tiết.

Sự kiện này không thể hủy và không bong bóng.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}} hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("error", (event) => { })

onerror = (event) => { }
```

## Loại sự kiện

Một {{domxref("RTCErrorEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("RTCErrorEvent")}}

## Thuộc tính sự kiện

_Ngoài các thuộc tính được liệt kê bên dưới, còn có các thuộc tính từ giao diện gốc, {{domxref("Event")}}._

- {{domxref("RTCErrorEvent.error", "error")}} {{ReadOnlyInline}}
  - : Đối tượng {{domxref("RTCError")}} chỉ định lỗi đã xảy ra; đối tượng này bao gồm loại lỗi đã xảy ra và thông tin về vị trí xảy ra lỗi (chẳng hạn như số dòng nào trong {{Glossary("SDP")}} hoặc mã nguyên nhân {{Glossary("SCTP")}} nào có vấn đề).

## Ví dụ

```js
// Strings for each of the SCTP cause codes found in RFC
// 4960, section 3.3.10:
// https://datatracker.ietf.org/doc/html/rfc4960#section-3.3.10

const sctpCauseCodes = [
  "No SCTP error",
  "Invalid stream identifier",
  "Missing mandatory parameter",
  "Stale cookie error",
  "Sender is out of resource (i.e., memory)",
  "Unable to resolve address",
  "Unrecognized SCTP chunk type received",
  "Invalid mandatory parameter",
  "Unrecognized parameters",
  "No user data (SCTP DATA chunk has no data)",
  "Cookie received while shutting down",
  "Restart of an association with new addresses",
  "User-initiated abort",
  "Protocol violation",
];

dc.addEventListener("error", (ev) => {
  const err = ev.error;

  console.error("WebRTC error: ", err.message);

  // Handle specific error detail types

  switch (err.errorDetail) {
    case "sdp-syntax-error":
      console.error("    SDP syntax error in line ", err.sdpLineNumber);
      break;
    case "idp-load-failure":
      console.error(
        "    Identity provider load failure: HTTP error ",
        err.httpRequestStatusCode,
      );
      break;
    case "sctp-failure":
      if (err.sctpCauseCode < sctpCauseCodes.length) {
        console.error("    SCTP failure: ", err.sctpCauseCode);
      } else {
        console.error("    Unknown SCTP error");
      }
      break;
    case "dtls-failure":
      if (err.receivedAlert) {
        console.error("    Received DTLS failure alert: ", err.receivedAlert);
      }
      if (err.sentAlert) {
        console.error("    Sent DTLS failure alert: ", err.receivedAlert);
      }
      break;
  }

  // Add source file name and line information

  console.error(
    "    Error in file ",
    err.filename,
    " at line ",
    err.lineNumber,
    ", column ",
    err.columnNumber,
  );
});
```

Sự kiện nhận được cung cấp thông tin chi tiết trong đối tượng {{domxref("RTCError")}} có tên là {{domxref("RTCErrorEvent.error", "error")}}; `RTCError` là phần mở rộng của giao diện {{domxref("DOMException")}}. {{domxref("DOMException.name", "name")}} của lỗi là `RTCError` và {{domxref("DOMException.message", "message")}} là một chuỗi lỗi được chỉ định bởi lớp WebRTC.

Thông tin lỗi được xuất ra bảng điều khiển bằng {{domxref("console/error_static", "console.error()")}}. Chuỗi `message` luôn được xuất ra, cũng như thông tin về tên, số dòng và số cột của tệp nguồn nơi xảy ra lỗi.

Tuy nhiên, ngoài ra, tùy thuộc vào giá trị của {{domxref("RTCError.errorDetail", "errorDetail")}}, thông tin bổ sung có thể được xuất ra. Mỗi loại lỗi có một tập hợp thông tin đầu ra khác nhau. Ví dụ: lỗi cú pháp SDP hiển thị số dòng của lỗi trong SDP và lỗi SCTP hiển thị thông báo tương ứng với mã nguyên nhân SCTP. Các loại lỗi khác cũng đưa ra thông tin phù hợp tương tự.

Bạn cũng có thể thiết lập trình xử lý sự kiện cho các sự kiện `error` bằng cách sử dụng thuộc tính trình xử lý sự kiện `onerror` của giao diện `RTCDataChannel`:

```js
dc.onerror = (ev) => {
  const err = ev.error;

  // …
};
```

> [!LƯU Ý]
> Vì `RTCError` không phải là một trong các lỗi cũ nên giá trị của {{domxref("DOMException.code", "RTCError.code")}} luôn là 0.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [API WebRTC](/en-US/docs/Web/API/WebRTC_API)
- [Một ví dụ RTCDataChannel đơn giản](/en-US/docs/Web/API/WebRTC_API/Simple_RTCDataChannel_sample)
- Sự kiện liên quan: {{domxref("RTCDataChannel.open_event", "open")}}, {{domxref("RTCDataChannel.message_event", "message")}} và {{domxref("RTCDataChannel.close_event", "close")}}
