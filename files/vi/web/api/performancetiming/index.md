---
title: PerformanceTiming
slug: Web/API/PerformanceTiming
page-type: web-api-interface
status:
  - deprecated
browser-compat: api.PerformanceTiming
---

{{APIRef("Performance API")}}{{Deprecated_Header}}

> [!WARNING]
> Giao diện này đã lỗi thời trong [thông số Navigation Timing Level 2](https://w3c.github.io/navigation-timing/#obsolete). Vui lòng sử dụng giao diện {{domxref("PerformanceNavigationTiming")}} thay thế.

Giao diện **`PerformanceTiming`** là một giao diện cũ được giữ lại để tương thích ngược và chứa các thuộc tính cung cấp thông tin thời gian hiệu suất cho các sự kiện khác nhau xảy ra trong quá trình tải và sử dụng trang hiện tại. Bạn lấy đối tượng `PerformanceTiming` mô tả trang của mình bằng cách sử dụng thuộc tính {{domxref("Performance.timing", "window.performance.timing")}}.

## Thuộc tính phiên bản

_Giao diện `PerformanceTiming` không kế thừa bất kỳ thuộc tính nào._

Mỗi thuộc tính mô tả thời điểm mà một điểm cụ thể trong quá trình tải trang được đạt đến. Một số tương ứng với các sự kiện DOM; các thuộc tính khác mô tả thời điểm mà các hoạt động nội bộ của trình duyệt được thực hiện.

Mỗi thời điểm được cung cấp dưới dạng một số biểu diễn thời điểm, tính bằng mili giây kể từ kỷ nguyên UNIX.

Các thuộc tính này được liệt kê theo thứ tự xuất hiện trong quá trình điều hướng.

- {{domxref("PerformanceTiming.navigationStart")}} {{ReadOnlyInline}} {{Deprecated_Inline}}
  - : Khi lời nhắc hủy tải kết thúc trên tài liệu trước đó trong cùng ngữ cảnh duyệt web. Nếu không có tài liệu trước đó, giá trị này sẽ giống với `PerformanceTiming.fetchStart`.
- {{domxref("PerformanceTiming.unloadEventStart")}} {{ReadOnlyInline}} {{Deprecated_Inline}}
  - : Khi sự kiện {{domxref("Window/unload_event", "unload")}} được phát ra, cho biết thời điểm tài liệu trước đó trong cửa sổ bắt đầu hủy tải. Nếu không có tài liệu trước đó, hoặc nếu tài liệu trước đó hoặc một trong các chuyển hướng cần thiết không cùng nguồn gốc, giá trị trả về là `0`.
- {{domxref("PerformanceTiming.unloadEventEnd")}} {{ReadOnlyInline}} {{Deprecated_Inline}}
  - : Khi trình xử lý sự kiện {{domxref("Window/unload_event", "unload")}} kết thúc. Nếu không có tài liệu trước đó, hoặc nếu tài liệu trước đó, hoặc một trong các chuyển hướng cần thiết, không cùng nguồn gốc, giá trị trả về là `0`.
- {{domxref("PerformanceTiming.redirectStart")}} {{ReadOnlyInline}} {{Deprecated_Inline}}
  - : Khi chuyển hướng HTTP đầu tiên bắt đầu. Nếu không có chuyển hướng, hoặc nếu một trong các chuyển hướng không cùng nguồn gốc, giá trị trả về là `0`.
- {{domxref("PerformanceTiming.redirectEnd")}} {{ReadOnlyInline}} {{Deprecated_Inline}}
  - : Khi chuyển hướng HTTP cuối cùng hoàn thành, tức là khi byte cuối cùng của phản hồi HTTP được nhận. Nếu không có chuyển hướng, hoặc nếu một trong các chuyển hướng không cùng nguồn gốc, giá trị trả về là `0`.
- {{domxref("PerformanceTiming.fetchStart")}} {{ReadOnlyInline}} {{Deprecated_Inline}}
  - : Khi trình duyệt sẵn sàng tải tài liệu bằng yêu cầu HTTP. Thời điểm này _trước_ khi kiểm tra bất kỳ bộ nhớ đệm ứng dụng nào.
- {{domxref("PerformanceTiming.domainLookupStart")}} {{ReadOnlyInline}} {{Deprecated_Inline}}
  - : Khi quá trình tra cứu tên miền bắt đầu. Nếu kết nối liên tục được sử dụng, hoặc thông tin được lưu trong bộ nhớ đệm hoặc tài nguyên cục bộ, giá trị sẽ giống với `PerformanceTiming.fetchStart`.
- {{domxref("PerformanceTiming.domainLookupEnd")}} {{ReadOnlyInline}} {{Deprecated_Inline}}
  - : Khi quá trình tra cứu tên miền kết thúc. Nếu kết nối liên tục được sử dụng, hoặc thông tin được lưu trong bộ nhớ đệm hoặc tài nguyên cục bộ, giá trị sẽ giống với `PerformanceTiming.fetchStart`.
- {{domxref("PerformanceTiming.connectStart")}} {{ReadOnlyInline}} {{Deprecated_Inline}}
  - : Khi yêu cầu mở kết nối được gửi đến mạng. Nếu lớp truyền tải báo cáo lỗi và việc thiết lập kết nối được bắt đầu lại, thời gian bắt đầu thiết lập kết nối cuối cùng được cung cấp. Nếu kết nối liên tục được sử dụng, giá trị sẽ giống với `PerformanceTiming.fetchStart`.
- {{domxref("PerformanceTiming.connectEnd")}} {{ReadOnlyInline}} {{Deprecated_Inline}}
  - : Khi kết nối được mở vào mạng. Nếu lớp truyền tải báo cáo lỗi và việc thiết lập kết nối được bắt đầu lại, thời gian kết thúc thiết lập kết nối cuối cùng được cung cấp. Nếu kết nối liên tục được sử dụng, giá trị sẽ giống với `PerformanceTiming.fetchStart`. Một kết nối được coi là đã mở khi tất cả quá trình bắt tay kết nối bảo mật, hoặc xác thực SOCKS, đã kết thúc.
- {{domxref("PerformanceTiming.secureConnectionStart")}} {{ReadOnlyInline}} {{Deprecated_Inline}}
  - : Khi quá trình bắt tay kết nối bảo mật bắt đầu. Nếu không có kết nối như vậy được yêu cầu, giá trị trả về là `0`.
- {{domxref("PerformanceTiming.requestStart")}} {{ReadOnlyInline}} {{Deprecated_Inline}}
  - : Khi trình duyệt gửi yêu cầu để lấy tài liệu thực tế, từ máy chủ hoặc từ bộ nhớ đệm. Nếu lớp truyền tải thất bại sau khi bắt đầu yêu cầu và kết nối được mở lại, thuộc tính này sẽ được đặt thành thời gian tương ứng với yêu cầu mới.
- {{domxref("PerformanceTiming.responseStart")}} {{ReadOnlyInline}} {{Deprecated_Inline}}
  - : Khi trình duyệt nhận được byte đầu tiên của phản hồi, từ máy chủ, bộ nhớ đệm, hoặc tài nguyên cục bộ.
- {{domxref("PerformanceTiming.responseEnd")}} {{ReadOnlyInline}} {{Deprecated_Inline}}
  - : Khi trình duyệt nhận được byte cuối cùng của phản hồi, hoặc khi kết nối đóng nếu điều này xảy ra trước, từ máy chủ, bộ nhớ đệm, hoặc tài nguyên cục bộ.
- {{domxref("PerformanceTiming.domLoading")}} {{ReadOnlyInline}} {{Deprecated_Inline}}
  - : Khi trình phân tích cú pháp bắt đầu công việc, tức là khi {{domxref("Document.readyState")}} của nó thay đổi thành `'loading'` và sự kiện {{domxref("Document/readystatechange_event", "readystatechange")}} tương ứng được phát ra.
- {{domxref("PerformanceTiming.domInteractive")}} {{ReadOnlyInline}} {{Deprecated_Inline}}
  - : Khi trình phân tích cú pháp hoàn thành công việc trên tài liệu chính, tức là khi {{domxref("Document.readyState")}} của nó thay đổi thành `'interactive'` và sự kiện {{domxref("Document/readystatechange_event", "readystatechange")}} tương ứng được phát ra.
- {{domxref("PerformanceTiming.domContentLoadedEventStart")}} {{ReadOnlyInline}} {{Deprecated_Inline}}
  - : Ngay trước khi trình phân tích cú pháp gửi sự kiện {{domxref("Document/DOMContentLoaded_event", "DOMContentLoaded")}}, tức là ngay sau khi tất cả các script cần thực thi ngay sau khi phân tích cú pháp đã được thực thi.
- {{domxref("PerformanceTiming.domContentLoadedEventEnd")}} {{ReadOnlyInline}} {{Deprecated_Inline}}
  - : Ngay sau khi tất cả các script cần thực thi càng sớm càng tốt, theo thứ tự hoặc không, đã được thực thi.
- {{domxref("PerformanceTiming.domComplete")}} {{ReadOnlyInline}} {{Deprecated_Inline}}
  - : Khi trình phân tích cú pháp hoàn thành công việc trên tài liệu chính, tức là khi {{domxref("Document.readyState")}} của nó thay đổi thành `'complete'` và sự kiện {{domxref("Document/readystatechange_event", "readystatechange")}} tương ứng được phát ra.
- {{domxref("PerformanceTiming.loadEventStart")}} {{ReadOnlyInline}} {{Deprecated_Inline}}
  - : Khi sự kiện {{domxref("Window/load_event", "load")}} được gửi cho tài liệu hiện tại. Nếu sự kiện này chưa được gửi, giá trị trả về là `0`.
- {{domxref("PerformanceTiming.loadEventEnd")}} {{ReadOnlyInline}} {{Deprecated_Inline}}
  - : Khi trình xử lý sự kiện {{domxref("Window/load_event", "load")}} kết thúc, tức là khi sự kiện load hoàn thành. Nếu sự kiện này chưa được gửi, hoặc chưa hoàn thành, giá trị trả về là `0`.

## Phương thức phiên bản

_Giao diện `PerformanceTiming` không kế thừa bất kỳ phương thức nào._

- {{domxref("PerformanceTiming.toJSON()")}} {{Deprecated_Inline}}
  - : Trả về một [đối tượng JSON](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON) biểu diễn đối tượng `PerformanceTiming` này.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính {{domxref("Performance.timing")}} tạo ra đối tượng như vậy.
- {{domxref("PerformanceNavigationTiming")}} (một phần của Navigation Timing Level 2) đã thay thế API này.
