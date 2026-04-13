---
title: "RTCDtlsTransport: error event"
short-title: error
slug: Web/API/RTCDtlsTransport/error_event
page-type: web-api-event
browser-compat: api.RTCDtlsTransport.error_event
---

{{APIRef("WebRTC")}}

Một {{domxref("RTCDtlsTransport")}} nhận sự kiện `error` khi xảy ra lỗi cấp transport trên {{domxref("RTCPeerConnection")}}.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("error", (event) => { })

onerror = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("RTCErrorEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("RTCErrorEvent")}}

## Thuộc tính sự kiện

_Ngoài các thuộc tính chuẩn có sẵn trên giao diện {{domxref("Event")}}, `RTCErrorEvent` cũng bao gồm:_

- {{domxref("RTCErrorEvent.error", "error")}} {{ReadOnlyInline}}
  - : Một đối tượng {{domxref("RTCError")}} chỉ ra lỗi đã xảy ra; đối tượng này bao gồm loại lỗi đã xảy ra, thông tin về nơi xảy ra lỗi (chẳng hạn như dòng số nào trong {{Glossary("SDP")}} hoặc mã nguyên nhân {{Glossary("SCTP")}} nào là vấn đề).

## Mô tả

Các lỗi cấp transport sẽ có một trong các giá trị sau cho thuộc tính {{domxref("RTCError")}} {{domxref("RTCError.errorDetail", "errorDetail")}} của lỗi đã chỉ định:

- `dtls-failure`
  - : Việc thỏa thuận kết nối {{Glossary("DTLS")}} thất bại, hoặc kết nối bị chấm dứt với một lỗi nghiêm trọng. {{domxref("DOMException.message", "message")}} của lỗi chứa thông tin chi tiết về bản chất của lỗi. Nếu một lỗi nghiêm trọng _được nhận_, thuộc tính {{domxref("RTCError.receivedAlert", "receivedAlert")}} của đối tượng lỗi được đặt thành giá trị của cảnh báo DTLSL đã nhận. Mặt khác, nếu một lỗi nghiêm trọng _được gửi_, {{domxref("RTCError.sentAlert", "sentAlert")}} được đặt thành giá trị của cảnh báo.
- `fingerprint-failure`
  - : Chứng chỉ từ xa cho {{domxref("RTCDtlsTransport")}} không khớp với bất kỳ fingerprint nào được liệt kê trong SDP. Nếu peer từ xa không thể khớp chứng chỉ cục bộ với các fingerprint được cung cấp, lỗi này không xảy ra, mặc dù tình huống này có thể dẫn đến lỗi `dtls-failure`.

## Ví dụ

Trong ví dụ này, thuộc tính xử lý sự kiện `onerror` được sử dụng để đặt trình xử lý cho sự kiện `error`.

```js
transport.onerror = (ev) => {
  const err = ev.error;

  // …
};
```

> [!NOTE]
> Vì `RTCError` không phải là một trong các lỗi kế thừa, giá trị của {{domxref("DOMException.code", "code")}} luôn là 0.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC API](/en-US/docs/Web/API/WebRTC_API)
