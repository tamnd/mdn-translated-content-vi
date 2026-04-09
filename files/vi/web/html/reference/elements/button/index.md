---
title: "<button>: Phần tử Button"
slug: Web/HTML/Reference/Elements/button
page-type: html-element
browser-compat: html.elements.button
sidebar: htmlsidebar
---

Phần tử **`<button>`** trong [HTML](/en-US/docs/Web/HTML) là một phần tử tương tác được kích hoạt bởi người dùng bằng chuột, bàn phím, ngón tay, lệnh thoại, hoặc công nghệ hỗ trợ khác. Sau khi được kích hoạt, nó thực hiện một hành động, chẳng hạn như gửi [form](/en-US/docs/Learn_web_development/Extensions/Forms) hoặc mở hộp thoại.

Theo mặc định, các nút HTML được trình bày theo kiểu giống với nền tảng mà {{Glossary("user agent")}} chạy trên, nhưng bạn có thể thay đổi giao diện của nút bằng [CSS](/en-US/docs/Web/CSS).

{{InteractiveExample("HTML Demo: &lt;button&gt;", "tabbed-shorter")}}

```html interactive-example
<button class="favorite styled" type="button">Add to favorites</button>
```

```css interactive-example
.styled {
  border: 0;
  line-height: 2.5;
  padding: 0 20px;
  font-size: 1rem;
  text-align: center;
  color: white;
  text-shadow: 1px 1px 1px black;
  border-radius: 10px;
  background-color: tomato;
  background-image: linear-gradient(
    to top left,
    rgb(0 0 0 / 0.2),
    rgb(0 0 0 / 0.2) 30%,
    transparent
  );
  box-shadow:
    inset 2px 2px 3px rgb(255 255 255 / 0.6),
    inset -2px -2px 3px rgb(0 0 0 / 0.6);
}

.styled:hover {
  background-color: red;
}

.styled:active {
  box-shadow:
    inset -2px -2px 3px rgb(255 255 255 / 0.6),
    inset 2px 2px 3px rgb(0 0 0 / 0.6);
}
```

## Thuộc tính

Các thuộc tính của phần tử này bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- `autofocus`
  - : Thuộc tính Boolean này chỉ định rằng nút nên có [tiêu điểm](/en-US/docs/Web/API/HTMLElement/focus) nhập liệu khi trang tải. **Chỉ một phần tử trong tài liệu có thể có thuộc tính này.**

