---
title: RTCRtpSender
slug: Web/API/RTCRtpSender
page-type: web-api-interface
browser-compat: api.RTCRtpSender
---

{{APIRef("WebRTC")}}

Giao diện **`RTCRtpSender`** cung cấp khả năng kiểm soát và thu thập thông tin chi tiết về cách một {{domxref("MediaStreamTrack")}} cụ thể được mã hóa và gửi đến một peer từ xa.

Với nó, bạn có thể cấu hình mã hóa được sử dụng cho track tương ứng, thu thập thông tin về khả năng media của thiết bị, v.v. Bạn cũng có thể truy cập vào một {{domxref("RTCDTMFSender")}} để gửi các mã {{Glossary("DTMF")}} (mô phỏng việc người dùng nhấn các nút trên bàn quay điện thoại) đến peer từ xa.

## Thuộc tính instance

- {{domxref("RTCRtpSender.dtmf")}} {{ReadOnlyInline}}
  - : Một {{domxref("RTCDTMFSender")}} có thể được sử dụng để gửi các âm {{Glossary("DTMF")}} sử dụng payload `telephone-event` trên phiên {{Glossary("RTP")}} được đại diện bởi đối tượng `RTCRtpSender`. Nếu là `null`, track và/hoặc kết nối không hỗ trợ DTMF. Chỉ các track âm thanh mới hỗ trợ DTMF.
- {{domxref("RTCRtpSender.track")}} {{ReadOnlyInline}}
  - : {{domxref("MediaStreamTrack")}} đang được xử lý bởi `RTCRtpSender`. Nếu `track` là `null`, `RTCRtpSender` không truyền tải gì cả.
- {{domxref("RTCRtpSender.transport")}} {{ReadOnlyInline}}
  - : {{domxref("RTCDtlsTransport")}} mà qua đó sender đang trao đổi các gói RTP và RTCP được sử dụng để quản lý việc truyền tải dữ liệu media và điều khiển. Giá trị này là `null` cho đến khi transport được thiết lập. Khi bundling đang được sử dụng, nhiều transceiver có thể chia sẻ cùng một đối tượng transport.
- {{domxref("RTCRtpSender.transform")}}
  - : Một {{domxref("RTCRtpScriptTransform")}}<!-- hoặc {{domxref("SFrameTransform")}} --> được sử dụng để chèn một transform stream ({{domxref("TransformStream")}}) chạy trong một worker thread vào pipeline của sender, cho phép áp dụng các biến đổi stream cho các khung video và âm thanh đã mã hóa sau khi chúng được xuất ra bởi codec và trước khi chúng được gửi đi.

### Thuộc tính lỗi thời

- `rtcpTransport` {{deprecated_inline}}
  - : Thuộc tính này đã bị loại bỏ; các transport RTP và RTCP đã được kết hợp thành một transport duy nhất. Sử dụng thuộc tính {{domxref("RTCRtpSender.transport", "transport")}} thay thế.

## Phương thức static

- {{domxref("RTCRtpSender.getCapabilities_static", "RTCRtpSender.getCapabilities()")}}
  - : Trả về một đối tượng mô tả khả năng của hệ thống để gửi một loại dữ liệu media cụ thể.

## Phương thức instance

- {{domxref("RTCRtpSender.getParameters()")}}
  - : Trả về một đối tượng mô tả cấu hình hiện tại cho việc mã hóa và truyền tải media trên `track`.
- {{domxref("RTCRtpSender.getStats()")}}
  - : Trả về một {{jsxref("Promise")}} được fulfilled với một {{domxref("RTCStatsReport")}} cung cấp dữ liệu thống kê cho tất cả các luồng outbound đang được gửi bằng cách sử dụng `RTCRtpSender` này.
- {{domxref("RTCRtpSender.setParameters()")}}
  - : Áp dụng các thay đổi cho các tham số cấu hình cách `track` được mã hóa và truyền tải đến peer từ xa.
- {{domxref("RTCRtpSender.setStreams()")}}
  - : Thiết lập {{domxref("MediaStream", "(các) luồng", "", 1)}} được liên kết với {{domxref("RTCRtpSender.track", "track")}} đang được truyền tải bởi sender này.
- {{domxref("RTCRtpSender.replaceTrack()")}}
  - : Cố gắng thay thế track hiện đang được gửi bởi `RTCRtpSender` bằng một track khác mà không cần đàm phán lại. Phương thức này có thể được sử dụng, ví dụ, để chuyển đổi giữa camera trước và sau trên một thiết bị.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- API WebRTC
- {{domxref("RTCPeerConnection.addTrack()")}}
- {{domxref("RTCPeerConnection.getSenders()")}}
- {{domxref("RTCRtpReceiver")}}
