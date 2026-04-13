---
title: XMLHttpRequestEventTarget
slug: Web/API/XMLHttpRequestEventTarget
page-type: web-api-interface
browser-compat: api.XMLHttpRequestEventTarget
---

{{APIRef("XMLHttpRequest API")}} {{AvailableInWorkers("window_and_worker_except_service")}}

`XMLHttpRequestEventTarget` là giao diện mô tả các bộ xử lý sự kiện được dùng chung trên {{domxref("XMLHttpRequest")}} và {{domxref("XMLHttpRequestUpload")}}.

Bạn không dùng trực tiếp `XMLHttpRequestEventTarget`; thay vào đó bạn làm việc với các lớp con.

## Sự kiện

Các sự kiện sau được cung cấp cho {{domxref("XMLHttpRequest")}} và {{domxref("XMLHttpRequestUpload")}}:

- {{domxref("XMLHttpRequestEventTarget/abort_event", "abort")}}
  - : Được kích hoạt khi một yêu cầu bị hủy, ví dụ vì chương trình đã gọi {{domxref("XMLHttpRequest.abort()")}}.
    Cũng có sẵn qua thuộc tính xử lý sự kiện `onabort`.
- {{domxref("XMLHttpRequestEventTarget/error_event", "error")}}
  - : Được kích hoạt khi yêu cầu gặp lỗi.
    Cũng có sẵn qua thuộc tính xử lý sự kiện `onerror`.
- {{domxref("XMLHttpRequestEventTarget/load_event", "load")}}
  - : Được kích hoạt khi một giao dịch yêu cầu hoàn tất thành công.
    Cũng có sẵn qua thuộc tính xử lý sự kiện `onload`.
- {{domxref("XMLHttpRequestEventTarget/loadend_event", "loadend")}}
  - : Được kích hoạt khi một yêu cầu đã hoàn tất, dù thành công (sau {{domxref("XMLHttpRequestEventTarget/load_event", "load")}}) hay không thành công (sau {{domxref("XMLHttpRequestEventTarget/abort_event", "abort")}} hoặc {{domxref("XMLHttpRequestEventTarget/error_event", "error")}}).
    Cũng có sẵn qua thuộc tính xử lý sự kiện `onloadend`.
- {{domxref("XMLHttpRequestEventTarget/loadstart_event", "loadstart")}}
  - : Được kích hoạt khi yêu cầu bắt đầu tải dữ liệu.
    Cũng có sẵn qua thuộc tính xử lý sự kiện `onloadstart`.
- {{domxref("XMLHttpRequestEventTarget/progress_event", "progress")}}
  - : Được kích hoạt định kỳ khi yêu cầu nhận thêm dữ liệu.
    Cũng có sẵn qua thuộc tính xử lý sự kiện `onprogress`.
- {{domxref("XMLHttpRequestEventTarget/timeout_event", "timeout")}}
  - : Được kích hoạt khi tiến trình bị chấm dứt do hết thời gian đặt trước.
    Cũng có sẵn qua thuộc tính xử lý sự kiện `ontimeout`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XMLHttpRequest")}}
- {{domxref("XMLHttpRequestUpload")}}