- `command`
  - : Chỉ định hành động được thực hiện trên phần tử được kiểm soát bởi `<button>` điều khiển được chỉ định qua thuộc tính `commandfor`. Các giá trị có thể:
    - `"show-modal"`
      - : Nút sẽ hiển thị {{htmlelement("dialog")}} dưới dạng modal. Nếu hộp thoại đã là modal, không có hành động nào được thực hiện. Đây là tương đương khai báo của việc gọi phương thức {{domxref("HTMLDialogElement.showModal()")}} trên phần tử `<dialog>`.
    - `"close"`
      - : Nút sẽ đóng phần tử {{htmlelement("dialog")}}.
        Nếu hộp thoại đã đóng, không có hành động nào được thực hiện.
        Đây là tương đương khai báo của việc gọi phương thức {{domxref("HTMLDialogElement.close()")}} trên phần tử `<dialog>`.
        Khi sử dụng với thuộc tính `value`, giá trị của nút sẽ được truyền như thuộc tính {{domxref("HTMLDialogElement.returnValue", "returnValue")}} của hộp thoại.
    - `"request-close"`
      - : Nút sẽ kích hoạt sự kiện {{domxref("HTMLDialogElement.cancel_event", "cancel")}} trên phần tử {{htmlelement("dialog")}} để yêu cầu trình duyệt đóng nó, tiếp theo là sự kiện {{domxref("HTMLDialogElement.close_event", "close")}}.
        Điều này khác với lệnh `close` ở chỗ các tác giả có thể gọi {{domxref("Event.preventDefault()")}} trên sự kiện `cancel` để ngăn `<dialog>` đóng.
        Nếu hộp thoại đã đóng, không có hành động nào được thực hiện.
        Đây là tương đương khai báo của việc gọi phương thức {{domxref("HTMLDialogElement.requestClose()")}} trên phần tử `<dialog>`.
        Khi sử dụng với thuộc tính `value` của nút, giá trị sẽ được truyền như thuộc tính `returnValue` của hộp thoại.
    - `"show-popover"`
      - : Nút sẽ hiển thị popover đang ẩn. Nếu bạn cố hiển thị popover đang hiển thị, không có hành động nào được thực hiện. Xem {{domxref("Popover API", "Popover API", "", "nocode")}} để biết thêm chi tiết. Điều này tương đương với việc đặt giá trị `show` cho thuộc tính [`popovertargetaction`](#popovertargetaction), và cũng cung cấp tương đương khai báo của việc gọi phương thức {{domxref("HTMLElement.showPopover()")}} trên phần tử popover.
    - `"hide-popover"`
      - : Nút sẽ ẩn popover đang hiển thị. Nếu bạn cố ẩn popover đã ẩn, không có hành động nào được thực hiện. Xem {{domxref("Popover API", "Popover API", "", "nocode")}} để biết thêm chi tiết. Điều này tương đương với việc đặt giá trị `hide` cho thuộc tính [`popovertargetaction`](#popovertargetaction), và cũng cung cấp tương đương khai báo của việc gọi phương thức {{domxref("HTMLElement.hidePopover()")}} trên phần tử popover.
    - `"toggle-popover"`
      - : Nút sẽ chuyển đổi popover giữa hiển thị và ẩn. Nếu popover đang ẩn, nó sẽ được hiển thị; nếu popover đang hiển thị, nó sẽ bị ẩn. Xem {{domxref("Popover API", "Popover API", "", "nocode")}} để biết thêm chi tiết. Điều này tương đương với việc đặt giá trị `toggle` cho thuộc tính [`popovertargetaction`](#popovertargetaction), và cũng cung cấp tương đương khai báo của việc gọi phương thức {{domxref("HTMLElement.togglePopover()")}} trên phần tử popover.
    - Giá trị tùy chỉnh
      - : Thuộc tính này có thể đại diện cho các giá trị tùy chỉnh có tiền tố là hai ký tự gạch ngang (`--`). Các nút với giá trị tùy chỉnh sẽ gửi {{domxref("CommandEvent")}} trên phần tử được kiểm soát.

- `commandfor`
  - : Biến phần tử `<button>` thành nút lệnh, kiểm soát một phần tử tương tác nhất định bằng cách phát ra lệnh được chỉ định trong thuộc tính [`command`](#command) của nút. Thuộc tính `commandfor` nhận ID của phần tử cần kiểm soát làm giá trị. Đây là phiên bản tổng quát hơn của [`popovertarget`](#popovertarget).
- [`disabled`](/en-US/docs/Web/HTML/Reference/Attributes/disabled)
  - : Thuộc tính Boolean này ngăn người dùng tương tác với nút: không thể nhấn hoặc lấy tiêu điểm.
- [`form`](/en-US/docs/Web/HTML/Reference/Attributes/form)
  - : Phần tử {{HTMLElement("form")}} cần liên kết với nút (form sở hữu của nó). Giá trị của thuộc tính này phải là `id` của `<form>` trong cùng tài liệu. (Nếu thuộc tính này không được đặt, `<button>` được liên kết với phần tử `<form>` tổ tiên của nó, nếu có.)

    Thuộc tính này cho phép bạn liên kết các phần tử `<button>` với `<form>` ở bất kỳ đâu trong tài liệu, không chỉ bên trong `<form>`. Nó cũng có thể ghi đè phần tử `<form>` tổ tiên.

- `formaction`
  - : URL xử lý thông tin được gửi bởi nút. Ghi đè thuộc tính [`action`](/en-US/docs/Web/HTML/Reference/Elements/form#action) của form sở hữu nút. Không có tác dụng nếu không có form sở hữu.
- `formenctype`
  - : Nếu nút là nút gửi (nằm trong/liên kết với `<form>` và không có `type="button"`), chỉ định cách mã hóa dữ liệu form được gửi. Các giá trị có thể:
    - `application/x-www-form-urlencoded`: Mặc định nếu thuộc tính không được sử dụng.
    - `multipart/form-data`: Được dùng để gửi các phần tử {{HTMLElement("input")}} với thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) được đặt thành `file`.
    - `text/plain`: Được chỉ định như một công cụ gỡ lỗi; không nên dùng cho việc gửi form thực tế.

    Nếu thuộc tính này được chỉ định, nó ghi đè thuộc tính [`enctype`](/en-US/docs/Web/HTML/Reference/Elements/form#enctype) của form sở hữu nút.

- `formmethod`
  - : Nếu nút là nút gửi (nằm trong/liên kết với `<form>` và không có `type="button"`), thuộc tính này chỉ định [phương thức HTTP](/en-US/docs/Web/HTTP/Reference/Methods) được dùng để gửi form. Các giá trị có thể:
    - `post`: Dữ liệu từ form được bao gồm trong nội dung yêu cầu HTTP khi gửi đến server. Sử dụng khi form chứa thông tin không nên công khai, như thông tin đăng nhập.
    - `get`: Dữ liệu form được nối vào URL `action` của form, với `?` là dấu phân cách, và URL kết quả được gửi đến server. Sử dụng phương thức này khi form [không có tác dụng phụ](/en-US/docs/Glossary/Idempotent), như các form tìm kiếm.
    - `dialog`: Phương thức này được dùng để chỉ ra rằng nút đóng [hộp thoại](/en-US/docs/Web/HTML/Reference/Elements/dialog) liên kết với nó, và không truyền dữ liệu form chút nào.

    Nếu được chỉ định, thuộc tính này ghi đè thuộc tính [`method`](/en-US/docs/Web/HTML/Reference/Elements/form#method) của form sở hữu nút.

- `formnovalidate`
  - : Nếu nút là nút gửi, thuộc tính Boolean này chỉ định rằng form không cần được [xác thực](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation) khi gửi. Nếu thuộc tính này được chỉ định, nó ghi đè thuộc tính [`novalidate`](/en-US/docs/Web/HTML/Reference/Elements/form#novalidate) của form sở hữu nút.

    Thuộc tính này cũng có sẵn trên các phần tử [`<input type="image">`](/en-US/docs/Web/HTML/Reference/Elements/input/image) và [`<input type="submit">`](/en-US/docs/Web/HTML/Reference/Elements/input/submit).

- `formtarget`
  - : Nếu nút là nút gửi, thuộc tính này là tên do tác giả định nghĩa hoặc từ khóa tiêu chuẩn có tiền tố dấu gạch dưới chỉ ra nơi hiển thị phản hồi từ việc gửi form. Đây là `name` của, hoặc từ khóa cho, _browsing context_ (tab, cửa sổ, hoặc {{HTMLElement("iframe")}}). Nếu thuộc tính này được chỉ định, nó ghi đè thuộc tính [`target`](/en-US/docs/Web/HTML/Reference/Elements/form#target) của form sở hữu nút. Các từ khóa sau có ý nghĩa đặc biệt:
    - `_self`: Tải phản hồi vào cùng browsing context hiện tại. Đây là mặc định nếu thuộc tính không được chỉ định.
    - `_blank`: Tải phản hồi vào một browsing context mới chưa được đặt tên — thường là tab hoặc cửa sổ mới, tùy thuộc vào cài đặt trình duyệt.
    - `_parent`: Tải phản hồi vào browsing context cha của trang hiện tại. Nếu không có cha, tùy chọn này hoạt động giống như `_self`.
    - `_top`: Tải phản hồi vào browsing context cấp cao nhất (tức là browsing context là tổ tiên của trang hiện tại và không có cha). Nếu không có cha, tùy chọn này hoạt động giống như `_self`.

- `interestfor` {{experimental_inline}} {{non-standard_inline}}
  - : Định nghĩa phần tử `<button>` là **invoker quan tâm**. Giá trị của nó là `id` của phần tử đích, phần tử này sẽ bị ảnh hưởng theo một cách nào đó (thường là hiển thị hoặc ẩn) khi sự quan tâm được hiển thị hoặc mất đi trên phần tử invoker (ví dụ, bằng cách di chuột vào/ra hoặc lấy/mất tiêu điểm). Xem [Sử dụng interest invokers](/en-US/docs/Web/API/Popover_API/Using_interest_invokers) để biết thêm chi tiết và ví dụ.

- `name`
  - : Tên của nút, được gửi cùng với `value` của nút như một phần của dữ liệu form, khi nút đó được dùng để gửi form.

- `popovertarget`
  - : Biến phần tử `<button>` thành nút điều khiển popover; nhận ID của phần tử popover cần kiểm soát làm giá trị. Thiết lập mối quan hệ giữa popover và nút invoker của nó bằng thuộc tính `popovertarget` có hai tác dụng hữu ích bổ sung:
    - Trình duyệt tạo mối quan hệ [`aria-details`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-details) và [`aria-expanded`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-expanded) ngầm định giữa popover và invoker, và đặt popover ở vị trí logic trong thứ tự điều hướng tiêu điểm bàn phím khi hiển thị. Điều này làm cho popover dễ tiếp cận hơn cho người dùng bàn phím và công nghệ hỗ trợ (AT) (xem thêm [Các tính năng tiếp cận popover](/en-US/docs/Web/API/Popover_API/Using#popover_accessibility_features)).
    - Trình duyệt tạo tham chiếu anchor ngầm định giữa hai phần tử, làm cho việc định vị popover tương đối với các điều khiển của chúng sử dụng [định vị anchor CSS](/en-US/docs/Web/CSS/Guides/Anchor_positioning) rất tiện lợi. Xem [Định vị anchor popover](/en-US/docs/Web/API/Popover_API/Using#popover_anchor_positioning) để biết thêm chi tiết.

- `popovertargetaction`
  - : Chỉ định hành động được thực hiện trên phần tử popover được kiểm soát bởi `<button>` điều khiển. Các giá trị có thể:
    - `"hide"`
      - : Nút sẽ ẩn popover đang hiển thị. Nếu bạn cố ẩn popover đã ẩn, không có hành động nào được thực hiện.
    - `"show"`
      - : Nút sẽ hiển thị popover đang ẩn. Nếu bạn cố hiển thị popover đang hiển thị, không có hành động nào được thực hiện.
    - `"toggle"`
      - : Nút sẽ chuyển đổi popover giữa hiển thị và ẩn. Nếu popover đang ẩn, nó sẽ được hiển thị; nếu popover đang hiển thị, nó sẽ bị ẩn. Nếu `popovertargetaction` bị bỏ qua, `"toggle"` là hành động mặc định sẽ được thực hiện bởi nút điều khiển.

- `type`
  - : Hành vi mặc định của nút. Các giá trị có thể:
    - `submit`: Nút gửi dữ liệu form đến server. Đây là mặc định nếu thuộc tính không được chỉ định cho các nút liên kết với `<form>`, hoặc nếu thuộc tính là giá trị rỗng hoặc không hợp lệ.
    - `reset`: Nút đặt lại tất cả điều khiển về giá trị ban đầu, giống như [\<input type="reset">](/en-US/docs/Web/HTML/Reference/Elements/input/reset). (Hành vi này thường làm phiền người dùng.)
    - `button`: Nút không có hành vi mặc định và mặc định không làm gì khi nhấn. Nó có thể có các script phía client lắng nghe các sự kiện của phần tử, được kích hoạt khi các sự kiện xảy ra.

- `value`
  - : Định nghĩa giá trị được liên kết với `name` của nút khi được gửi cùng dữ liệu form.
    Giá trị này được truyền đến server trong các tham số khi form được gửi bằng nút này.
    Khi được sử dụng với các lệnh `close` hoặc `request-close`, thuộc tính `value` đặt {{domxref("HTMLDialogElement.returnValue", "returnValue")}} của phần tử {{htmlelement("dialog")}} đang được kiểm soát.

## Ghi chú

Nút gửi với thuộc tính `formaction` được đặt, nhưng không có form liên kết thì không làm gì cả. Bạn phải đặt form sở hữu, bằng cách bọc nó trong `<form>` hoặc đặt thuộc tính `form` thành id của form.

Các phần tử `<button>` dễ tạo kiểu hơn nhiều so với các phần tử {{HTMLElement("input")}}. Bạn có thể thêm nội dung HTML bên trong (nghĩ đến `<i>`, `<br>`, hoặc thậm chí `<img>`), và sử dụng {{Cssxref("::after")}} và {{Cssxref("::before")}} pseudo-elements để hiển thị phức tạp.

Nếu các nút của bạn không dùng để gửi dữ liệu form đến server, hãy đảm bảo đặt thuộc tính `type` của chúng thành `button`. Nếu không, chúng sẽ cố gắng gửi dữ liệu form và tải (không tồn tại) phản hồi, có thể phá hủy trạng thái hiện tại của tài liệu.

Mặc dù `<button type="button">` không có hành vi mặc định, các trình xử lý sự kiện có thể được lập trình để kích hoạt các hành vi. Một nút được kích hoạt có thể thực hiện các hành động có thể lập trình bằng [JavaScript](/en-US/docs/Learn_web_development/Core/Scripting), chẳng hạn như xóa một mục khỏi danh sách.

Theo mặc định, các user agent tạo kiểu nút là `display: flow-root`, thiết lập một [block formatting context](/en-US/docs/Web/CSS/Guides/Display/Block_formatting_context) mới và căn giữa các con của nút cả theo chiều ngang lẫn chiều dọc miễn là chúng không tràn ra ngoài. Nếu nút được định nghĩa là flex hoặc grid container, các con sẽ hoạt động như các mục flex hoặc grid. Nút được đặt thành `display: inline` sẽ được tạo kiểu như thể giá trị được đặt thành `display: inline-block`.

## Khả năng tiếp cận

### Nút biểu tượng

Các nút chỉ hiển thị biểu tượng không có _{{glossary("accessible name")}}_. Tên có thể tiếp cận cung cấp thông tin cho công nghệ hỗ trợ, chẳng hạn như trình đọc màn hình, để truy cập khi phân tích tài liệu và tạo [cây tiếp cận](/en-US/docs/Learn_web_development/Core/Accessibility/What_is_accessibility#accessibility_apis). Công nghệ hỗ trợ sau đó sử dụng cây tiếp cận để điều hướng và thao tác nội dung trang.

Để cung cấp tên có thể tiếp cận cho nút biểu tượng, hãy đặt văn bản vào phần tử `<button>` mô tả ngắn gọn chức năng của nút.

#### Ví dụ

```html
<button name="favorite">
  <svg fill="black" viewBox="0 0 42 42">
    <path
      d="M21,1c1.081,0,5.141,12.315,6.201,13.126s13.461,1.053,13.791,2.137 c0.34,1.087-9.561,8.938-9.961,10.252c-0.409,1.307,
      3.202,13.769,2.331,14.442c-0.879,0.673-11.05-6.79-12.361-6.79 c-1.311,0-11.481,7.463-12.36,6.79c-0.871-0.674,2.739-13.136,
      2.329-14.442c-0.399-1.313-10.3-9.165-9.96-10.252 c0.33-1.084,12.731-1.326,13.791-2.137S19.91,1,21,1z"></path>
  </svg>
  Add to favorites
</button>
```

##### Kết quả

{{EmbedLiveSample('Icon buttons')}}

Nếu bạn muốn ẩn trực quan văn bản của nút, cách tiếp cận có thể truy cập là sử dụng [kết hợp các thuộc tính CSS](https://www.a11yproject.com/posts/how-to-hide-content/) để xóa nó trực quan khỏi màn hình, nhưng giữ nó có thể phân tích bởi công nghệ hỗ trợ.

Tuy nhiên, đáng lưu ý rằng để văn bản nút hiển thị có thể giúp những người có thể không quen thuộc với ý nghĩa của biểu tượng hoặc hiểu mục đích của nút. Điều này đặc biệt quan trọng đối với những người không thành thạo về công nghệ hoặc có thể có cách giải thích văn hóa khác nhau về biểu tượng mà nút sử dụng.

- [Tên có thể tiếp cận là gì? | Vispero](https://vispero.com/resources/what-is-an-accessible-name/)
- [MDN Hiểu WCAG, Giải thích Hướng dẫn 4.1](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Robust#guideline_4.1_—_compatible_maximize_compatibility_with_current_and_future_user_agents_including_assistive_technologies)
- [Hiểu Tiêu chí Thành công 4.1.2 | W3C Hiểu WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/ensure-compat-rsv.html)

### Kích thước và Khoảng cách

#### Kích thước

Các phần tử tương tác như nút nên có diện tích đủ lớn để dễ kích hoạt. Điều này giúp nhiều loại người, bao gồm người có vấn đề kiểm soát vận động và người dùng các hình thức nhập liệu không chính xác như bút cảm ứng hoặc ngón tay. Kích thước tương tác tối thiểu là 44×44 [pixel CSS](/en-US/docs/Glossary/CSS_pixel) được khuyến nghị.

- [Hiểu Tiêu chí Thành công 2.5.5: Kích thước Mục tiêu | W3C Hiểu WCAG 2.1](https://www.w3.org/WAI/WCAG21/Understanding/target-size.html)
- [Kích thước Mục tiêu và 2.5.5 | Adrian Roselli](https://adrianroselli.com/2019/06/target-size-and-2-5-5.html)
- [Kiểm tra nhanh: Mục tiêu chạm lớn - Dự án A11Y](https://www.a11yproject.com/posts/large-touch-targets/)

#### Khoảng cách

Lượng lớn nội dung tương tác — bao gồm cả nút — được đặt gần nhau về mặt trực quan nên có khoảng cách phân tách chúng. Khoảng cách này có lợi cho những người đang gặp vấn đề kiểm soát vận động, những người có thể vô tình kích hoạt nội dung tương tác sai.

Khoảng cách có thể được tạo bằng các thuộc tính CSS như {{cssxref("margin")}}.

- [Run tay và vấn đề nút khổng lồ - Axess Lab](https://axesslab.com/hand-tremors/)

### Thông tin trạng thái ARIA

Để mô tả trạng thái của nút, thuộc tính ARIA chính xác cần sử dụng là [`aria-pressed`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-pressed) chứ không phải [`aria-checked`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-checked) hay [`aria-selected`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-selected). Để tìm hiểu thêm, hãy đọc thông tin về [vai trò nút ARIA](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/button_role).

### Kiểu nút

Tốt nhất là không ghi đè vòng tiêu điểm mặc định cho các phần tử có tiêu điểm. Nếu kiểu nút bị ghi đè, điều quan trọng là **đảm bảo rằng trạng thái tiêu điểm có đủ độ tương phản** để người có điều kiện thị lực kém có thể nhận thấy và người có sự khác biệt nhận thức sẽ hiểu nó.

Lớp pseudo {{cssxref(":focus-visible")}} có thể được dùng để áp dụng kiểu cho phần tử có {{cssxref(":focus")}} chỉ khi heuristic của user agent xác định rằng tiêu điểm nên được làm nổi bật, chẳng hạn khi `<button>` nhận tiêu điểm bàn phím. Xem [:focus vs :focus-visible](/en-US/docs/Web/CSS/Reference/Selectors/:focus-visible#focus_vs_focus-visible) để biết thêm thông tin.

Tỷ lệ độ tương phản màu sắc được xác định bằng cách so sánh độ sáng của giá trị màu văn bản và nền nút với nền mà nút được đặt trên. Để đáp ứng [Hướng dẫn Khả năng Tiếp cận Nội dung Web (WCAG)](https://www.w3.org/WAI/standards-guidelines/wcag/) hiện tại, tỷ lệ 4.5:1 được yêu cầu cho nội dung văn bản và 3:1 cho văn bản lớn. (Văn bản lớn được định nghĩa là 18.66px và {{cssxref("font-weight", "bold")}} trở lên, hoặc 24px trở lên.)

- [WebAIM: Kiểm tra Độ tương phản Màu sắc](https://webaim.org/resources/contrastchecker/)
- [MDN Hiểu WCAG, Giải thích Hướng dẫn 1.4](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.4_make_it_easier_for_users_to_see_and_hear_content_including_separating_foreground_from_background)
- [Hiểu Tiêu chí Thành công 1.4.3 | W3C Hiểu WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html)

### Nhấp chuột và tiêu điểm

Việc nhấp vào `<button>` hoặc các loại nút {{HTMLElement("input")}} có khiến nó (theo mặc định) được lấy tiêu điểm hay không tùy theo trình duyệt và hệ điều hành. Hầu hết trình duyệt đều cấp tiêu điểm cho nút được nhấp, nhưng [Safari thì không, theo thiết kế](https://webkit.org/b/22261#c68).

## Ví dụ

### Tạo nút cơ bản

Ví dụ này tạo ra một nút có thể nhấp.
Thuộc tính `type="button"` đảm bảo nút không có hành vi mặc định.
Bạn có thể làm cho nút này tương tác bằng JavaScript hoặc các thuộc tính như `command` và `commandfor`.

```html
<button type="button" name="button">I'm a button</button>
```

{{ EmbedLiveSample('creating_a_basic_button', 200, 64) }}

### Sử dụng giá trị `request-close` cho thuộc tính `command`

Hộp thoại trong ví dụ này có hai nút radio kiểm soát việc hộp thoại có thể đóng hay không.
Chọn **Yes** hoặc **No**, sau đó nhấp **Request to Close** để thử đóng hộp thoại.
Nếu **Yes** được chọn, hộp thoại đóng; nếu **No** được chọn, hộp thoại vẫn mở và hiển thị thông báo.

```html
<button type="button" commandfor="mydialog" command="show-modal">
  Open Dialog
</button>
<dialog id="mydialog">
  <div class="wrapper">
    <form>
      <fieldset>
        <legend>Allow this dialog to close when requested?</legend>
        <div>
          <input type="radio" id="no" name="close" value="no" checked />
          <label for="no">No</label>
        </div>
        <div>
          <input type="radio" id="yes" name="close" value="yes" />
          <label for="yes">Yes</label>
        </div>
      </fieldset>
    </form>
    <button commandfor="mydialog" command="request-close">
      Request to Close
    </button>
    <p class="warning" hidden>You must choose "Yes" to close this dialog.</p>
  </div>
</dialog>
```

```css hidden
.warning {
  color: tomato;
}
```

```js
const dialog = document.querySelector("dialog");
const radio = document.querySelector("form").elements["close"];
const warning = document.querySelector(".warning");

dialog.addEventListener("cancel", (e) => {
  if (!e.cancelable) return;
  if (radio.value === "no") {
    warning.hidden = false;
    e.preventDefault();
  } else {
    warning.hidden = true;
  }
});
```

{{ EmbedLiveSample('using_the_request-close_value_for_the_command_attribute', 100, 200) }}

Nút **Open Dialog** mở phần tử `<dialog>` bằng `command="show-modal"`.

Nút **Request to Close** có `command="request-close"`, nhắm đến phần tử `<dialog>` bằng thuộc tính `commandfor="mydialog"`. Khi được nhấp, nó yêu cầu `<dialog>` xem nó có thể đóng hay không (không giống thuộc tính `command="close"`, sẽ đóng `<dialog>` ngay lập tức).
Điều này kiểm tra xem `<dialog>` có [`cancelable`](/en-US/docs/Web/API/Event/cancelable) hay không bằng sự kiện `cancel`.

Khi sự kiện là `cancelable`, giá trị của các nút radio được kiểm tra:

- Nếu đặt thành `yes`, hộp thoại được đóng.
- Nếu đặt thành `no`, thuộc tính `hidden` được tắt trên cảnh báo và phương thức [`preventDefault()`](/en-US/docs/Web/API/Event/preventDefault) được gọi, ngăn hành vi đóng `<dialog>` mặc định.

### Sử dụng thuộc tính `value` với lệnh `close` của hộp thoại

Ví dụ này minh họa cách sử dụng thuộc tính `value` của nút với lệnh `close` để điền giá trị thuộc tính {{domxref("HTMLDialogElement.returnValue", "returnValue")}} của hộp thoại.

Khi nút **Cancel** hoặc **Delete** được nhấp, hộp thoại đóng và đặt `returnValue` của nó thành thuộc tính `value` của nút.
Trình lắng nghe sự kiện `close` kiểm tra `dialog.returnValue` để xác định hành động người dùng đã chọn và ghi kết quả ra màn hình.

#### HTML

HTML đầu tiên định nghĩa nút **Delete Record** sử dụng thuộc tính `commandfor` để chỉ định hộp thoại cần mở.

Trong hộp thoại, các nút **Cancel** và **Delete** sử dụng thuộc tính `commandfor` để chỉ ra rằng chúng áp dụng cho hộp thoại hiện tại.
Chúng cũng đặt thuộc tính `command` thành "close" và đặt thuộc tính `value` thành "cancel" và "delete" tương ứng — giá trị của nút được chọn tự động được sao chép vào `returnValue` của hộp thoại khi nút được nhấp.

```html
<button commandfor="confirm-dialog" command="show-modal">Delete Record</button>
<dialog id="confirm-dialog">
  <header>
    <h1>Delete Record?</h1>
  </header>
  <p>Are you sure? This action cannot be undone</p>
  <footer>
    <button commandfor="confirm-dialog" command="close" value="cancel">
      Cancel
    </button>
    <button commandfor="confirm-dialog" command="close" value="delete">
      Delete
    </button>
  </footer>
</dialog>
```

```html
<pre id="log"></pre>
```

```css hidden
#log {
  height: 20px;
}
```

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = text;
}
```

#### JavaScript

Mã sử dụng trình lắng nghe sự kiện `close` để ghi `returnValue` của hộp thoại.

```js
const dialog = document.getElementById("confirm-dialog");

dialog.addEventListener("close", () => {
  switch (dialog.returnValue) {
    case "cancel":
      log("Cancel was clicked");
      break;
    case "delete":
      log("Delete was clicked");
      break;
    default:
      log("Closed with value:", dialog.returnValue);
  }
});
```

#### Kết quả

{{ EmbedLiveSample('using_the_value_attribute_with_dialog_close_command', 100, 200) }}

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories"
          >Danh mục nội dung</a
        >
      </th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >Nội dung luồng</a
        >,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung cụm từ</a
        >,
        <a
          href="/en-US/docs/Web/HTML/Guides/Content_categories#interactive_content"
          >Nội dung tương tác</a
        >,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#listed"
          >được liệt kê</a
        >,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#labelable"
          >có thể gắn nhãn</a
        >, và
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#submittable"
          >có thể gửi</a
        >
        <a
          href="/en-US/docs/Web/HTML/Guides/Content_categories#form-associated_content"
          >phần tử liên kết form</a
        >, nội dung hữu hình.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung cho phép</th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >Nội dung cụm từ</a
        >
        nhưng không được có
        <a
          href="/en-US/docs/Web/HTML/Guides/Content_categories#interactive_content"
          >Nội dung tương tác</a
        >. Nếu <code>&lt;button&gt;</code> là con đầu tiên của <a href="/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select">phần tử select có thể tùy chỉnh</a>, thì nó cũng có thể
   chứa không hoặc một phần tử {{htmlelement("selectedcontent")}}.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Không, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha cho phép</th>
      <td>
        Bất kỳ phần tử nào chấp nhận
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung cụm từ</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/button_role"
            >button</a
          ></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA cho phép</th>
      <td>
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/checkbox_role"><code>checkbox</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role"><code>combobox</code></a>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/link_role"><code>link</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitem_role"><code>menuitem</code></a>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemcheckbox_role"><code>menuitemcheckbox</code></a>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemradio_role"><code>menuitemradio</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/option_role"><code>option</code></a>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/radio_role"><code>radio</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/switch_role"><code>switch</code></a>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role"><code>tab</code></a>
      </td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLButtonElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
