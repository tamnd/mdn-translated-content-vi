---
title: "RTCDTMFSender: insertDTMF() method"
short-title: insertDTMF()
slug: Web/API/RTCDTMFSender/insertDTMF
page-type: web-api-instance-method
browser-compat: api.RTCDTMFSender.insertDTMF
---

{{APIRef("WebRTC")}}

Phương thức **`insertDTMF()`** của giao diện {{domxref("RTCDTMFSender")}} gửi âm thanh {{Glossary("DTMF")}} đến peer từ xa qua {{domxref("RTCPeerConnection")}}.

Các âm thanh được gửi bất đồng bộ. Mỗi khi một âm thanh bắt đầu hoặc kết thúc, một sự kiện [`tonechange`](/en-US/docs/Web/API/RTCDTMFSender/tonechange_event) được gửi đến `RTCDTMFSender`.

Bạn có thể gọi `insertDTMF()` bất cứ lúc nào khi kết nối đang hoạt động. Mỗi lần gọi `insertDTMF()` thay thế bất kỳ âm thanh nào đang chờ trong `toneBuffer`. Bạn có thể hủy bỏ việc gửi các âm thanh trong hàng đợi bằng cách chỉ định một chuỗi rỗng (`""`) là tập hợp các âm thanh cần phát. Vì `insertDTMF()` thay thế buffer âm thanh, để thêm vào các âm thanh DTMF đang được phát, cần gọi `insertDTMF()` với một chuỗi chứa cả các âm thanh còn lại (được lưu trong `toneBuffer`) và các âm thanh mới được nối thêm với nhau.

## Cú pháp

```js-nolint
insertDTMF(tones)
insertDTMF(tones, duration)
insertDTMF(tones, duration, interToneGap)
```

### Tham số

- `tones`
  - : Một chuỗi chứa các mã DTMF được truyền đến người nhận. Chỉ định một chuỗi rỗng là tham số `tones` sẽ xóa buffer âm thanh, hủy bỏ bất kỳ âm thanh nào đang trong hàng đợi. Ký tự dấu phẩy `,` trong chuỗi chèn một khoảng dừng 2 giây. Ví dụ `"12,34"` sẽ gửi âm thanh cho `1` và `2`, tạm dừng hai giây, rồi gửi `3` và `4`. Nhiều dấu phẩy thêm khoảng dừng dài hơn, vì vậy `,,` sẽ thêm bốn giây.
- `duration` {{optional_inline}}
  - : Lượng thời gian, tính bằng mili giây, mỗi âm thanh DTMF nên kéo dài. Giá trị này phải từ 40 ms đến 6000 ms (6 giây), bao gồm. Mặc định là 100 ms.
- `interToneGap` {{optional_inline}}
  - : Khoảng thời gian, tính bằng mili giây, chờ giữa các âm thanh. Trình duyệt sẽ thực thi giá trị tối thiểu là 30 ms (tức là nếu bạn chỉ định giá trị thấp hơn, 30 ms sẽ được sử dụng thay thế). Mặc định là 70 ms.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu không thể gửi âm thanh DTMF vì track đã bị dừng hoặc ở trạng thái chỉ đọc hoặc không hoạt động.
- `InvalidCharacterError` {{domxref("DOMException")}}
  - : Được ném ra nếu một hoặc nhiều ký tự trong `tones` không phải là ký tự DTMF hợp lệ (`0-9`, `A-Z`, `#`, hoặc `,`).

## Ví dụ

### Sử dụng insertDTMF để gửi âm thanh DTMF

Ví dụ này cho thấy cách sử dụng phương thức `insertDTMF()` để gửi âm thanh qua kết nối WebRTC.

Mã đầu tiên kiểm tra xem thuộc tính `canInsertDTMF` có được định nghĩa hay không, và nếu có, sử dụng nó để kiểm tra xem việc chèn âm thanh DTMF có được hỗ trợ không. Nếu tính năng được hỗ trợ, `insertDTMF()` được gọi để chèn một âm thanh.

```js
if (sender.dtmf.canInsertDTMF) {
  const duration = 500;
  sender.dtmf.insertDTMF("1234", duration);
} else {
  console.log("DTMF function not available");
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC API](/en-US/docs/Web/API/WebRTC_API)
- [Using DTMF with WebRTC](/en-US/docs/Web/API/WebRTC_API/Using_DTMF)
- {{domxref("RTCPeerConnection")}}
- {{domxref("RTCDTMFSender")}}
- {{domxref("RTCRtpSender")}}
