---
title: "RTCErrorEvent: thuộc tính error"
short-title: error
slug: Web/API/RTCErrorEvent/error
page-type: web-api-instance-property
browser-compat: api.RTCErrorEvent.error
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`error`** của {{domxref("RTCErrorEvent")}} chứa một đối tượng {{domxref("RTCError")}} mô tả chi tiết về lỗi mà sự kiện đang thông báo.

## Giá trị

Một đối tượng {{domxref("RTCError")}} có các thuộc tính cung cấp chi tiết về lỗi đã xảy ra trong ngữ cảnh của một hoạt động {{Glossary("WebRTC")}}.

## Ví dụ

Trong ví dụ này, một trình xử lý được thiết lập cho sự kiện {{domxref("RTCDataChannel.error_event", "error")}} của một {{domxref("RTCDataChannel")}}.

```js
dataChannel.addEventListener("error", (event) => {
  let error = event.error;

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

Nếu lỗi là lỗi cú pháp SDP, được chỉ ra bởi thuộc tính {{domxref("RTCError.errorDetail", "errorDetail")}} của nó là `sdp-syntax-error`, một chuỗi thông điệp được xây dựng để trình bày thông điệp lỗi và số dòng trong SDP nơi xảy ra lỗi. Thông điệp này sau đó được hiển thị bằng hàm `showMyAlertMessage()`, đại diện cho bất kỳ cơ chế đầu ra nào mà mã này có thể dùng.

Bất kỳ lỗi nào khác đều được coi là cuối cùng, gây ra hàm `terminateMyConnection()` được gọi.

Ví dụ trên dùng {{domxref("EventTarget.addEventListener", "addEventListener()")}} để thêm trình xử lý cho các sự kiện `error`. Bạn cũng có thể dùng thuộc tính xử lý sự kiện `onerror` của đối tượng `RTCDataChannel`, như thế này:

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
