---
title: MediaCapabilities
slug: Web/API/MediaCapabilities
page-type: web-api-interface
browser-compat: api.MediaCapabilities
---

{{APIRef("Media Capabilities API")}}{{AvailableInWorkers}}

Giao diện **`MediaCapabilities`** của [Media Capabilities API](/en-US/docs/Web/API/Media_Capabilities_API) cung cấp thông tin về khả năng giải mã của thiết bị, hệ thống và trình duyệt. API có thể được sử dụng để truy vấn trình duyệt về khả năng giải mã của thiết bị dựa trên codec, cấu hình, độ phân giải và tốc độ bit. Thông tin có thể được sử dụng để phục vụ các luồng phương tiện tối ưu cho người dùng và xác định xem việc phát lại có mượt mà và tiết kiệm điện hay không.

Thông tin được truy cập thông qua thuộc tính **`mediaCapabilities`** của giao diện {{domxref("Navigator")}} và {{domxref("WorkerNavigator")}}.

## Phương thức phiên bản

- {{domxref("MediaCapabilities.encodingInfo()")}}
  - : Khi được truyền một cấu hình phương tiện hợp lệ, nó trả về một promise với thông tin về việc loại phương tiện có được hỗ trợ hay không, và liệu việc mã hóa phương tiện như vậy có mượt mà và tiết kiệm điện hay không.
- {{domxref("MediaCapabilities.decodingInfo()")}}
  - : Khi được truyền một cấu hình phương tiện hợp lệ, nó trả về một promise với thông tin về việc loại phương tiện có được hỗ trợ hay không, và liệu việc giải mã phương tiện như vậy có mượt mà và tiết kiệm điện hay không.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phương thức [canPlayType()](/en-US/docs/Web/API/HTMLMediaElement/canPlayType) của [HTMLMediaElement](/en-US/docs/Web/API/HTMLMediaElement)
- Phương thức [isTypeSupported()](/en-US/docs/Web/API/MediaSource/isTypeSupported_static) của [MediaSource](/en-US/docs/Web/API/MediaSource)
- Giao diện {{domxref("Navigator")}}
