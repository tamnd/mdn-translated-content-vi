---
title: "NotRestoredReasonDetails: thuộc tính reason"
short-title: reason
slug: Web/API/NotRestoredReasonDetails/reason
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.NotRestoredReasonDetails.reason
---

{{APIRef("Performance API")}}{{SeeCompatTable}}

Thuộc tính **`reason`** chỉ đọc của giao diện {{domxref("NotRestoredReasonDetails")}} trả về một chuỗi mô tả lý do tại sao trang bị chặn khỏi việc sử dụng bộ nhớ đệm tiến/lùi ({{Glossary("bfcache")}}).

## Giá trị

Một chuỗi.

Có nhiều lý do khác nhau tại sao việc chặn có thể xảy ra, và các trình duyệt có thể chọn thực hiện các lý do chặn cụ thể của riêng họ dựa trên cách họ hoạt động. Các nhà phát triển nên tránh phụ thuộc vào cách diễn đạt cụ thể của các lý do và sẵn sàng xử lý các lý do mới được thêm vào hoặc xóa đi.

Các giá trị ban đầu được liệt kê trong thông số kỹ thuật là:

- `"fetch"`
  - : Trong khi đang hủy tải, một yêu cầu fetch được khởi tạo bởi tài liệu hiện tại (ví dụ: qua {{domxref("Window/fetch", "fetch()")}}) đã bị hủy trong khi đang diễn ra. Do đó, trang không ở trạng thái ổn định có thể được lưu trữ trong bfcache.
- `"lock"`
  - : Trong khi đang hủy tải, các khóa đang được giữ và các yêu cầu khóa đã bị chấm dứt, vì vậy trang không ở trạng thái ổn định có thể được lưu trữ trong bfcache.
- `"masked"`
  - : Lý do chính xác bị ẩn vì mục đích bảo mật. Giá trị này có thể có nghĩa là một trong những điều sau:
    - Tài liệu hiện tại có các phần tử con chứa trong một {{htmlelement("iframe")}} có nguồn gốc chéo và chúng đã ngăn việc lưu trữ trong bfcache.
    - Tài liệu hiện tại không thể được lưu trữ trong bfcache vì lý do cụ thể của user agent.
- `"navigation-failure"`
  - : Điều hướng gốc tạo ra tài liệu hiện tại đã gặp lỗi, và việc lưu tài liệu lỗi kết quả vào bfcache đã bị ngăn chặn.
- `"parser-aborted"`
  - : Tài liệu hiện tại chưa hoàn thành việc phân tích cú pháp HTML ban đầu, và việc lưu tài liệu chưa hoàn thành vào bfcache đã bị ngăn chặn.
- `"websocket"`
  - : Trong khi đang hủy tải, một kết nối [WebSocket](/en-US/docs/Web/API/WebSockets_API) đang mở đã bị đóng, vì vậy trang không ở trạng thái ổn định có thể được lưu trữ trong bfcache.

Một số trình duyệt có thể sử dụng thêm các lý do chặn, ví dụ:

- `"unload-listener"`
  - : Trang đăng ký một trình xử lý [`unload`](/en-US/docs/Web/API/Window/unload_event), điều này ngăn việc sử dụng bfcache. Đây là một cảnh báo hữu ích, vì `unload` đã không còn được khuyến nghị sử dụng. Xem [ghi chú sử dụng](/en-US/docs/Web/API/Window/unload_event#usage_notes) để biết thêm thông tin.
- `"response-cache-control-no-store"`
  - : Trang sử dụng `no-store` làm giá trị header {{httpheader("Cache-Control")}}.
- `"related-active-contents"`
  - : Trang đã được mở từ một trang khác vẫn còn tham chiếu đến trang này, ví dụ: sử dụng chức năng "nhân đôi tab".

## Ví dụ

Xem [Giám sát lý do chặn bfcache](/en-US/docs/Web/API/Performance_API/Monitoring_bfcache_blocking_reasons) để biết các ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Giám sát lý do chặn bfcache](/en-US/docs/Web/API/Performance_API/Monitoring_bfcache_blocking_reasons)
- {{domxref("PerformanceNavigationTiming.notRestoredReasons")}}
