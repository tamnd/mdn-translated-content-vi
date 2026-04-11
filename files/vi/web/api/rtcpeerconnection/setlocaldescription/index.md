---
title: "RTCPeerConnection: phương thức setLocalDescription()"
short-title: setLocalDescription()
slug: Web/API/RTCPeerConnection/setLocalDescription
page-type: web-api-instance-method
browser-compat: api.RTCPeerConnection.setLocalDescription
---

{{APIRef("WebRTC")}}

Phương thức **`setLocalDescription()`** của giao diện {{domxref("RTCPeerConnection")}} thay đổi mô tả cục bộ gắn với kết nối.
Mô tả này chỉ định các thuộc tính của đầu cục bộ của kết nối, bao gồm định dạng media.
Phương thức nhận một tham số duy nhất - mô tả phiên - và trả về một {{jsxref("Promise")}} được thực thi khi mô tả đã được thay đổi, theo cách bất đồng bộ.

Nếu `setLocalDescription()` được gọi khi kết nối đã được thiết lập, điều đó có nghĩa là việc thương lượng lại đang diễn ra (có thể để thích ứng với điều kiện mạng thay đổi).
Vì các mô tả sẽ được trao đổi cho đến khi hai máy ngang hàng đồng ý về một cấu hình, mô tả được gửi bằng `setLocalDescription()` không có hiệu lực ngay lập tức.
Thay vào đó, cấu hình kết nối hiện tại vẫn được giữ nguyên cho đến khi thương lượng hoàn tất. Chỉ khi đó cấu hình đã đồng thuận mới có hiệu lực.

## Cú pháp

```js-nolint
setLocalDescription()
setLocalDescription(sessionDescription)

setLocalDescription(sessionDescription, successCallback, errorCallback) // deprecated
```

### Tham số

- `sessionDescription` {{optional_inline}}
  - : Một đối tượng chỉ định cấu hình sẽ được áp dụng cho đầu cục bộ của kết nối. Nó nên chứa các thuộc tính sau:
    - `type` {{optional_inline}}
      - : Chuỗi cho biết loại của mô tả phiên. Nếu bạn không cung cấp rõ một mô tả phiên, môi trường chạy WebRTC sẽ cố gắng xử lý đúng cách. Nếu trạng thái báo hiệu là `stable`, `have-local-offer` hoặc `have-remote-pranswer`, môi trường chạy WebRTC sẽ tự động tạo một offer mới và đặt nó làm mô tả cục bộ mới. Ngược lại, `setLocalDescription()` sẽ tạo một answer, và answer đó sẽ trở thành mô tả cục bộ mới.
    - `sdp` {{optional_inline}}
      - : Chuỗi chứa SDP mô tả phiên. Nếu không cung cấp sdp, giá trị mặc định là chuỗi rỗng. Nếu `type` là `"rollback"`, `sdp` phải là `null` hoặc chuỗi rỗng.

    Nếu mô tả bị bỏ qua, môi trường chạy WebRTC sẽ cố tự làm điều đúng.

    Bạn cũng có thể truyền một thể hiện {{domxref("RTCSessionDescription")}} thực sự, nhưng không có khác biệt nào. Vì lý do này, hàm tạo `RTCSessionDescription` đã bị loại bỏ.

Trong mã và tài liệu cũ, bạn có thể thấy một phiên bản dựa trên callback của hàm này.
Cách này đã bị loại bỏ và **rất không nên** dùng, vì nó sẽ bị xóa trong tương lai.
Bạn nên cập nhật mọi mã hiện có để dùng phiên bản dựa trên {{jsxref("Promise")}} của `setLocalDescription()` thay thế.
Các tham số của dạng cũ được mô tả dưới đây để hỗ trợ cập nhật mã hiện có.

- `successCallback` {{deprecated_inline}}
  - : Một {{jsxref("Function")}} của JavaScript không nhận tham số đầu vào, được gọi sau khi mô tả đã được đặt thành công.
    Lúc đó, offer có thể được gửi tới máy ngang hàng từ xa qua máy chủ báo hiệu.
