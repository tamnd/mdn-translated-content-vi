---
title: "ARIA: vai trò menuitemradio"
short-title: menuitemradio
slug: Web/Accessibility/ARIA/Reference/Roles/menuitemradio_role
page-type: aria-role
spec-urls:
  - https://w3c.github.io/aria/#menuitemradio
  - https://www.w3.org/WAI/ARIA/apg/patterns/menubar/examples/menubar-navigation/
sidebar: accessibilitysidebar
---

`menuitemradio` là một menu item có thể đánh dấu trong một tập phần tử có cùng vai trò, trong đó chỉ một phần tử có thể được đánh dấu tại một thời điểm.

## Mô tả

Các mục trong menu và menubar là menu item. Có ba kiểu menu item: [`menuitem`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitem_role), [`menuitemcheckbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemcheckbox_role), và `menuitemradio`. Để giới hạn số menu item được đánh dấu còn một trong một nhóm, hãy dùng vai trò `menuitemradio` trên tất cả các phần tử trong nhóm.

`menuitemradio` là menu item có thể đánh dấu trong một tập phần tử cùng vai trò, trong đó chỉ một phần tử có thể được đánh dấu tại một thời điểm.

Ba phần tử menu item này chỉ có thể được chứa trong, hoặc được sở hữu bởi, một phần tử có vai trò [`menu`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menu_role) hoặc [`menubar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menubar_role), tùy chọn được lồng trong một phần tử nhóm có vai trò [`group`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role). Việc lồng hoặc được sở hữu khác đi (xem [`aria-owns`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-owns)) trong một `menu` hoặc `menubar` xác định các menu item là những widget liên quan với nhau.

Khi tất cả các mục trong một submenu đều là thành viên của cùng một radio group, `group` được xác định bởi phần tử menu; phần tử `group` là không cần thiết.

