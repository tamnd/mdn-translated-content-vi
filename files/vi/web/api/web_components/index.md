---
title: Web Components
slug: Web/API/Web_components
page-type: web-api-overview
browser-compat:
  - html.elements.template
  - api.ShadowRoot
---

{{DefaultAPISidebar("Web Components")}}

Web Components là một bộ công nghệ khác nhau cho phép bạn tạo các custom element có thể tái sử dụng, với chức năng được đóng gói tách biệt khỏi phần còn lại của mã, rồi dùng chúng trong các web app của bạn.

## Khái niệm và cách dùng

Là nhà phát triển, ai cũng biết rằng tái sử dụng mã nhiều nhất có thể là một ý tưởng tốt. Nhưng với các cấu trúc đánh dấu tùy biến thì việc này trước đây không hề dễ dàng - hãy nghĩ đến HTML phức tạp (và style, script đi kèm) mà đôi khi bạn phải viết để dựng các điều khiển giao diện tùy biến, và việc dùng chúng nhiều lần có thể làm trang web trở nên rối rắm nếu không cẩn thận.

Web Components hướng tới việc giải quyết những vấn đề như vậy - nó gồm ba công nghệ chính, có thể dùng cùng nhau để tạo ra các custom element linh hoạt với chức năng được đóng gói, có thể tái sử dụng ở bất cứ đâu mà không lo xung đột mã.

- **Custom elements**
  - : Một tập hợp các JavaScript API cho phép bạn định nghĩa custom element và hành vi của chúng, rồi dùng khi cần trong giao diện người dùng.
- **Shadow DOM**
  - : Một tập hợp các JavaScript API để gắn một cây DOM "shadow" được đóng gói vào một phần tử, được hiển thị tách biệt khỏi DOM tài liệu chính, đồng thời kiểm soát các chức năng liên quan. Theo cách này, bạn có thể giữ các tính năng của một phần tử ở trạng thái riêng tư, để chúng có thể được script và style mà không lo va chạm với các phần khác của tài liệu.
- **HTML templates**
  - : Các phần tử {{HTMLElement("template")}} và {{HTMLElement("slot")}} cho phép bạn viết các mẫu đánh dấu không được hiển thị trên trang đã render. Sau đó chúng có thể được tái sử dụng nhiều lần làm nền tảng cho cấu trúc của một custom element.

### Cách triển khai cơ bản

