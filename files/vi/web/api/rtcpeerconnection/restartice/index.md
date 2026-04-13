---
title: "RTCPeerConnection: phương thức restartIce()"
short-title: restartIce()
slug: Web/API/RTCPeerConnection/restartIce
page-type: web-api-instance-method
browser-compat: api.RTCPeerConnection.restartIce
---

{{APIRef("WebRTC")}}

Phương thức **`restartIce()`** của giao diện {{domxref("RTCPeerConnection")}} cho phép ứng dụng web yêu cầu thực hiện lại việc thu thập {{Glossary("ICE")}} candidate ở cả hai đầu của kết nối.
Điều này đơn giản hóa quá trình bằng cách cho phép cùng một phương thức được dùng bởi cả bên gọi lẫn bên nhận để kích hoạt khởi động lại ICE.

Sau khi `restartIce()` trả về, offer được trả về bởi lần gọi tiếp theo tới {{domxref("RTCPeerConnection.createOffer", "createOffer()")}} sẽ được cấu hình tự động để kích hoạt khởi động lại ICE trên cả máy ngang hàng cục bộ và máy ngang hàng từ xa, sau khi offer được gửi qua cơ chế báo hiệu của bạn và máy ngang hàng từ xa cũng đã đặt mô tả của nó.

`restartIce()` khiến sự kiện {{domxref("RTCPeerConnection.negotiationneeded_event", "negotiationneeded")}} được gửi trên `RTCPeerConnection` để thông báo cho ứng dụng rằng nó nên thực hiện thương lượng qua kênh báo hiệu.

Nếu thương lượng không hoàn tất - do rollback hoặc do các offer đến đang trong quá trình được thương lượng - {{domxref("RTCPeerConnection")}} sẽ ghi nhớ rằng bạn đã yêu cầu khởi động lại ICE.
Lần tiếp theo trạng thái {{domxref("RTCPeerConnection.signalingState", "signalingState")}} của kết nối chuyển sang `stable`, kết nối sẽ gửi sự kiện {{domxref("RTCPeerConnection.negotiationneeded_event", "negotiationneeded")}}.
Quá trình này tiếp tục cho đến khi một lần khởi động lại ICE được hoàn tất thành công.

## Cú pháp

```js-nolint
restartIce()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ghi chú sử dụng

Sau khi gọi `restartIce()`, offer tiếp theo được tạo bằng {{domxref("RTCPeerConnection.createOffer", "createOffer()")}} sẽ khởi động lại ICE khi được gửi tới máy ngang hàng từ xa qua cơ chế báo hiệu.
Việc khởi động lại ICE về cơ bản đặt lại ICE để nó tạo ra toàn bộ candidate mới bằng thông tin xác thực mới.
Việc truyền media hiện có vẫn tiếp tục không bị gián đoạn trong quá trình này.

Để biết chi tiết về cách khởi động lại ICE hoạt động, xem [ICE restart](/en-US/docs/Web/API/WebRTC_API/Session_lifetime#ice_restart) và {{RFC(5245, "ICE specification", "9.1.1.1")}}.

## Ví dụ

Ví dụ này tạo một trình xử lý cho sự kiện {{domxref("RTCPeerConnection.iceconnectionstatechange_event", "iceconnectionstatechange")}} xử lý việc chuyển sang trạng thái `failed` bằng cách khởi động lại ICE để thử lại.

```js
pc.addEventListener("iceconnectionstatechange", (event) => {
  if (pc.iceConnectionState === "failed") {
    /* có thể cấu hình lại kết nối theo cách nào đó ở đây */
    /* rồi yêu cầu khởi động lại ICE */
    pc.restartIce();
  }
});
```

Với mã này, việc chuyển sang trạng thái `failed` trong quá trình thương lượng ICE sẽ khiến sự kiện {{domxref("RTCPeerConnection.negotiationneeded_event", "negotiationneeded")}} được gửi ra, và mã của bạn nên thương lượng lại như bình thường để phản hồi.
Tuy nhiên, vì bạn đã gọi `restartIce()`, lệnh gọi {{domxref("RTCPeerConnection.createOffer", "createOffer()")}} trong trình xử lý `negotiationneeded` sẽ kích hoạt khởi động lại ICE thay vì chỉ thương lượng lại thông thường.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC API](/en-US/docs/Web/API/WebRTC_API)
- [Thời gian tồn tại của một phiên WebRTC](/en-US/docs/Web/API/WebRTC_API/Session_lifetime)
- [Báo hiệu và gọi video](/en-US/docs/Web/API/WebRTC_API/Signaling_and_video_calling)
