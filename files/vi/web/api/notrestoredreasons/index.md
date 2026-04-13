---
title: NotRestoredReasons
slug: Web/API/NotRestoredReasons
page-type: web-api-interface
status:
  - experimental
browser-compat: api.NotRestoredReasons
---

{{APIRef("Performance API")}}{{SeeCompatTable}}

Giao diện **`NotRestoredReasons`** của {{domxref("Performance API", "Performance API", "", "nocode")}} cung cấp dữ liệu báo cáo chứa các lý do tại sao tài liệu hiện tại bị chặn không sử dụng bộ đệm back/forward ({{Glossary("bfcache")}}) khi điều hướng.

Các đối tượng này được truy cập qua thuộc tính {{domxref("PerformanceNavigationTiming.notRestoredReasons")}}.

## Thuộc tính phiên bản

- {{domxref("NotRestoredReasons.children", "children")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một mảng các đối tượng `NotRestoredReasons`, một cho mỗi {{htmlelement("iframe")}} con được nhúng trong tài liệu hiện tại, có thể chứa các lý do tại sao khung cấp cao nhất bị chặn liên quan đến các khung con. Mỗi đối tượng có cùng cấu trúc với đối tượng cha, cho phép bất kỳ số cấp `<iframe>` được nhúng nào cũng có thể được đại diện bên trong đối tượng đệ quy. Nếu khung không có con, mảng sẽ rỗng; nếu tài liệu ở trong `<iframe>` cross-origin, `children` sẽ trả về `null`.
- {{domxref("NotRestoredReasons.id", "id")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một chuỗi đại diện cho giá trị thuộc tính `id` của `<iframe>` chứa tài liệu (ví dụ `<iframe id="foo" src="...">`). Nếu tài liệu không ở trong `<iframe>` hoặc `<iframe>` không có `id`, `id` sẽ trả về `null`.
- {{domxref("NotRestoredReasons.name", "name")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một chuỗi đại diện cho giá trị thuộc tính `name` của `<iframe>` chứa tài liệu (ví dụ `<iframe name="bar" src="...">`). Nếu tài liệu không ở trong `<iframe>` hoặc `<iframe>` không có `name`, `name` sẽ trả về `null`.
- {{domxref("NotRestoredReasons.reasons", "reasons")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một mảng các đối tượng {{domxref("NotRestoredReasonDetails")}}, mỗi đối tượng đại diện cho một lý do tại sao trang được điều hướng đến bị chặn không sử dụng bfcache. Nếu tài liệu ở trong `<iframe>` cross-origin, `reasons` sẽ trả về `null`, nhưng tài liệu cha có thể hiển thị `reason` là `"masked"` nếu bất kỳ `<iframe>` nào chặn sử dụng bfcache cho khung cấp cao nhất.
- {{domxref("NotRestoredReasons.src", "src")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một chuỗi đại diện cho đường dẫn đến nguồn của `<iframe>` chứa tài liệu (ví dụ `<iframe src="exampleframe.html">`). Nếu tài liệu không ở trong `<iframe>`, `src` sẽ trả về `null`.
- {{domxref("NotRestoredReasons.url", "url")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một chuỗi đại diện cho URL của trang được điều hướng hoặc `<iframe>`. Nếu tài liệu ở trong `<iframe>` cross-origin, `url` sẽ trả về `null`.

## Phương thức phiên bản

- {{domxref("NotRestoredReasons.toJSON", "toJSON()")}} {{Experimental_Inline}}
  - : Một {{Glossary("Serialization","bộ tuần tự hóa")}}; trả về biểu diễn JSON của đối tượng `NotRestoredReasons`.

## Ví dụ

Xem [Theo dõi lý do chặn bfcache](/en-US/docs/Web/API/Performance_API/Monitoring_bfcache_blocking_reasons) để biết ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Theo dõi lý do chặn bfcache](/en-US/docs/Web/API/Performance_API/Monitoring_bfcache_blocking_reasons)
- {{domxref("PerformanceNavigationTiming.notRestoredReasons")}}
