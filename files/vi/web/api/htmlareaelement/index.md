---
title: HTMLAreaElement
slug: Web/API/HTMLAreaElement
page-type: web-api-interface
browser-compat: api.HTMLAreaElement
---

{{APIRef("HTML DOM")}}

Giao diện **`HTMLAreaElement`** cung cấp các thuộc tính và phương thức đặc biệt (bổ sung cho giao diện {{domxref("HTMLElement")}} thông thường mà nó kế thừa) để thao tác bố cục và cách trình bày của các phần tử {{htmlelement("area")}}.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

_Kế thừa các thuộc tính từ phần tử cha {{domxref("HTMLElement")}}._

- {{domxref("HTMLAreaElement.alt")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`alt`](/en-US/docs/Web/HTML/Reference/Elements/area#alt), chứa văn bản thay thế cho phần tử.
- {{domxref("HTMLAreaElement.coords")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`coords`](/en-US/docs/Web/HTML/Reference/Elements/area#coords), chứa các tọa độ để xác định vùng hot-spot.
- {{domxref("HTMLAreaElement.download")}}
  - : Một chuỗi cho biết tài nguyên được liên kết nhằm mục đích tải xuống thay vì hiển thị trong trình duyệt. Giá trị đại diện cho tên tệp đề xuất. Nếu tên không phải là tên tệp hợp lệ trên hệ điều hành cơ bản, trình duyệt sẽ điều chỉnh nó.
- {{domxref("HTMLAreaElement.hash")}}
  - : Một chuỗi chứa định danh phân đoạn (bao gồm dấu thăng (#) ở đầu), nếu có, trong URL được tham chiếu.
- {{domxref("HTMLAreaElement.host")}}
  - : Một chuỗi chứa tên máy chủ và cổng (nếu không phải là cổng mặc định) trong URL được tham chiếu.
- {{domxref("HTMLAreaElement.hostname")}}
  - : Một chuỗi chứa tên máy chủ trong URL được tham chiếu.
- {{domxref("HTMLAreaElement.href")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`href`](/en-US/docs/Web/HTML/Reference/Elements/area#href), chứa một URL hợp lệ của tài nguyên được liên kết.
- {{domxref("HTMLAreaElement.interestForElement")}} {{experimental_inline}} {{non-standard_inline}}
  - : Lấy hoặc đặt phần tử mục tiêu của một trình gọi quan tâm, trong trường hợp phần tử {{htmlelement("area")}} liên quan được chỉ định là một [trình gọi quan tâm](/en-US/docs/Web/API/Popover_API/Using_interest_invokers#creating_an_interest_invoker).
- {{domxref("HTMLAreaElement.noHref")}} {{deprecated_inline}}
  - : Một giá trị boolean cho biết vùng có không hoạt động (`true`) hay hoạt động (`false`).
- {{domxref("HTMLAreaElement.origin")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi chứa nguồn gốc của URL, bao gồm giao thức, tên miền và cổng.
- {{domxref("HTMLAreaElement.password")}}
  - : Một chuỗi chứa mật khẩu được chỉ định trước tên miền.
- {{domxref("HTMLAreaElement.pathname")}}
  - : Một chuỗi chứa thành phần đường dẫn, nếu có, của URL được tham chiếu.
- {{domxref("HTMLAreaElement.ping")}}
  - : Một danh sách các URL được phân tách bằng khoảng trắng. Khi liên kết được theo dõi, trình duyệt sẽ gửi các yêu cầu {{HTTPMethod("POST")}} với nội dung PING đến các URL đó.
- {{domxref("HTMLAreaElement.port")}}
  - : Một chuỗi chứa thành phần cổng, nếu có, của URL được tham chiếu.
- {{domxref("HTMLAreaElement.protocol")}}
  - : Một chuỗi chứa thành phần giao thức (bao gồm dấu hai chấm `':'` ở cuối), của URL được tham chiếu.
- {{domxref("HTMLAreaElement.referrerPolicy")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`referrerpolicy`](/en-US/docs/Web/HTML/Reference/Elements/area#referrerpolicy), cho biết sẽ sử dụng referrer nào khi tìm nạp tài nguyên được liên kết.
- {{domxref("HTMLAreaElement.rel")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`rel`](/en-US/docs/Web/HTML/Reference/Elements/area#rel), cho biết mối quan hệ của tài liệu hiện tại với tài nguyên được liên kết.
- {{domxref("HTMLAreaElement.relList")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("DOMTokenList")}} phản ánh thuộc tính HTML [`rel`](/en-US/docs/Web/HTML/Reference/Elements/area#rel), cho biết mối quan hệ của tài liệu hiện tại với tài nguyên được liên kết, dưới dạng danh sách các token.
- {{domxref("HTMLAreaElement.search")}}
  - : Một chuỗi chứa thành phần tìm kiếm (bao gồm dấu hỏi `'?'` ở đầu), nếu có, của URL được tham chiếu.
- {{domxref("HTMLAreaElement.shape")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`shape`](/en-US/docs/Web/HTML/Reference/Elements/area#shape), cho biết hình dạng của vùng hot-spot, giới hạn ở các giá trị đã biết.
- {{domxref("HTMLAreaElement.target")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`target`](/en-US/docs/Web/HTML/Reference/Elements/area#target), cho biết ngữ cảnh duyệt web nơi mở tài nguyên được liên kết.
- {{domxref("HTMLAreaElement.username")}}
  - : Một chuỗi chứa tên người dùng được chỉ định trước tên miền.

## Phương thức thể hiện

_Kế thừa các phương thức từ phần tử cha, {{domxref("HTMLElement")}}._

- {{domxref("HTMLAreaElement.toString()")}}
  - : Trả về một chuỗi chứa toàn bộ URL. Đây là từ đồng nghĩa với {{domxref("HTMLAreaElement.href")}}.

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- Phần tử HTML triển khai giao diện này: {{ HTMLElement("area") }}
