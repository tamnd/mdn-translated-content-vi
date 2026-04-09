---
title: "ARIA: thuộc tính aria-labelledby"
short-title: aria-labelledby
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-labelledby
sidebar: accessibilitysidebar
---

Thuộc tính `aria-labelledby` xác định phần tử (hoặc nhiều phần tử) gán nhãn cho phần tử mà nó được áp dụng lên.

## Mô tả

Thuộc tính `aria-labelledby` cho phép tác giả tham chiếu đến các phần tử khác trên trang để định nghĩa một tên truy cập. Điều này hữu ích khi dùng các phần tử không có hỗ trợ gốc cho việc liên kết phần tử nhằm cung cấp tên truy cập.

Một số phần tử lấy [tên truy cập](https://w3c.github.io/accname/#dfn-accessible-name) từ nội dung bên trong của chúng. Ví dụ, tên truy cập của {{HTMLElement('button')}}, {{HTMLElement('a')}}, hoặc {{HTMLElement('td')}} đến từ văn bản nằm giữa thẻ mở và thẻ đóng. Các phần tử khác như {{HTMLElement('textarea')}}, {{HTMLElement('fieldset')}}, và {{HTMLElement('table')}} lấy tên truy cập từ nội dung của các phần tử liên kết; với các phần tử này, tên truy cập đến từ {{HTMLElement('label')}} có thuộc tính `for`, {{HTMLElement('legend')}}, và {{HTMLElement('caption')}} tương ứng.

Tất cả các phần tử tương tác phải có tên truy cập. `aria-labelledby` có thể được dùng để tham chiếu đến một phần tử khác nhằm định nghĩa tên truy cập của nó, khi tên truy cập của phần tử cần dùng nội dung từ nơi khác trong DOM.

Nếu không có nội dung nào có thể được tham chiếu để tạo tên truy cập, hãy dùng thuộc tính [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) thay thế.

Mục đích của `aria-labelledby` giống với `aria-label`. Nó cung cấp cho người dùng một tên truy cập dễ nhận biết cho phần tử tương tác. Nếu một phần tử có cả hai thuộc tính, `aria-labelledby` sẽ được dùng. `aria-labelledby` có ưu tiên cao hơn mọi cách khác để cung cấp tên truy cập, bao gồm `aria-label`, {{HTMLElement('label')}}, và nội dung văn bản bên trong phần tử.

Thuộc tính `aria-labelledby` và [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby) đều tham chiếu đến các phần tử khác để tính toán phần thay thế văn bản. `aria-labelledby` nên tham chiếu đến văn bản ngắn cung cấp tên truy cập cho phần tử. `aria-describedby` được dùng để tham chiếu nội dung dài hơn cung cấp phần mô tả. Nếu không có phần tử nào trong DOM cung cấp một nhãn ngắn phù hợp cho tên truy cập của phần tử tương tác, hãy dùng `aria-label` để định nghĩa tên truy cập.

> [!NOTE]
> Trong tiếng Anh Mỹ, "labeled" được viết với một chữ "l", nhưng cách viết "labelledby" đã được thiết lập và là cách viết được dùng trong các API trợ năng.

Ví dụ sau dùng `aria-labelledby` để cung cấp tên truy cập cho một input checkbox bằng cách sử dụng nội dung văn bản của một phần tử anh em:

```html
<span
  role="checkbox"
  aria-checked="false"
  tabindex="0"
  aria-labelledby="tac"></span>
<span id="tac">Tôi đồng ý với Điều khoản và Điều kiện.</span>
```

Lưu ý rằng mặc dù trong trường hợp này dùng `aria-labelledby` tương tự như dùng phần tử HTML {{HTMLElement('label')}} với thuộc tính `for`, vẫn có một số khác biệt rất quan trọng. Thuộc tính `aria-labelledby` chỉ định nghĩa tên truy cập. Nó không cung cấp các chức năng khác của `<label>`, chẳng hạn như việc nhấp vào phần tử gán nhãn sẽ kích hoạt input mà nó liên kết. Điều đó phải được thêm lại bằng JavaScript.

May mắn là HTML {{HTMLElement('input')}} với `type="checkbox"` hoạt động với `<label>` gốc. Khi có thể, hãy dùng cách sau:

```html
<label for="tac">
  <input id="tac" type="checkbox" name="terms-and-conditions" />
  Tôi đồng ý với Điều khoản và Điều kiện.
</label>
<p><a href="tac.html">Đọc Điều khoản và Điều kiện của chúng tôi</a>.</p>
```

### Lợi ích (và hạn chế)

1. Thuộc tính `aria-labelledby` có mức ưu tiên cao nhất khi trình duyệt tính toán tên truy cập. Hãy lưu ý rằng nó ghi đè lên các cách đặt tên khác, bao gồm `aria-label`, các thuộc tính đặt tên khác, và thậm chí cả nội dung của phần tử.

   ```html
   <button aria-label="Blue" aria-labelledby="color">Red</button>
   <span id="color">Yellow</span>
   ```

   Trong ví dụ này, tên truy cập là "Yellow".

2. Giá trị của thuộc tính `aria-labelledby` là một danh sách tham chiếu id được phân tách bằng khoảng trắng, nghĩa là bạn có thể kết hợp nhiều phần tử thành một tên truy cập duy nhất. Bạn có thể đưa cả [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) của chính phần tử đó để tham chiếu đến nội dung của nó.

   ```html
   <h2 id="attr" class="article-title">13 thuộc tính ARIA bạn cần biết</h2>
   <p>
     Có hơn 50 trạng thái và thuộc tính ARIA, nhưng 13 trong số đó nổi bật…
     <a href="13.html" id="rm13" aria-labelledby="rm13 attr">đọc thêm</a>
   </p>
   ```

   Trong ví dụ này, tên truy cập là "đọc thêm 13 thuộc tính ARIA bạn cần biết".

3. Thứ tự giá trị của thuộc tính `aria-labelledby` là quan trọng. Khi có nhiều hơn một phần tử được tham chiếu bởi `aria-labelledby`, nội dung từ từng phần tử được kết hợp theo thứ tự chúng được tham chiếu trong giá trị `aria-labelledby`. Nếu chúng ta viết `aria-labelledby="attr rm13">`, tên truy cập sẽ là "13 thuộc tính ARIA bạn cần biết đọc thêm".

4. Thuộc tính `aria-labelledby` bỏ qua các `id` lặp lại trong giá trị của nó. Nếu một phần tử được tham chiếu nhiều hơn một lần, chỉ tham chiếu đầu tiên được xử lý. `aria-labelledby="attr attr rm13 rm13">` được xử lý như `aria-labelledby="attr rm13">`

5. Giá trị thuộc tính `aria-labelledby` có thể bao gồm nội dung từ các phần tử thậm chí không hiển thị. Mặc dù bạn nên cung cấp cho người dùng công nghệ trợ năng cùng nội dung như những người dùng khác, bạn có thể đưa nội dung từ các phần tử có thuộc tính HTML [`hidden`](/en-US/docs/Web/HTML/Reference/Global_attributes/hidden), CSS [`display: none`](/en-US/docs/Web/CSS/Reference/Properties/display), và CSS [`visibility: hidden`](/en-US/docs/Web/CSS/Reference/Properties/visibility) vào chuỗi tên được tính toán.

6. Thuộc tính `aria-labelledby` bao gồm giá trị của các phần tử input. Nếu giá trị tham chiếu đến một `<input>`, giá trị hiện tại của điều khiển biểu mẫu sẽ được đưa vào chuỗi tên được tính toán, và thay đổi khi giá trị được cập nhật.

7. Thuộc tính `aria-labelledby` không thể được chuỗi hóa. Nếu một phần tử có `aria-labelledby` tham chiếu đến một phần tử khác cũng có `aria-labelledby`, thì thuộc tính `aria-labelledby` trên phần tử được tham chiếu sẽ bị bỏ qua.

> [!WARNING]
> Vì việc tính toán tên của một phần tử với `aria-labelledby` có thể phức tạp và tham chiếu tới nội dung ẩn, việc kiểm thử với công nghệ trợ năng để bảo đảm tên mong đợi được hiển thị cho người dùng là rất quan trọng.

## Giá trị

- Danh sách tham chiếu ID
  - : Danh sách các giá trị ID được phân tách bằng khoảng trắng, tham chiếu đến các phần tử gán nhãn cho phần tử hiện tại.

## Giao diện liên quan

- {{domxref("Element.ariaLabelledByElements")}}
  - : Thuộc tính `ariaLabelledByElements` là một phần trong giao diện của mỗi phần tử.
    Giá trị của nó là một mảng các lớp con của {{domxref("Element")}} phản ánh các tham chiếu `id` trong thuộc tính `aria-labelledby` ([với một số lưu ý](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references)).
- {{domxref("ElementInternals.ariaLabelledByElements")}}
  - : Thuộc tính `ariaLabelledByElements` là một phần trong giao diện của mỗi custom element.
    Giá trị của nó là một mảng các lớp con của {{domxref("Element")}} phản ánh các tham chiếu `id` trong thuộc tính `aria-labelledby` ([với một số lưu ý](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references)).

## Vai trò liên quan

Được dùng trong hầu hết các vai trò **trừ** những vai trò không thể được tác giả cung cấp tên truy cập.

Thuộc tính `aria-labelledby` **KHÔNG** được hỗ trợ trong:

- [`caption`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles)
- [`code`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles)
- [`deletion`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles)
- [`emphasis`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles)
- [`generic`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/generic_role)
- [`insertion`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles)
- [`mark`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/mark_role)
- [`paragraph`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles)
- [`presentation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role) / [`none`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/none_role)
- [`strong`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles)
- [`subscript`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles)
- [`suggestion`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/suggestion_role)
- [`superscript`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles)
- [`term`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/term_role)
- [`time`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles)

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- HTML {{HTMLElement('label')}} element
- HTML {{HTMLElement('legend')}} element
- HTML {{HTMLElement('caption')}} element
- [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label)
- [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby)