1. Tạo một class trong đó bạn chỉ định chức năng của web component, dùng cú pháp [class](/en-US/docs/Web/JavaScript/Reference/Classes).
2. Đăng ký custom element mới bằng phương thức {{domxref("CustomElementRegistry.define()")}}, truyền vào tên phần tử cần định nghĩa, class hoặc function nơi chức năng của nó được xác định, và tùy chọn là phần tử nó kế thừa từ đâu. Bạn có thể đăng ký trên global registry qua {{domxref("Window.customElements")}}, hoặc tạo một [scoped registry](/en-US/docs/Web/API/Web_components/Using_custom_elements#scoped_custom_element_registries) bằng constructor {{domxref("CustomElementRegistry.CustomElementRegistry()", "CustomElementRegistry()")}} để tránh xung đột tên giữa các component.
3. Nếu cần, gắn một shadow DOM vào custom element bằng phương thức {{domxref("Element.attachShadow()")}}. Thêm phần tử con, trình nghe sự kiện, v.v. vào shadow DOM bằng các phương thức DOM thông thường.
4. Nếu cần, định nghĩa một HTML template bằng {{htmlelement("template")}} và {{htmlelement("slot")}}. Một lần nữa, dùng các phương thức DOM thông thường để sao chép template và gắn nó vào shadow DOM.
5. Dùng custom element ở bất cứ đâu bạn muốn trên trang, giống như với bất kỳ phần tử HTML nào.

## Hướng dẫn

- [Using custom elements](/en-US/docs/Web/API/Web_components/Using_custom_elements)
  - : Hướng dẫn cho thấy cách dùng các tính năng của custom elements để tạo web component đơn giản, đồng thời xem xét các lifecycle callback và một số tính năng nâng cao khác.
- [Using shadow DOM](/en-US/docs/Web/API/Web_components/Using_shadow_DOM)
  - : Hướng dẫn về những nền tảng của shadow DOM, cho thấy cách gắn shadow DOM vào một phần tử, thêm vào cây shadow DOM, tạo style cho nó, v.v.
- [Using templates and slots](/en-US/docs/Web/API/Web_components/Using_templates_and_slots)
  - : Hướng dẫn cho thấy cách định nghĩa một cấu trúc HTML có thể tái sử dụng bằng các phần tử {{htmlelement("template")}} và {{htmlelement("slot")}}, rồi dùng cấu trúc đó bên trong web component của bạn.

## Tham chiếu

### Custom elements

- {{domxref("CustomElementRegistry")}}
  - : Chứa chức năng liên quan đến custom elements, đáng chú ý nhất là phương thức {{domxref("CustomElementRegistry.define()")}} dùng để đăng ký custom element mới để chúng có thể được dùng trong tài liệu của bạn. Constructor {{domxref("CustomElementRegistry.CustomElementRegistry()", "CustomElementRegistry()")}} có thể dùng để tạo registry theo phạm vi, và phương thức {{domxref("CustomElementRegistry.initialize()")}} gắn một scoped registry với một DOM subtree.
- {{domxref("Window.customElements")}}
  - : Trả về tham chiếu đến đối tượng `CustomElementRegistry` toàn cục.
- {{domxref("Document.customElementRegistry")}}
  - : {{domxref("CustomElementRegistry")}} gắn với tài liệu.
- {{domxref("Element.customElementRegistry")}}
  - : {{domxref("CustomElementRegistry")}} gắn với phần tử.
- [Life cycle callbacks](/en-US/docs/Web/API/Web_components/Using_custom_elements#custom_element_lifecycle_callbacks)
  - : Các hàm callback đặc biệt được định nghĩa bên trong class của custom element, ảnh hưởng đến hành vi của nó:
    - `connectedCallback()`
      - : Được gọi khi custom element lần đầu được kết nối với DOM của tài liệu.
    - `disconnectedCallback()`
      - : Được gọi khi custom element bị ngắt kết nối khỏi DOM của tài liệu.
    - `adoptedCallback()`
      - : Được gọi khi custom element được chuyển sang một tài liệu mới.
    - `attributeChangedCallback()`
      - : Được gọi khi một thuộc tính của custom element được thêm, xóa, hoặc thay đổi.

- Extensions for creating customized built-in elements
  - : Các phần mở rộng sau được định nghĩa:
    - Thuộc tính HTML toàn cục [`is`](/en-US/docs/Web/HTML/Reference/Global_attributes/is)
      - : Cho phép bạn chỉ định rằng một phần tử HTML chuẩn nên hoạt động như một customized built-in element đã đăng ký.
    - Tùy chọn "is" của phương thức {{domxref("Document.createElement()")}}
      - : Cho phép bạn tạo một thể hiện của phần tử HTML chuẩn hoạt động như một customized built-in element đã đăng ký cụ thể.

- CSS pseudo-classes
  - : Các pseudo-class liên quan riêng đến custom elements:
    - {{cssxref(":defined")}}
      - : Khớp với bất kỳ phần tử nào đã được định nghĩa, bao gồm cả phần tử dựng sẵn và custom element được định nghĩa bằng `CustomElementRegistry.define()`.
    - {{cssxref(":host")}}
      - : Chọn shadow host của [shadow DOM](/en-US/docs/Web/API/Web_components/Using_shadow_DOM) chứa CSS đang được dùng bên trong.
    - {{cssxref(":host", ":host()")}}
      - : Chọn shadow host của [shadow DOM](/en-US/docs/Web/API/Web_components/Using_shadow_DOM) chứa CSS đang được dùng bên trong (để bạn có thể chọn custom element từ bên trong shadow DOM của nó) - nhưng chỉ khi bộ chọn được truyền làm tham số của hàm khớp với shadow host.
    - {{cssxref(":host-context", ":host-context()")}}
      - : Chọn shadow host của [shadow DOM](/en-US/docs/Web/API/Web_components/Using_shadow_DOM) chứa CSS đang được dùng bên trong (để bạn có thể chọn custom element từ bên trong shadow DOM của nó) - nhưng chỉ khi bộ chọn được truyền làm tham số của hàm khớp với (các) tổ tiên của shadow host tại vị trí nó nằm trong cây DOM.
    - {{CSSxRef(":state",":state()")}}
      - : Khớp với các custom element đang ở một trạng thái tùy biến được chỉ định.
        Cụ thể hơn, nó khớp với các custom element vô danh khi trạng thái chỉ định hiện diện trong {{domxref("CustomStateSet")}} của phần tử.

- CSS pseudo-elements
  - : Các pseudo-element liên quan riêng đến custom elements:
    - {{cssxref("::part")}}
      - : Đại diện cho bất kỳ phần tử nào bên trong [shadow tree](/en-US/docs/Web/API/Web_components/Using_shadow_DOM) có thuộc tính [`part`](/en-US/docs/Web/HTML/Reference/Global_attributes/part) khớp.

### Shadow DOM

- {{domxref("ShadowRoot")}}
  - : Đại diện cho nút gốc của một shadow DOM subtree.
- {{domxref("ShadowRoot.customElementRegistry")}}
  - : {{domxref("CustomElementRegistry")}} gắn với shadow root. Có thể được đặt qua tùy chọn `customElementRegistry` của {{domxref("Element.attachShadow()")}}, hoặc sau đó bằng cách dùng {{domxref("CustomElementRegistry.initialize()")}}.
- {{domxref("Element")}} extensions
  - : Các phần mở rộng cho interface `Element` liên quan đến shadow DOM:
    - Phương thức {{domxref("Element.attachShadow()")}} gắn một cây shadow DOM vào phần tử được chỉ định.
    - Thuộc tính {{domxref("Element.shadowRoot")}} trả về shadow root gắn với phần tử được chỉ định, hoặc `null` nếu không có shadow root nào được gắn.

- Relevant {{domxref("Node")}} additions
  - : Các bổ sung cho interface `Node` liên quan đến shadow DOM:
    - Phương thức {{domxref("Node.getRootNode()")}} trả về root của đối tượng ngữ cảnh, tùy chọn bao gồm shadow root nếu nó có sẵn.
    - Thuộc tính {{domxref("Node.isConnected")}} trả về giá trị boolean cho biết Node có được kết nối hay không (trực tiếp hoặc gián tiếp) với đối tượng ngữ cảnh, ví dụ như đối tượng {{domxref("Document")}} trong trường hợp DOM bình thường, hoặc {{domxref("ShadowRoot")}} trong trường hợp shadow DOM.

- {{domxref("Event")}} extensions
  - : Các phần mở rộng cho interface `Event` liên quan đến shadow DOM:
    - {{domxref("Event.composed")}}
      - : Trả về `true` nếu sự kiện sẽ lan truyền qua ranh giới shadow DOM vào DOM chuẩn, nếu không trả về `false`.
    - {{domxref("Event.composedPath")}}
      - : Trả về đường đi của sự kiện (các đối tượng mà listener sẽ được gọi trên đó). Điều này không bao gồm các nút trong shadow tree nếu shadow root được tạo với {{domxref("ShadowRoot.mode")}} là closed.

### HTML templates

- {{htmlelement("template")}}
  - : Chứa một đoạn HTML không được render khi tài liệu chứa nó được tải lần đầu, nhưng có thể được hiển thị tại runtime bằng JavaScript, chủ yếu dùng làm nền cho cấu trúc custom element. DOM interface liên quan là {{domxref("HTMLTemplateElement")}}.
- {{htmlelement("slot")}}
  - : Một chỗ giữ chỗ bên trong web component mà bạn có thể lấp bằng đánh dấu của riêng mình, cho phép bạn tạo các cây DOM tách biệt và trình bày chúng cùng nhau. DOM interface liên quan là {{domxref("HTMLSlotElement")}}.
- Thuộc tính HTML toàn cục [`slot`](/en-US/docs/Web/HTML/Reference/Global_attributes/slot)
  - : Gán một slot trong cây shadow DOM cho một phần tử.
- {{domxref("Element.assignedSlot")}}
  - : Một thuộc tính chỉ đọc trả về tham chiếu đến {{htmlelement("slot")}} mà phần tử này được chèn vào.
- {{domxref("Text.assignedSlot")}}
  - : Một thuộc tính chỉ đọc trả về tham chiếu đến {{htmlelement("slot")}} mà nút văn bản này được chèn vào.
- {{domxref("Element")}} extensions
  - : Các phần mở rộng cho interface `Element` liên quan đến slot:
    - {{domxref("Element.slot")}}
      - : Trả về tên của slot shadow DOM gắn với phần tử.

- CSS pseudo-elements
  - : Các pseudo-element liên quan riêng đến slot:
    - {{cssxref("::slotted")}}
      - : Khớp với bất kỳ nội dung nào được chèn vào slot.

- Sự kiện {{domxref("HTMLSlotElement/slotchange_event", "slotchange")}}
  - : Được kích hoạt trên một thể hiện {{domxref("HTMLSlotElement")}} (phần tử {{htmlelement("slot")}}) khi (các) nút chứa trong slot đó thay đổi.

## Ví dụ

Chúng tôi đang xây dựng một số ví dụ trong repo GitHub [web-components-examples](https://github.com/mdn/web-components-examples). Sẽ còn thêm nữa theo thời gian.

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}
