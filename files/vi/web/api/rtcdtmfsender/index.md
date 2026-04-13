---
title: RTCDTMFSender
slug: Web/API/RTCDTMFSender
page-type: web-api-interface
browser-compat: api.RTCDTMFSender
---

{{APIRef("WebRTC")}}

Giao diện **`RTCDTMFSender`** cung cấp cơ chế để truyền mã {{Glossary("DTMF")}} trên một {{domxref("RTCPeerConnection")}} [WebRTC](/en-US/docs/Web/API/WebRTC_API). Bạn có thể truy cập `RTCDTMFSender` của kết nối qua thuộc tính {{domxref("RTCRtpSender.dtmf")}} trên track âm thanh mà bạn muốn gửi DTMF.

Mục đích chính của hỗ trợ DTMF trong WebRTC là cho phép các máy khách giao tiếp dựa trên WebRTC kết nối với [mạng điện thoại chuyển mạch công cộng (PSTN)](https://en.wikipedia.org/wiki/Public_switched_telephone_network) hoặc các dịch vụ điện thoại kế thừa khác, bao gồm các dịch vụ voice over IP (VoIP) hiện có. Vì lý do đó, DTMF không thể được sử dụng giữa hai thiết bị dựa trên WebRTC, vì không có cơ chế nào được cung cấp bởi WebRTC để nhận mã DTMF.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("RTCDTMFSender.canInsertDTMF")}} {{ReadOnlyInline}}
  - : Một giá trị boolean là `true` nếu `RTCDTMFSender` có khả năng gửi âm thanh DTMF, hoặc `false` nếu không.

- {{domxref("RTCDTMFSender.toneBuffer")}} {{ReadOnlyInline}}
  - : Một chuỗi chứa danh sách các âm thanh DTMF hiện đang trong hàng đợi để truyền (các âm thanh đã phát không còn được bao gồm trong chuỗi). Xem {{domxref("RTCDTMFSender.toneBuffer", "toneBuffer")}} để biết thông tin về định dạng của buffer âm thanh.

## Phương thức phiên bản

- {{domxref("RTCDTMFSender.insertDTMF()")}}
  - : Cho một chuỗi mô tả một tập hợp mã DTMF và tùy chọn, thời lượng và khoảng cách giữa các âm thanh, `insertDTMF()` bắt đầu gửi các âm thanh được chỉ định. Gọi `insertDTMF()` sẽ thay thế bất kỳ âm thanh nào đang chờ từ `toneBuffer`. Bạn có thể hủy bỏ việc gửi các âm thanh trong hàng đợi bằng cách chỉ định một chuỗi rỗng (`""`) là tập hợp các âm thanh cần phát.

## Sự kiện

Lắng nghe các sự kiện này bằng {{domxref("EventTarget.addEventListener", "addEventListener()")}} hoặc bằng cách gán trình xử lý sự kiện cho thuộc tính `oneventname` của giao diện này.

- {{domxref("RTCDTMFSender.tonechange_event", "tonechange")}}
  - : Sự kiện `tonechange` được gửi đến trình xử lý sự kiện của phiên bản `RTCDTMFSender` để cho biết rằng một âm thanh đã bắt đầu hoặc dừng phát.

## Ví dụ

Xem bài viết [Using DTMF with WebRTC](/en-US/docs/Web/API/WebRTC_API/Using_DTMF) để có ví dụ đầy đủ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC API](/en-US/docs/Web/API/WebRTC_API)
- [Using DTMF with WebRTC](/en-US/docs/Web/API/WebRTC_API/Using_DTMF)
- {{domxref("RTCRtpSender.dtmf")}}
- {{domxref("RTCPeerConnection")}}
- {{domxref("RTCRtpSender")}}
