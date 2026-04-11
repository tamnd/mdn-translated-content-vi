---
title: "RTCSessionDescription: RTCSessionDescription() constructor"
short-title: RTCSessionDescription()
slug: Web/API/RTCSessionDescription/RTCSessionDescription
page-type: web-api-constructor
status:
  - deprecated
browser-compat: api.RTCSessionDescription.RTCSessionDescription
---

{{APIRef("WebRTC")}}{{deprecated_header}}

Hàm tạo **`RTCSessionDescription()`** tạo một {{domxref("RTCSessionDescription")}} mới với các thuộc tính của nó được khởi tạo như mô tả trong đối tượng được chỉ định.

> [!GHI CHÚ]
> Hàm tạo này không được dùng nữa vì
> {{domxref("RTCPeerConnection.setLocalDescription()")}} và các phương pháp khác sử dụng
> SDP làm đầu vào bây giờ chấp nhận trực tiếp một đối tượng chứa các thuộc tính {{domxref("RTCSessionDescription.type", "type")}} và {{domxref("RTCSessionDescription.sdp", "sdp")}}, do đó bạn không cần phải khởi tạo một
> `RTCSessionDescription` chính bạn.

## Cú pháp

```js-nolint
new RTCSessionDescription(options)
```

### Giá trị

- `options`
  - : Một đối tượng cung cấp các giá trị mặc định cho mô tả phiên. Nó phải chứa các thuộc tính sau:
    - `type`
      - : **Bắt buộc.** Một chuỗi được sử dụng để thiết lập thuộc tính `type` của đối tượng `RTCSessionDescription` mới. Phải là một trong các giá trị {{domxref("RTCSessionDescription.type")}} hợp lệ.
    - `sdp` {{optional_inline}}
      - : Một chuỗi chứa thông báo {{Glossary("SDP")}} mô tả phiên làm việc. Giá trị này mặc định là một chuỗi trống (`""`) và có thể không phải là `null`.

## Ví dụ

Ví dụ này sử dụng hàm tạo để chuyển một đề nghị SDP thành một đối tượng `RTCSessionDescription`.

> [!GHI CHÚ]
> Tuy nhiên, điều này không còn cần thiết nữa;
> {{domxref("RTCPeerConnection.setLocalDescription()")}} và các phương pháp khác sử dụng
> SDP làm đầu vào bây giờ chấp nhận trực tiếp các đối tượng đơn giản, do đó bạn không cần phải khởi tạo một
> `RTCSessionDescription` chính bạn.

```js
navigator.getUserMedia({ video: true }, (stream) => {
  pc.onaddstream({ stream });
  // Adding a local stream won't trigger the onaddstream callback
  pc.addStream(stream);

  pc.createOffer((offer) => {
    pc.setLocalDescription(
      new RTCSessionDescription(offer),
      () => {
        // send the offer to a server to be forwarded to the friend you're calling.
      },
      error,
    );
  }, error);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC API](/en-US/docs/Web/API/WebRTC_API)
- {{domxref("RTCSessionDescription")}}
