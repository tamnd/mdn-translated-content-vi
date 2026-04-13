---
title: "RTCPeerConnection: thuộc tính peerIdentity"
short-title: peerIdentity
slug: Web/API/RTCPeerConnection/peerIdentity
page-type: web-api-instance-property
browser-compat: api.RTCPeerConnection.peerIdentity
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`peerIdentity`** của giao diện {{domxref("RTCPeerConnection")}} trả về một {{jsxref("Promise")}} của JavaScript, được giải quyết thành một {{domxref("RTCIdentityAssertion")}} chứa một chuỗi định danh máy ngang hàng từ xa.
Khi promise này được giải quyết thành công, danh tính thu được sẽ là **danh tính máy ngang hàng đích** và không thể thay đổi trong suốt thời gian kết nối.

## Giá trị

Một {{jsxref("Promise")}} của JavaScript được giải quyết thành một {{domxref("RTCIdentityAssertion")}} mô tả danh tính của máy ngang hàng từ xa.

Nếu xảy ra lỗi khi cố gắng xác thực một chứng thực danh tính đến (tức là thông tin mô tả danh tính của một máy ngang hàng), promise sẽ bị từ chối.
Nếu chưa có danh tính máy ngang hàng đích, `peerIdentity` sẽ được đặt thành một promise mới được tạo và quá trình sẽ bắt đầu lại, cho đến khi quá trình thành công hoặc không còn nỗ lực xác thực nào nữa.

> [!NOTE]
> Promise được trả về bởi {{domxref("RTCPeerConnection.setRemoteDescription", "setRemoteDescription()")}} không thể được giải quyết cho tới khi mọi danh tính máy ngang hàng đích đã được đặt đều được xác thực.
> Nếu danh tính chưa được xác thực, promise do `setRemoteDescription()` trả về sẽ bị từ chối.
> Nếu không có danh tính máy ngang hàng đích, `setRemoteDescription()` không cần đợi việc xác thực xảy ra trước khi được giải quyết.

## Ví dụ

Trong ví dụ này, một hàm `getIdentityAssertion()` được tạo để chờ bất đồng bộ cho tới khi danh tính của máy ngang hàng được xác minh, rồi trả về danh tính cho bên gọi.
Nếu xảy ra lỗi và promise bị từ chối, mã sẽ ghi lỗi ra console và trả về `null` cho bên gọi.

```js
let pc = new RTCPeerConnection();

// …

async function getIdentityAssertion(pc) {
  try {
    const identity = await pc.peerIdentity;
    return identity;
  } catch (err) {
    console.log("Error identifying remote peer: ", err);
    return null;
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC API](/en-US/docs/Web/API/WebRTC_API)
