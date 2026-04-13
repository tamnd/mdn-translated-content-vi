---
title: HTMLIFrameElement
slug: Web/API/HTMLIFrameElement
page-type: web-api-interface
browser-compat: api.HTMLIFrameElement
---

{{APIRef("HTML DOM")}}

Giao diện **`HTMLIFrameElement`** cung cấp các thuộc tính và phương thức đặc biệt (bên cạnh những thuộc tính và phương thức của giao diện {{domxref("HTMLElement")}} mà nó kế thừa) để thao tác bố cục và cách trình bày của các phần tử khung nội tuyến (inline frame).

{{InheritanceDiagram}}

## Thuộc tính instance

_Kế thừa các thuộc tính từ phần tử cha, {{domxref("HTMLElement")}}_.

- {{domxref("HTMLIFrameElement.align")}} {{Deprecated_Inline}}
  - : Một chuỗi chỉ định cách căn chỉnh của khung so với ngữ cảnh xung quanh.
- {{domxref("HTMLIFrameElement.allow")}}
  - : Một chuỗi cho biết [Chính sách quyền](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) được chỉ định cho `<iframe>` này.
- {{domxref("HTMLIFrameElement.allowFullscreen")}}
  - : Một giá trị boolean cho biết khung nội tuyến có sẵn sàng chuyển sang chế độ toàn màn hình hay không. Xem [Sử dụng chế độ toàn màn hình](/en-US/docs/Web/API/Fullscreen_API) để biết chi tiết.
