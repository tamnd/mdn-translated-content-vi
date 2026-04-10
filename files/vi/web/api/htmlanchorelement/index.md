---
title: HTMLAnchorElement
slug: Web/API/HTMLAnchorElement
page-type: web-api-interface
browser-compat: api.HTMLAnchorElement
---

{{APIRef("HTML DOM")}}

Giao diện **`HTMLAnchorElement`** đại diện cho các phần tử siêu liên kết và cung cấp các thuộc tính cùng phương thức đặc biệt (bổ sung cho giao diện {{domxref("HTMLElement")}} thông thường mà chúng kế thừa) để thao tác bố cục và cách trình bày của những phần tử này. Giao diện này tương ứng với phần tử [`<a>`](/en-US/docs/Web/HTML/Reference/Elements/a); không nên nhầm lẫn với [`<link>`](/en-US/docs/Web/HTML/Reference/Elements/link) được đại diện bởi [`HTMLLinkElement`](/en-US/docs/Web/API/HTMLLinkElement).

{{InheritanceDiagram}}

## Thuộc tính thể hiện

_Kế thừa các thuộc tính từ phần tử cha, {{domxref("HTMLElement")}}._

- {{domxref("HTMLAnchorElement.attributionSourceId")}} {{experimental_inline}}
  - : Một số nguyên không âm đại diện cho định danh nguồn quy kết được sử dụng cho [Private Click Measurement](https://privacycg.github.io/private-click-measurement/). Các giá trị hợp lệ nằm trong khoảng từ `0` đến `255`.
- {{domxref("HTMLAnchorElement.attributionSrc")}} {{securecontext_inline}} {{deprecated_inline}}
  - : Lấy và đặt thuộc tính [`attributionsrc`](/en-US/docs/Web/HTML/Reference/Elements/a#attributionsrc) trên một phần tử {{htmlelement("a")}} một cách lập trình, phản ánh giá trị của thuộc tính đó. `attributionsrc` chỉ định rằng bạn muốn trình duyệt gửi một tiêu đề {{httpheader("Attribution-Reporting-Eligible")}}. Ở phía máy chủ, điều này được dùng để kích hoạt việc gửi tiêu đề {{httpheader("Attribution-Reporting-Register-Source")}} trong phản hồi, nhằm đăng ký một nguồn quy kết dựa trên điều hướng.
- {{domxref("HTMLAnchorElement.download")}}
  - : Một chuỗi cho biết tài nguyên được liên kết nhằm mục đích tải xuống thay vì hiển thị trong trình duyệt. Giá trị đại diện cho tên tệp đề xuất. Nếu tên không phải là tên tệp hợp lệ trên hệ điều hành cơ bản, trình duyệt sẽ điều chỉnh nó.
- {{domxref("HTMLAnchorElement.hash")}}
  - : Một chuỗi đại diện cho định danh phân đoạn, bao gồm dấu thăng (`#`) ở đầu, nếu có, trong URL được tham chiếu.
- {{domxref("HTMLAnchorElement.host")}}
  - : Một chuỗi đại diện cho tên máy chủ và cổng (nếu không phải là cổng mặc định) trong URL được tham chiếu.
- {{domxref("HTMLAnchorElement.hostname")}}
  - : Một chuỗi đại diện cho tên máy chủ trong URL được tham chiếu.
- {{domxref("HTMLAnchorElement.href")}}
  - : Một chuỗi là kết quả của việc phân tích cú pháp thuộc tính HTML [`href`](/en-US/docs/Web/HTML/Reference/Elements/a#href) so với tài liệu, chứa một URL hợp lệ của tài nguyên được liên kết.
- {{domxref("HTMLAnchorElement.hreflang")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`hreflang`](/en-US/docs/Web/HTML/Reference/Elements/a#hreflang), cho biết ngôn ngữ của tài nguyên được liên kết.
- {{domxref("HTMLAnchorElement.interestForElement")}} {{experimental_inline}} {{non-standard_inline}}
  - : Lấy hoặc đặt phần tử mục tiêu của một trình gọi quan tâm, trong trường hợp phần tử {{htmlelement("a")}} liên quan được chỉ định là một [trình gọi quan tâm](/en-US/docs/Web/API/Popover_API/Using_interest_invokers#creating_an_interest_invoker).
- {{domxref("HTMLAnchorElement.origin")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi chứa nguồn gốc của URL, tức là giao thức, tên miền và cổng của nó.
- {{domxref("HTMLAnchorElement.password")}}
  - : Một chuỗi chứa mật khẩu được chỉ định trước tên miền.
- {{domxref("HTMLAnchorElement.pathname")}}
  - : Một chuỗi bắt đầu bằng `/` theo sau là đường dẫn của URL, không bao gồm chuỗi truy vấn hoặc phân đoạn.
- {{domxref("HTMLAnchorElement.ping")}}
  - : Một danh sách các URL được phân tách bằng khoảng trắng. Khi liên kết được theo dõi, trình duyệt sẽ gửi các yêu cầu {{HTTPMethod("POST")}} với nội dung PING đến các URL đó.
- {{domxref("HTMLAnchorElement.port")}}
  - : Một chuỗi đại diện cho thành phần cổng, nếu có, của URL được tham chiếu.
- {{domxref("HTMLAnchorElement.protocol")}}
  - : Một chuỗi đại diện cho thành phần giao thức, bao gồm dấu hai chấm (`:`) ở cuối, của URL được tham chiếu.
- {{domxref("HTMLAnchorElement.referrerPolicy")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`referrerpolicy`](/en-US/docs/Web/HTML/Reference/Elements/a#referrerpolicy), cho biết sẽ sử dụng referrer nào.
- {{domxref("HTMLAnchorElement.rel")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`rel`](/en-US/docs/Web/HTML/Reference/Elements/a#rel), chỉ định mối quan hệ của đối tượng mục tiêu với đối tượng được liên kết.
- {{domxref("HTMLAnchorElement.relList")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("DOMTokenList")}} phản ánh thuộc tính HTML [`rel`](/en-US/docs/Web/HTML/Reference/Elements/a#rel), dưới dạng danh sách các token.
- {{domxref("HTMLAnchorElement.search")}}
  - : Một chuỗi đại diện cho thành phần tìm kiếm, bao gồm dấu hỏi (`?`) ở đầu, nếu có, của URL được tham chiếu.
- {{domxref("HTMLAnchorElement.target")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`target`](/en-US/docs/Web/HTML/Reference/Elements/a#target), cho biết nơi hiển thị tài nguyên được liên kết.
- {{domxref("HTMLAnchorElement.text")}}
  - : Một chuỗi là từ đồng nghĩa với thuộc tính {{domxref("Node.textContent")}}.
- {{domxref("HTMLAnchorElement.type")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`type`](/en-US/docs/Web/HTML/Reference/Elements/a#type), cho biết kiểu MIME của tài nguyên được liên kết.
- {{domxref("HTMLAnchorElement.username")}}
  - : Một chuỗi chứa tên người dùng được chỉ định trước tên miền.

### Các thuộc tính đã lỗi thời

- `HTMLAnchorElement.charset` {{deprecated_inline}}
  - : Một chuỗi đại diện cho bộ ký tự của tài nguyên được liên kết.
- `HTMLAnchorElement.coords` {{deprecated_inline}}
  - : Một chuỗi đại diện cho danh sách các tọa độ được phân tách bằng dấu phẩy.
- `HTMLAnchorElement.name` {{deprecated_inline}}
  - : Một chuỗi đại diện cho tên neo.
- `HTMLAnchorElement.rev` {{deprecated_inline}}
  - : Một chuỗi phản ánh thuộc tính HTML [`rev`](/en-US/docs/Web/HTML/Reference/Elements/a#rev), chỉ định mối quan hệ của đối tượng liên kết với đối tượng mục tiêu.
- `HTMLAnchorElement.shape` {{deprecated_inline}}
  - : Một chuỗi đại diện cho hình dạng của vùng hoạt động.

## Phương thức thể hiện

_Kế thừa các phương thức từ phần tử cha, {{domxref("HTMLElement")}}._

- {{domxref("HTMLAnchorElement.toString()")}}
  - : Trả về một chuỗi chứa toàn bộ URL. Đây là từ đồng nghĩa với {{domxref("HTMLAnchorElement.href")}}, mặc dù nó không thể được sử dụng để sửa đổi giá trị.

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- Phần tử HTML triển khai giao diện này: {{HTMLElement("a")}}
