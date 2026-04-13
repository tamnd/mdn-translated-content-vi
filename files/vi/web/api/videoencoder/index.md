---
title: VideoEncoder
slug: Web/API/VideoEncoder
page-type: web-api-interface
browser-compat: api.VideoEncoder
---

{{APIRef("WebCodecs API")}}{{SecureContext_Header}}{{AvailableInWorkers("window_and_dedicated")}}

Giao diện **`VideoEncoder`** của {{domxref('WebCodecs API', '', '', 1)}} mã hóa các đối tượng {{domxref("VideoFrame")}} thành {{domxref("EncodedVideoChunk")}}.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("VideoEncoder.VideoEncoder", "VideoEncoder()")}}
  - : Tạo một đối tượng `VideoEncoder` mới.

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ lớp cha {{DOMxRef("EventTarget")}}._

- {{domxref("VideoEncoder.encodeQueueSize")}} {{ReadOnlyInline}}
  - : Một số nguyên biểu thị số lượng yêu cầu trong hàng đợi mã hóa.
- {{domxref("VideoEncoder.state")}} {{ReadOnlyInline}}
  - : Biểu thị trạng thái của codec bên dưới và liệu nó có được cấu hình để mã hóa hay không.

### Sự kiện

- {{domxref("VideoEncoder.dequeue_event", "dequeue")}}
  - : Kích hoạt để báo hiệu sự giảm xuống của {{domxref("VideoEncoder.encodeQueueSize")}}.

## Phương thức tĩnh

- {{domxref("VideoEncoder.isConfigSupported_static", "VideoEncoder.isConfigSupported()")}}
  - : Trả về một promise cho biết liệu `VideoEncoderConfig` được cung cấp có được hỗ trợ hay không.

## Phương thức phiên bản

_Kế thừa các phương thức từ lớp cha {{DOMxRef("EventTarget")}}._

- {{domxref("VideoEncoder.configure()")}}
  - : Chuẩn bị bất đồng bộ bộ mã hóa để chấp nhận các khung video để mã hóa với các tham số đã chỉ định.
- {{domxref("VideoEncoder.encode()")}}
  - : Mã hóa bất đồng bộ một {{domxref("VideoFrame")}}.
- {{domxref("VideoEncoder.flush()")}}
  - : Trả về một promise giải quyết sau khi tất cả các lần mã hóa đang chờ đã hoàn thành.
- {{domxref("VideoEncoder.reset()")}}
  - : Hủy tất cả các lần mã hóa và callback đang chờ.
- {{domxref("VideoEncoder.close()")}}
  - : Kết thúc tất cả công việc đang chờ và giải phóng tài nguyên hệ thống.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

[Xử lý video với WebCodecs](https://developer.chrome.com/docs/web-platform/best-practices/webcodecs)