- {{domxref("HTMLIFrameElement.allowPaymentRequest")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Một giá trị boolean cho biết liệu [Payment Request API](/en-US/docs/Web/API/Payment_Request_API) có thể được gọi trong một iframe khác nguồn gốc hay không.
- {{domxref("HTMLIFrameElement.browsingTopics")}} {{non-standard_inline}} {{deprecated_inline}}
  - : Một thuộc tính boolean chỉ định rằng các chủ đề đã chọn cho người dùng hiện tại sẽ được gửi cùng yêu cầu cho nguồn của {{htmlelement("iframe")}} liên kết. Thuộc tính này phản ánh giá trị của thuộc tính nội dung `browsingtopics`.
- {{domxref("HTMLIFrameElement.contentDocument")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("Document")}}, tài liệu đang hoạt động trong ngữ cảnh duyệt web lồng ghép của khung nội tuyến.
- {{domxref("HTMLIFrameElement.contentWindow")}} {{ReadOnlyInline}}
  - : Trả về một {{glossary("WindowProxy")}}, proxy cửa sổ cho ngữ cảnh duyệt web lồng ghép.
- {{domxref("HTMLIFrameElement.credentialless")}} {{Experimental_Inline}}
  - : Một giá trị boolean cho biết `<iframe>` có không có thông tin xác thực hay không, nghĩa là nội dung của nó được tải trong một ngữ cảnh tạm thời mới. Ngữ cảnh này không có quyền truy cập vào bộ nhớ chia sẻ và thông tin xác thực của ngữ cảnh cha. Đổi lại, các quy tắc nhúng {{httpheader("Cross-Origin-Embedder-Policy")}} (COEP) có thể được dỡ bỏ, cho phép các tài liệu đã đặt COEP nhúng các tài liệu bên thứ ba không đặt COEP. Xem [IFrame credentialless](/en-US/docs/Web/HTTP/Guides/IFrame_credentialless) để biết giải thích chi tiết hơn.
- {{domxref("HTMLIFrameElement.csp")}} {{Experimental_Inline}}
  - : Chỉ định Chính sách bảo mật nội dung (Content Security Policy) mà một tài liệu nhúng phải đồng ý thực thi.
- {{domxref("HTMLIFrameElement.featurePolicy")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về giao diện {{domxref("FeaturePolicy")}} cung cấp một API đơn giản để kiểm tra [Chính sách quyền](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) được áp dụng cho một tài liệu cụ thể.
- {{domxref("HTMLIFrameElement.frameBorder")}} {{Deprecated_Inline}}
  - : Một chuỗi cho biết có tạo viền giữa các khung hay không.
- {{domxref("HTMLIFrameElement.height")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`height`](/en-US/docs/Web/HTML/Reference/Elements/iframe#height), cho biết chiều cao của khung.
- {{domxref("HTMLIFrameElement.loading")}}
  - : Một chuỗi cung cấp gợi ý cho trình duyệt rằng iframe nên được tải ngay lập tức (`eager`) hoặc theo nhu cầu (`lazy`).
    Thuộc tính này phản ánh thuộc tính HTML [`loading`](/en-US/docs/Web/HTML/Reference/Elements/iframe#loading).
- {{domxref("HTMLIFrameElement.longDesc")}} {{Deprecated_Inline}}
  - : Một chuỗi chứa URI của mô tả dài về khung.
- {{domxref("HTMLIFrameElement.marginHeight")}} {{Deprecated_Inline}}
  - : Một chuỗi là chiều cao của lề khung.
- {{domxref("HTMLIFrameElement.marginWidth")}} {{Deprecated_Inline}}
  - : Một chuỗi là chiều rộng của lề khung.
- {{domxref("HTMLIFrameElement.name")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`name`](/en-US/docs/Web/HTML/Reference/Elements/iframe#name), chứa tên để tham chiếu đến khung.
- {{domxref("HTMLIFrameElement.privateToken")}} {{experimental_inline}}
  - : Một biểu diễn chuỗi của một đối tượng options đại diện cho một thao tác [private state token](/en-US/docs/Web/API/Private_State_Token_API/Using); đối tượng này có cùng cấu trúc với từ điển [`privateToken`](/en-US/docs/Web/API/RequestInit#privatetoken) của `RequestInit`. Phản ánh nội dung của thuộc tính [`privateToken`](/en-US/docs/Web/HTML/Reference/Elements/iframe#privatetoken) của phần tử `<iframe>` liên kết.
- {{domxref("HTMLIFrameElement.referrerPolicy")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`referrerPolicy`](/en-US/docs/Web/HTML/Reference/Elements/iframe#referrerpolicy) cho biết nên sử dụng referrer nào khi lấy tài nguyên được liên kết.
- {{domxref("HTMLIFrameElement.sandbox")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("DOMTokenList")}} phản ánh thuộc tính HTML [`sandbox`](/en-US/docs/Web/HTML/Reference/Elements/iframe#sandbox), cho biết các hạn chế bổ sung đối với hành vi của nội dung lồng ghép.
- {{domxref("HTMLIFrameElement.scrolling")}} {{Deprecated_Inline}}
  - : Một chuỗi cho biết trình duyệt có nên cung cấp thanh cuộn cho khung hay không.
- {{domxref("HTMLIFrameElement.src")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`src`](/en-US/docs/Web/HTML/Reference/Elements/iframe#src), chứa địa chỉ của nội dung cần được nhúng. Lưu ý rằng việc xóa thuộc tính src của `<iframe>` theo chương trình (ví dụ: qua {{domxref("Element.removeAttribute()")}}) sẽ khiến `about:blank` được tải vào khung trong Firefox (từ phiên bản 65), các trình duyệt dựa trên Chromium và Safari/iOS.
- {{domxref("HTMLIFrameElement.srcdoc")}}
  - : Một {{domxref("TrustedHTML")}} hoặc chuỗi đại diện cho tài liệu HTML được tải vào khung.
- {{domxref("HTMLIFrameElement.width")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`width`](/en-US/docs/Web/HTML/Reference/Elements/iframe#width), cho biết chiều rộng của khung.

## Phương thức instance

_Cũng kế thừa các phương thức từ giao diện cha, {{domxref("HTMLElement")}}._

- {{domxref("HTMLIFrameElement.getSVGDocument()")}}
  - : Trả về SVG được nhúng dưới dạng một {{domxref("Document")}}.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML triển khai giao diện này: {{HTMLElement("iframe")}}
