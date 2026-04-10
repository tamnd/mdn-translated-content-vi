---
title: Document
slug: Web/API/Document
page-type: web-api-interface
browser-compat: api.Document
---

{{APIRef("DOM")}}

Giao diện **`Document`** đại diện cho bất kỳ trang web nào được tải trong trình duyệt và đóng vai trò là điểm truy cập vào nội dung của trang web, cụ thể là [cây DOM](/en-US/docs/Web/API/Document_Object_Model#what_is_a_dom_tree).

Cây DOM bao gồm các phần tử như {{HTMLElement("body")}} và {{HTMLElement("table")}}, cùng [nhiều phần tử khác](/en-US/docs/Web/HTML/Reference/Elements). Nó cung cấp các chức năng toàn cục cho tài liệu, chẳng hạn như cách lấy URL của trang và tạo các phần tử mới trong tài liệu.

{{InheritanceDiagram}}

Giao diện `Document` mô tả các thuộc tính và phương thức chung cho bất kỳ loại tài liệu nào. Tùy thuộc vào loại tài liệu (ví dụ: [HTML](/en-US/docs/Web/HTML), [XML](/en-US/docs/Web/XML), SVG, ...), một API lớn hơn sẽ khả dụng: các tài liệu HTML, được phục vụ với kiểu nội dung `"text/html"`, cũng triển khai giao diện {{DOMxRef("HTMLDocument")}}, trong khi các tài liệu XML và SVG triển khai giao diện {{DOMxRef("XMLDocument")}}.

## Constructor

- {{DOMxRef("Document.Document", "Document()")}}
  - : Tạo một đối tượng `Document` mới.

## Thuộc tính instance

_Giao diện này cũng kế thừa từ các giao diện {{DOMxRef("Node")}} và {{DOMxRef("EventTarget")}}._

- {{DOMxRef("Document.activeElement")}} {{ReadOnlyInline}}
  - : Trả về {{DOMxRef('Element')}} hiện đang có tiêu điểm.
- {{DOMxRef("Document.activeViewTransition")}} {{ReadOnlyInline}}
  - : Trả về một instance {{DOMxRef('ViewTransition')}} đại diện cho [view transition](/en-US/docs/Web/API/View_Transition_API) đang hoạt động trên tài liệu, hoặc `null` nếu không có view transition nào đang hoạt động.
- {{DOMxRef("Document.adoptedStyleSheets")}}
  - : Thêm một mảng các stylesheet đã được xây dựng để sử dụng cho tài liệu.
    Các stylesheet này cũng có thể được chia sẻ với các subtree shadow DOM của cùng một tài liệu.
- {{DOMxRef("Document.body")}}
  - : Trả về node {{HTMLElement("body")}} hoặc {{htmlelement("frameset")}} của tài liệu hiện tại.
- {{DOMxRef("Document.characterSet")}} {{ReadOnlyInline}}
  - : Trả về bộ ký tự đang được tài liệu sử dụng.
- {{domxref("Document.childElementCount")}} {{ReadOnlyInline}}
  - : Trả về số lượng phần tử con của tài liệu hiện tại.
- {{domxref("Document.children")}} {{ReadOnlyInline}}
  - : Trả về các phần tử con của tài liệu hiện tại.
- {{DOMxRef("Document.compatMode")}} {{ReadOnlyInline}}
  - : Cho biết liệu tài liệu có được hiển thị ở chế độ _quirks_ hay _strict_.
- {{DOMxRef("Document.contentType")}} {{ReadOnlyInline}}
  - : Trả về Content-Type từ MIME Header của tài liệu hiện tại.
- {{DOMxRef("Document.currentScript")}} {{ReadOnlyInline}}
  - : Trả về phần tử {{HTMLElement("script")}} có script đang được xử lý và [không phải là JavaScript module](https://github.com/whatwg/html/issues/997).
- {{DOMxRef("Document.customElementRegistry")}} {{ReadOnlyInline}}
  - : Đối tượng {{domxref("CustomElementRegistry")}} được liên kết với tài liệu này, hoặc `null` nếu chưa được thiết lập.
- {{DOMxRef("Document.doctype")}} {{ReadOnlyInline}}
  - : Trả về Document Type Definition (DTD) của tài liệu hiện tại.
- {{DOMxRef("Document.documentElement")}} {{ReadOnlyInline}}
  - : Trả về {{DOMxRef("Element")}} là phần tử con trực tiếp của tài liệu. Đối với các tài liệu HTML, đây thường là đối tượng {{DOMxRef("HTMLHtmlElement")}} đại diện cho phần tử {{HTMLElement("html")}} của tài liệu.
- {{DOMxRef("Document.documentURI")}} {{ReadOnlyInline}}
  - : Trả về vị trí của tài liệu dưới dạng chuỗi.
- {{DOMxRef("Document.embeds")}} {{ReadOnlyInline}}
  - : Trả về một {{DOMxRef("HTMLCollection")}} các phần tử {{HTMLElement('embed')}} được nhúng trong tài liệu.
- {{DOMxRef("Document.featurePolicy")}} {{Experimental_Inline}} {{ReadOnlyInline}}
  - : Trả về giao diện {{DOMxRef("FeaturePolicy")}} với các chính sách tính năng được áp dụng cho tài liệu.
- {{domxref("Document.firstElementChild")}} {{ReadOnlyInline}}
  - : Trả về phần tử con đầu tiên của tài liệu hiện tại.
- {{DOMxRef("Document.fonts")}}
  - : Trả về giao diện {{DOMxRef("FontFaceSet")}} của tài liệu hiện tại.
- {{DOMxRef("Document.forms")}} {{ReadOnlyInline}}
  - : Trả về một {{DOMxRef("HTMLCollection")}} các phần tử {{HTMLElement("form")}} trong tài liệu.
- {{DOMxRef("Document.fragmentDirective")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("FragmentDirective")}} cho tài liệu hiện tại.
- {{DOMxRef("Document.fullscreenElement")}} {{ReadOnlyInline}}
  - : Phần tử hiện đang ở chế độ toàn màn hình cho tài liệu này.
- {{DOMxRef("Document.head")}} {{ReadOnlyInline}}
  - : Trả về phần tử {{HTMLElement("head")}} của tài liệu hiện tại.
- {{DOMxRef("Document.hidden")}} {{ReadOnlyInline}}
  - : Trả về giá trị Boolean cho biết trang có được coi là ẩn hay không.
- {{DOMxRef("Document.images")}} {{ReadOnlyInline}}
  - : Trả về một {{DOMxRef("HTMLCollection")}} các hình ảnh trong tài liệu.
- {{DOMxRef("Document.implementation")}} {{ReadOnlyInline}}
  - : Trả về DOM implementation được liên kết với tài liệu hiện tại.
- {{domxref("Document.lastElementChild")}} {{ReadOnlyInline}}
  - : Trả về phần tử con cuối cùng của tài liệu hiện tại.
- {{DOMxRef("Document.links")}} {{ReadOnlyInline}}
  - : Trả về một {{DOMxRef("HTMLCollection")}} các siêu liên kết trong tài liệu.
- {{DOMxRef("Document.pictureInPictureElement")}} {{ReadOnlyInline}}
  - : Trả về {{DOMxRef('Element')}} hiện đang được trình bày ở chế độ picture-in-picture trong tài liệu này.
- {{DOMxRef("Document.pictureInPictureEnabled")}} {{ReadOnlyInline}}
  - : Trả về true nếu tính năng picture-in-picture được kích hoạt.
- {{DOMxRef("Document.plugins")}} {{ReadOnlyInline}}
  - : Trả về một {{DOMxRef("HTMLCollection")}} các plugin khả dụng.
- {{DOMxRef("Document.pointerLockElement")}} {{ReadOnlyInline}}
  - : Trả về phần tử được đặt làm mục tiêu cho các sự kiện chuột khi con trỏ bị khóa. `null` nếu khóa đang chờ, con trỏ không bị khóa, hoặc mục tiêu nằm trong tài liệu khác.
- {{DOMxRef("Document.prerendering")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Trả về giá trị boolean cho biết tài liệu có đang trong quá trình prerendering hay không, được khởi tạo thông qua [Speculation Rules API](/en-US/docs/Web/API/Speculation_Rules_API).
- {{DOMxRef("Document.scripts")}} {{ReadOnlyInline}}
  - : Trả về một {{DOMxRef("HTMLCollection")}} các phần tử {{HTMLElement("script")}} trong tài liệu.
- {{DOMxRef("Document.scrollingElement")}} {{ReadOnlyInline}}
  - : Trả về tham chiếu đến {{DOMxRef("Element")}} cuộn tài liệu.
- {{DOMxRef("Document.styleSheets")}} {{ReadOnlyInline}}
  - : Trả về một {{DOMxRef('StyleSheetList')} các đối tượng {{DOMxRef('CSSStyleSheet')}} cho các stylesheet được liên kết rõ ràng hoặc được nhúng trong tài liệu.
- {{DOMxRef("Document.timeline")}} {{ReadOnlyInline}}
  - : Trả về timeline như một instance đặc biệt của {{domxref("DocumentTimeline")}} được tự động tạo khi tải trang.
- {{DOMxRef("Document.visibilityState")}} {{ReadOnlyInline}}
  - : Trả về một `string` biểu thị trạng thái hiển thị của tài liệu. Các giá trị có thể là `visible`, `hidden` và `unloaded`.

### Các mở rộng cho HTMLDocument

_Giao diện `Document` cho các tài liệu HTML kế thừa từ giao diện {{DOMxRef("HTMLDocument")}} hoặc được mở rộng cho các tài liệu đó._

- {{DOMxRef("Document.cookie")}}
  - : Trả về danh sách các cookie được phân tách bằng dấu chấm phẩy cho tài liệu đó hoặc thiết lập một cookie duy nhất.
- {{DOMxRef("Document.defaultView")}} {{ReadOnlyInline}}
  - : Trả về tham chiếu đến đối tượng window.
- {{DOMxRef("Document.designMode")}}
  - : Lấy/thiết lập khả năng chỉnh sửa toàn bộ tài liệu.
- {{DOMxRef("Document.dir")}}
  - : Lấy/thiết lập hướng văn bản (rtl/ltr) của tài liệu.
- {{DOMxRef("Document.fullscreenEnabled")}} {{ReadOnlyInline}}
  - : Cho biết chế độ toàn màn hình có khả dụng hay không.
- {{DOMxRef("Document.lastModified")}} {{ReadOnlyInline}}
  - : Trả về ngày mà tài liệu được sửa đổi lần cuối.
- {{DOMxRef("Document.location")}} {{ReadOnlyInline}}
  - : Trả về URI của tài liệu hiện tại.
- {{DOMxRef("Document.readyState")}} {{ReadOnlyInline}}
  - : Trả về trạng thái tải của tài liệu.
- {{DOMxRef("Document.referrer")}} {{ReadOnlyInline}}
  - : Trả về URI của trang đã liên kết đến trang này.
- {{DOMxRef("Document.title")}}
  - : Thiết lập hoặc lấy tiêu đề của tài liệu hiện tại.
- {{DOMxRef("Document.URL")}} {{ReadOnlyInline}}
  - : Trả về vị trí của tài liệu dưới dạng chuỗi.
- Thuộc tính được đặt tên
  - : Một số phần tử trong tài liệu cũng được hiển thị dưới dạng thuộc tính:
    - Đối với mỗi phần tử {{HTMLElement("embed")}}, {{HTMLElement("form")}}, {{HTMLElement("iframe")}}, {{HTMLElement("img")}} và {{HTMLElement("object")}}, `name` của nó (nếu không rỗng) sẽ được hiển thị.
      Ví dụ: nếu tài liệu chứa `<form name="my_form">`, thì `document["my_form"]` (và tương đương `document.my_form`) trả về tham chiếu đến phần tử đó.
    - Đối với mỗi phần tử {{HTMLElement("object")}}, `id` của nó (nếu không rỗng) sẽ được hiển thị.
    - Đối với mỗi phần tử {{HTMLElement("img")}} có `name` không rỗng, `id` của nó (nếu không rỗng) sẽ được hiển thị.

    Nếu một thuộc tính tương ứng với một phần tử duy nhất, phần tử đó sẽ được trả về trực tiếp. Nếu phần tử duy nhất đó là một iframe, thì {{domxref("HTMLIFrameElement/contentWindow", "contentWindow")}} của nó sẽ được trả về thay thế. Nếu thuộc tính tương ứng với nhiều phần tử, thì một {{domxref("HTMLCollection")}} sẽ được trả về chứa tất cả các phần tử đó.

### Các thuộc tính đã lỗi thời

- {{DOMxRef("Document.alinkColor")}} {{Deprecated_Inline}}
  - : Trả về hoặc thiết lập màu của các liên kết đang hoạt động trong phần thân tài liệu.
- {{DOMxRef("Document.all")}} {{Deprecated_Inline}}
  - : Cung cấp quyền truy cập vào tất cả các phần tử trong tài liệu — nó trả về một {{DOMxRef('HTMLAllCollection')}} có gốc tại node tài liệu. Đây là thuộc tính không chuẩn, kế thừa và không nên sử dụng.
- {{DOMxRef("Document.anchors")}} {{Deprecated_Inline}} {{ReadOnlyInline}}
  - : Trả về danh sách tất cả các neo trong tài liệu.
- {{DOMxRef("Document.applets")}} {{Deprecated_Inline}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("HTMLCollection")}} rỗng. Thuộc tính kế thừa, trước đây trả về danh sách các applet trong tài liệu.
- {{DOMxRef("Document.bgColor")}} {{Deprecated_Inline}}
  - : Lấy/thiết lập màu nền của tài liệu hiện tại.
- {{DOMxRef("Document.characterSet","Document.charset")}} {{Deprecated_Inline}} {{ReadOnlyInline}}
  - : Bí danh của {{DOMxRef("Document.characterSet")}}. Sử dụng thuộc tính này thay thế.
- {{DOMxRef("Document.domain")}} {{Deprecated_Inline}}
  - : Lấy/thiết lập miền của tài liệu hiện tại.
- {{DOMxRef("Document.fgColor")}} {{Deprecated_Inline}}
  - : Lấy/thiết lập màu nền trước, hoặc màu văn bản, của tài liệu hiện tại.
- {{DOMxRef("Document.fullscreen")}} {{Deprecated_Inline}}
  - : Trả về `true` khi tài liệu đang ở [chế độ toàn màn hình](/en-US/docs/Web/API/Fullscreen_API).
- {{DOMxRef("Document.characterSet", "Document.inputEncoding")}} {{Deprecated_Inline}} {{ReadOnlyInline}}
  - : Bí danh của {{DOMxRef("Document.characterSet")}}. Sử dụng thuộc tính này thay thế.
- {{DOMxRef("Document.lastStyleSheetSet")}} {{Deprecated_Inline}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Trả về tên của bộ stylesheet được kích hoạt lần cuối. Có giá trị `null` cho đến khi bộ stylesheet được thay đổi bằng cách thiết lập giá trị của {{DOMxRef("Document.selectedStyleSheetSet","selectedStyleSheetSet")}}.
- {{DOMxRef("Document.linkColor")}} {{Deprecated_Inline}}
  - : Lấy/thiết lập màu của các siêu liên kết trong tài liệu.
- {{DOMxRef("Document.preferredStyleSheetSet")}} {{Deprecated_Inline}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Trả về bộ stylesheet ưa thích như được chỉ định bởi tác giả trang.
- {{DOMxRef("Document.rootElement")}} {{Deprecated_Inline}}
  - : Giống như {{DOMxRef("Document.documentElement")}}, nhưng chỉ dành cho các phần tử gốc {{SVGElement("svg")}}. Sử dụng thuộc tính này thay thế.
- {{DOMxRef("Document.selectedStyleSheetSet")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Trả về bộ stylesheet nào đang được sử dụng.
- {{DOMxRef("Document.styleSheetSets")}} {{Deprecated_Inline}} {{ReadOnlyInline}} {{Non-standard_Inline}}
  - : Trả về danh sách các bộ stylesheet khả dụng trên tài liệu.
- {{DOMxRef("Document.vlinkColor")}} {{Deprecated_Inline}}
  - : Lấy/thiết lập màu của các siêu liên kết đã truy cập.
- {{DOMxRef("Document.xmlEncoding")}} {{Deprecated_Inline}}
  - : Trả về mã hóa như được xác định bởi khai báo XML.
- `Document.xmlStandalone` {{Deprecated_Inline}}
  - : Trả về `true` nếu khai báo XML chỉ định tài liệu là standalone (_ví dụ,_ một phần bên ngoài của DTD ảnh hưởng đến nội dung của tài liệu), ngược lại `false`.
- {{DOMxRef("Document.xmlVersion")}} {{Deprecated_Inline}}
  - : Trả về số phiên bản như được chỉ định trong khai báo XML hoặc `"1.0"` nếu khai báo vắng mặt.

## Phương thức instance

_Giao diện này cũng kế thừa từ các giao diện {{DOMxRef("Node")}} và {{DOMxRef("EventTarget")}}._

- {{DOMxRef("Document.adoptNode()")}}
  - : Nhận node từ tài liệu bên ngoài.
- {{DOMxRef("Document.append()")}}
  - : Chèn một tập hợp các đối tượng {{domxref("Node")}} hoặc chuỗi sau phần tử con cuối cùng của tài liệu.
- {{DOMxRef("Document.ariaNotify()")}} {{Experimental_Inline}}
  - : Chỉ định rằng một chuỗi văn bản nhất định sẽ được trình đọc màn hình thông báo.
- {{DOMxRef("Document.browsingTopics()")}} {{non-standard_inline}} {{deprecated_inline}}
  - : Trả về một promise sẽ được đáp ứng với một mảng các đối tượng đại diện cho các chủ đề hàng đầu cho người dùng, một chủ đề từ mỗi ba epoch gần nhất. Theo mặc định, phương thức này cũng khiến trình duyệt ghi lại lượt truy cập trang hiện tại do người gọi quan sát, vì vậy tên máy chủ của trang có thể được sử dụng sau này trong tính toán chủ đề. Xem [Topics API](/en-US/docs/Web/API/Topics_API) để biết thêm chi tiết.
- `Document.captureEvents()` {{Deprecated_Inline}}
  - : Xem {{DOMxRef("Window.captureEvents")}}.
- {{DOMxRef("Document.caretPositionFromPoint()")}}
  - : Trả về một đối tượng {{DOMxRef('CaretPosition')}} chứa node DOM chứa con trỏ và offset ký tự của con trỏ trong node đó.
- {{DOMxRef("Document.caretRangeFromPoint()")}} {{Non-standard_Inline}}
  - : Lấy một đối tượng {{DOMxRef("Range")} cho fragment tài liệu dưới các tọa độ đã chỉ định.
- {{DOMxRef("Document.createAttribute()")}}
  - : Tạo một đối tượng {{DOMxRef("Attr")}} mới và trả về nó.
- {{DOMxRef("Document.createAttributeNS()")}}
  - : Tạo một node thuộc tính mới trong namespace đã cho và trả về nó.
- {{DOMxRef("Document.createCDATASection()")}}
  - : Tạo một node CDATA mới và trả về nó.
- {{DOMxRef("Document.createComment()")}}
  - : Tạo một node chú thích mới và trả về nó.
- {{DOMxRef("Document.createDocumentFragment()")}}
  - : Tạo một fragment tài liệu mới.
- {{DOMxRef("Document.createElement()")}}
  - : Tạo một phần tử mới với tên tag đã cho.
- {{DOMxRef("Document.createElementNS()")}}
  - : Tạo một phần tử mới với tên tag và URI namespace đã cho.
- {{DOMxRef("Document.createEvent()")}} {{deprecated_inline}}
  - : Tạo một đối tượng sự kiện.
- {{DOMxRef("Document.createNodeIterator()")}}
  - : Tạo một đối tượng {{DOMxRef("NodeIterator")}}.
- {{DOMxRef("Document.createProcessingInstruction()")}}
  - : Tạo một đối tượng {{DOMxRef("ProcessingInstruction")}} mới.
- {{DOMxRef("Document.createRange()")}}
  - : Tạo một đối tượng {{DOMxRef("Range")}}.
- {{DOMxRef("Document.createTextNode()")}}
  - : Tạo một node văn bản.
- {{DOMxRef("Document.createTouch()")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Tạo một đối tượng {{DOMxRef("Touch")}}.
- {{DOMxRef("Document.createTouchList()")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Tạo một đối tượng {{DOMxRef("TouchList")}}.
- {{DOMxRef("Document.createTreeWalker()")}}
  - : Tạo một đối tượng {{DOMxRef("TreeWalker")}}.
- {{DOMxRef("Document.elementFromPoint()")}}
  - : Trả về phần tử trên cùng tại các tọa độ đã chỉ định.
- {{DOMxRef("Document.elementsFromPoint()")}}
  - : Trả về một mảng tất cả các phần tử tại các tọa độ đã chỉ định.
- {{DOMxRef("Document.enableStyleSheetsForSet()")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Kích hoạt các stylesheet cho bộ stylesheet đã chỉ định.
- {{DOMxRef("Document.exitFullscreen()")}}
  - : Ngừng hiển thị toàn màn hình của phần tử toàn màn hình của tài liệu.
- {{DOMxRef("Document.exitPictureInPicture()")}}
  - : Đưa video từ cửa sổ picture-in-picture nổi trở lại vùng chứa ban đầu của nó.
- {{DOMxRef("Document.exitPointerLock()")}}
  - : Giải tỏa khóa con trỏ.
- {{DOMxRef("Document.getAnimations()")}}
  - : Trả về một mảng tất cả các đối tượng {{DOMxRef("Animation")}} hiện đang có hiệu lực, có các phần tử mục tiêu là hậu duệ của `document`.
- `Document.getBoxQuads()` {{Experimental_Inline}}
  - : Trả về danh sách các đối tượng {{domxref("DOMQuad")}} đại diện cho các fragment CSS của node.
- {{DOMxRef("Document.getElementById", "Document.getElementById()")}}
  - : Trả về tham chiếu đối tượng đến phần tử được xác định.
- {{DOMxRef("Document.getElementsByClassName()")}}
  - : Trả về danh sách các phần tử có tên class đã cho.
- {{DOMxRef("Document.getElementsByTagName()")}}
  - : Trả về danh sách các phần tử có tên tag đã cho.
- {{DOMxRef("Document.getElementsByTagNameNS()")}}
  - : Trả về danh sách các phần tử có tên tag và namespace đã cho.
- {{DOMxRef("Document.getSelection()")}}
  - : Trả về một đối tượng {{DOMxRef('Selection')}} đại diện cho phạm vi văn bản được người dùng chọn, hoặc vị trí hiện tại của con trỏ.
- {{domxref("Document.hasPrivateToken()")}} {{experimental_inline}}
  - : Trả về một promise sẽ được đáp ứng với giá trị boolean cho biết trình duyệt có lưu trữ [private state token](/en-US/docs/Web/API/Private_State_Token_API) từ một issuer cụ thể hay không.
- {{domxref("Document.hasRedemptionRecord()")}} {{experimental_inline}}
  - : Trả về một promise sẽ được đáp ứng với giá trị boolean cho biết trình duyệt có [redemption record](/en-US/docs/Web/API/Private_State_Token_API/Using#redeeming_tokens) bắt nguồn từ một issuer cụ thể hay không.
- {{DOMxRef("Document.hasStorageAccess()")}}
  - : Trả về một {{jsxref("Promise")}} sẽ được phân giải với giá trị boolean cho biết tài liệu có quyền truy cập vào cookie không phân vùng hay không.
- {{DOMxRef("Document.hasUnpartitionedCookieAccess()")}}
  - : Tên mới cho {{DOMxRef("Document.hasStorageAccess()")}}.
- {{DOMxRef("Document.importNode()")}}
  - : Trả về bản sao của node từ tài liệu bên ngoài.
- {{DOMxRef("Document.moveBefore()")}}
  - : Di chuyển một {{domxref("Node")}} đã cho bên trong node DOM `Document` như một phần tử con trực tiếp, trước một node tham chiếu đã cho, mà không cần xóa và chèn lại node.
- {{DOMxRef("Document.mozSetImageElement()")}} {{Non-standard_Inline}}
  - : Cho phép bạn thay đổi phần tử đang được sử dụng làm hình nền cho một ID phần tử đã chỉ định.
- {{DOMxRef("Document.prepend()")}}
  - : Chèn một tập hợp các đối tượng {{domxref("Node")}} hoặc chuỗi trước phần tử con đầu tiên của tài liệu.
- {{DOMxRef("Document.querySelector()")}}
  - : Trả về phần tử Element đầu tiên trong tài liệu, theo thứ tự tài liệu, khớp với các bộ chọn đã chỉ định.
- {{DOMxRef("Document.querySelectorAll()")}}
  - : Trả về danh sách tất cả các phần tử Element trong tài liệu khớp với các bộ chọn đã chỉ định.
- {{DOMxRef("Document.releaseCapture()")}} {{Non-standard_Inline}}
  - : Giải phóng capture chuột hiện tại nếu nó đang trên một phần tử trong tài liệu này.
- `Document.releaseEvents()` {{Deprecated_Inline}}
  - : Xem {{DOMxRef("Window.releaseEvents()")}}.
- {{DOMxRef("Document.replaceChildren()")}}
  - : Thay thế các phần tử con hiện có của tài liệu bằng một tập hợp các phần tử con mới đã chỉ định.
- {{DOMxRef("Document.requestStorageAccess()")}}
  - : Cho phép tài liệu được tải trong ngữ cảnh của bên thứ ba (ví dụ: được nhúng trong một {{htmlelement("iframe")}}) yêu cầu truy cập vào cookie không phân vùng, trong trường hợp các trình duyệt mặc định chặn truy cập vào cookie không phân vùng bởi các trang được tải trong ngữ cảnh của bên thứ ba để cải thiện quyền riêng tư.
- {{DOMxRef("Document.requestStorageAccessFor()")}} {{deprecated_inline}}
  - : Cho phép các trang cấp cao nhất yêu cầu truy cập cookie của bên thứ ba thay mặt cho nội dung nhúng có nguồn gốc từ trang khác trong cùng [related website set](/en-US/docs/Web/API/Storage_Access_API/Related_website_sets).
- {{domxref("Document.startViewTransition()")}}
  - : Bắt đầu một {{domxref("View Transition API", "view transition", "", "nocode")}} mới và trả về một đối tượng {{domxref("ViewTransition")}} để đại diện cho nó.

Giao diện `Document` được mở rộng với giao diện {{DOMxRef("XPathEvaluator")}}:

- {{DOMxRef("Document.createExpression()")}}
  - : Biên dịch một [`XPathExpression`](/en-US/docs/Web/API/XPathExpression) sau đó có thể được sử dụng cho các đánh giá (lặp lại).
- {{DOMxRef("Document.createNSResolver()")}} {{deprecated_inline}}
  - : Trả về node đầu vào như hiện có.
- {{DOMxRef("Document.evaluate()")}}
  - : Đánh giá một biểu thức XPath.

### Mở rộng cho các tài liệu HTML

Giao diện `Document` cho các tài liệu HTML kế thừa từ giao diện {{DOMxRef("HTMLDocument")}} hoặc được mở rộng cho các tài liệu đó:

- {{DOMxRef("Document.clear()")}} {{Deprecated_Inline}}
  - : Phương thức này không làm gì cả.
- {{DOMxRef("Document.close()")}}
  - : Đóng stream tài liệu để ghi.
- {{DOMxRef("Document.execCommand()")}} {{Deprecated_Inline}}
  - : Trên tài liệu có thể chỉnh sửa, thực thi lệnh định dạng.
- {{DOMxRef("Document.getElementsByName()")}}
  - : Trả về danh sách các phần tử có tên đã cho.
- {{DOMxRef("Document.hasFocus()")}}
  - : Trả về `true` nếu tiêu điểm hiện đang nằm ở bất kỳ đâu bên trong tài liệu đã chỉ định.
- {{DOMxRef("Document.open()")}}
  - : Mở stream tài liệu để ghi.
- {{DOMxRef("Document.queryCommandEnabled()")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Trả về true nếu lệnh định dạng có thể được thực thi trên phạm vi hiện tại.
- `Document.queryCommandIndeterm()` {{Deprecated_Inline}}
  - : Trả về true nếu lệnh định dạng đang ở trạng thái không xác định trên phạm vi hiện tại.
- {{DOMxRef("Document.queryCommandState()")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Trả về true nếu lệnh định dạng đã được thực thi trên phạm vi hiện tại.
- {{DOMxRef("Document.queryCommandSupported()")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Trả về true nếu lệnh định dạng được hỗ trợ trên phạm vi hiện tại.
- `Document.queryCommandValue()` {{Deprecated_Inline}}
  - : Trả về giá trị hiện tại của phạm vi hiện tại cho lệnh định dạng.
- {{DOMxRef("Document.write()")}} {{deprecated_inline}}
  - : Ghi văn bản vào tài liệu.
- {{DOMxRef("Document.writeln()")}} {{deprecated_inline}}
  - : Ghi một dòng văn bản vào tài liệu.

## Phương thức static

_Giao diện này cũng kế thừa từ các giao diện {{DOMxRef("Node")}} và {{DOMxRef("EventTarget")}}._

- {{domxref("Document/parseHTML_static", "Document.parseHTML()")}} {{experimental_inline}}
  - : Tạo một đối tượng `Document` mới từ chuỗi HTML theo cách an toàn với XSS kèm theo sanitization.
- {{domxref("Document/parseHTMLUnsafe_static", "Document.parseHTMLUnsafe()")}}
  - : Tạo một đối tượng `Document` mới từ chuỗi HTML mà không thực hiện sanitization.
    Chuỗi có thể chứa các shadow root khai báo.

## Sự kiện

Lắng nghe các sự kiện này bằng cách sử dụng `addEventListener()` hoặc bằng cách gán một trình lắng nghe sự kiện cho thuộc tính `oneventname` của giao diện này. Ngoài các sự kiện được liệt kê dưới đây, nhiều sự kiện có thể nổi bọt từ {{domxref("Node", "nodes", "", "nocode")}} chứa trong cây tài liệu.

- {{DOMxRef("Document.afterscriptexecute_event", "afterscriptexecute")}} {{Non-standard_Inline}} {{deprecated_inline}}
  - : Được kích hoạt khi phần tử {{HTMLElement("script")}} tĩnh hoàn thành thực thi script của nó
- {{DOMxRef("Document.beforescriptexecute_event", "beforescriptexecute")}} {{Non-standard_Inline}} {{deprecated_inline}}
  - : Được kích hoạt khi một {{HTMLElement("script")}} tĩnh sắp bắt đầu thực thi.
- {{domxref("Document.prerenderingchange_event", "prerenderingchange")}} {{experimental_inline}}
  - : Được kích hoạt trên tài liệu được prerender khi nó được kích hoạt (tức là người dùng xem trang).
- {{DOMxRef("Document.securitypolicyviolation_event", "securitypolicyviolation")}}
  - : Được kích hoạt khi chính sách bảo mật nội dung bị vi phạm.
- {{DOMxRef("Document/visibilitychange_event", "visibilitychange")}}
  - : Được kích hoạt khi nội dung của một tab đã trở nên hiển thị hoặc đã bị ẩn.

### Các sự kiện toàn màn hình

- {{DOMxRef("Document/fullscreenchange_event", "fullscreenchange")}}
  - : Được kích hoạt khi `Document` chuyển vào hoặc ra khỏi chế độ [toàn màn hình](/en-US/docs/Web/API/Fullscreen_API/Guide).
- {{DOMxRef("Document/fullscreenerror_event", "fullscreenerror")}}
  - : Được kích hoạt nếu xảy ra lỗi khi cố gắng chuyển vào hoặc ra khỏi chế độ [toàn màn hình](/en-US/docs/Web/API/Fullscreen_API/Guide).

### Các sự kiện tải & dỡ tải

- {{DOMxRef("Document/DOMContentLoaded_event", "DOMContentLoaded")}}
  - : Được kích hoạt khi tài liệu đã được tải và phân tích cú pháp hoàn toàn, mà không chờ các stylesheet, hình ảnh và subframe tải xong.
- {{DOMxRef("Document/readystatechange_event", "readystatechange")}}
  - : Được kích hoạt khi thuộc tính {{DOMxRef("Document/readyState", "readyState")}} của tài liệu thay đổi.

### Các sự kiện khóa con trỏ

- {{DOMxRef("Document/pointerlockchange_event", "pointerlockchange")}}
  - : Được kích hoạt khi con trỏ được khóa/mở khóa.
- {{DOMxRef("Document/pointerlockerror_event", "pointerlockerror")}}
  - : Được kích hoạt khi việc khóa con trỏ thất bại.

### Các sự kiện cuộn

- {{DOMxRef("Document/scroll_event", "scroll")}}
  - : Được kích hoạt khi chế độ xem tài liệu hoặc một phần tử đã được cuộn.
- {{DOMxRef("Document/scrollend_event", "scrollend")}}
  - : Được kích hoạt khi chế độ xem tài liệu hoặc một phần tử đã hoàn tất cuộn.
- {{domxref("Document/scrollsnapchange_event", "scrollsnapchange")}} {{experimental_inline}}
  - : Được kích hoạt trên vùng chứa cuộn khi kết thúc thao tác cuộn khi một mục snap cuộn mới đã được chọn.
- {{domxref("Document/scrollsnapchanging_event", "scrollsnapchanging")}} {{experimental_inline}}
  - : Được kích hoạt trên vùng chứa cuộn khi trình duyệt xác định một mục snap cuộn mới đang chờ, tức là nó sẽ được chọn khi cử chỉ cuộn hiện tại kết thúc.

### Các sự kiện chọn văn bản

- {{DOMxRef("Document/selectionchange_event", "selectionchange")}}
  - : Được kích hoạt khi lựa chọn văn bản hiện tại trên tài liệu thay đổi.

### Các sự kiện nổi bọt

Không phải tất cả các sự kiện nổi bọt đều có thể đến được đối tượng `Document`. Chỉ những sự kiện sau mới có thể và có thể được lắng nghe trên đối tượng `Document`:

- `abort`
- {{domxref("Element/auxclick_event", "auxclick")}}
- {{domxref("Element/beforeinput_event", "beforeinput")}}
- {{domxref("Element/beforematch_event", "beforematch")}}
- {{domxref("HTMLElement/beforetoggle_event", "beforetoggle")}}
- {{domxref("Element/blur_event", "blur")}}
- `cancel`
- {{domxref("HTMLMediaElement/canplay_event", "canplay")}}
- {{domxref("HTMLMediaElement/canplaythrough_event", "canplaythrough")}}
- {{domxref("HTMLElement/change_event", "change")}}
- {{domxref("Element/click_event", "click")}}
- {{domxref("HTMLDialogElement/close_event", "close")}}
- {{domxref("HTMLCanvasElement/contextlost_event", "contextlost")}}
- {{domxref("Element/contextmenu_event", "contextmenu")}}
- {{domxref("HTMLCanvasElement/contextrestored_event", "contextrestored")}}
- {{domxref("Element/copy_event", "copy")}}
- {{domxref("HTMLTrackElement/cuechange_event", "cuechange")}}
- {{domxref("Element/cut_event", "cut")}}
- {{domxref("Element/dblclick_event", "dblclick")}}
- {{domxref("HTMLElement/drag_event", "drag")}}
- {{domxref("HTMLElement/dragend_event", "dragend")}}
- {{domxref("HTMLElement/dragenter_event", "dragenter")}}
- {{domxref("HTMLElement/dragleave_event", "dragleave")}}
- {{domxref("HTMLElement/dragover_event", "dragover")}}
- {{domxref("HTMLElement/dragstart_event", "dragstart")}}
- {{domxref("HTMLElement/drop_event", "drop")}}
- {{domxref("HTMLMediaElement/durationchange_event", "durationchange")}}
- {{domxref("HTMLMediaElement/emptied_event", "emptied")}}
- {{domxref("HTMLMediaElement/ended_event", "ended")}}
- {{domxref("HTMLElement/error_event", "error")}}
- {{domxref("Element/focus_event", "focus")}}
- {{domxref("HTMLFormElement/formdata_event", "formdata")}}
- {{domxref("Element/input_event", "input")}}
- {{domxref("HTMLInputElement/invalid_event", "invalid")}}
- {{domxref("Element/keydown_event", "keydown")}}
- {{domxref("Element/keypress_event", "keypress")}}
- {{domxref("Element/keyup_event", "keyup")}}
- {{domxref("HTMLElement/load_event", "load")}}
- {{domxref("HTMLMediaElement/loadeddata_event", "loadeddata")}}
- {{domxref("HTMLMediaElement/loadedmetadata_event", "loadedmetadata")}}
- {{domxref("HTMLMediaElement/loadstart_event", "loadstart")}}
- {{domxref("Element/mousedown_event", "mousedown")}}
- {{domxref("Element/mouseenter_event", "mouseenter")}}
- {{domxref("Element/mouseleave_event", "mouseleave")}}
- {{domxref("Element/mousemove_event", "mousemove")}}
- {{domxref("Element/mouseout_event", "mouseout")}}
- {{domxref("Element/mouseover_event", "mouseover")}}
- {{domxref("Element/mouseup_event", "mouseup")}}
- {{domxref("Element/paste_event", "paste")}}
- {{domxref("HTMLMediaElement/pause_event", "pause")}}
- {{domxref("HTMLMediaElement/play_event", "play")}}
- {{domxref("HTMLMediaElement/playing_event", "playing")}}
- {{domxref("HTMLMediaElement/progress_event", "progress")}}
- {{domxref("HTMLMediaElement/ratechange_event", "ratechange")}}
- {{domxref("HTMLFormElement/reset_event", "reset")}}
- {{domxref("HTMLVideoElement/resize_event", "resize")}}
- {{domxref("Element/scroll_event", "scroll")}}
- {{domxref("Element/scrollend_event", "scrollend")}}
- {{domxref("Element/securitypolicyviolation_event", "securitypolicyviolation")}}
- {{domxref("HTMLMediaElement/seeked_event", "seeked")}}
- {{domxref("HTMLMediaElement/seeking_event", "seeking")}}
- {{domxref("HTMLInputElement/select_event", "select")}}
- {{domxref("HTMLSlotElement/slotchange_event", "slotchange")}}
- {{domxref("HTMLMediaElement/stalled_event", "stalled")}}
- {{domxref("HTMLFormElement/submit_event", "submit")}}
- {{domxref("HTMLMediaElement/suspend_event", "suspend")}}
- {{domxref("HTMLMediaElement/timeupdate_event", "timeupdate")}}
- {{domxref("HTMLElement/toggle_event", "toggle")}}
- {{domxref("HTMLMediaElement/volumechange_event", "volumechange")}}
- {{domxref("HTMLMediaElement/waiting_event", "waiting")}}
- {{domxref("Element/wheel_event", "wheel")}}

## Các đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
