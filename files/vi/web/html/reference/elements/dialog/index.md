---
title: "<dialog>: Phần tử hộp thoại"
slug: Web/HTML/Reference/Elements/dialog
page-type: html-element
browser-compat: html.elements.dialog
sidebar: htmlsidebar
---

Phần tử **`<dialog>`** trong [HTML](/en-US/docs/Web/HTML) biểu diễn một hộp thoại modal hoặc non-modal, hoặc các thành phần tương tác khác, như cảnh báo có thể đóng, trình kiểm tra, hoặc cửa sổ con.

## Thuộc tính

Phần tử này bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

> [!WARNING]
> Thuộc tính `tabindex` không được dùng trên phần tử `<dialog>`. Xem [Ghi chú thêm](#additional_notes).

- `closedby`
  - : Chỉ định các loại hành động người dùng có thể dùng để đóng phần tử `<dialog>`. Thuộc tính này phân biệt ba phương thức đóng hộp thoại:
    - _Hành động người dùng đóng nhẹ_, trong đó `<dialog>` bị đóng khi người dùng nhấp hoặc chạm bên ngoài nó. Điều này tương đương với [hành vi "đóng nhẹ" của trạng thái "auto" popover](/en-US/docs/Web/API/Popover_API/Using#auto_state_and_light_dismiss).
    - _Hành động người dùng cụ thể theo nền tảng_, như nhấn phím <kbd>Esc</kbd> trên nền tảng máy tính để bàn, hoặc cử chỉ "quay lại" hoặc "bỏ qua" trên nền tảng di động.
    - Cơ chế do nhà phát triển chỉ định như một {{htmlelement("button")}} với trình xử lý [`click`](/en-US/docs/Web/API/Element/click_event) gọi {{domxref("HTMLDialogElement.close()")}} hoặc việc gửi {{htmlelement("form")}}.

    Các giá trị có thể là:
    - `any`
      - : Hộp thoại có thể bị đóng bằng bất kỳ ba phương thức nào.
    - `closerequest`
      - : Hộp thoại có thể bị đóng bằng hành động người dùng cụ thể theo nền tảng hoặc cơ chế do nhà phát triển chỉ định.
    - `none`
      - : Hộp thoại chỉ có thể bị đóng bằng cơ chế do nhà phát triển chỉ định.

    Nếu phần tử `<dialog>` không có giá trị `closedby` hợp lệ được chỉ định, thì
    - nếu nó được mở bằng {{domxref("HTMLDialogElement.showModal()", "showModal()")}}, nó hành xử như thể giá trị là `"closerequest"`
    - nếu không, nó hành xử như thể giá trị là `"none"`.

- `open`
  - : Cho biết rằng hộp thoại đang hoạt động và có thể tương tác. Nếu thuộc tính `open` không được đặt, hộp thoại sẽ không hiển thị với người dùng.
    Khuyến nghị dùng phương thức `.show()` hoặc `.showModal()` để hiển thị hộp thoại, thay vì thuộc tính `open`. Nếu `<dialog>` được mở bằng thuộc tính `open`, nó là non-modal.

    > [!NOTE]
    > Mặc dù bạn có thể chuyển đổi giữa trạng thái mở và đóng của hộp thoại non-modal bằng cách thêm/xóa thuộc tính `open`, cách tiếp cận này không được khuyến nghị. Xem {{domxref("HTMLDialogElement.open", "open")}} để biết thêm thông tin.

## Mô tả

Phần tử HTML `<dialog>` được dùng để tạo cả hộp thoại modal và non-modal.
Hộp thoại modal chặn tương tác với các phần tử UI khác, làm phần còn lại của trang [trở nên bất hoạt](/en-US/docs/Web/HTML/Reference/Global_attributes/inert#:~:text=When,clicked), trong khi hộp thoại non-modal cho phép tương tác với phần còn lại của trang.

### Điều khiển hộp thoại bằng JavaScript

JavaScript có thể được dùng để hiển thị và đóng phần tử `<dialog>`.
Bạn có thể dùng phương thức {{domxref("HTMLDialogElement.showModal()", "showModal()")}} để hiển thị hộp thoại modal và phương thức {{domxref("HTMLDialogElement.show()", "show()")}} để hiển thị hộp thoại non-modal. Hộp thoại có thể được đóng bằng phương thức {{domxref("HTMLDialogElement.close()", "close()")}} hoặc dùng phương thức [`dialog`](/en-US/docs/Web/HTML/Reference/Elements/form#method) khi gửi `<form>` được lồng trong phần tử `<dialog>`.
Hộp thoại modal cũng có thể được đóng bằng cách nhấn phím <kbd>Esc</kbd>.

### Hộp thoại modal dùng invoker commands

Hộp thoại modal có thể được mở và đóng một cách khai báo bằng cách dùng các thuộc tính HTML của [Invoker Commands API](/en-US/docs/Web/API/Invoker_Commands_API) [`commandfor`](/en-US/docs/Web/HTML/Reference/Elements/button#commandfor) và [`command`](/en-US/docs/Web/HTML/Reference/Elements/button#command), có thể được đặt trên các phần tử {{htmlelement("button")}}.

Thuộc tính `command` đặt lệnh cụ thể sẽ được gửi khi phần tử `<button>` được nhấp, trong khi `commandfor` đặt `id` của hộp thoại mục tiêu.
Các lệnh có thể gửi cho hộp thoại là [`"show-modal"`](/en-US/docs/Web/HTML/Reference/Elements/button#show-modal), [`"close"`](/en-US/docs/Web/HTML/Reference/Elements/button#close), và [`"request-close"`](/en-US/docs/Web/HTML/Reference/Elements/button#request-close).

HTML dưới đây minh họa cách áp dụng các thuộc tính cho phần tử `<button>` để có thể nhấn nó để mở `<dialog>` modal với `id` là "my-dialog".

```html
<button command="show-modal" commandfor="my-dialog">Open dialog</button>

<dialog id="my-dialog">
  <p>This dialog was opened using an invoker command.</p>
  <button commandfor="my-dialog" command="close">Close</button>
</dialog>
```

### Hộp thoại non-modal dùng popover commands

Hộp thoại non-modal có thể được mở, đóng và chuyển đổi một cách khai báo bằng cách dùng các thuộc tính HTML của [Popover API](/en-US/docs/Web/API/Popover_API) [`popovertarget`](/en-US/docs/Web/HTML/Reference/Elements/button#popovertarget) và [`popovertargetaction`](/en-US/docs/Web/HTML/Reference/Elements/button#popovertargetaction), có thể được xác định trên các phần tử {{htmlelement("button")}} và {{htmlelement("input")}}.

`<dialog>` phải được chuyển thành popover bằng cách thêm thuộc tính `popover`.
Bạn có thể dùng `popovertarget` trên button/input để chỉ định popover mục tiêu, và `popovertargetaction` để chỉ định hành động xảy ra trên popover khi button được nhấp.
Lưu ý rằng, vì hộp thoại là popover, nó sẽ là non-modal, vì vậy bạn có thể đóng nó bằng cách nhấp bên ngoài hộp thoại.

HTML dưới đây hiển thị cách áp dụng các thuộc tính cho phần tử `<button>` để có thể nhấn nó để hiển thị và ẩn `<dialog>` modal với `id` là "my-dialog".

```html
<button popovertarget="my-dialog">Open dialog</button>

<dialog id="my-dialog" popover>
  <p>This dialog was opened using a popovertargetaction attribute.</p>
  <button popovertarget="my-dialog" popovertargetaction="hide">Close</button>
</dialog>
```

Popover API cũng cung cấp các thuộc tính có thể được dùng để lấy và đặt trạng thái trong JavaScript.

### Đóng hộp thoại

Điều quan trọng là phải cung cấp cơ chế đóng cho mọi phần tử `<dialog>`, và đảm bảo rằng điều này hoạt động trên các thiết bị có thể không có bàn phím vật lý.

Có nhiều cách để đóng hộp thoại:

- Gửi form trong phần tử `<dialog>` với `method="dialog"` được đặt trên phần tử `<form>` (xem ví dụ [Dùng thuộc tính dialog open](#using_the_dialog_open_attribute)).
- Nhấp bên ngoài vùng hộp thoại khi "đóng nhẹ" được bật (xem ví dụ [Thuộc tính HTML Popover API](#popover_api_html_attributes)).
- Nhấn phím <kbd>Esc</kbd>, trong các hộp thoại được bật (xem ví dụ [Thuộc tính HTML Popover API](#popover_api_html_attributes)).
- Gọi phương thức {{domxref("HTMLDialogElement.close()")}} (xem [ví dụ modal](#creating_a_modal_dialog)).

### Tạo kiểu CSS

`<dialog>` có thể được chọn bằng tên phần tử (như bất kỳ phần tử nào khác), và bạn cũng có thể khớp trạng thái của nó bằng các lớp giả như [`:modal`](/en-US/docs/Web/CSS/Reference/Selectors/:modal) và [`:open`](/en-US/docs/Web/CSS/Reference/Selectors/:open).

Phần tử giả CSS {{cssxref('::backdrop')}} có thể được dùng để tạo kiểu nền của hộp thoại modal, được hiển thị phía sau phần tử `<dialog>` khi hộp thoại được hiển thị bằng phương thức {{domxref("HTMLDialogElement.showModal()")}}.
Phần tử giả này có thể được dùng, ví dụ, để làm mờ, tối hoặc che khuất nội dung bất hoạt phía sau hộp thoại modal.

### Ghi chú thêm

- Các phần tử HTML {{HTMLElement("form")}} có thể được dùng để đóng hộp thoại nếu chúng có thuộc tính `method="dialog"` hoặc nếu button được dùng để gửi form có [`formmethod="dialog"`](/en-US/docs/Web/HTML/Reference/Elements/input#formmethod) được đặt. Khi `<form>` trong `<dialog>` được gửi qua phương thức `dialog`, hộp thoại đóng lại, trạng thái của các điều khiển form được lưu nhưng không được gửi, và thuộc tính {{domxref("HTMLDialogElement.returnValue", "returnValue")}} được đặt thành giá trị của button đã được kích hoạt.
- Thuộc tính [`autofocus`](/en-US/docs/Web/HTML/Reference/Global_attributes/autofocus) nên được thêm vào phần tử mà người dùng dự kiến tương tác ngay sau khi mở hộp thoại modal. Nếu không có phần tử nào khác liên quan đến tương tác ngay lập tức hơn, khuyến nghị thêm `autofocus` vào button đóng bên trong hộp thoại, hoặc chính hộp thoại nếu người dùng dự kiến nhấp/kích hoạt nó để đóng.
- Không thêm thuộc tính `tabindex` vào phần tử `<dialog>` vì nó không tương tác và không nhận tiêu điểm. Nội dung của hộp thoại, bao gồm button đóng trong hộp thoại, có thể nhận tiêu điểm và tương tác.

## Trợ năng

Khi triển khai hộp thoại, điều quan trọng là phải xem xét vị trí phù hợp nhất để đặt tiêu điểm người dùng. Khi dùng {{domxref("HTMLDialogElement.showModal()")}} để mở `<dialog>`, tiêu điểm được đặt vào phần tử có thể lấy tiêu điểm đầu tiên được lồng trong hộp thoại. Chỉ định rõ ràng vị trí tiêu điểm ban đầu bằng cách dùng thuộc tính [`autofocus`](/en-US/docs/Web/HTML/Reference/Global_attributes/autofocus) sẽ giúp đảm bảo tiêu điểm ban đầu được đặt vào phần tử được coi là vị trí tiêu điểm ban đầu tốt nhất cho bất kỳ hộp thoại cụ thể nào. Khi nghi ngờ, vì không phải lúc nào cũng biết tiêu điểm ban đầu có thể được đặt ở đâu trong hộp thoại, đặc biệt là các trường hợp mà nội dung hộp thoại được hiển thị động khi được gọi, bản thân phần tử `<dialog>` có thể cung cấp vị trí tiêu điểm ban đầu tốt nhất.

Đảm bảo cung cấp cơ chế cho phép người dùng đóng hộp thoại. Cách chắc chắn nhất để đảm bảo tất cả người dùng có thể đóng hộp thoại là bao gồm một button rõ ràng để làm như vậy, chẳng hạn như button xác nhận, hủy hoặc đóng.

Mặc định, hộp thoại được gọi bởi phương thức `showModal()` có thể bị đóng bằng cách nhấn phím <kbd>Esc</kbd>. Hộp thoại non-modal không đóng qua phím <kbd>Esc</kbd> theo mặc định, và tùy thuộc vào những gì hộp thoại non-modal đại diện, hành vi này có thể không mong muốn. Người dùng bàn phím mong đợi phím <kbd>Esc</kbd> đóng hộp thoại modal; đảm bảo hành vi này được triển khai và duy trì. Nếu nhiều hộp thoại modal đang mở, nhấn phím <kbd>Esc</kbd> chỉ nên đóng hộp thoại được hiển thị cuối cùng. Khi dùng `<dialog>`, hành vi này được trình duyệt cung cấp.

Mặc dù hộp thoại có thể được tạo bằng các phần tử khác, phần tử `<dialog>` gốc cung cấp các tính năng về khả năng sử dụng và trợ năng phải được sao chép nếu bạn dùng các phần tử khác cho mục đích tương tự. Nếu bạn tạo một triển khai hộp thoại tùy chỉnh, hãy đảm bảo rằng tất cả các hành vi mặc định mong đợi được hỗ trợ và các khuyến nghị ghi nhãn phù hợp được tuân theo.

Phần tử `<dialog>` được các trình duyệt hiển thị theo cách tương tự như các hộp thoại tùy chỉnh dùng thuộc tính ARIA [role="dialog"](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/dialog_role). Các phần tử `<dialog>` được gọi bởi phương thức `showModal()` ngầm định có [aria-modal="true"](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-modal), trong khi các phần tử `<dialog>` được gọi bởi phương thức `show()` hoặc hiển thị bằng thuộc tính `open` hoặc bằng cách thay đổi `display` mặc định của `<dialog>` được hiển thị là `[aria-modal="false"]`. Khi triển khai hộp thoại modal, mọi thứ khác ngoài `<dialog>` và nội dung của nó nên được hiển thị bất hoạt bằng cách dùng thuộc tính [`inert`](/en-US/docs/Web/HTML/Reference/Global_attributes/inert). Khi dùng `<dialog>` cùng với phương thức `HTMLDialogElement.showModal()`, hành vi này được trình duyệt cung cấp.

## Ví dụ

### Thuộc tính HTML của Invoker Command API

Ví dụ này minh họa cách bạn có thể dùng để mở và đóng hộp thoại modal bằng cách dùng các thuộc tính HTML [`commandfor`](/en-US/docs/Web/HTML/Reference/Elements/button#commandfor) và [`command`](/en-US/docs/Web/HTML/Reference/Elements/button#command) của [Invoker Commands API](/en-US/docs/Web/API/Invoker_Commands_API).

Đầu tiên, chúng ta khai báo một phần tử {{htmlelement("button")}}, đặt thuộc tính `command` thành [`"show-modal"`](/en-US/docs/Web/HTML/Reference/Elements/button#show-modal), và thuộc tính `commandfor` thành `id` của hộp thoại cần mở (`my-dialog`).
Sau đó chúng ta khai báo một phần tử `<dialog>` chứa một `<button>` "Close". Button này gửi lệnh [`"close"`](/en-US/docs/Web/HTML/Reference/Elements/button#close) đến id hộp thoại (cùng một hộp thoại).

```html
<button command="show-modal" commandfor="my-dialog">Open dialog</button>

<dialog id="my-dialog">
  <p>This dialog was opened using an invoker command.</p>
  <button commandfor="my-dialog" command="close">Close</button>
</dialog>
```

#### Kết quả

Mở hộp thoại bằng cách nhấn button "Open dialog".
Bạn có thể đóng hộp thoại bằng cách chọn button "Close" hoặc nhấn phím <kbd>Esc</kbd>.

{{EmbedLiveSample("Open and close a dialog using Invoker Command API HTML attributes", "100%", 200)}}

### Thuộc tính HTML của Popover API

Ví dụ này minh họa cách bạn có thể mở và đóng hộp thoại non-modal bằng cách dùng các thuộc tính HTML [`popover`](/en-US/docs/Web/HTML/Reference/Global_attributes/popover), [`popovertarget`](/en-US/docs/Web/HTML/Reference/Elements/button#popovertarget), và [`popovertargetaction`](/en-US/docs/Web/HTML/Reference/Elements/button#popovertargetaction) của [Popover API](/en-US/docs/Web/API/Popover_API).

`<dialog>` được chuyển thành popover bằng cách thêm thuộc tính `popover`.
Vì chúng ta chưa chỉ định giá trị cho thuộc tính, giá trị mặc định `"auto"` được dùng.
Điều này bật hành vi "đóng nhẹ", cho phép hộp thoại được đóng bằng cách nhấp bên ngoài hộp thoại hoặc nhấn <kbd>Esc</kbd>.
Thay vào đó chúng ta có thể đặt `popover="manual"` để tắt hành vi "đóng nhẹ", trong trường hợp đó hộp thoại sẽ phải được đóng bằng button "Close".

Lưu ý rằng chúng ta chưa chỉ định thuộc tính `popovertargetaction` cho `<button>` mở hộp thoại.
Điều này không cần thiết trong trường hợp này, vì giá trị mặc định của nó là `toggle`, sẽ chuyển đổi hộp thoại giữa trạng thái mở và đóng khi button được nhấp.

```html
<button popovertarget="my-dialog">Open dialog</button>

<dialog id="my-dialog" popover>
  <p>This dialog was opened using a popovertargetaction attribute.</p>
  <button popovertarget="my-dialog" popovertargetaction="hide">Close</button>
</dialog>
```

#### Kết quả

Mở hộp thoại bằng cách nhấn button "Open dialog".
Bạn có thể đóng hộp thoại bằng cách chọn button "Close" hoặc nhấn phím <kbd>Esc</kbd>.
Bạn cũng có thể đóng nó bằng cách chọn bên ngoài hộp thoại, vì nó là non-modal.

{{EmbedLiveSample("Popover API HTML attributes", "100%", 200)}}

### Dùng thuộc tính `open` của dialog

Ví dụ này minh họa cách bạn có thể đặt thuộc tính boolean `open` trên phần tử `<dialog>`, để tạo hộp thoại non-modal chỉ dùng HTML đã mở khi tải trang.

Hộp thoại có thể được đóng bằng cách nhấn button "OK" vì thuộc tính `method` trong phần tử `<form>` được đặt thành `"dialog"`.
Trong trường hợp này, không cần JavaScript để đóng form.

```html
<dialog open>
  <p>Greetings, one and all!</p>
  <form method="dialog">
    <button>OK</button>
  </form>
</dialog>
```

#### Kết quả

Hộp thoại này ban đầu mở và non-modal do có thuộc tính `open`.
Sau khi nhấp "OK", hộp thoại bị đóng, để lại khung Kết quả trống.

{{EmbedLiveSample("HTML-only non-modal dialog", "100%", 200)}}

> [!NOTE]
> Tải lại trang để đặt lại kết quả.

Khi hộp thoại bị đóng, không có phương thức nào được cung cấp để mở lại nó. Phương thức ưu tiên để hiển thị hộp thoại non-modal là dùng phương thức {{domxref("HTMLDialogElement.show()")}}.
Có thể chuyển đổi hiển thị hộp thoại bằng cách thêm hoặc xóa thuộc tính boolean `open`, nhưng đây không phải là thực hành được khuyến nghị.

### Tạo hộp thoại modal

Ví dụ này minh họa hộp thoại modal với nền [gradient](/en-US/docs/Web/CSS/Reference/Values/gradient). Phương thức `.showModal()` mở hộp thoại modal khi button "Show the dialog" được kích hoạt. Hộp thoại có thể được đóng bằng cách nhấn phím <kbd>Esc</kbd> hoặc qua phương thức `close()` khi button "Close" bên trong hộp thoại được kích hoạt.

Khi hộp thoại mở, trình duyệt theo mặc định đặt tiêu điểm vào phần tử đầu tiên có thể được lấy tiêu điểm trong hộp thoại. Trong ví dụ này, thuộc tính [`autofocus`](/en-US/docs/Web/HTML/Reference/Global_attributes/autofocus) được áp dụng cho button "Close", đặt tiêu điểm cho nó khi hộp thoại mở, vì đây là phần tử chúng ta mong đợi người dùng sẽ tương tác ngay sau khi hộp thoại mở.

#### HTML

```html
<dialog>
  <button autofocus>Close</button>
  <p>This modal dialog has a groovy backdrop!</p>
</dialog>
<button>Show the dialog</button>
```

#### CSS

Chúng ta có thể tạo kiểu cho nền của hộp thoại bằng cách dùng phần tử giả {{cssxref('::backdrop')}}.

```css
::backdrop {
  background-image: linear-gradient(
    45deg,
    magenta,
    rebeccapurple,
    dodgerblue,
    green
  );
  opacity: 0.75;
}
```

#### JavaScript

Hộp thoại được mở ở dạng modal bằng phương thức `.showModal()` và đóng bằng phương thức `.close()` hoặc `.requestClose()`.

```js
const dialog = document.querySelector("dialog");
const showButton = document.querySelector("dialog + button");
const closeButton = document.querySelector("dialog button");

// Button "Show the dialog" mở hộp thoại ở dạng modal
showButton.addEventListener("click", () => {
  dialog.showModal();
});

// Button "Close" đóng hộp thoại
closeButton.addEventListener("click", () => {
  dialog.close();
});
```

#### Kết quả

{{EmbedLiveSample("Creating_a_modal_dialog", "100%", 200)}}

Khi hộp thoại modal được hiển thị, nó xuất hiện phía trên tất cả các hộp thoại khác có thể có. Mọi thứ bên ngoài hộp thoại modal đều bất hoạt và các tương tác bên ngoài hộp thoại bị chặn. Lưu ý rằng khi hộp thoại mở, ngoại trừ chính hộp thoại, không thể tương tác với tài liệu; button "Show the dialog" phần lớn bị che khuất bởi nền gần như mờ đục của hộp thoại và bất hoạt.

### Xử lý giá trị trả về từ hộp thoại

Ví dụ này minh họa [`returnValue`](/en-US/docs/Web/API/HTMLDialogElement/returnValue) của phần tử `<dialog>` và cách đóng hộp thoại modal bằng cách dùng form. Mặc định, `returnValue` là chuỗi rỗng hoặc giá trị của button gửi form trong phần tử `<dialog>`, nếu có.

Ví dụ này mở hộp thoại modal khi button "Show the dialog" được kích hoạt. Hộp thoại chứa form với {{HTMLElement("select")}} và hai phần tử {{HTMLElement("button")}}, mặc định là `type="submit"`. Trình lắng nghe sự kiện cập nhật giá trị của button "Confirm" khi tùy chọn select thay đổi. Nếu button "Confirm" được kích hoạt để đóng hộp thoại, giá trị hiện tại của button là giá trị trả về. Nếu hộp thoại được đóng bằng cách nhấn button "Cancel", `returnValue` là `cancel`.

Khi hộp thoại được đóng, giá trị trả về được hiển thị dưới button "Show the dialog". Nếu hộp thoại được đóng bằng cách nhấn phím <kbd>Esc</kbd>, `returnValue` không được cập nhật, và sự kiện `close` không xảy ra, vì vậy văn bản trong {{HTMLElement("output")}} không được cập nhật.

#### HTML

```html
<!-- Hộp thoại modal chứa form -->
<dialog id="favDialog">
  <form>
    <p>
      <label>
        Favorite animal:
        <select>
          <option value="default">Choose…</option>
          <option>Brine shrimp</option>
          <option>Red panda</option>
          <option>Spider monkey</option>
        </select>
      </label>
    </p>
    <div>
      <button value="cancel" formmethod="dialog">Cancel</button>
      <button id="confirmBtn" value="default">Confirm</button>
    </div>
  </form>
</dialog>
<p>
  <button id="showDialog">Show the dialog</button>
</p>
<output></output>
```

#### JavaScript

Hộp thoại được mở bằng trình lắng nghe sự kiện trên button "Show the dialog", gọi {{domxref("HTMLDialogElement.showModal()")}} khi button được nhấp.

Hộp thoại được đóng khi button "Cancel" được nhấp, vì `<button>` bao gồm thuộc tính [`formmethod="dialog"`](/en-US/docs/Web/HTML/Reference/Elements/input/submit#formmethod).
Khi phương thức của form là [`dialog`](#additional_notes), trạng thái của form được lưu nhưng không được gửi, và hộp thoại đóng lại (thuộc tính ghi đè phương thức {{HTTPMethod("GET")}} mặc định của {{HTMLElement("form")}}).
Không có `action`, việc gửi form qua phương thức {{HTTPMethod("GET")}} mặc định gây ra tải lại trang.
Chúng ta dùng JavaScript để ngăn việc gửi và đóng hộp thoại với các phương thức {{domxref("event.preventDefault()")}} và {{domxref("HTMLDialogElement.close()")}}, tương ứng.

```js
const showButton = document.getElementById("showDialog");
const favDialog = document.getElementById("favDialog");
const outputBox = document.querySelector("output");
const selectEl = favDialog.querySelector("select");
const confirmBtn = favDialog.querySelector("#confirmBtn");

// Button "Show the dialog" mở <dialog> ở dạng modal
showButton.addEventListener("click", () => {
  favDialog.showModal();
});

// Button "Cancel" đóng hộp thoại mà không gửi do [formmethod="dialog"], kích hoạt sự kiện close.
favDialog.addEventListener("close", (e) => {
  outputBox.value =
    favDialog.returnValue === "default"
      ? "No return value."
      : `ReturnValue: ${favDialog.returnValue}.`; // Phải kiểm tra "default" thay vì chuỗi rỗng
});

// Ngăn button "confirm" khỏi hành vi mặc định là gửi form, và đóng hộp thoại với phương thức `close()`, kích hoạt sự kiện "close".
confirmBtn.addEventListener("click", (event) => {
  event.preventDefault(); // Chúng ta không muốn gửi form giả này
  favDialog.close(selectEl.value); // Phải gửi giá trị của hộp select ở đây.
});
```

#### Kết quả

{{EmbedLiveSample("Handling the return value from the dialog", "100%", 300)}}

### Đóng hộp thoại với trường form bắt buộc

Khi form bên trong hộp thoại có trường bắt buộc, user agent chỉ cho phép bạn đóng hộp thoại sau khi bạn cung cấp giá trị cho trường bắt buộc. Để đóng hộp thoại như vậy, hãy dùng thuộc tính [`formnovalidate`](/en-US/docs/Web/HTML/Reference/Elements/input#formnovalidate) trên button đóng hoặc gọi phương thức `close()` trên đối tượng hộp thoại khi button đóng được nhấp.

```html
<dialog id="dialog">
  <form method="dialog">
    <p>
      <label>
        Favorite animal:
        <input type="text" required />
      </label>
    </p>
    <div>
      <input type="submit" id="normal-close" value="Normal close" />
      <input
        type="submit"
        id="novalidate-close"
        value="Novalidate close"
        formnovalidate />
      <input type="submit" id="js-close" value="JS close" />
    </div>
  </form>
</dialog>
<p>
  <button id="show-dialog">Show the dialog</button>
</p>
<output></output>
```

```css hidden
[type="submit"] {
  margin-right: 1rem;
}
```

#### JavaScript

```js
const showBtn = document.getElementById("show-dialog");
const dialog = document.getElementById("dialog");
const jsCloseBtn = dialog.querySelector("#js-close");

showBtn.addEventListener("click", () => {
  dialog.showModal();
});

jsCloseBtn.addEventListener("click", (e) => {
  e.preventDefault();
  dialog.close();
});
```

#### Kết quả

{{EmbedLiveSample("Closing a dialog with a required form input", "100%", 300)}}

Từ kết quả, chúng ta thấy không thể đóng hộp thoại bằng button _Normal close_. Nhưng hộp thoại có thể được đóng nếu chúng ta bỏ qua xác thực form bằng cách dùng thuộc tính `formnovalidate` trên button _Cancel_. Theo lập trình, `dialog.close()` cũng sẽ đóng hộp thoại như vậy.

### So sánh các hành vi closedby khác nhau

Ví dụ này minh họa sự khác biệt trong hành vi giữa các giá trị khác nhau của thuộc tính [`closedby`](#closedby).

#### HTML

Chúng ta cung cấp ba phần tử {{htmlelement("button")}} và ba phần tử `<dialog>`. Mỗi button sẽ được lập trình để mở một hộp thoại khác nhau minh họa hành vi của một trong ba giá trị của thuộc tính `closedby` — `none`, `closerequest`, và `any`. Lưu ý rằng mỗi phần tử `<dialog>` chứa một phần tử `<button>` sẽ được dùng để đóng nó.

```html live-sample___closedbyvalues
<p>Choose a <code>&lt;dialog&gt;</code> type to show:</p>
<div id="controls">
  <button id="none-btn"><code>closedby="none"</code></button>
  <button id="closerequest-btn">
    <code>closedby="closerequest"</code>
  </button>
  <button id="any-btn"><code>closedby="any"</code></button>
</div>

<dialog closedby="none">
  <h2><code>closedby="none"</code></h2>
  <p>
    Only closable using a specific provided mechanism, which in this case is
    pressing the "Close" button below.
  </p>
  <button class="close">Close</button>
</dialog>

<dialog closedby="closerequest">
  <h2><code>closedby="closerequest"</code></h2>
  <p>Closable using the "Close" button or the Esc key.</p>
  <button class="close">Close</button>
</dialog>

<dialog closedby="any">
  <h2><code>closedby="any"</code></h2>
  <p>
    Closable using the "Close" button, the Esc key, or by clicking outside the
    dialog. "Light dismiss" behavior.
  </p>
  <button class="close">Close</button>
</dialog>
```

```css hidden live-sample___closedbyvalues
body {
  font-family: sans-serif;
}

#controls {
  display: flex;
  justify-content: space-around;
}

dialog {
  width: 480px;
  border-radius: 5px;
  border-color: rgb(0 0 0 / 0.3);
}

dialog h2 {
  margin: 0;
}

dialog p {
  line-height: 1.4;
}
```

#### JavaScript

Ở đây chúng ta gán các biến khác nhau để tham chiếu đến các phần tử `<button>` điều khiển chính, các phần tử `<dialog>`, và các phần tử `<button>` "Close" bên trong hộp thoại. Đầu tiên chúng ta gán trình lắng nghe sự kiện [`click`](/en-US/docs/Web/API/Element/click_event) cho mỗi button điều khiển bằng [`addEventListener`](/en-US/docs/Web/API/EventTarget/addEventListener), hàm xử lý sự kiện của nó mở phần tử `<dialog>` liên kết qua [`showModal()`](/en-US/docs/Web/API/HTMLDialogElement/showModal). Sau đó chúng ta lặp qua các tham chiếu `<button>` "Close", gán cho mỗi một hàm xử lý sự kiện click đóng phần tử `<dialog>` của nó qua [`close()`](/en-US/docs/Web/API/HTMLDialogElement/close).

```js live-sample___closedbyvalues
const noneBtn = document.getElementById("none-btn");
const closerequestBtn = document.getElementById("closerequest-btn");
const anyBtn = document.getElementById("any-btn");

const noneDialog = document.querySelector("[closedby='none']");
const closerequestDialog = document.querySelector("[closedby='closerequest']");
const anyDialog = document.querySelector("[closedby='any']");

const closeBtns = document.querySelectorAll(".close");

noneBtn.addEventListener("click", () => {
  noneDialog.showModal();
});

closerequestBtn.addEventListener("click", () => {
  closerequestDialog.showModal();
});

anyBtn.addEventListener("click", () => {
  anyDialog.showModal();
});

closeBtns.forEach((btn) => {
  btn.addEventListener("click", () => {
    btn.parentElement.close();
  });
});
```

#### Kết quả

Kết quả hiển thị như sau:

{{EmbedLiveSample("closedby-values", "100%", 300)}}

Hãy thử nhấp vào từng button để mở hộp thoại. Button đầu tiên chỉ có thể được đóng bằng cách nhấp button "Close" của nó. Button thứ hai cũng có thể được đóng qua hành động người dùng cụ thể theo thiết bị như nhấn phím <kbd>Esc</kbd>. Button thứ ba có đầy đủ [hành vi "đóng nhẹ"](/en-US/docs/Web/API/Popover_API/Using#auto_state_and_light_dismiss), vì vậy nó cũng có thể được đóng bằng cách nhấp hoặc chạm bên ngoài hộp thoại.

### Tạo hiệu ứng cho hộp thoại

Các `<dialog>` được đặt thành [`display: none;`](/en-US/docs/Web/CSS/Reference/Properties/display) khi ẩn và `display: block;` khi hiển thị, cũng như bị xóa/thêm vào {{glossary("top layer")}} và [cây trợ năng](/en-US/docs/Web/Performance/Guides/How_browsers_work#building_the_accessibility_tree). Do đó, để tạo hiệu ứng cho các phần tử `<dialog>`, thuộc tính {{cssxref("display")}} cần có khả năng tạo hiệu ứng. [Các trình duyệt hỗ trợ](/en-US/docs/Web/CSS/Reference/Properties/display#browser_compatibility) tạo hiệu ứng cho `display` với biến thể của [kiểu tạo hiệu ứng rời rạc](/en-US/docs/Web/CSS/Guides/Animations/Animatable_properties#discrete). Cụ thể, trình duyệt sẽ chuyển đổi giữa `none` và giá trị `display` khác để nội dung được tạo hiệu ứng hiển thị trong toàn bộ thời gian tạo hiệu ứng.

Ví dụ:

- Khi tạo hiệu ứng `display` từ `none` sang `block` (hoặc giá trị `display` hiển thị khác), giá trị sẽ chuyển sang `block` ở `0%` của thời gian tạo hiệu ứng để nó hiển thị trong suốt.
- Khi tạo hiệu ứng `display` từ `block` (hoặc giá trị `display` hiển thị khác) sang `none`, giá trị sẽ chuyển sang `none` ở `100%` của thời gian tạo hiệu ứng để nó hiển thị trong suốt.

> [!NOTE]
> Khi tạo hiệu ứng bằng [CSS transitions](/en-US/docs/Web/CSS/Guides/Transitions), [`transition-behavior: allow-discrete`](/en-US/docs/Web/CSS/Reference/Properties/transition-behavior) cần được đặt để bật hành vi trên. Hành vi này có sẵn theo mặc định khi tạo hiệu ứng bằng [CSS animations](/en-US/docs/Web/CSS/Guides/Animations); không cần bước tương đương.

#### Chuyển đổi phần tử dialog

Khi tạo hiệu ứng `<dialog>` với CSS transitions, các tính năng sau là cần thiết:

- Quy tắc at-rule {{cssxref("@starting-style")}}
  - : Cung cấp một tập hợp các giá trị bắt đầu cho các thuộc tính được đặt trên `<dialog>` mà bạn muốn chuyển đổi từ mỗi lần nó được mở. Điều này cần thiết để tránh hành vi không mong muốn. Mặc định, CSS transitions chỉ xảy ra khi thuộc tính thay đổi từ giá trị này sang giá trị khác trên phần tử hiển thị; chúng không được kích hoạt khi cập nhật kiểu đầu tiên của phần tử, hoặc khi kiểu `display` thay đổi từ `none` sang kiểu khác.
- Thuộc tính {{cssxref("display")}}
  - : Thêm `display` vào danh sách transitions để `<dialog>` vẫn là `display: block` (hoặc giá trị `display` hiển thị khác được đặt ở trạng thái mở của hộp thoại) trong suốt thời gian transition, đảm bảo các transitions khác hiển thị.
- Thuộc tính {{cssxref("overlay")}}
  - : Bao gồm `overlay` trong danh sách transitions để đảm bảo việc xóa `<dialog>` khỏi top layer bị trì hoãn cho đến khi transition hoàn thành, đảm bảo transition hiển thị.
- Thuộc tính {{cssxref("transition-behavior")}}
  - : Đặt `transition-behavior: allow-discrete` trên các transitions `display` và `overlay` (hoặc trên cú pháp viết tắt {{cssxref("transition")}}) để bật discrete transitions trên hai thuộc tính này mà mặc định không thể tạo hiệu ứng.

Đây là ví dụ nhanh để hiển thị giao diện của nó.

##### HTML

HTML chứa phần tử `<dialog>`, cộng với button để hiển thị hộp thoại. Ngoài ra, phần tử `<dialog>` chứa button khác để tự đóng.

```html
<dialog id="dialog">
  Content here
  <button class="close">close</button>
</dialog>

<button class="show">Show Modal</button>
```

##### CSS

Trong CSS, chúng ta bao gồm khối `@starting-style` xác định các kiểu bắt đầu transition cho các thuộc tính `opacity` và `transform`, các kiểu kết thúc transition ở trạng thái `dialog:open`, và các kiểu mặc định ở trạng thái `dialog` mặc định để transition trở lại sau khi `<dialog>` xuất hiện. Lưu ý cách danh sách `transition` của `<dialog>` bao gồm không chỉ các thuộc tính này, mà còn các thuộc tính `display` và `overlay`, mỗi thuộc tính có `allow-discrete` được đặt trên chúng.

Chúng ta cũng đặt giá trị kiểu bắt đầu cho thuộc tính {{cssxref("background-color")}} trên {{cssxref("::backdrop")}} xuất hiện phía sau `<dialog>` khi nó mở, để cung cấp hiệu ứng làm tối đẹp. Bộ chọn `dialog:open::backdrop` chỉ chọn các nền của phần tử `<dialog>` khi hộp thoại đang mở.

```css
/* Trạng thái mở của hộp thoại */
dialog:open {
  opacity: 1;
  transform: scaleY(1);
}

/* Trạng thái đóng của hộp thoại */
dialog {
  opacity: 0;
  transform: scaleY(0);
  transition:
    opacity 0.7s ease-out,
    transform 0.7s ease-out,
    overlay 0.7s ease-out allow-discrete,
    display 0.7s ease-out allow-discrete;
  /* Tương đương với
  transition: all 0.7s allow-discrete; */
}

/* Trạng thái trước khi mở */
/* Cần đặt sau quy tắc dialog:open trước để có hiệu lực,
    vì độ ưu tiên là như nhau */
@starting-style {
  dialog:open {
    opacity: 0;
    transform: scaleY(0);
  }
}

/* Chuyển đổi :backdrop khi hộp thoại modal được đưa lên top layer */
dialog::backdrop {
  background-color: transparent;
  transition:
    display 0.7s allow-discrete,
    overlay 0.7s allow-discrete,
    background-color 0.7s;
  /* Tương đương với
  transition: all 0.7s allow-discrete; */
}

dialog:open::backdrop {
  background-color: rgb(0 0 0 / 25%);
}

/* Quy tắc starting-style này không thể lồng bên trong bộ chọn trên
vì bộ chọn lồng không thể đại diện cho phần tử giả. */

@starting-style {
  dialog:open::backdrop {
    background-color: transparent;
  }
}
```

> [!NOTE]
> Trong các trình duyệt không hỗ trợ lớp giả {{cssxref(":open")}}, bạn có thể dùng bộ chọn thuộc tính `dialog[open]` để tạo kiểu cho phần tử `<dialog>` khi ở trạng thái mở.

##### JavaScript

JavaScript thêm trình xử lý sự kiện vào các button hiển thị và đóng khiến chúng hiển thị và đóng `<dialog>` khi chúng được nhấp:

```js
const dialogElem = document.getElementById("dialog");
const showBtn = document.querySelector(".show");
const closeBtn = document.querySelector(".close");

showBtn.addEventListener("click", () => {
  dialogElem.showModal();
});

closeBtn.addEventListener("click", () => {
  dialogElem.close();
});
```

##### Kết quả

Mã hiển thị như sau:

{{ EmbedLiveSample("Transitioning dialog elements", "100%", "200") }}

> [!NOTE]
> Vì các `<dialog>` thay đổi từ `display: none` sang `display: block` mỗi lần chúng được hiển thị, `<dialog>` chuyển đổi từ các kiểu `@starting-style` của nó sang các kiểu `dialog:open` mỗi lần transition vào xảy ra. Khi `<dialog>` đóng, nó chuyển đổi từ trạng thái `dialog:open` sang trạng thái `dialog` mặc định.
>
> Có thể transition kiểu khi vào và ra khác nhau trong các trường hợp như vậy. Xem ví dụ [Minh họa khi nào starting styles được dùng](/en-US/docs/Web/CSS/Reference/At-rules/@starting-style#demonstration_of_when_starting_styles_are_used) của chúng ta để có bằng chứng về điều này.

#### Tạo hiệu ứng keyframe cho dialog

Khi tạo hiệu ứng `<dialog>` với CSS keyframe animations, có một số điểm khác biệt cần lưu ý so với transitions:

- Bạn không cung cấp `@starting-style`.
- Bạn bao gồm giá trị `display` trong keyframe; đây sẽ là giá trị `display` trong toàn bộ thời gian tạo hiệu ứng, hoặc cho đến khi gặp giá trị `display` khác không phải `none`.
- Bạn không cần bật rõ ràng discrete animations; không có tương đương với `allow-discrete` bên trong keyframes.
- Bạn cũng không cần đặt `overlay` bên trong keyframes; tạo hiệu ứng `display` xử lý việc tạo hiệu ứng `<dialog>` từ trạng thái hiển thị sang ẩn.

Hãy xem ví dụ để bạn có thể thấy giao diện của nó.

##### HTML

Đầu tiên, HTML chứa phần tử `<dialog>`, cộng với button để hiển thị hộp thoại. Ngoài ra, phần tử `<dialog>` chứa button khác để tự đóng.

```html
<dialog id="dialog">
  Content here
  <button class="close">close</button>
</dialog>

<button class="show">Show Modal</button>
```

##### CSS

CSS xác định keyframes để tạo hiệu ứng giữa trạng thái đóng và hiển thị của `<dialog>`, cộng với hiệu ứng fade-in cho nền của `<dialog>`. Các tạo hiệu ứng `<dialog>` bao gồm tạo hiệu ứng `display` để đảm bảo các hiệu ứng hiển thị thực tế vẫn hiển thị trong toàn bộ thời gian. Lưu ý rằng không thể tạo hiệu ứng cho fade out của nền — nền bị xóa ngay lập tức khỏi DOM khi `<dialog>` đóng, vì vậy không có gì để tạo hiệu ứng.

```css
dialog {
  animation: fade-out 0.7s ease-out;
}

dialog:open {
  animation: fade-in 0.7s ease-out;
}

dialog:open::backdrop {
  background-color: black;
  animation: backdrop-fade-in 0.7s ease-out forwards;
}

/* Keyframes tạo hiệu ứng */

@keyframes fade-in {
  0% {
    opacity: 0;
    transform: scaleY(0);
    display: none;
  }

  100% {
    opacity: 1;
    transform: scaleY(1);
    display: block;
  }
}

@keyframes fade-out {
  0% {
    opacity: 1;
    transform: scaleY(1);
    display: block;
  }

  100% {
    opacity: 0;
    transform: scaleY(0);
    display: none;
  }
}

@keyframes backdrop-fade-in {
  0% {
    opacity: 0;
  }

  100% {
    opacity: 0.25;
  }
}

body,
button {
  font-family: system-ui;
}
```

##### JavaScript

Cuối cùng, JavaScript thêm trình xử lý sự kiện vào các button để bật việc hiển thị và đóng `<dialog>`:

```js
const dialogElem = document.getElementById("dialog");
const showBtn = document.querySelector(".show");
const closeBtn = document.querySelector(".close");

showBtn.addEventListener("click", () => {
  dialogElem.showModal();
});

closeBtn.addEventListener("click", () => {
  dialogElem.close();
});
```

##### Kết quả

Mã hiển thị như sau:

{{ EmbedLiveSample("dialog keyframe animations", "100%", "200") }}

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories">Danh mục nội dung</a>
      </th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content">Nội dung luồng</a>,
        gốc phân đoạn
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content">Nội dung luồng</a>
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ thẻ</th>
      <td>Không, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Bất kỳ phần tử nào chấp nhận
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content">nội dung luồng</a>
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/dialog_role">dialog</a>
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/alertdialog_role"><code>alertdialog</code></a></td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLDialogElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("HTMLDialogElement")}}
- Sự kiện {{domxref("HTMLDialogElement/close_event", "close")}} của giao diện `HTMLDialogElement`
- Sự kiện {{domxref("HTMLDialogElement/cancel_event", "cancel")}} của giao diện `HTMLDialogElement`
- Thuộc tính {{domxref("HTMLDialogElement/open", "open")}} của giao diện `HTMLDialogElement`
- Thuộc tính toàn cục [`inert`](/en-US/docs/Web/HTML/Reference/Global_attributes/inert) cho các phần tử HTML
- Phần tử giả CSS {{CSSXref("::backdrop")}}
- [Web forms](/en-US/docs/Learn_web_development/Extensions/Forms) trong khu vực Learn
