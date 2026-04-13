---
title: RTCSessionDescription
slug: Web/API/RTCSessionDescription
page-type: web-api-interface
browser-compat: api.RTCSessionDescription
---

{{APIRef("WebRTC")}}

Giao diện **`RTCSessionDescription`** mô tả một đầu của kết nối—hoặc kết nối tiềm năng—và cách nó được cấu hình. Mỗi `RTCSessionDescription` bao gồm một {{domxref("RTCSessionDescription.type", "type")}} mô tả cho biết phần nào của quá trình thương lượng offer/answer mà nó mô tả và bộ mô tả {{Glossary("SDP")}} của phiên.

Quá trình thương lượng kết nối giữa hai peer liên quan đến việc trao đổi các đối tượng `RTCSessionDescription` qua lại, với mỗi mô tả đề xuất một tổ hợp tùy chọn cấu hình kết nối mà người gửi mô tả hỗ trợ. Khi hai peer thống nhất về cấu hình cho kết nối, quá trình thương lượng sẽ hoàn tất.

## Constructor

- {{domxref("RTCSessionDescription.RTCSessionDescription", "RTCSessionDescription()")}} {{deprecated_inline}}
  - : Tạo một `RTCSessionDescription` mới bằng cách chỉ định `type` và `sdp`. Tất cả các phương thức chấp nhận đối tượng `RTCSessionDescription` cũng chấp nhận các đối tượng có cùng thuộc tính, vì vậy bạn có thể sử dụng một đối tượng thuần thay vì tạo một instance `RTCSessionDescription`.

## Thuộc tính instance

_Giao diện `RTCSessionDescription` không kế thừa bất kỳ thuộc tính nào._

- {{domxref("RTCSessionDescription.type")}} {{ReadOnlyInline}}
  - : Một enum mô tả loại của mô tả phiên.
- {{domxref("RTCSessionDescription.sdp")}} {{ReadOnlyInline}}
  - : Một chuỗi chứa {{Glossary("SDP")}} mô tả phiên.

## Phương thức instance

_Giao diện `RTCSessionDescription` không kế thừa bất kỳ phương thức nào._

- {{domxref("RTCSessionDescription.toJSON()")}}
  - : Trả về mô tả {{Glossary("JSON")}} của đối tượng. Giá trị của cả hai thuộc tính, {{domxref("RTCSessionDescription.type", "type")}} và {{domxref("RTCSessionDescription.sdp", "sdp")}}, đều được chứa trong JSON được tạo.

## Ví dụ

```js
signalingChannel.onmessage = (evt) => {
  if (!pc) start(false);

  const message = JSON.parse(evt.data);
  if (message.type && message.sdp) {
    pc.setRemoteDescription(
      new RTCSessionDescription(message),
      () => {
        // nếu chúng tôi nhận được một offer, chúng tôi cần trả lời
        if (pc.remoteDescription.type === "offer") {
          pc.createAnswer(localDescCreated, logError);
        }
      },
      logError,
    );
  } else {
    pc.addIceCandidate(
      new RTCIceCandidate(message.candidate),
      () => {},
      logError,
    );
  }
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Hỗ trợ trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
- {{domxref("RTCPeerConnection.setLocalDescription()")}} và {{domxref("RTCPeerConnection.setRemoteDescription()")}}
