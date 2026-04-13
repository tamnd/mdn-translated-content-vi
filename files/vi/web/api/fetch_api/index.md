---
title: Fetch API
slug: Web/API/Fetch_API
page-type: web-api-overview
browser-compat:
  - api.fetch
  - api.Window.fetchLater
---

{{DefaultAPISidebar("Fetch API")}}

Fetch API cung cấp một giao diện để truy xuất tài nguyên, bao gồm cả qua mạng. Đây là sự thay thế mạnh mẽ và linh hoạt hơn cho {{DOMxRef("XMLHttpRequest")}}.

## Khái niệm và cách dùng

Fetch API sử dụng các đối tượng {{DOMxRef("Request")}} và {{DOMxRef("Response")}} cùng những thành phần khác liên quan đến yêu cầu mạng, cũng như các khái niệm liên quan như CORS và ngữ nghĩa của tiêu đề HTTP Origin.

Để thực hiện một yêu cầu và truy xuất một tài nguyên, hãy dùng phương thức {{domxref("Window/fetch", "fetch()")}}. Đây là phương thức toàn cục trong cả ngữ cảnh {{DOMxRef("Window")}} và {{DOMxRef("WorkerGlobalScope", "Worker")}}. Điều đó khiến nó có sẵn trong hầu hết mọi ngữ cảnh mà bạn muốn truy xuất tài nguyên.

Phương thức `fetch()` nhận một đối số bắt buộc là đường dẫn tới tài nguyên bạn muốn truy xuất. Nó trả về một {{JSxRef("Promise")}} được giải quyết thành {{DOMxRef("Response")}} của yêu cầu đó ngay khi máy chủ phản hồi bằng các header, **ngay cả khi phản hồi từ máy chủ là một mã trạng thái lỗi HTTP**. Bạn cũng có thể tùy chọn truyền vào một đối tượng tùy chọn `init` làm đối số thứ hai, xem {{DOMxRef("Request")}}.

Khi đã nhận được một {{DOMxRef("Response")}}, sẽ có nhiều phương thức để xác định nội dung của phần thân phản hồi là gì và cần xử lý nó như thế nào.

Bạn có thể tạo trực tiếp một yêu cầu và phản hồi bằng các bộ khởi tạo {{DOMxRef("Request.Request", "Request()")}} và {{DOMxRef("Response.Response", "Response()")}}, nhưng việc này không thường được thực hiện trực tiếp. Thay vào đó, các đối tượng này thường được tạo ra như kết quả của những hành động API khác, ví dụ {{DOMxRef("FetchEvent.respondWith()")}} từ service worker.

Tìm hiểu thêm về cách dùng các tính năng của Fetch API trong [Sử dụng Fetch API](/en-US/docs/Web/API/Fetch_API/Using_Fetch).

### Deferred Fetch

API {{domxref("Window/fetchLater", "fetchLater()")}} cho phép nhà phát triển yêu cầu một _deferred fetch_, tức một yêu cầu truy xuất có thể được gửi sau một khoảng thời gian xác định, hoặc khi trang bị đóng hay điều hướng đi nơi khác. Xem [Sử dụng Deferred Fetch](/en-US/docs/Web/API/Fetch_API/Using_Deferred_Fetch).

## Giao diện

- {{domxref("Window.fetch()")}} và {{domxref("WorkerGlobalScope.fetch()")}}
  - : Phương thức `fetch()` dùng để truy xuất một tài nguyên.
- {{domxref("Window.fetchLater()")}}
  - : Dùng để thực hiện một yêu cầu deferred fetch.
- {{domxref("DeferredRequestInit")}}
  - : Biểu diễn tập hợp các tùy chọn có thể dùng để cấu hình một yêu cầu deferred fetch.
- {{domxref("FetchLaterResult")}}
  - : Biểu diễn kết quả của việc yêu cầu deferred fetch.
- {{DOMxRef("Headers")}}
  - : Biểu diễn các header của phản hồi/yêu cầu, cho phép bạn truy vấn chúng và thực hiện các hành động khác nhau tùy theo kết quả.
- {{DOMxRef("Request")}}
  - : Biểu diễn một yêu cầu tới tài nguyên.
- {{DOMxRef("Response")}}
  - : Biểu diễn phản hồi cho một yêu cầu.

## Tiêu đề HTTP

- {{HTTPHeader("Permissions-Policy/deferred-fetch", "deferred-fetch")}}
  - : Kiểm soát [hạn mức cấp cao nhất](/en-US/docs/Web/API/Fetch_API/Using_Deferred_Fetch#quotas) cho API `fetchLater()`.
- {{HTTPHeader("Permissions-Policy/deferred-fetch-minimal", "deferred-fetch-minimal")}}
  - : Kiểm soát [hạn mức dùng chung cho subframe khác nguồn gốc](/en-US/docs/Web/API/Fetch_API/Using_Deferred_Fetch#quotas) của API `fetchLater()`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Fetch](/en-US/docs/Web/API/Fetch_API/Using_Fetch)
- [Service Worker API](/en-US/docs/Web/API/Service_Worker_API)
- [Kiểm soát truy cập HTTP (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
