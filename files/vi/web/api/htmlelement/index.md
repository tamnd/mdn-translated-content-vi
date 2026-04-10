---
title: HTMLElement
slug: Web/API/HTMLElement
page-type: web-api-interface
browser-compat: api.HTMLElement
---

{{APIRef("HTML DOM")}}

Giao diện **`HTMLElement`** đại diện cho bất kỳ phần tử [HTML](/en-US/docs/Web/HTML) nào. Một số phần tử trực tiếp triển khai giao diện này, trong khi các phần tử khác triển khai nó thông qua một giao diện kế thừa từ nó.

{{InheritanceDiagram}}

## Thuộc tính instance

_Cũng kế thừa các thuộc tính từ phần tử cha, {{DOMxRef("Element")}}._

- {{DOMxRef("HTMLElement.accessKey")}}
  - : Một chuỗi đại diện cho phím truy cập được gán cho phần tử.
- {{DOMxRef("HTMLElement.accessKeyLabel")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi chứa phím truy cập được gán cho phần tử.
- {{DOMxRef("HTMLElement.anchorElement")}} {{ReadOnlyInline}}&nbsp;{{non-standard_inline}} {{experimental_inline}}
  - : Trả về tham chiếu đến phần tử neo của phần tử, hoặc `null` nếu nó không có.
- {{DOMxRef("HTMLElement.attributeStyleMap")}} {{ReadOnlyInline}}
  - : Một {{DOMxRef("StylePropertyMap")}} đại diện cho các khai báo của thuộc tính [`style`](/en-US/docs/Web/HTML/Reference/Global_attributes/style) của phần tử.
- {{domxref("HTMLElement.autocapitalize")}}
  - : Một chuỗi đại diện cho hành vi viết hoa của phần tử đối với đầu vào của người dùng. Các giá trị hợp lệ là: `none`, `off`, `on`, `characters`, `words`, `sentences`.
- {{domxref("HTMLElement.autofocus")}}
  - : Một giá trị boolean phản ánh thuộc tính global HTML [`autofocus`](/en-US/docs/Web/HTML/Reference/Elements/select#autofocus), cho biết liệu điều khiển có nên được lấy tiêu điểm khi trang tải hay không, hoặc khi dialog hoặc popover được hiển thị nếu được chỉ định trong một phần tử bên trong các phần tử {{htmlelement("dialog")}} hoặc các phần tử có thuộc tính popover được đặt.
- {{domxref("HTMLElement.autocorrect")}}
  - : Một boolean đại diện cho việc văn bản do người dùng nhập có được tự động sửa lỗi hay không.
    Thuộc tính này phản ánh thuộc tính global HTML [`autocorrect`](/en-US/docs/Web/HTML/Reference/Global_attributes/autocorrect).
- {{DOMxRef("HTMLElement.contentEditable")}}
  - : Một chuỗi, trong đó giá trị `true` có nghĩa là phần tử có thể chỉnh sửa và giá trị `false` có nghĩa là không.
- {{DOMxRef("HTMLElement.dataset")}} {{ReadOnlyInline}}
  - : Trả về một {{DOMxRef("DOMStringMap")}} mà script có thể đọc và ghi các [thuộc tính dữ liệu tùy chỉnh](/en-US/docs/Web/HTML/How_to/Use_data_attributes) (`data-*`) của phần tử.
- {{DOMxRef("HTMLElement.dir")}}
  - : Một chuỗi, phản ánh thuộc tính global `dir`, đại diện cho hướng của phần tử. Các giá trị khả thi là `"ltr"`, `"rtl"`, và `"auto"`.
- {{DOMxRef("HTMLElement.draggable")}}
  - : Một giá trị boolean cho biết liệu phần tử có thể được kéo hay không.
- {{DOMxRef("HTMLElement.editContext")}} {{experimental_inline}}
  - : Trả về {{DOMxRef("EditContext")}} được liên kết với phần tử, hoặc `null` nếu không có.
- {{DOMxRef("HTMLElement.enterKeyHint")}}
  - : Một chuỗi xác định nhãn hành động (hoặc biểu tượng) nào sẽ hiển thị cho phím enter trên bàn phím ảo.
- {{DOMxRef("HTMLElement.hidden")}}
  - : Một chuỗi hoặc boolean phản ánh giá trị của thuộc tính [`hidden`](/en-US/docs/Web/HTML/Reference/Global_attributes/hidden) của phần tử.
- {{DOMxRef("HTMLElement.inert")}}
  - : Một giá trị boolean cho biết liệu tác nhân người dùng có phải hoạt động như thể nút đã cho không tồn tại đối với các sự kiện tương tác của người dùng, tìm kiếm văn bản trong trang ("tìm trong trang"), và chọn văn bản.
- {{DOMxRef("HTMLElement.innerText")}}
  - : Đại diện cho nội dung văn bản đã được kết xuất của một nút và các phần tử con cháu của nó.
    Khi dùng làm bộ lấy, nó xấp xỉ văn bản mà người dùng sẽ nhận được nếu họ tô sáng nội dung của phần tử bằng con trỏ và sau đó sao chép vào clipboard.
    Khi dùng làm bộ đặt, nó thay thế nội dung bên trong phần tử đã chọn, chuyển đổi bất kỳ ngắt dòng nào thành các phần tử {{HTMLElement("br")}}.
- {{DOMxRef("HTMLElement.inputMode")}}
  - : Một giá trị chuỗi phản ánh giá trị của thuộc tính [`inputmode`](/en-US/docs/Web/HTML/Reference/Global_attributes/inputmode) của phần tử.
- {{DOMxRef("HTMLElement.isContentEditable")}} {{ReadOnlyInline}}
  - : Trả về một giá trị boolean cho biết liệu nội dung của phần tử có thể chỉnh sửa được hay không.
- {{DOMxRef("HTMLElement.lang")}}
  - : Một chuỗi đại diện cho ngôn ngữ của các thuộc tính, văn bản và nội dung phần tử.
- {{DOMxRef("HTMLElement.nonce")}}
  - : Trả về số sử dụng một lần trong mật mã học được sử dụng bởi Chính sách bảo mật nội dung (Content Security Policy) để xác định xem một lệnh fetch nhất định có được phép tiến hành hay không.
- {{DOMxRef("HTMLElement.offsetHeight")}} {{ReadOnlyInline}}
  - : Trả về một `double` chứa chiều cao của một phần tử, tương đối với bố cục.
- {{DOMxRef("HTMLElement.offsetLeft")}} {{ReadOnlyInline}}
  - : Trả về một `double`, khoảng cách từ border trái của phần tử này đến border trái của `offsetParent` của nó.
- {{DOMxRef("HTMLElement.offsetParent")}} {{ReadOnlyInline}}
  - : Một {{DOMxRef("Element")}} là phần tử mà từ đó tất cả các phép tính offset hiện được tính toán.
- {{DOMxRef("HTMLElement.offsetTop")}} {{ReadOnlyInline}}
  - : Trả về một `double`, khoảng cách từ border trên của phần tử này đến border trên của `offsetParent` của nó.
- {{DOMxRef("HTMLElement.offsetWidth")}} {{ReadOnlyInline}}
  - : Trả về một `double` chứa chiều rộng của một phần tử, tương đối với bố cục.
- {{DOMxRef("HTMLElement.outerText")}}
  - : Đại diện cho nội dung văn bản đã được kết xuất của một nút và các phần tử con cháu của nó.
    Khi dùng làm bộ lấy, nó giống như {{DOMxRef("HTMLElement.innerText")}} (đại diện cho nội dung văn bản đã được kết xuất của một phần tử và các phần tử con cháu của nó).
    Khi dùng làm bộ đặt, nó thay thế nút đã chọn và nội dung của nó bằng giá trị đã cho, chuyển đổi bất kỳ ngắt dòng nào thành các phần tử {{HTMLElement("br")}}.
- {{domxref("HTMLElement.popover")}}
  - : Lấy và đặt trạng thái popover của một phần tử qua JavaScript (`"auto"`, `"hint"`, hoặc `"manual"`), và có thể được dùng để phát hiện tính năng. Phản ánh giá trị của thuộc tính global HTML [`popover`](/en-US/docs/Web/HTML/Reference/Global_attributes/popover).
- {{DOMxRef("HTMLElement.spellcheck")}}
  - : Một giá trị boolean kiểm soát gợi ý [kiểm tra chính tả](/en-US/docs/Web/HTML/Reference/Global_attributes/spellcheck). Nó có sẵn trên tất cả các phần tử HTML, mặc dù nó không ảnh hưởng đến tất cả chúng.
- {{DOMxRef("HTMLElement.style")}}
  - : Một {{DOMxRef("CSSStyleDeclaration")}} đại diện cho các khai báo của thuộc tính [`style`](/en-US/docs/Web/HTML/Reference/Global_attributes/style) của phần tử.
- {{DOMxRef("HTMLElement.tabIndex")}}
  - : Một `long` đại diện cho vị trí của phần tử trong thứ tự tab.
- {{DOMxRef("HTMLElement.title")}}
  - : Một chuỗi chứa văn bản xuất hiện trong hộp popup khi chuột ở trên phần tử.
- {{DOMxRef("HTMLElement.translate")}}
  - : Một giá trị boolean đại diện cho việc dịch thuật.
- {{DOMxRef("HTMLElement.virtualKeyboardPolicy")}} {{Experimental_Inline}}
  - : Một chuỗi cho biết hành vi của bàn phím ảo trên màn hình đối với các thiết bị như máy tính bảng, điện thoại di động hoặc các thiết bị khác nơi bàn phím cứng có thể không khả dụng, nếu nội dung của phần tử có thể chỉnh sửa (ví dụ: nó là phần tử {{htmlelement("input")}} hoặc {{htmlelement("textarea")}}, hoặc một phần tử có thuộc tính [`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable) được đặt).
- {{DOMxRef("HTMLElement.writingSuggestions")}}
  - : Một chuỗi cho biết liệu các gợi ý viết do trình duyệt cung cấp có nên được bật trong phạm vi của phần tử hay không.

## Phương thức instance

_Cũng kế thừa các phương thức từ phần tử cha, {{DOMxRef("Element")}}._

- {{DOMxRef("HTMLElement.attachInternals()")}}
  - : Trả về một đối tượng {{DOMxRef("ElementInternals")}}, và cho phép một phần tử tùy chỉnh tham gia vào các biểu mẫu HTML.
- {{DOMxRef("HTMLElement.blur()")}}
  - : Xóa tiêu điểm bàn phím khỏi phần tử đang được tiêu điểm hiện tại.
- {{DOMxRef("HTMLElement.click()")}}
  - : Gửi một sự kiện nhấp chuột đến phần tử.
- {{DOMxRef("HTMLElement.focus()")}}
  - : Làm cho phần tử trở thành tiêu điểm bàn phím hiện tại.
- {{DOMxRef("HTMLElement.hidePopover()")}}
  - : Ẩn một phần tử popover bằng cách xóa nó khỏi {{glossary("top layer")}} và áp dụng kiểu `display: none`.
- {{DOMxRef("HTMLElement.showPopover()")}}
  - : Hiển thị một phần tử popover bằng cách thêm nó vào {{glossary("top layer")}} và xóa `display: none;` khỏi các kiểu của nó.
- {{DOMxRef("HTMLElement.togglePopover()")}}
  - : Chuyển đổi một phần tử popover giữa trạng thái ẩn và hiển thị.

## Sự kiện

Lắng nghe các sự kiện này bằng cách sử dụng {{domxref("EventTarget.addEventListener", "addEventListener()")}} hoặc bằng cách gán một trình lắng nghe sự kiện cho thuộc tính `oneventname` của giao diện này.

_Cũng kế thừa các sự kiện từ phần tử cha, {{DOMxRef("Element")}}._

- {{DOMxRef("HTMLElement/change_event", "change")}}
  - : Được kích hoạt khi `value` của một phần tử {{HTMLElement("input")}}, {{HTMLElement("select")}}, hoặc {{HTMLElement("textarea")}} đã được thay đổi và xác nhận bởi người dùng. Không giống như sự kiện {{domxref("Element/input_event", "input")}}, sự kiện `change` không nhất thiết được kích hoạt cho mỗi thay đổi đối với `value` của một phần tử.
- {{domxref("HTMLElement/command_event", "command")}}
  - : Kích hoạt trên một phần tử được điều khiển thông qua một {{domxref("HTMLButtonElement", "button")}} với các giá trị {{domxref("HTMLButtonElement.commandForElement", "commandForElement")}} và {{domxref("HTMLButtonElement.command", "command")}} hợp lệ, bất cứ khi nào nút được tương tác (ví dụ: nó được nhấp).
- {{DOMxRef("HTMLElement/error_event", "error")}}
  - : Được kích hoạt khi một tài nguyên không tải được hoặc không thể sử dụng.
- {{DOMxRef("HTMLElement/load_event", "load")}}
  - : Kích hoạt cho các phần tử chứa tài nguyên khi tài nguyên đã tải thành công.

### Sự kiện kéo và thả

- {{DOMxRef("HTMLElement/drag_event", "drag")}}
  - : Sự kiện này được kích hoạt khi một phần tử hoặc lựa chọn văn bản đang được kéo.
- {{DOMxRef("HTMLElement/dragend_event", "dragend")}}
  - : Sự kiện này được kích hoạt khi một thao tác kéo đang được kết thúc (bằng cách thả nút chuột hoặc nhấn phím escape).
- {{DOMxRef("HTMLElement/dragenter_event", "dragenter")}}
  - : Sự kiện này được kích hoạt khi một phần tử được kéo hoặc lựa chọn văn bản đi vào một mục tiêu thả hợp lệ.
- {{DOMxRef("HTMLElement/dragleave_event", "dragleave")}}
  - : Sự kiện này được kích hoạt khi một phần tử được kéo hoặc lựa chọn văn bản rời khỏi một mục tiêu thả hợp lệ.
- {{DOMxRef("HTMLElement/dragover_event", "dragover")}}
  - : Sự kiện này được kích hoạt liên tục khi một phần tử hoặc lựa chọn văn bản đang được kéo và con trỏ chuột ở trên một mục tiêu thả hợp lệ (mỗi 50 ms KHI chuột không di chuyển ELSE nhanh hơn nhiều giữa 5 ms (di chuyển chậm) và 1ms (di chuyển nhanh) xấp xỉ. Mẫu kích hoạt này khác với {{domxref("Element/mouseover_event", "mouseover")}} ).
- {{DOMxRef("HTMLElement/dragstart_event", "dragstart")}}
  - : Sự kiện này được kích hoạt khi người dùng bắt đầu kéo một phần tử hoặc lựa chọn văn bản.
- {{DOMxRef("HTMLElement/drop_event", "drop")}}
  - : Sự kiện này được kích hoạt khi một phần tử hoặc lựa chọn văn bản được thả lên một mục tiêu thả hợp lệ.

### Sự kiện trình gọi interest

- {{domxref("HTMLElement.interest_event", "interest")}} {{experimental_inline}} {{non-standard_inline}}
  - : Được kích hoạt trên phần tử mục tiêu của [trình gọi interest](/en-US/docs/Web/API/Popover_API/Using_interest_invokers) khi interest được hiển thị, cho phép mã được chạy để phản hồi.
- {{domxref("HTMLElement.loseinterest_event", "loseinterest")}} {{experimental_inline}} {{non-standard_inline}}
  - : Được kích hoạt trên phần tử mục tiêu của trình gọi interest khi interest bị mất, cho phép mã được chạy để phản hồi.

### Sự kiện toggle

- {{DOMxRef("HTMLElement/beforetoggle_event", "beforetoggle")}}
  - : Được kích hoạt khi phần tử là một [popover](/en-US/docs/Web/API/Popover_API) hoặc {{htmlelement("dialog")}}, trước khi nó được ẩn hoặc hiển thị.
- {{DOMxRef("HTMLElement/toggle_event", "toggle")}}
  - : Được kích hoạt khi phần tử là một phần tử [popover](/en-US/docs/Web/API/Popover_API), {{htmlelement("dialog")}}, hoặc {{htmlelement("details")}}, ngay sau khi nó được ẩn hoặc hiển thị.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("Element")}}
