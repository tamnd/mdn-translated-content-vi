---
title: Thuộc tính toàn cục
slug: Web/HTML/Reference/Global_attributes
page-type: landing-page
browser-compat: html.global_attributes
sidebar: htmlsidebar
---

**Thuộc tính toàn cục** là các thuộc tính chung cho tất cả các phần tử HTML; chúng có thể được dùng trên tất cả các phần tử, mặc dù chúng có thể không có hiệu lực trên một số phần tử.

Thuộc tính toàn cục có thể được chỉ định trên tất cả [các phần tử HTML](/en-US/docs/Web/HTML/Reference/Elements), _ngay cả những phần tử không được chỉ định trong tiêu chuẩn_. Điều đó có nghĩa là bất kỳ phần tử không chuẩn nào cũng phải cho phép các thuộc tính này, mặc dù việc dùng các phần tử đó có nghĩa là tài liệu không còn tuân thủ HTML5. Ví dụ, các trình duyệt tuân thủ HTML5 ẩn nội dung được đánh dấu là `<foo hidden>…</foo>`, mặc dù `<foo>` không phải là phần tử HTML hợp lệ.

Ngoài các thuộc tính toàn cục HTML cơ bản, các thuộc tính toàn cục sau cũng tồn tại:

- `xml:lang` và `xml:base` — được kế thừa từ các đặc tả XHTML và không được dùng nữa, nhưng vẫn được giữ cho mục đích tương thích.
- Thuộc tính ARIA [`role`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles) và nhiều trạng thái và thuộc tính [`aria-*`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes), được dùng để đảm bảo khả năng tiếp cận.
- [Các thuộc tính xử lý sự kiện](#list_of_global_event_handler_attributes) được liệt kê bên dưới.

## Danh sách thuộc tính toàn cục

- [`accesskey`](/en-US/docs/Web/HTML/Reference/Global_attributes/accesskey)
  - : Cung cấp gợi ý để tạo phím tắt bàn phím cho phần tử hiện tại. Thuộc tính này bao gồm danh sách các ký tự được phân tách bằng dấu cách. Trình duyệt nên dùng ký tự đầu tiên tồn tại trong bố cục bàn phím của máy tính.
- [`anchor`](/en-US/docs/Web/HTML/Reference/Global_attributes/anchor) {{non-standard_inline}}
  - : Liên kết một phần tử được định vị với một phần tử neo. Giá trị của thuộc tính là giá trị [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) của phần tử bạn muốn neo phần tử được định vị vào. Phần tử sau đó có thể được định vị [bằng cách dùng định vị neo CSS](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using).
- [`autocapitalize`](/en-US/docs/Web/HTML/Reference/Global_attributes/autocapitalize)
  - : Kiểm soát liệu văn bản được nhập có tự động viết hoa hay không và nếu có thì theo cách nào.
- [`autocorrect`](/en-US/docs/Web/HTML/Reference/Global_attributes/autocorrect)
  - : Kiểm soát liệu văn bản đầu vào có tự động được sửa lỗi chính tả hay không.
    Điều này có thể được áp dụng cho các phần tử có văn bản có thể chỉnh sửa ngoại trừ các phần tử {{HTMLElement("input")}} với thuộc tính: [`type="password"`](/en-US/docs/Web/HTML/Reference/Elements/input/password), [`type="email"`](/en-US/docs/Web/HTML/Reference/Elements/input/email), hoặc [`type="url"`](/en-US/docs/Web/HTML/Reference/Elements/input/url).
- [`autofocus`](/en-US/docs/Web/HTML/Reference/Global_attributes/autofocus)
  - : Cho biết rằng một phần tử sẽ được lấy tiêu điểm khi tải trang, hoặc ngay khi {{HTMLElement("dialog")}} mà nó thuộc về được hiển thị. Thuộc tính này là boolean, ban đầu là false.
- [`class`](/en-US/docs/Web/HTML/Reference/Global_attributes/class)
  - : Danh sách các lớp của phần tử, được phân tách bằng dấu cách. Các lớp cho phép CSS và JavaScript chọn và truy cập các phần tử cụ thể qua [bộ chọn lớp](/en-US/docs/Web/CSS/Reference/Selectors/Class_selectors) hoặc các hàm như phương thức {{DOMxRef("Document.getElementsByClassName()")}}.
- [`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable)
  - : Thuộc tính [enumerated](/en-US/docs/Glossary/Enumerated) cho biết nếu phần tử có thể được chỉnh sửa bởi người dùng. Nếu có, trình duyệt sẽ sửa đổi widget của nó để cho phép chỉnh sửa. Thuộc tính phải nhận một trong các giá trị sau:
    - `true` hoặc _chuỗi rỗng_, cho biết rằng phần tử phải có thể chỉnh sửa;
    - `false`, cho biết rằng phần tử không được chỉnh sửa.
    - `plaintext-only`, cho biết văn bản thô của phần tử có thể chỉnh sửa, nhưng định dạng văn bản phong phú bị tắt.

- [`data-*`](/en-US/docs/Web/HTML/Reference/Global_attributes/data-*)
  - : Tạo thành một lớp thuộc tính, được gọi là thuộc tính dữ liệu tùy chỉnh, cho phép trao đổi thông tin độc quyền giữa [HTML](/en-US/docs/Web/HTML) và biểu diễn {{glossary("DOM")}} của nó mà có thể được dùng bởi các script. Tất cả dữ liệu tùy chỉnh như vậy có thể truy cập qua giao diện {{DOMxRef("HTMLElement")}} của phần tử mà thuộc tính được đặt trên. Thuộc tính {{DOMxRef("HTMLElement.dataset")}} cung cấp quyền truy cập vào chúng.
- [`dir`](/en-US/docs/Web/HTML/Reference/Global_attributes/dir)
  - : Thuộc tính enumerated cho biết hướng của văn bản trong phần tử. Nó có thể có các giá trị sau:
    - `ltr`, có nghĩa là _từ trái sang phải_ và được dùng cho các ngôn ngữ được viết từ trái sang phải (như tiếng Anh);
    - `rtl`, có nghĩa là _từ phải sang trái_ và được dùng cho các ngôn ngữ được viết từ phải sang trái (như tiếng Ả Rập);
    - `auto`, để user agent tự quyết định. Nó dùng thuật toán cơ bản khi phân tích cú pháp các ký tự bên trong phần tử cho đến khi tìm thấy ký tự có hướng mạnh, sau đó áp dụng hướng đó cho toàn bộ phần tử.

- [`draggable`](/en-US/docs/Web/HTML/Reference/Global_attributes/draggable)
  - : Thuộc tính enumerated cho biết liệu phần tử có thể được kéo hay không, bằng cách dùng [Drag and Drop API](/en-US/docs/Web/API/HTML_Drag_and_Drop_API). Nó có thể có các giá trị sau:
    - `true`, cho biết phần tử có thể được kéo
    - `false`, cho biết phần tử không thể được kéo.

- [`enterkeyhint`](/en-US/docs/Web/HTML/Reference/Global_attributes/enterkeyhint)
  - : Gợi ý nhãn hành động (hoặc biểu tượng) nào sẽ hiển thị cho phím enter trên bàn phím ảo.
- [`exportparts`](/en-US/docs/Web/HTML/Reference/Global_attributes/exportparts)
  - : Được dùng để xuất các phần shadow theo cách chuyển tiếp từ cây shadow lồng nhau vào cây light chứa.
- [`hidden`](/en-US/docs/Web/HTML/Reference/Global_attributes/hidden)
  - : Thuộc tính enumerated cho biết rằng phần tử chưa, hoặc không còn, _có liên quan_. Ví dụ, nó có thể được dùng để ẩn các phần tử của trang không thể dùng cho đến khi quá trình đăng nhập được hoàn thành. Trình duyệt sẽ không hiển thị các phần tử như vậy. Thuộc tính này không được dùng để ẩn nội dung có thể hợp lệ được hiển thị.
- [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id)
  - : Xác định một định danh duy nhất (ID) phải là duy nhất trong toàn bộ tài liệu. Mục đích của nó là xác định phần tử khi liên kết (bằng cách dùng định danh đoạn), scripting, hoặc tạo kiểu (với CSS).
- [`inert`](/en-US/docs/Web/HTML/Reference/Global_attributes/inert)
  - : Giá trị boolean khiến trình duyệt bỏ qua các sự kiện đầu vào người dùng cho phần tử. Hữu ích khi có các sự kiện click.
- [`inputmode`](/en-US/docs/Web/HTML/Reference/Global_attributes/inputmode)
  - : Cung cấp gợi ý cho các trình duyệt về loại cấu hình bàn phím ảo để dùng khi chỉnh sửa phần tử này hoặc nội dung của nó. Được dùng chủ yếu trên các phần tử {{HTMLElement("input")}}, nhưng có thể dùng trên bất kỳ phần tử nào ở chế độ [`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable).
- [`is`](/en-US/docs/Web/HTML/Reference/Global_attributes/is)
  - : Cho phép bạn chỉ định rằng một phần tử HTML tiêu chuẩn nên hành xử như một phần tử tích hợp tùy chỉnh đã đăng ký (xem [Using custom elements](/en-US/docs/Web/API/Web_components/Using_custom_elements) để biết thêm chi tiết).

> [!NOTE]
> Các thuộc tính `item*` là một phần của [tính năng WHATWG HTML Microdata](https://html.spec.whatwg.org/multipage/microdata.html#microdata).

- [`itemid`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemid)
  - : Định danh toàn cục duy nhất của một mục.
- [`itemprop`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemprop)
  - : Được dùng để thêm thuộc tính vào một mục. Mọi phần tử HTML có thể có thuộc tính `itemprop` được chỉ định, trong đó `itemprop` bao gồm cặp tên và giá trị.
- [`itemref`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemref)
  - : Các thuộc tính không phải là hậu duệ của phần tử có thuộc tính `itemscope` có thể được liên kết với mục bằng cách dùng `itemref`. Nó cung cấp danh sách các id phần tử (không phải `itemid`) với các thuộc tính bổ sung ở nơi khác trong tài liệu.
- [`itemscope`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemscope)
  - : `itemscope` (thường) hoạt động cùng với [`itemtype`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemtype) để chỉ định rằng HTML trong một khối là về một mục cụ thể. `itemscope` tạo Mục và xác định phạm vi của `itemtype` liên kết với nó. `itemtype` là URL hợp lệ của từ vựng (như [schema.org](https://schema.org/)) mô tả mục và ngữ cảnh thuộc tính của nó.
- [`itemtype`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemtype)
  - : Chỉ định URL của từ vựng sẽ được dùng để xác định `itemprop` (thuộc tính mục) trong cấu trúc dữ liệu. [`itemscope`](/en-US/docs/Web/HTML/Reference/Global_attributes/itemscope) được dùng để đặt phạm vi của nơi trong cấu trúc dữ liệu từ vựng được đặt bởi `itemtype` sẽ hoạt động.
- [`lang`](/en-US/docs/Web/HTML/Reference/Global_attributes/lang)
  - : Giúp xác định ngôn ngữ của phần tử: ngôn ngữ mà các phần tử không thể chỉnh sửa đang ở trong, hoặc ngôn ngữ mà các phần tử có thể chỉnh sửa nên được viết bởi người dùng. Thuộc tính phải chứa {{glossary("BCP 47 language tag")}} hợp lệ. `xml:lang` có ưu tiên cao hơn nó.
- [`nonce`](/en-US/docs/Web/HTML/Reference/Global_attributes/nonce)
  - : {{Glossary("Nonce", "nonce")}} (số được dùng một lần) mật mã học có thể được dùng bởi [Content Security Policy](/en-US/docs/Web/HTTP/Guides/CSP) để xác định liệu một yêu cầu fetch cụ thể có được phép tiến hành hay không.
- [`part`](/en-US/docs/Web/HTML/Reference/Global_attributes/part)
  - : Danh sách các tên phần của phần tử, được phân tách bằng dấu cách. Tên phần cho phép CSS chọn và tạo kiểu cho các phần tử cụ thể trong cây shadow qua phần tử giả {{CSSxRef("::part")}}.
- [`popover`](/en-US/docs/Web/HTML/Reference/Global_attributes/popover)
  - : Được dùng để chỉ định phần tử là phần tử popover (xem {{domxref("Popover API", "Popover API", "", "nocode")}}). Các phần tử popover bị ẩn qua `display: none` cho đến khi được mở qua phần tử gọi/kiểm soát (tức là `<button>` hoặc `<input type="button">` với thuộc tính [`popovertarget`](/en-US/docs/Web/HTML/Reference/Elements/button#popovertarget)) hoặc lời gọi {{domxref("HTMLElement.showPopover()")}}.
- [`role`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles)
  - : Các vai trò xác định ý nghĩa ngữ nghĩa của nội dung, cho phép trình đọc màn hình và các công cụ khác trình bày và hỗ trợ tương tác với một đối tượng theo cách nhất quán với kỳ vọng của người dùng về loại đối tượng đó. `roles` được thêm vào các phần tử HTML bằng `role="role_type"`, trong đó `role_type` là tên của vai trò trong đặc tả ARIA.
- [`slot`](/en-US/docs/Web/HTML/Reference/Global_attributes/slot)
  - : Gán một slot trong cây shadow [shadow DOM](/en-US/docs/Web/API/Web_components/Using_shadow_DOM) cho một phần tử: Phần tử có thuộc tính `slot` được gán cho slot được tạo bởi phần tử {{HTMLElement("slot")}} có giá trị thuộc tính [`name`](/en-US/docs/Web/HTML/Reference/Elements/slot#name) khớp với giá trị thuộc tính `slot` đó.
- [`spellcheck`](/en-US/docs/Web/HTML/Reference/Global_attributes/spellcheck)
  - : Thuộc tính enumerated xác định liệu phần tử có thể được kiểm tra lỗi chính tả hay không. Nó có thể có các giá trị sau:
    - chuỗi rỗng hoặc `true`, cho biết phần tử nên được kiểm tra lỗi chính tả nếu có thể;
    - `false`, cho biết phần tử không nên được kiểm tra lỗi chính tả.

- [`style`](/en-US/docs/Web/HTML/Reference/Global_attributes/style)
  - : Chứa các khai báo tạo kiểu [CSS](/en-US/docs/Web/CSS) được áp dụng cho phần tử. Lưu ý rằng khuyến nghị các kiểu nên được xác định trong một tệp hoặc các tệp riêng biệt. Thuộc tính này và phần tử {{HTMLElement("style")}} chủ yếu có mục đích cho phép tạo kiểu nhanh, ví dụ cho mục đích kiểm tra.
- [`tabindex`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex)
  - : Thuộc tính số nguyên cho biết nếu phần tử có thể nhận tiêu điểm đầu vào (có thể _lấy tiêu điểm_), nếu nó nên tham gia điều hướng bàn phím tuần tự, và nếu có thì ở vị trí nào. Nó có thể nhận nhiều giá trị:
    - _giá trị âm_ có nghĩa là phần tử nên có thể lấy tiêu điểm, nhưng không nên có thể truy cập qua điều hướng bàn phím tuần tự;
    - `0` có nghĩa là phần tử nên có thể lấy tiêu điểm và có thể truy cập qua điều hướng bàn phím tuần tự, nhưng thứ tự tương đối của nó được xác định bởi quy ước nền tảng;
    - _giá trị dương_ có nghĩa là phần tử nên có thể lấy tiêu điểm và có thể truy cập qua điều hướng bàn phím tuần tự; thứ tự mà các phần tử được lấy tiêu điểm là giá trị tăng dần của [`tabindex`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex). Nếu nhiều phần tử có cùng tabindex, thứ tự tương đối của chúng theo vị trí tương đối trong tài liệu.

- [`title`](/en-US/docs/Web/HTML/Reference/Global_attributes/title)
  - : Chứa văn bản biểu diễn thông tin tư vấn liên quan đến phần tử mà nó thuộc về. Thông tin như vậy thường, nhưng không nhất thiết, có thể được trình bày cho người dùng như tooltip.
- [`translate`](/en-US/docs/Web/HTML/Reference/Global_attributes/translate)
  - : Thuộc tính enumerated được dùng để chỉ định liệu các giá trị thuộc tính của phần tử và các giá trị của các node con {{DOMxRef("Text")}} của nó có được dịch khi trang được bản địa hóa hay không, hoặc để lại không thay đổi. Nó có thể có các giá trị sau:
    - chuỗi rỗng hoặc `yes`, cho biết phần tử sẽ được dịch.
    - `no`, cho biết phần tử sẽ không được dịch.

- [`virtualkeyboardpolicy`](/en-US/docs/Web/HTML/Reference/Global_attributes/virtualkeyboardpolicy) {{Experimental_Inline}}
  - : Thuộc tính {{Glossary("enumerated")}} được dùng để kiểm soát hành vi bàn phím ảo trên màn hình trên các thiết bị như máy tính bảng, điện thoại di động, hoặc các thiết bị khác mà bàn phím phần cứng có thể không có sẵn cho các phần tử có nội dung có thể chỉnh sửa (ví dụ, đây là phần tử {{htmlelement("input")}} hoặc {{htmlelement("textarea")}}, hoặc phần tử có thuộc tính [`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable) được đặt).
    - `auto` hoặc _chuỗi rỗng_, tự động hiển thị bàn phím ảo khi phần tử được lấy tiêu điểm hoặc chạm vào.
    - `manual`, tách tiêu điểm và chạm trên phần tử khỏi trạng thái của bàn phím ảo.

- [`writingsuggestions`](/en-US/docs/Web/HTML/Reference/Global_attributes/writingsuggestions)
  - : Thuộc tính {{Glossary("enumerated")}} cho biết liệu các gợi ý viết do trình duyệt cung cấp có nên được bật trong phạm vi của phần tử hay không.
    - `false`, tắt các gợi ý viết của trình duyệt.
    - `true` hoặc _chuỗi rỗng_, bật các gợi ý viết.

## Danh sách thuộc tính xử lý sự kiện toàn cục

Các thuộc tính xử lý sự kiện HTML không được khuyến nghị; xem [HTML attribute reference](/en-US/docs/Web/HTML/Reference/Attributes#event_handler_attributes) để biết cách chúng hoạt động.

Mặc dù các thuộc tính liệt kê bên dưới áp dụng cho tất cả các phần tử, chúng không hữu ích trên tất cả các phần tử. Ví dụ, thuộc tính HTML `onvolumechange` được chấp nhận bởi tất cả các phần tử và gắn trình lắng nghe sự kiện cho `volumechange`, nhưng chỉ các phần tử media mới nhận được sự kiện `volumechange` được trình duyệt kích hoạt. Đối với các phần tử khác, bạn chỉ có thể dùng {{domxref("EventTarget.dispatchEvent()")}} để gửi thủ công một sự kiện. [Một số thuộc tính](/en-US/docs/Web/HTML/Reference/Elements/body#event_attributes) có thể được chỉ định trên {{HTMLElement("body")}}, nhưng thay vào đó chúng sẽ lắng nghe các sự kiện trên `window`.

- [`onabort`](/en-US/docs/Web/API/HTMLMediaElement/abort_event)
- [`onanimationcancel`](/en-US/docs/Web/API/Element/animationcancel_event)
- [`onanimationend`](/en-US/docs/Web/API/Element/animationend_event)
- [`onanimationiteration`](/en-US/docs/Web/API/Element/animationiteration_event)
- [`onanimationstart`](/en-US/docs/Web/API/Element/animationstart_event)
- [`onauxclick`](/en-US/docs/Web/API/Element/auxclick_event)
- [`onbeforeinput`](/en-US/docs/Web/API/Element/beforeinput_event)
- [`onbeforematch`](/en-US/docs/Web/API/Element/beforematch_event)
- [`onbeforetoggle`](/en-US/docs/Web/API/HTMLElement/beforetoggle_event)
- [`onblur`](/en-US/docs/Web/API/Element/blur_event)
- [`oncancel`](/en-US/docs/Web/API/HTMLInputElement/cancel_event)
- [`oncanplay`](/en-US/docs/Web/API/HTMLMediaElement/canplay_event)
- [`oncanplaythrough`](/en-US/docs/Web/API/HTMLMediaElement/canplaythrough_event)
- [`onchange`](/en-US/docs/Web/API/HTMLElement/change_event)
- [`onclick`](/en-US/docs/Web/API/Element/click_event)
- [`onclose`](/en-US/docs/Web/API/HTMLDialogElement/close_event)
- [`oncommand`](/en-US/docs/Web/API/HTMLElement/command_event)
- [`oncontentvisibilityautostatechange`](/en-US/docs/Web/API/Element/contentvisibilityautostatechange_event)
- [`oncontextlost`](/en-US/docs/Web/API/HTMLCanvasElement/contextlost_event)
- [`oncontextmenu`](/en-US/docs/Web/API/Element/contextmenu_event)
- [`oncontextrestored`](/en-US/docs/Web/API/HTMLCanvasElement/contextrestored_event)
- [`oncopy`](/en-US/docs/Web/API/Element/copy_event)
- [`oncuechange`](/en-US/docs/Web/API/HTMLTrackElement/cuechange_event)
- [`oncut`](/en-US/docs/Web/API/Element/cut_event)
- [`ondblclick`](/en-US/docs/Web/API/Element/dblclick_event)
- [`ondrag`](/en-US/docs/Web/API/HTMLElement/drag_event)
- [`ondragend`](/en-US/docs/Web/API/HTMLElement/dragend_event)
- [`ondragenter`](/en-US/docs/Web/API/HTMLElement/dragenter_event)
- [`ondragleave`](/en-US/docs/Web/API/HTMLElement/dragleave_event)
- [`ondragover`](/en-US/docs/Web/API/HTMLElement/dragover_event)
- [`ondragstart`](/en-US/docs/Web/API/HTMLElement/dragstart_event)
- [`ondrop`](/en-US/docs/Web/API/HTMLElement/drop_event)
- [`ondurationchange`](/en-US/docs/Web/API/HTMLMediaElement/durationchange_event)
- [`onemptied`](/en-US/docs/Web/API/HTMLMediaElement/emptied_event)
- [`onended`](/en-US/docs/Web/API/HTMLMediaElement/ended_event)
- [`onerror`](/en-US/docs/Web/API/HTMLElement/error_event)
- [`onfocus`](/en-US/docs/Web/API/Element/focus_event)
- [`onfocusin`](/en-US/docs/Web/API/Element/focusin_event)
- [`onfocusout`](/en-US/docs/Web/API/Element/focusout_event)
- [`onformdata`](/en-US/docs/Web/API/HTMLFormElement/formdata_event)
- [`onfullscreenchange`](/en-US/docs/Web/API/Element/fullscreenchange_event)
- [`onfullscreenerror`](/en-US/docs/Web/API/Element/fullscreenerror_event)
- [`ongesturechange`](/en-US/docs/Web/API/Element/gesturechange_event) {{non-standard_inline}}
- [`ongestureend`](/en-US/docs/Web/API/Element/gestureend_event) {{non-standard_inline}}
- [`ongesturestart`](/en-US/docs/Web/API/Element/gesturestart_event) {{non-standard_inline}}
- [`ongotpointercapture`](/en-US/docs/Web/API/Element/gotpointercapture_event)
- [`oninput`](/en-US/docs/Web/API/Element/input_event)
- [`oninvalid`](/en-US/docs/Web/API/HTMLInputElement/invalid_event)
- [`onkeydown`](/en-US/docs/Web/API/Element/keydown_event)
- [`onkeypress`](/en-US/docs/Web/API/Element/keypress_event) {{deprecated_inline}}
- [`onkeyup`](/en-US/docs/Web/API/Element/keyup_event)
- [`onload`](/en-US/docs/Web/API/HTMLElement/load_event)
- [`onloadeddata`](/en-US/docs/Web/API/HTMLMediaElement/loadeddata_event)
- [`onloadedmetadata`](/en-US/docs/Web/API/HTMLMediaElement/loadedmetadata_event)
- [`onloadstart`](/en-US/docs/Web/API/HTMLMediaElement/loadstart_event)
- [`onlostpointercapture`](/en-US/docs/Web/API/Element/lostpointercapture_event)
- [`onmousedown`](/en-US/docs/Web/API/Element/mousedown_event)
- [`onmouseenter`](/en-US/docs/Web/API/Element/mouseenter_event)
- [`onmouseleave`](/en-US/docs/Web/API/Element/mouseleave_event)
- [`onmousemove`](/en-US/docs/Web/API/Element/mousemove_event)
- [`onmouseout`](/en-US/docs/Web/API/Element/mouseout_event)
- [`onmouseover`](/en-US/docs/Web/API/Element/mouseover_event)
- [`onmouseup`](/en-US/docs/Web/API/Element/mouseup_event)
- [`onmousewheel`](/en-US/docs/Web/API/Element/mousewheel_event) {{deprecated_inline}} {{non-standard_inline}}
- [`onpaste`](/en-US/docs/Web/API/Element/paste_event)
- [`onpause`](/en-US/docs/Web/API/HTMLMediaElement/pause_event)
- [`onplay`](/en-US/docs/Web/API/HTMLMediaElement/play_event)
- [`onplaying`](/en-US/docs/Web/API/HTMLMediaElement/playing_event)
- [`onpointercancel`](/en-US/docs/Web/API/Element/pointercancel_event)
- [`onpointerdown`](/en-US/docs/Web/API/Element/pointerdown_event)
- [`onpointerenter`](/en-US/docs/Web/API/Element/pointerenter_event)
- [`onpointerleave`](/en-US/docs/Web/API/Element/pointerleave_event)
- [`onpointermove`](/en-US/docs/Web/API/Element/pointermove_event)
- [`onpointerout`](/en-US/docs/Web/API/Element/pointerout_event)
- [`onpointerover`](/en-US/docs/Web/API/Element/pointerover_event)
- [`onpointerrawupdate`](/en-US/docs/Web/API/Element/pointerrawupdate_event)
- [`onpointerup`](/en-US/docs/Web/API/Element/pointerup_event)
- [`onprogress`](/en-US/docs/Web/API/HTMLMediaElement/progress_event)
- [`onratechange`](/en-US/docs/Web/API/HTMLMediaElement/ratechange_event)
- [`onreset`](/en-US/docs/Web/API/HTMLFormElement/reset_event)
- [`onresize`](/en-US/docs/Web/API/HTMLVideoElement/resize_event)
- [`onscroll`](/en-US/docs/Web/API/Element/scroll_event)
- [`onscrollend`](/en-US/docs/Web/API/Element/scrollend_event)
- [`onscrollsnapchange`](/en-US/docs/Web/API/Element/scrollsnapchange_event) {{Experimental_Inline}}
- [`onscrollsnapchanging`](/en-US/docs/Web/API/Element/scrollsnapchanging_event) {{Experimental_Inline}}
- [`onsecuritypolicyviolation`](/en-US/docs/Web/API/Element/securitypolicyviolation_event)
- [`onseeked`](/en-US/docs/Web/API/HTMLMediaElement/seeked_event)
- [`onseeking`](/en-US/docs/Web/API/HTMLMediaElement/seeking_event)
- [`onselect`](/en-US/docs/Web/API/HTMLInputElement/select_event)
- [`onselectionchange`](/en-US/docs/Web/API/HTMLInputElement/selectionchange_event)
- [`onselectstart`](/en-US/docs/Web/API/Node/selectstart_event)
- [`onslotchange`](/en-US/docs/Web/API/HTMLSlotElement/slotchange_event)
- [`onstalled`](/en-US/docs/Web/API/HTMLMediaElement/stalled_event)
- [`onsubmit`](/en-US/docs/Web/API/HTMLFormElement/submit_event)
- [`onsuspend`](/en-US/docs/Web/API/HTMLMediaElement/suspend_event)
- [`ontimeupdate`](/en-US/docs/Web/API/HTMLMediaElement/timeupdate_event)
- [`ontoggle`](/en-US/docs/Web/API/HTMLElement/toggle_event)
- [`ontouchcancel`](/en-US/docs/Web/API/Element/touchcancel_event)
- [`ontouchend`](/en-US/docs/Web/API/Element/touchend_event)
- [`ontouchmove`](/en-US/docs/Web/API/Element/touchmove_event)
- [`ontouchstart`](/en-US/docs/Web/API/Element/touchstart_event)
- [`ontransitioncancel`](/en-US/docs/Web/API/Element/transitioncancel_event)
- [`ontransitionend`](/en-US/docs/Web/API/Element/transitionend_event)
- [`ontransitionrun`](/en-US/docs/Web/API/Element/transitionrun_event)
- [`ontransitionstart`](/en-US/docs/Web/API/Element/transitionstart_event)
- [`onvolumechange`](/en-US/docs/Web/API/HTMLMediaElement/volumechange_event)
- [`onwaiting`](/en-US/docs/Web/API/HTMLMediaElement/waiting_event)
- [`onwebkitmouseforcechanged`](/en-US/docs/Web/API/Element/webkitmouseforcechanged_event) {{non-standard_inline}}
- [`onwebkitmouseforcedown`](/en-US/docs/Web/API/Element/webkitmouseforcedown_event) {{non-standard_inline}}
- [`onwebkitmouseforceup`](/en-US/docs/Web/API/Element/webkitmouseforceup_event) {{non-standard_inline}}
- [`onwebkitmouseforcewillbegin`](/en-US/docs/Web/API/Element/webkitmouseforcewillbegin_event) {{non-standard_inline}}
- [`onwheel`](/en-US/docs/Web/API/Element/wheel_event)

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{DOMxRef("Element")}} cho phép truy vấn hầu hết các thuộc tính toàn cục.
