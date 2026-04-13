---
title: "RTCPeerConnection: thuộc tính canTrickleIceCandidates"
short-title: canTrickleIceCandidates
slug: Web/API/RTCPeerConnection/canTrickleIceCandidates
page-type: web-api-instance-property
browser-compat: api.RTCPeerConnection.canTrickleIceCandidates
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`canTrickleIceCandidates`** của giao diện {{domxref("RTCPeerConnection")}} trả về một giá trị boolean cho biết máy ngang hàng từ xa có thể chấp nhận [ICE candidate được gửi dần](https://datatracker.ietf.org/doc/html/draft-ietf-mmusic-trickle-ice) hay không.

**ICE trickling** là quá trình tiếp tục gửi candidate sau khi offer hoặc answer ban đầu đã được gửi cho máy ngang hàng còn lại.

Thuộc tính này chỉ được đặt sau khi gọi {{domxref("RTCPeerConnection.setRemoteDescription()")}}.
Lý tưởng nhất là giao thức báo hiệu của bạn cung cấp cách phát hiện hỗ trợ trickling, để bạn không phải phụ thuộc vào thuộc tính này.
Trình duyệt WebRTC luôn hỗ trợ trickle ICE.
Nếu trickling không được hỗ trợ, hoặc bạn không thể xác định được, bạn có thể kiểm tra một giá trị false của thuộc tính này rồi chờ đến khi giá trị của {{domxref("RTCPeerConnection.iceGatheringState", "iceGatheringState")}} đổi thành `"completed"` trước khi tạo và gửi offer ban đầu.
Theo cách đó, offer sẽ chứa tất cả candidate.

## Giá trị

Một giá trị boolean là `true` nếu máy ngang hàng từ xa có thể chấp nhận các ICE candidate được gửi dần, và `false` nếu không thể.
Nếu chưa thiết lập máy ngang hàng từ xa nào, giá trị này là `null`.

> [!NOTE]
> Giá trị của thuộc tính này được xác định sau khi máy ngang hàng cục bộ gọi {{domxref("RTCPeerConnection.setRemoteDescription()")}};
> mô tả được cung cấp sẽ được bộ máy ICE dùng để xác định xem máy ngang hàng từ xa có hỗ trợ ICE candidate được gửi dần hay không.

## Ví dụ

```js
const pc = new RTCPeerConnection();

function waitToCompleteIceGathering(pc) {
  return new Promise((resolve) => {
    pc.addEventListener(
      "icegatheringstatechange",
      (e) =>
        e.target.iceGatheringState === "complete" &&
        resolve(pc.localDescription),
    );
  });
}

// Mã sau có thể được dùng để xử lý một offer từ một máy ngang hàng khi
// chưa biết nó có hỗ trợ trickle ICE hay không.
async function newPeer(remoteOffer) {
  await pc.setRemoteDescription(remoteOffer);
  const offer = await pc.createOffer();
  await pc.setLocalDescription(offer);
  if (pc.canTrickleIceCandidates) return pc.localDescription;
  const answer = await waitToCompleteIceGathering(pc);
  sendAnswerToPeer(answer); // Gửi tới máy ngang hàng qua kênh báo hiệu
}
// Xử lý lỗi bằng try/catch

pc.addEventListener(
  "icecandidate",
  (e) => pc.canTrickleIceCandidates && sendCandidateToPeer(e.candidate),
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
- {{domxref("RTCPeerConnection.addIceCandidate()")}}
- [Thời gian tồn tại của một phiên WebRTC](/en-US/docs/Web/API/WebRTC_API/Session_lifetime)
