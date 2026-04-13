---
title: RTCRtpReceiver
slug: Web/API/RTCRtpReceiver
page-type: web-api-interface
browser-compat: api.RTCRtpReceiver
---

{{APIRef("WebRTC")}}

Giao diện **`RTCRtpReceiver`** của [WebRTC API](/en-US/docs/Web/API/WebRTC_API) quản lý việc nhận và giải mã dữ liệu cho một {{domxref("MediaStreamTrack")}} trên một {{domxref("RTCPeerConnection")}}.

## Thuộc tính thể hiện

- {{domxref("RTCRtpReceiver.jitterBufferTarget")}}
  - : Một {{domxref("DOMHighResTimeStamp")}} cho biết thời gian giữ ưu tiên của ứng dụng đối với phương tiện trong bộ đệm jitter, giúp nó ảnh hưởng đến sự đánh đổi giữa độ trễ phát và nguy cơ hết khung âm thanh hoặc video do jitter mạng.
- {{domxref("RTCRtpReceiver.track")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("MediaStreamTrack")}} được liên kết với thể hiện `RTCRtpReceiver` hiện tại.
- {{domxref("RTCRtpReceiver.transport")}} {{ReadOnlyInline}}
  - : Trả về thể hiện {{domxref("RTCDtlsTransport")}} mà phương tiện của track của bộ nhận được nhận qua đó.
- {{domxref("RTCRtpReceiver.transform")}}
  - : Một {{domxref("RTCRtpScriptTransform")}} được dùng để chèn một luồng biến đổi ({{domxref("TransformStream")}}) chạy trong một worker thread vào pipeline của bộ nhận, cho phép áp dụng biến đổi luồng lên các khung mã hóa video và âm thanh đi vào.

### Thuộc tính cũ

- `rtcpTransport` {{deprecated_inline}}
  - : Thuộc tính này đã bị loại bỏ; các transport RTP và RTCP đã được gộp thành một transport duy nhất. Hãy dùng thuộc tính {{domxref("RTCRtpReceiver.transport", "transport")}} thay thế.

## Phương thức tĩnh

- {{domxref("RTCRtpReceiver.getCapabilities_static", "RTCRtpReceiver.getCapabilities()")}}
  - : Trả về chế độ xem lạc quan nhất về năng lực của hệ thống để nhận loại phương tiện đã cho.

## Phương thức thể hiện

- {{domxref("RTCRtpReceiver.getContributingSources()")}}
  - : Trả về một mảng chứa một đối tượng cho mỗi định danh CSRC (contributing source) duy nhất được `RTCRtpReceiver` hiện tại nhận trong mười giây gần nhất.
- {{domxref("RTCRtpReceiver.getParameters()")}}
  - : Trả về một đối tượng chứa thông tin về cách dữ liệu RTC được giải mã.
- {{domxref("RTCRtpReceiver.getStats()")}}
  - : Trả về một {{jsxref("Promise")}} mà hàm xử lý fulfillment nhận một {{domxref("RTCStatsReport")}} chứa thống kê về các luồng đầu vào.
- {{domxref("RTCRtpReceiver.getSynchronizationSources()")}}
  - : Trả về một mảng chứa một đối tượng cho mỗi định danh SSRC (synchronization source) duy nhất được `RTCRtpReceiver` hiện tại nhận trong mười giây gần nhất.

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}
