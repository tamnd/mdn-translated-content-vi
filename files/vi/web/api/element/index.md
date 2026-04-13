---
title: Element
slug: Web/API/Element
page-type: web-api-interface
browser-compat: api.Element
---

{{APIRef("DOM")}}

**`Element`** là lớp cơ sở tổng quát nhất mà mọi đối tượng phần tử trong một {{DOMxRef("Document")}} kế thừa. Nó chỉ có các phương thức và thuộc tính chung cho mọi loại phần tử. Các lớp cụ thể hơn sẽ kế thừa từ `Element`.

Ví dụ, giao diện {{DOMxRef("HTMLElement")}} là giao diện cơ sở cho các phần tử HTML. Tương tự, giao diện {{DOMxRef("SVGElement")}} là nền tảng cho mọi phần tử SVG, và giao diện {{DOMxRef("MathMLElement")}} là giao diện cơ sở cho các phần tử MathML. Phần lớn chức năng được đặc tả sâu hơn trong hệ phân cấp lớp.

Các ngôn ngữ ngoài phạm vi nền tảng Web, như XUL thông qua giao diện `XULElement`, cũng triển khai `Element`.

{{InheritanceDiagram}}

## Thuộc tính instance

_`Element` kế thừa các thuộc tính từ giao diện cha của nó, {{DOMxRef("Node")}}, và qua đó là giao diện cha của giao diện đó, {{DOMxRef("EventTarget")}}._

- {{DOMxRef("Element.assignedSlot")}} {{ReadOnlyInline}}
  - : Trả về một {{DOMxRef("HTMLSlotElement")}} đại diện cho {{htmlelement("slot")}} mà nút đang được chèn vào.
