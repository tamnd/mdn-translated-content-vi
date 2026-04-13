---
title: VideoDecoder
slug: Web/API/VideoDecoder
page-type: web-api-interface
browser-compat: api.VideoDecoder
---

{{securecontext_header}}{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Giao diện **`VideoDecoder`** của {{domxref('WebCodecs API','','','true')}} giải mã các đoạn video.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("VideoDecoder.VideoDecoder", "VideoDecoder()")}}
  - : Tạo một đối tượng `VideoDecoder` mới.

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ lớp cha {{DOMxRef("EventTarget")}}._

- {{domxref("VideoDecoder.decodeQueueSize")}} {{ReadOnlyInline}}
  - : Một số nguyên biểu thị số lượng yêu cầu giải mã đang chờ trong hàng đợi.
- {{domxref("VideoDecoder.state")}} {{ReadOnlyInline}}
  - : Cho biết trạng thái hiện tại của bộ giải mã. Các giá trị có thể là:
    - `"unconfigured"`
    - `"configured"`
    - `"closed"`

### Sự kiện

- {{domxref("VideoDecoder.dequeue_event", "dequeue")}}
  - : Kích hoạt để báo hiệu sự giảm xuống của {{domxref("VideoDecoder.decodeQueueSize")}}.

## Phương thức tĩnh

- {{domxref("VideoDecoder.isConfigSupported_static", "VideoDecoder.isConfigSupported()")}}
  - : Trả về một promise cho biết liệu `VideoDecoderConfig` được cung cấp có được hỗ trợ hay không.

## Phương thức phiên bản

_Kế thừa các phương thức từ lớp cha {{DOMxRef("EventTarget")}}._

- {{domxref("VideoDecoder.configure()")}}
  - : Thêm một thông điệp điều khiển vào hàng đợi để cấu hình bộ giải mã video cho việc giải mã các đoạn.
- {{domxref("VideoDecoder.decode()")}}
  - : Thêm một thông điệp điều khiển vào hàng đợi để giải mã một đoạn video nhất định.
- {{domxref("VideoDecoder.flush()")}}
  - : Trả về một promise được giải quyết khi tất cả các thông điệp đang chờ trong hàng đợi đã hoàn thành.
- {{domxref("VideoDecoder.reset()")}}
  - : Đặt lại tất cả các trạng thái bao gồm cấu hình, thông điệp điều khiển trong hàng đợi và tất cả các callback đang chờ.
- {{domxref("VideoDecoder.close()")}}
  - : Kết thúc tất cả công việc đang chờ và giải phóng tài nguyên hệ thống.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Video processing with WebCodecs](https://developer.chrome.com/docs/web-platform/best-practices/webcodecs)
- [WebCodecs API Samples](https://w3c.github.io/webcodecs/samples/)