- `errorCallback` {{deprecated_inline}}
  - : Hàm khớp với chữ ký `RTCPeerConnectionErrorCallback`, được gọi nếu mô tả không thể được đặt.
    Nó nhận một đối tượng {{domxref("DOMException")}} duy nhất giải thích lý do yêu cầu thất bại.

Phiên bản lỗi thời này của phương thức trả về ngay lập tức mà không đợi việc đặt thực sự hoàn tất: nếu thành công, `successCallback` sẽ được gọi; nếu thất bại, `errorCallback` sẽ được gọi.

### Giá trị trả về

Một {{jsxref("Promise")}} được thực thi khi giá trị của {{domxref("RTCPeerConnection.localDescription")}} được thay đổi thành công hoặc bị từ chối nếu thay đổi không thể áp dụng (ví dụ, nếu mô tả được chỉ định không tương thích với một hoặc cả hai máy ngang hàng trong kết nối).
Handler khi promise được thực thi không nhận tham số đầu vào.

> [!NOTE]
> Quá trình thay đổi mô tả thực sự bao gồm các bước trung gian do lớp WebRTC xử lý để bảo đảm một kết nối đang hoạt động có thể được thay đổi mà không mất kết nối nếu thay đổi không thành công.
> Xem [Mô tả đang chờ xử lý và mô tả hiện tại](/en-US/docs/Web/API/WebRTC_API/Connectivity#pending_and_current_descriptions) trong trang WebRTC Connectivity để biết thêm chi tiết về quá trình này.

### Ngoại lệ lỗi thời

Khi dùng phiên bản dựa trên callback đã lỗi thời của `setLocalDescription()`, có thể xảy ra các ngoại lệ sau:

- `InvalidStateError` {{domxref("DOMException")}} {{deprecated_inline}}
  - : Ném ra nếu {{domxref("RTCPeerConnection.signalingState", "signalingState")}} của kết nối là `"closed"`, cho biết kết nối hiện không mở nên không thể thương lượng.
- `InvalidSessionDescriptionError` {{domxref("DOMException")}} {{deprecated_inline}}
  - : Ném ra nếu tham số `sessionDescription` không hợp lệ.

## Ví dụ

### Mô tả ngầm định

Một trong những lợi thế của dạng `setLocalDescription()` không có tham số là nó cho phép bạn đơn giản hóa đáng kể mã thương lượng.
Đây gần như chỉ là những gì trình xử lý sự kiện {{domxref("RTCPeerConnection.negotiationneeded_event", "negotiationneeded")}} của bạn cần trông như thế nào.
Chỉ cần thêm mã máy chủ báo hiệu, ở đây được biểu diễn bằng lời gọi `signalRemotePeer()`.

```js
pc.addEventListener("negotiationneeded", async (event) => {
  await pc.setLocalDescription();
  signalRemotePeer({ description: pc.localDescription });
});
```

Ngoài xử lý lỗi ra thì gần như chỉ có vậy!

### Cung cấp offer hoặc answer của riêng bạn

Ví dụ dưới đây cho thấy việc triển khai trình xử lý cho sự kiện {{DOMxRef("RTCPeerConnection/negotiationneeded_event", "negotiationneeded")}} tạo offer một cách rõ ràng, thay vì để `setLocalDescription()` tự làm việc đó.

```js
async function handleNegotiationNeededEvent() {
  try {
    const offer = await pc.createOffer();
    pc.setLocalDescription(offer);
    signalRemotePeer({ description: pc.localDescription });
  } catch (err) {
    window.reportError(err);
  }
}
```

Đoạn này bắt đầu bằng việc tạo một offer bằng cách gọi {{domxref("RTCPeerConnection.createOffer()", "createOffer()")}}; khi thành công, chúng ta gọi `setLocalDescription()`.
Sau đó, chúng ta có thể gửi offer vừa tạo tới máy ngang hàng còn lại bằng máy chủ báo hiệu, ở đây được thực hiện bằng cách gọi hàm `signalRemotePeer()`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC API](/en-US/docs/Web/API/WebRTC_API)
- {{domxref("RTCSessionDescription")}}
