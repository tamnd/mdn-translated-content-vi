---
title: AudioDecoder
slug: Web/API/AudioDecoder
page-type: web-api-interface
browser-compat: api.AudioDecoder
---

{{securecontext_header}}{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Giao diện **`AudioDecoder`** của {{domxref('WebCodecs API','','',' ')}} giải mã các đoạn âm thanh.

{{InheritanceDiagram}}

## Bộ dựng

- {{domxref("AudioDecoder.AudioDecoder", "AudioDecoder()")}}
  - : Tạo một đối tượng `AudioDecoder` mới.

## Thuộc tính thể hiện

_Kế thừa các thuộc tính từ đối tượng cha là {{DOMxRef("EventTarget")}}._

- {{domxref("AudioDecoder.decodeQueueSize")}} {{ReadOnlyInline}}
  - : Một số nguyên biểu diễn số lượng yêu cầu giải mã trong hàng đợi.
- {{domxref("AudioDecoder.state")}} {{ReadOnlyInline}}
  - : Biểu diễn trạng thái của codec nền tảng và liệu nó đã được cấu hình để giải mã hay chưa.

### Sự kiện

- {{domxref("AudioDecoder.dequeue_event", "dequeue")}}
  - : Kích hoạt để báo hiệu {{domxref("AudioDecoder.decodeQueueSize")}} đã giảm.

## Phương thức tĩnh

- {{domxref("AudioDecoder/isConfigSupported_static", "AudioDecoder.isConfigSupported()")}}
  - : Trả về một promise cho biết cấu hình `AudioDecoderConfig` được cung cấp có được hỗ trợ hay không.

## Phương thức thể hiện

_Kế thừa các phương thức từ đối tượng cha là {{DOMxRef("EventTarget")}}._

- {{domxref("AudioDecoder.configure()")}}
  - : Đưa một thông điệp điều khiển vào hàng đợi để cấu hình bộ giải mã âm thanh nhằm giải mã các đoạn dữ liệu.
- {{domxref("AudioDecoder.decode()")}}
  - : Đưa một thông điệp điều khiển vào hàng đợi để giải mã một đoạn âm thanh được cung cấp.
- {{domxref("AudioDecoder.flush()")}}
  - : Trả về một promise được hoàn tất khi mọi thông điệp đang chờ trong hàng đợi đã hoàn tất.
- {{domxref("AudioDecoder.reset()")}}
  - : Đặt lại mọi trạng thái, bao gồm cấu hình, các thông điệp điều khiển trong hàng đợi thông điệp điều khiển và mọi callback đang chờ.
- {{domxref("AudioDecoder.close()")}}
  - : Kết thúc mọi tác vụ đang chờ và giải phóng tài nguyên hệ thống.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