- {{DOMxRef("Element.attributes")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{DOMxRef("NamedNodeMap")}} chứa các thuộc tính đã gán của phần tử HTML tương ứng.
- {{domxref("Element.childElementCount")}} {{ReadOnlyInline}}
  - : Trả về số lượng phần tử con của phần tử này.
- {{domxref("Element.children")}} {{ReadOnlyInline}}
  - : Trả về các phần tử con của phần tử này.
- {{DOMxRef("Element.classList")}} {{ReadOnlyInline}}
  - : Trả về một {{DOMxRef("DOMTokenList")}} chứa danh sách các lớp.
- {{DOMxRef("Element.className")}}
  - : Một chuỗi biểu thị lớp của phần tử.
- {{DOMxRef("Element.clientHeight")}} {{ReadOnlyInline}}
  - : Trả về một số biểu thị chiều cao bên trong của phần tử.
- {{DOMxRef("Element.clientLeft")}} {{ReadOnlyInline}}
  - : Trả về một số biểu thị độ rộng của viền trái của phần tử.
- {{DOMxRef("Element.clientTop")}} {{ReadOnlyInline}}
  - : Trả về một số biểu thị độ rộng của viền trên của phần tử.
- {{DOMxRef("Element.clientWidth")}} {{ReadOnlyInline}}
  - : Trả về một số biểu thị chiều rộng bên trong của phần tử.
- {{DOMxRef("Element.currentCSSZoom")}} {{ReadOnlyInline}}
  - : Một số cho biết mức thu phóng hiệu lực của phần tử, hoặc 1.0 nếu phần tử không được hiển thị.
- {{DOMxRef("Element.customElementRegistry")}} {{ReadOnlyInline}}
  - : Đối tượng {{domxref("CustomElementRegistry")}} gắn với phần tử này, hoặc `null` nếu chưa được thiết lập.
- {{DOMxRef("Element.elementTiming")}} {{Experimental_Inline}}
  - : Một chuỗi phản ánh thuộc tính [`elementtiming`](/en-US/docs/Web/HTML/Reference/Attributes/elementtiming), đánh dấu một phần tử để theo dõi trong API {{domxref("PerformanceElementTiming")}}.
- {{domxref("Element.firstElementChild")}} {{ReadOnlyInline}}
  - : Trả về phần tử con đầu tiên của phần tử này.
- {{DOMxRef("Element.id")}}
  - : Một chuỗi biểu thị id của phần tử.
- {{DOMxRef("Element.innerHTML")}}
  - : Một chuỗi biểu thị markup của nội dung phần tử.
- {{domxref("Element.lastElementChild")}} {{ReadOnlyInline}}
  - : Trả về phần tử con cuối cùng của phần tử này.
- {{DOMxRef("Element.localName")}} {{ReadOnlyInline}}
  - : Một chuỗi biểu thị phần cục bộ của tên đủ điều kiện của phần tử.
- {{DOMxRef("Element.namespaceURI")}} {{ReadOnlyInline}}
  - : URI namespace của phần tử, hoặc `null` nếu không có namespace.
- {{DOMxRef("Element.nextElementSibling")}} {{ReadOnlyInline}}
  - : Một `Element`, là phần tử ngay sau phần tử đã cho trong cây, hoặc `null` nếu không có nút anh em.
- {{DOMxRef("Element.outerHTML")}}
  - : Một chuỗi biểu thị markup của phần tử, bao gồm cả nội dung. Khi dùng làm setter, nó thay thế phần tử bằng các nút được phân tích cú pháp từ chuỗi đã cho.
- {{DOMxRef("Element.part")}}
  - : Đại diện cho các định danh part của phần tử, được trả về dưới dạng một {{domxref("DOMTokenList")}}.
- {{DOMxRef("Element.prefix")}} {{ReadOnlyInline}}
  - : Một chuỗi biểu thị tiền tố namespace của phần tử, hoặc `null` nếu không có tiền tố.
- {{DOMxRef("Element.previousElementSibling")}} {{ReadOnlyInline}}
  - : Một `Element`, là phần tử ngay trước phần tử đã cho trong cây, hoặc `null` nếu không có phần tử anh em.
- {{DOMxRef("Element.scrollHeight")}} {{ReadOnlyInline}}
  - : Trả về một số biểu thị chiều cao vùng cuộn của phần tử.
- {{DOMxRef("Element.scrollLeft")}}
  - : Một số biểu thị độ lệch cuộn sang trái của phần tử.
- {{DOMxRef("Element.scrollLeftMax")}} {{Non-standard_Inline}} {{ReadOnlyInline}}
  - : Trả về một số biểu thị độ lệch cuộn trái tối đa có thể có cho phần tử.
- {{DOMxRef("Element.scrollTop")}}
  - : Một số biểu thị số pixel mà phần trên của phần tử đã được cuộn theo chiều dọc.
- {{DOMxRef("Element.scrollTopMax")}} {{Non-standard_Inline}} {{ReadOnlyInline}}
  - : Trả về một số biểu thị độ lệch cuộn trên tối đa có thể có cho phần tử.
- {{DOMxRef("Element.scrollWidth")}} {{ReadOnlyInline}}
  - : Trả về một số biểu thị chiều rộng vùng cuộn của phần tử.
- {{DOMxRef("Element.shadowRoot")}} {{ReadOnlyInline}}
  - : Trả về shadow root mở được gắn với phần tử, hoặc `null` nếu không có shadow root mở.
- {{DOMxRef("Element.slot")}}
  - : Trả về tên của slot shadow DOM mà phần tử đang được chèn vào.
- {{DOMxRef("Element.tagName")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi với tên thẻ của phần tử.

### Thuộc tính instance được bao gồm từ ARIA

_Giao diện `Element` cũng bao gồm các thuộc tính sau._

- {{domxref("Element.ariaAtomic")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-atomic`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-atomic), cho biết liệu công nghệ hỗ trợ sẽ trình bày toàn bộ hay chỉ một phần của vùng đã thay đổi dựa trên thông báo thay đổi do thuộc tính [`aria-relevant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-relevant) xác định.
- {{domxref("Element.ariaAutoComplete")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-autocomplete`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-autocomplete), cho biết việc nhập văn bản có thể kích hoạt hiển thị một hoặc nhiều dự đoán cho giá trị dự định của người dùng hay không.
- {{domxref("Element.ariaBrailleLabel")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-braillelabel`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-braillelabel), xác định nhãn chữ nổi Braille của phần tử.
- {{domxref("Element.ariaBrailleRoleDescription")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-brailleroledescription`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-brailleroledescription), xác định mô tả vai trò Braille của phần tử.
- {{domxref("Element.ariaBusy")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-busy`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-busy), cho biết một phần tử có đang được sửa đổi hay không.
- {{domxref("Element.ariaChecked")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-checked`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-checked), cho biết trạng thái "đã chọn" hiện tại của checkbox, radio button và các widget khác có trạng thái được chọn.
- {{domxref("Element.ariaColCount")}}
  - : Một chuỗi phản ánh thuộc tính [`aria-colcount`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colcount), xác định tổng số cột trong bảng, lưới, hoặc treegrid.
