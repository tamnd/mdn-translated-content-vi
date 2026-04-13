---
title: AudioEncoder
slug: Web/API/AudioEncoder
page-type: web-api-interface
browser-compat: api.AudioEncoder
---

{{APIRef("WebCodecs API")}}{{SecureContext_Header}}{{AvailableInWorkers("window_and_dedicated")}}

Giao diện **`AudioEncoder`** của [WebCodecs API](/en-US/docs/Web/API/WebCodecs_API) mã hóa các đối tượng {{domxref("AudioData")}}.

{{InheritanceDiagram}}

## Bộ khởi tạo

- {{domxref("AudioEncoder.AudioEncoder", "AudioEncoder()")}}
  - : Tạo một đối tượng `AudioEncoder` mới.

## Thuộc tính thể hiện

_Kế thừa các thuộc tính từ đối tượng cha {{DOMxRef("EventTarget")}}._

- {{domxref("AudioEncoder.encodeQueueSize")}} {{ReadOnlyInline}}
  - : Một số nguyên biểu diễn số lượng yêu cầu trong hàng đợi mã hóa.
- {{domxref("AudioEncoder.state")}} {{ReadOnlyInline}}
  - : Biểu diễn trạng thái của codec nền tảng và liệu nó đã được cấu hình để mã hóa hay chưa.

### Sự kiện

- {{domxref("AudioEncoder.dequeue_event", "dequeue")}}
  - : Phát ra để báo hiệu {{domxref("AudioEncoder.encodeQueueSize")}} đã giảm.

## Phương thức tĩnh

- {{domxref("AudioEncoder.isConfigSupported_static", "AudioEncoder.isConfigSupported()")}}
  - : Trả về một promise cho biết `AudioEncoderConfig` được cung cấp có được hỗ trợ hay không.

## Phương thức thể hiện

_Kế thừa các phương thức từ đối tượng cha {{DOMxRef("EventTarget")}}._

- {{domxref("AudioEncoder.configure()")}}
  - : Đưa một thông điệp điều khiển vào hàng đợi để cấu hình bộ mã hóa âm thanh cho việc mã hóa các chunk.
- {{domxref("AudioEncoder.encode()")}}
  - : Đưa một thông điệp điều khiển vào hàng đợi để mã hóa một đối tượng {{domxref("AudioData")}} được cung cấp.
- {{domxref("AudioEncoder.flush()")}}
  - : Trả về một promise được giải quyết khi mọi thông điệp đang chờ trong hàng đợi đã hoàn tất.
- {{domxref("AudioEncoder.reset()")}}
  - : Đặt lại mọi trạng thái, bao gồm cấu hình, các thông điệp điều khiển trong hàng đợi thông điệp điều khiển, và toàn bộ callback đang chờ.
- {{domxref("AudioEncoder.close()")}}
  - : Kết thúc toàn bộ công việc đang chờ và giải phóng tài nguyên hệ thống.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
