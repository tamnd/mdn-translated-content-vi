---
title: HTMLLinkElement
slug: Web/API/HTMLLinkElement
page-type: web-api-interface
browser-compat: api.HTMLLinkElement
---

{{ APIRef("HTML DOM") }}

Giao diện **`HTMLLinkElement`** đại diện cho thông tin tham chiếu của các tài nguyên bên ngoài và mối quan hệ của những tài nguyên đó với tài liệu và ngược lại (tương ứng với phần tử [`<link>`](/en-US/docs/Web/HTML/Reference/Elements/link); không nhầm lẫn với [`<a>`](/en-US/docs/Web/HTML/Reference/Elements/a), phần tử được đại diện bởi [`HTMLAnchorElement`](/en-US/docs/Web/API/HTMLAnchorElement)). Đối tượng này kế thừa tất cả các thuộc tính và phương thức của giao diện {{domxref("HTMLElement")}}.

{{InheritanceDiagram}}

## Thuộc tính instance

_Kế thừa các thuộc tính từ phần tử cha, {{domxref("HTMLElement")}}._

- {{domxref("HTMLLinkElement.as")}}
  - : Một chuỗi đại diện cho loại nội dung đang được tải bởi liên kết HTML khi [`rel="preload"`](/en-US/docs/Web/HTML/Reference/Attributes/rel/preload) hoặc [`rel="modulepreload"`](/en-US/docs/Web/HTML/Reference/Attributes/rel/modulepreload).
- {{domxref("HTMLLinkElement.blocking")}}
  - : Một chuỗi cho biết các hoạt động nhất định sẽ bị chặn khi tải tài nguyên bên ngoài. Nó phản ánh thuộc tính `blocking` của phần tử {{HTMLElement("link")}}.
- {{domxref("HTMLLinkElement.crossOrigin")}}
  - : Một chuỗi tương ứng với thiết lập CORS cho phần tử liên kết này. Xem phần [thuộc tính thiết lập CORS](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin) để biết chi tiết.
- {{domxref("HTMLLinkElement.disabled")}}
  - : Một giá trị kiểu logic cho biết liên kết có bị vô hiệu hóa hay không; hiện chỉ được sử dụng với liên kết bảng kiểu.
- {{domxref("HTMLLinkElement.fetchPriority")}}
  - : Một chuỗi tùy chọn đại diện cho gợi ý gửi đến trình duyệt về cách ưu tiên tải tài nguyên preload so với các tài nguyên khác cùng loại. Nếu giá trị này được cung cấp, nó phải là một trong các giá trị được phép: `high` để tải với mức ưu tiên cao hơn, `low` để tải với mức ưu tiên thấp hơn, hoặc `auto` để không có ưu tiên cụ thể (mặc định).
- {{domxref("HTMLLinkElement.href")}}
  - : Một chuỗi đại diện cho URI của tài nguyên đích.
- {{domxref("HTMLLinkElement.hreflang")}}
  - : Một chuỗi đại diện cho mã ngôn ngữ của tài nguyên được liên kết.
- {{domxref("HTMLLinkElement.imageSizes")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`imagesizes`](/en-US/docs/Web/HTML/Reference/Elements/link#imagesizes); danh sách các điều kiện và kích thước hình ảnh được phân tách bằng dấu phẩy.
- {{domxref("HTMLLinkElement.imageSrcset")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`imagesrcset`](/en-US/docs/Web/HTML/Reference/Elements/link#imagesrcset); danh sách các chuỗi ứng viên hình ảnh được phân tách bằng dấu phẩy.
- {{domxref("HTMLLinkElement.integrity")}}
  - : Một chuỗi chứa siêu dữ liệu nội dòng mà trình duyệt có thể sử dụng để xác minh tài nguyên tải về đã được phân phối mà không bị thao tác ngoài ý muốn. Nó phản ánh thuộc tính `integrity` của phần tử {{HTMLElement("link")}}.
- {{domxref("HTMLLinkElement.media")}}
  - : Một chuỗi đại diện cho danh sách một hoặc nhiều định dạng phương tiện mà tài nguyên áp dụng. Nó phản ánh thuộc tính `media` của phần tử {{HTMLElement("link")}}.
- {{domxref("HTMLLinkElement.referrerPolicy")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`referrerpolicy`](/en-US/docs/Web/HTML/Reference/Elements/link#referrerpolicy) cho biết referrer nào sẽ sử dụng.
- {{domxref("HTMLLinkElement.rel")}}
  - : Một chuỗi đại diện cho mối quan hệ thuận của tài nguyên được liên kết từ tài liệu đến tài nguyên.
- {{domxref("HTMLLinkElement.relList")}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMTokenList")}} phản ánh thuộc tính HTML [`rel`](/en-US/docs/Web/HTML/Reference/Elements/link#rel), dưới dạng danh sách các token.
- {{domxref("HTMLLinkElement.sizes")}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMTokenList")}} phản ánh thuộc tính HTML [`sizes`](/en-US/docs/Web/HTML/Reference/Elements/link#sizes), dưới dạng danh sách các token.
- {{domxref("HTMLLinkElement.sheet")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref("StyleSheet")}} liên kết với phần tử đã cho, hoặc `null` nếu không có.
- {{domxref("HTMLLinkElement.type")}}
  - : Một chuỗi đại diện cho kiểu MIME của tài nguyên được liên kết.

### Thuộc tính đã lỗi thời

- {{domxref("HTMLLinkElement.charset")}} {{deprecated_inline}}
  - : Một chuỗi đại diện cho bảng mã ký tự của tài nguyên đích.
- {{domxref("HTMLLinkElement.rev")}} {{deprecated_inline}}
  - : Một chuỗi đại diện cho mối quan hệ ngược của tài nguyên được liên kết từ tài nguyên đến tài liệu.

    > [!NOTE]
    > Hiện tại đặc tả HTML 5.2 của W3C nêu rằng `rev` chưa lỗi thời, trong khi đặc tả living standard của WHATWG vẫn đánh dấu nó là đã lỗi thời. Cho đến khi sự mâu thuẫn này được giải quyết, bạn nên giả định rằng nó vẫn lỗi thời.

- {{domxref("HTMLLinkElement.target")}} {{deprecated_inline}}
  - : Một chuỗi đại diện cho tên khung đích mà tài nguyên áp dụng.

## Phương thức instance

_Không có phương thức cụ thể; kế thừa phương thức từ phần tử cha, {{domxref("HTMLElement")}}._

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- Phần tử HTML triển khai giao diện này: {{HTMLElement("link")}}.
