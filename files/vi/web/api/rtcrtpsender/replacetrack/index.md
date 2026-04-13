---
title: "Phương thức replaceTrack() của RTCRtpSender"
short-title: replaceTrack()
slug: Web/API/RTCRtpSender/replaceTrack
page-type: web-api-instance-method
browser-compat: api.RTCRtpSender.replaceTrack
---

{{APIRef("WebRTC")}}

Phương thức **`replaceTrack()`** của {{domxref("RTCRtpSender")}} thay thế track hiện đang được sử dụng làm nguồn của sender bằng một {{domxref("MediaStreamTrack")}} mới.

Track mới phải có cùng loại media (âm thanh, video, v.v.) và việc chuyển đổi track không được yêu cầu đàm phán.

Trong số các trường hợp sử dụng của `replaceTrack()` là nhu cầu phổ biến khi chuyển đổi giữa camera sau và trước trên điện thoại. Với `replaceTrack()`, bạn có thể có một đối tượng track cho mỗi camera và chuyển đổi giữa hai camera khi cần. Xem ví dụ [chuyển đổi camera video](#chuyen-doi-camera-video) dưới đây.

## Cú pháp

```js-nolint
replaceTrack(newTrack)
```

### Tham số

- `newTrack` {{optional_inline}}
  - : Một {{domxref("MediaStreamTrack")}} chỉ định track để thay thế track nguồn hiện tại của `RTCRtpSender`. {{domxref("MediaStreamTrack.kind", "kind")}} của track mới phải giống với track hiện tại, nếu không yêu cầu thay thế track sẽ thất bại.

### Giá trị trả về

Một {{jsxref("Promise")}} được fulfilled khi track đã được thay thế thành công. Promise bị rejected nếu track không thể được thay thế vì bất kỳ lý do nào; điều này thường là do thay đổi sẽ yêu cầu đàm phán lại codec, điều không được phép (xem [Những thứ yêu cầu đàm phán](#nhung-thu-yeu-cau-dam-phan)).

Nếu `newTrack` bị bỏ qua hoặc là `null`, `replaceTrack()` dừng sender. Trong trường hợp này không cần đàm phán.

Khi promise được fulfilled, trình xử lý fulfillment nhận được giá trị là `undefined`.

### Ngoại lệ

Nếu promise trả về bị rejected, một trong các ngoại lệ sau sẽ được cung cấp cho trình xử lý rejection:

- `InvalidModificationError` {{domxref("DOMException")}}
  - : Được trả về nếu việc thay thế track hiện tại của `RTCRtpSender` bằng track mới sẽ yêu cầu đàm phán.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được trả về nếu track mà phương thức này được gọi đang bị dừng thay vì đang chạy.
- {{jsxref("TypeError")}}
  - : Được trả về nếu `kind` của track mới không khớp với track gốc.

## Ghi chú sử dụng

### Những thứ yêu cầu đàm phán

Hầu hết việc thay thế track có thể được thực hiện mà không cần đàm phán lại. Trên thực tế, ngay cả những thay đổi có vẻ lớn cũng có thể được thực hiện mà không cần đàm phán. Tuy nhiên, một số thay đổi có thể yêu cầu đàm phán và do đó làm `replaceTrack()` thất bại:

- Track mới có độ phân giải nằm ngoài giới hạn của kích thước đã đàm phán với peer; tuy nhiên, hầu hết các endpoint của trình duyệt cho phép thay đổi độ phân giải.
- Frame rate của track mới đủ cao để vượt quá block rate của codec.
- Track mới là track video và trạng thái raw hoặc pre-encoded khác với track gốc.
- Track mới là track âm thanh với số kênh khác với track gốc.
- Các nguồn media có bộ mã hóa tích hợp — chẳng hạn như bộ mã hóa phần cứng — có thể không thể cung cấp codec đã đàm phán. Các nguồn phần mềm có thể không triển khai codec đã đàm phán.

## Ví dụ

### Chuyển đổi camera video

```js
const localConnection = new RTCPeerConnection();
const remoteConnection = new RTCPeerConnection();
// Cấu hình những kết nối này để sử dụng API WebRTC có thể được khám phá tại
// https://developer.mozilla.org/en-US/docs/Web/API/WebRTC_API/Simple_RTCDataChannel_sample
const connections = [localConnection, remoteConnection];
function setCamera(selectedCamera) {
  navigator.mediaDevices
    .getUserMedia({
      video: {
        deviceId: {
          exact: selectedCamera,
        },
      },
    })
    .then((stream) => {
      const [videoTrack] = stream.getVideoTracks();
      connections.forEach((pc) => {
        const sender = pc
          .getSenders()
          .find((s) => s.track.kind === videoTrack.kind);
        console.log("Found sender:", sender);
        sender.replaceTrack(videoTrack);
      });
    })
    .catch((err) => {
      console.error(`Error happened: ${err}`);
    });
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [API WebRTC](/en-US/docs/Web/API/WebRTC_API)