Các menu item chứa vai trò `menuitemradio` phải bao gồm thuộc tính [`aria-checked`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-checked) để công nghệ hỗ trợ thấy được trạng thái radio button, trừ khi dùng [`<input type="radio">`](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox), trong trường hợp đó nên dùng thuộc tính [`checked`](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox#checked).

Tương tự như thuộc tính `checked` của các phần tử {{HTMLElement('input')}} kiểu `radio`, thuộc tính `aria-checked` của `menuitemradio` cho biết menu item đang được đánh dấu (`true`), hoặc chưa được đánh dấu (`false`). Không có giá trị `mixed` như ở `menuitemcheckbox`.

Chỉ một `menuitemradio` trong một nhóm có thể được đánh dấu cùng lúc. Khi một mục trong nhóm được đánh dấu, thuộc tính `aria-checked` của nó được đặt thành `true`, còn phần tử `menuitemradio` trước đó đã được đánh dấu trong cùng nhóm, nếu có, sẽ trở thành chưa được đánh dấu bằng cách đổi giá trị `aria-checked` của nó thành `false`.

Nếu bạn muốn nhiều hơn một mục trong nhóm được đánh dấu, hoặc nếu bạn muốn cho phép đánh dấu và bỏ đánh dấu một mục, hãy cân nhắc dùng `menuitemcheckbox`.

Nếu một `menu` hoặc `menubar` chứa nhiều hơn một nhóm phần tử `menuitemradio`, hoặc nếu menu chứa một nhóm phần tử `menuitemradio` cùng với các phần tử `menuitem` và/hoặc `menuitemcheckbox` không liên quan khác, hãy đặt mỗi tập phần tử `menuitemradio` liên quan trong một phần tử `group` hoặc phân tách nhóm phần tử `menuitemradio` khỏi các menu item khác bằng một phần tử `separator` (hoặc một phần tử HTML có vai trò tương đương như phần tử nhóm {{HTMLElement('fieldset')}} hoặc một phần tử ngắt chủ đề {{HTMLElement('hr')}}.

Bắt buộc phải có tên khả năng tiếp cận. Lý tưởng nhất, tên này nên đến từ một phần tử {{htmlelement('label')}} liên kết nếu dùng `<input type="radio">` hoặc nội dung con hiển thị. Lưu ý rằng nếu nhãn hoặc nội dung con không đủ và, tốt hơn là, dùng [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) tham chiếu nội dung không phải con hoặc dùng [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label), thì hai thuộc tính ARIA này sẽ ẩn các nội dung con khác khỏi công nghệ hỗ trợ.

Nếu tất cả phần tử trong tập không có trong DOM, hãy bao gồm các thuộc tính [`aria-setsize`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-setsize) và [`aria-posinset`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-posinset). Khi chỉ định `aria-setsize` và `aria-posinset` trên một `menuitemradio`, hãy đặt giá trị theo tổng số mục trong menu, không tính các separator.

Phần tử `menuitemradio` có thể có nội dung theo cụm từ, nhưng không được có nội dung tương tác làm phần tử con và không có phần tử con nào có thuộc tính `tabindex` được chỉ định.

### Tất cả phần tử con đều mang tính trình bày

Có một số loại thành phần giao diện người dùng, khi được biểu diễn trong một API khả năng tiếp cận của nền tảng, chỉ có thể chứa văn bản. Các API khả năng tiếp cận không có cách nào biểu diễn các phần tử ngữ nghĩa nằm trong `menuitemradio`. Để xử lý giới hạn này, trình duyệt tự động áp dụng vai trò [`presentation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role) cho mọi phần tử con của bất kỳ phần tử `menuitemradio` nào, vì đây là vai trò không hỗ trợ phần tử con mang ngữ nghĩa.

Ví dụ, hãy xem phần tử `menuitemradio` sau, có chứa một tiêu đề.

```html
<div role="menuitemradio"><h6>Name of my radio button</h6></div>
```

Vì các phần tử con của `menuitemradio` mang tính trình bày, nên đoạn mã sau tương đương:

```html
<div role="menuitemradio">
  <h6 role="presentation">Name of my radio button</h6>
</div>
```

Từ góc nhìn của người dùng công nghệ hỗ trợ, tiêu đề không tồn tại vì các đoạn mã trước đó tương đương với đoạn sau trong [cây khả năng tiếp cận](/en-US/docs/Glossary/Accessibility_tree):

```html
<div role="menuitemradio">Name of my radio button</div>
```

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- Vai trò [`menu`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menu_role)
  - : Widget cung cấp danh sách các hành động hoặc chức năng phổ biến mà người dùng có thể gọi.
- Vai trò [`menubar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menubar_role)
  - : Tương tự `menu` nhưng dành cho một tập lệnh thường dùng nhất quán, luôn hiển thị và thường trình bày theo chiều ngang.
- Vai trò [`group`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role)
  - : Vùng chứa cho một nhóm phần tử `menuitem`, bao gồm các phần tử `menuitemradio` trong một `menu` hoặc `menubar`.
- [`aria-checked`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-checked) (Bắt buộc)
  - : Đặt thành `true` hoặc `false`, nó chỉ ra trạng thái "đã đánh dấu" hiện tại của menuitemradio

### Tương tác bàn phím

Khi một `menu` mở ra, hoặc khi một `menubar` nhận focus, focus bàn phím được đặt vào mục đầu tiên. Tất cả các mục trong cả hai đều có thể nhận focus, bao gồm mọi phần tử `menuitemradio`.

Nếu `menuitemradio` nằm trong submenu của một `menubar` hoặc một menu được mở bằng menu button, các tương tác bàn phím sau phải được lập trình:

- <kbd>Enter</kbd>
  - : Nếu chưa được đánh dấu, đánh dấu `menuitemradio` đang được focus và bỏ đánh dấu mọi `menuitemradio` đã được đánh dấu khác trong cùng nhóm. Đồng thời, đóng menu.
- <kbd>Space</kbd>
  - : Nếu chưa được đánh dấu, đánh dấu `menuitemradio` đang được focus và bỏ đánh dấu mọi `menuitemradio` đã được đánh dấu khác trong cùng nhóm mà không đóng menu.
- <kbd>Escape</kbd>
  - : Đóng menu. Trong menubar, chuyển focus về mục cha của menubar.
- <kbd>Right Arrow</kbd>
  - : Đóng submenu. Trong menubar, chuyển focus tới mục tiếp theo trong menubar, mở bất kỳ submenu nào nếu có.
- <kbd>Left Arrow</kbd>
  - : Đóng menu. Trong menubar, chuyển focus tới mục trước đó trong menubar, mở bất kỳ submenu nào nếu có.
- <kbd>Down Arrow</kbd>
  - : Chuyển focus tới mục tiếp theo trong menu. Nếu focus đang ở mục cuối, chuyển focus về mục đầu.
- <kbd>Up Arrow</kbd>
  - : Chuyển focus tới mục trước đó trong menu. Nếu focus đang ở mục đầu, chuyển focus về mục cuối.
- <kbd>Home</kbd>
  - : Chuyển focus tới mục đầu tiên trong menu.
- <kbd>End</kbd>
  - : Chuyển focus tới mục cuối cùng trong menu.
- <kbd>Character</kbd>
  - : Chuyển focus tới mục tiếp theo có nhãn bắt đầu bằng ký tự vừa gõ. Nếu không có mục nào có nhãn bắt đầu bằng ký tự đó, focus không di chuyển.

### JavaScript bắt buộc

#### Trình xử lý sự kiện bắt buộc

- `onclick`
  - : Xử lý nhấp chuột trên cả radio và nhãn liên quan, thay đổi trạng thái radio bằng cách đổi giá trị thuộc tính `aria-checked` và đổi giao diện của radio để người dùng nhìn thấy nó như được đánh dấu hoặc không được đánh dấu
- `onKeyDown`
  - : Xử lý trường hợp người dùng nhấn phím <kbd>Space</kbd> để thay đổi trạng thái radio bằng cách đổi giá trị thuộc tính `aria-checked` và đổi giao diện của radio để người dùng nhìn thấy nó như được đánh dấu hoặc không được đánh dấu. Đồng thời xử lý tất cả các phím đã liệt kê ở phần điều hướng bàn phím ở trên.

## Ví dụ

```html
<li role="menuitemradio" tabindex="-1" aria-checked="false">Purple</li>
```

[`tabindex="-1"`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex) làm cho `menuitemradio` có thể nhận focus nhưng không nằm trong chuỗi tab của trang. Nếu chúng ta bao gồm `aria-checked="true"` thì nó sẽ cho biết `menuitemradio` đang được đánh dấu, và chúng ta sẽ tạo kiểu trực quan cho trạng thái được chọn giống như được đánh dấu bằng bộ chọn thuộc tính `[role='menuitemradio'][aria-checked='true']`. Thay vào đó, sự hiện diện của `aria-checked="false"` chỉ ra với công nghệ hỗ trợ rằng `menuitemradio` có thể được đánh dấu nhưng hiện chưa được đánh dấu. Tên khả năng tiếp cận "purple" đến từ nội dung.

Giao diện trực quan của trạng thái được chọn là một radio button đã được đánh dấu, và chúng ta có thể tạo nó bằng [generated content](/en-US/docs/Web/CSS/Guides/Generated_content), làm cho nó hiển thị và cùng màu với nội dung bằng cách đồng bộ với giá trị `aria-checked` bằng các [attribute selectors](/en-US/docs/Web/CSS/Reference/Selectors/Attribute_selectors) CSS và thay đổi thuộc tính {{cssxref("background-color")}}.

```css
[role="menuitemradio"]::before {
  display: inline-block;
  content: "";
  width: 1em;
  height: 1em;
  padding: 0.1em;
  border: 2px solid #333333;
  border-radius: 50%;
  box-sizing: border-box;
  background-clip: content-box;
  margin-inline-end: 2px;
}
[role="menuitemradio"][aria-checked="true"]::before {
  background-color: purple;
}
```

Đừng dùng thuộc tính rút gọn {{cssxref("background")}}, vì nó sẽ ghi đè thuộc tính {{cssxref("background-clip")}} mà chúng ta dùng để tạo hiệu ứng radio button.

### Ưu tiên HTML

Quy tắc đầu tiên của ARIA là: nếu một phần tử hoặc thuộc tính HTML gốc có ngữ nghĩa và hành vi bạn cần, hãy dùng nó thay vì tái sử dụng một phần tử và thêm vai trò, trạng thái hoặc thuộc tính ARIA để làm cho nó có thể tiếp cận. Vì vậy, nên dùng điều khiển biểu mẫu [HTML radio button](/en-US/docs/Web/HTML/Reference/Elements/input/radio) gốc thay vì dựng lại chức năng radio button bằng JavaScript và ARIA.

## Đặc tả

{{Specifications}}

## Xem thêm

- [`radio` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/radio_role)
- [`<input type="radio">`](/en-US/docs/Web/HTML/Reference/Elements/input/radio)
