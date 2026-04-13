---
title: RTCError
slug: Web/API/RTCError
page-type: web-api-interface
browser-compat: api.RTCError
---

{{APIRef("WebRTC")}}

Giao diện **`RTCError`** mô tả một lỗi xảy ra trong khi xử lý các hoạt động [WebRTC](/en-US/docs/Web/API/WebRTC_API). Nó dựa trên giao diện {{domxref("DOMException")}} tiêu chuẩn mô tả các lỗi DOM chung.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("RTCError.RTCError", "RTCError()")}}
  - : Tạo và trả về một đối tượng `RTCError` mới được khởi tạo với các tham số khác nhau và tùy chọn một chuỗi để sử dụng làm giá trị của thuộc tính {{domxref("DOMException.message", "message")}} của lỗi.

## Thuộc tính phiên bản

_Ngoài các thuộc tính được định nghĩa bởi giao diện cha, {{domxref("DOMException")}}, `RTCError` bao gồm các thuộc tính sau:_

- {{domxref("RTCError.errorDetail", "errorDetail")}} {{ReadOnlyInline}}
  - : Một chuỗi chỉ định mã lỗi WebRTC cụ thể xác định loại lỗi xảy ra.
- {{domxref("RTCError.receivedAlert", "receivedAlert")}} {{ReadOnlyInline}}
  - : Một giá trị số nguyên không dấu dài cho biết lỗi {{Glossary("DTLS")}} nghiêm trọng nhận được từ mạng. Chỉ hợp lệ nếu chuỗi `errorDetail` là `dtls-failure`. Nếu `null`, không có lỗi DTLS nào được nhận.
- {{domxref("RTCError.sctpCauseCode", "sctpCauseCode")}} {{ReadOnlyInline}}
  - : Nếu `errorDetail` là `sctp-failure`, thuộc tính này là một số nguyên dài chỉ định mã nguyên nhân {{Glossary("SCTP")}} cho biết nguyên nhân của lỗi thương lượng SCTP. `null` nếu lỗi không phải là lỗi SCTP.
- {{domxref("RTCError.sdpLineNumber", "sdpLineNumber")}} {{ReadOnlyInline}}
  - : Nếu `errorDetail` là `sdp-syntax-error`, thuộc tính này là một số nguyên dài xác định số dòng của {{Glossary("SDP")}} nơi xảy ra lỗi cú pháp. `null` nếu lỗi không phải là lỗi cú pháp SDP.
- {{domxref("RTCError.sentAlert", "sentAlert")}} {{ReadOnlyInline}}
  - : Nếu `errorDetail` là `dtls-failure`, thuộc tính này là một số nguyên không dấu dài cho biết lỗi DTLS nghiêm trọng được gửi bởi thiết bị này. Nếu `null`, không có lỗi DTLS nào được truyền.

> [!NOTE]
> Tất cả các đối tượng `RTCError` đều có {{domxref("DOMException.name", "name")}} được đặt thành `OperationError`.

## Ví dụ

Trong ví dụ này, một hàm xử lý được thiết lập cho sự kiện {{domxref("RTCDataChannel.error_event", "error")}} của {{domxref("RTCDataChannel")}}.

```js
dataChannel.addEventListener("error", (event) => {
  let error = event.error; // event.error is an RTCError

  if (error.errorDetail === "sdp-syntax-error") {
    let errLine = error.sdpLineNumber;
    let errMessage = error.message;

    let alertMessage = `A syntax error occurred interpreting line ${errLine} of the SDP: ${errMessage}`;
    showMyAlertMessage("Data Channel Error", alertMessage);
  } else {
    terminateMyConnection();
  }
});
```

Nếu lỗi là lỗi cú pháp SDP, được biểu thị bởi thuộc tính {{domxref("RTCError.errorDetail", "errorDetail")}} của nó là `sdp-syntax-error`, một chuỗi tin nhắn được xây dựng để trình bày thông báo lỗi và số dòng trong SDP tại đó lỗi xảy ra. Tin nhắn này sau đó được hiển thị bằng cách sử dụng một hàm gọi là `showMyAlertMessage()`, thay thế cho bất kỳ cơ chế đầu ra nào mà đoạn mã này có thể sử dụng.

Bất kỳ lỗi nào khác được xử lý là lỗi kết thúc, dẫn đến việc gọi hàm `terminateMyConnection()`.

Ví dụ trên sử dụng {{domxref("EventTarget.addEventListener", "addEventListener()")}} để thêm hàm xử lý cho các sự kiện `error`. Bạn cũng có thể sử dụng thuộc tính trình xử lý sự kiện {{domxref("RTCDataChannel.error_event", "onerror")}} của đối tượng `RTCDataChannel`, như thế này:

```js
dataChannel.onerror = (event) => {
  let error = event.error;

  /* and so forth */
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
