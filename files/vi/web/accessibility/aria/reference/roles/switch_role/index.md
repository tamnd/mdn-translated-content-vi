---
title: "ARIA: vai trò switch"
short-title: switch
slug: Web/Accessibility/ARIA/Reference/Roles/switch_role
page-type: aria-role
spec-urls:
  - https://w3c.github.io/aria/#switch
  - https://w3c.github.io/html-aria/#index-aria-switch
sidebar: accessibilitysidebar
---

Vai trò ARIA **`switch`** về mặt chức năng giống hệt vai trò [checkbox](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/checkbox_role), ngoại trừ việc thay vì biểu diễn trạng thái "được chọn" và "không được chọn", vốn có ý nghĩa khá chung chung, vai trò `switch` biểu diễn các trạng thái "bật" và "tắt."

Ví dụ này tạo một widget và gán cho nó vai trò ARIA `switch`.

```html
<button
  type="button"
  role="switch"
  aria-checked="true"
  id="speakerPower"
  class="switch">
  <span aria-hidden="true">off</span>
  <span aria-hidden="false">on</span>
</button>
<label for="speakerPower" class="switch">Speaker power</label>
```

## Mô tả

Vai trò ARIA **`switch`** giống vai trò [checkbox](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/checkbox_role), ngoại trừ việc thay vì "được chọn" hay "không được chọn", nó là "bật" hoặc "tắt". Giống như vai trò [checkbox](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/checkbox_role), thuộc tính [`aria-checked`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-checked) là bắt buộc. Hai giá trị có thể có là `true` và `false`. Khác với `<input type="checkbox">` hoặc `role="checkbox"`, không có trạng thái `indeterminate` hay `mixed`. Vai trò `switch` không hỗ trợ giá trị `mixed` cho thuộc tính `aria-checked`; nếu gán giá trị `mixed` cho `switch` thì giá trị sẽ được đặt thành `false`.

Công nghệ hỗ trợ có thể chọn biểu diễn các widget `switch` bằng một cách trình bày chuyên biệt để phản ánh khái niệm công tắc bật/tắt.

Vì switch là một điều khiển tương tác, nó phải có thể nhận focus và truy cập bằng bàn phím. Nếu vai trò này được áp dụng cho một phần tử không thể nhận focus, hãy dùng thuộc tính `tabindex` để thay đổi điều đó. Phím tắt dự kiến để bật/tắt giá trị của switch là phím <kbd>Space</kbd>. Nhà phát triển phải thay đổi giá trị thuộc tính `aria-checked` một cách động khi switch được bật/tắt.

### Tất cả phần tử con đều mang tính trình bày

Có một số loại thành phần giao diện người dùng, khi được biểu diễn trong một API khả năng tiếp cận của nền tảng, chỉ có thể chứa văn bản. Các API khả năng tiếp cận không có cách nào biểu diễn các phần tử ngữ nghĩa nằm trong `switch`. Để xử lý giới hạn này, trình duyệt tự động áp dụng vai trò [`presentation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role) cho mọi phần tử con của bất kỳ phần tử `switch` nào, vì đây là vai trò không hỗ trợ phần tử con mang ngữ nghĩa.

Ví dụ, hãy xem phần tử `switch` sau, có chứa một tiêu đề.

```html
<div role="switch"><h3>Title of my switch</h3></div>
```

Vì các phần tử con của `switch` mang tính trình bày, nên đoạn mã sau tương đương:

```html
<div role="switch"><h3 role="presentation">Title of my switch</h3></div>
```

Từ góc nhìn của người dùng công nghệ hỗ trợ, tiêu đề không tồn tại vì các đoạn mã trước đó tương đương với đoạn sau trong [cây khả năng tiếp cận](/en-US/docs/Glossary/Accessibility_tree):

```html
<div role="switch">Title of my switch</div>
```

### Các vai trò, trạng thái và thuộc tính ARIA liên quan

- Thuộc tính [`aria-checked`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-checked)
  - : Thuộc tính `aria-checked` là **bắt buộc** khi dùng vai trò `switch`, vì nó biểu diễn trạng thái hiện tại của widget mà vai trò `switch` được áp dụng cho. Giá trị `true` đại diện cho trạng thái "bật"; `false` đại diện cho trạng thái "tắt"; giá trị `mixed` không được vai trò switch hỗ trợ và được xử lý như `false`.
- Thuộc tính [`aria-readonly`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-readonly)
  - : Thuộc tính `aria-readonly` được hỗ trợ bởi vai trò `switch`. Nó cho biết trạng thái của widget có thể được người dùng chỉnh sửa hay không. Giá trị `false` nghĩa là người dùng _có thể_ thay đổi trạng thái của widget; giá trị `true` nghĩa là người dùng _không thể_ thay đổi trạng thái của widget. Giá trị mặc định là `false`.

### Tính năng JavaScript bắt buộc

- Trình xử lý cho sự kiện click
  - : Khi người dùng nhấp vào widget switch, một [click event](/en-US/docs/Web/API/Element/click_event) được phát ra, và nó phải được xử lý để thay đổi trạng thái của widget.
- Thay đổi thuộc tính `aria-checked`
  - : Khi một click event được phát ra trên widget switch, trình xử lý phải thay đổi giá trị thuộc tính `aria-checked` từ `true` sang `false`, hoặc ngược lại.

## Tác động có thể lên user agent và công nghệ hỗ trợ

Khi vai trò `switch` được thêm vào một phần tử, {{Glossary("user agent")}} xử lý nó như sau:

- Phần tử được hiển thị cho hạ tầng khả năng tiếp cận của hệ thống như có vai trò `switch`.
- Khi giá trị thuộc tính `aria-checked` thay đổi, một sự kiện có thể truy cập được phát ra bằng API khả năng tiếp cận của hệ thống nếu có sẵn và nó hỗ trợ vai trò `switch`.
- Tất cả phần tử con của một phần tử có vai trò `switch` sẽ tự động được gán vai trò `presentation`. Điều này ngăn các phần tử được dùng để tạo switch có thể được công nghệ hỗ trợ tương tác riêng lẻ. Văn bản trong các phần tử này vẫn hiển thị với user agent và có thể được đọc hoặc truyền cho người dùng, trừ khi nó bị ẩn rõ ràng bằng {{cssxref("display", "display: none")}} hoặc `aria-hidden="true"`.

Công nghệ hỗ trợ, nếu hỗ trợ vai trò `switch`, sẽ phản hồi bằng cách làm như sau:

- Trình đọc màn hình nên thông báo phần tử là một switch, tùy chọn cung cấp hướng dẫn về cách kích hoạt switch.

> [!NOTE]
> Có nhiều quan điểm khác nhau về cách công nghệ hỗ trợ nên xử lý vai trò này; cách trên chỉ là thực hành được đề xuất và có thể khác với các nguồn khác.

## Ví dụ

Các ví dụ sau sẽ giúp bạn hiểu cách áp dụng và dùng vai trò `switch`.

### Thêm vai trò switch trong ARIA

Ví dụ này tạo một widget và gán cho nó vai trò ARIA `switch`. Nút được tạo kiểu sao cho gợi nhớ công tắc nguồn bật/tắt.

#### HTML

Switch được triển khai như một phần tử {{HTMLElement("button")}}, ban đầu được đánh dấu do thuộc tính `aria-checked` của nó được đặt thành `"true"`. Switch có hai phần tử con chứa nhãn "off" và "on" và theo sau là một phần tử {{HTMLElement("label")}} xác định switch.

```html
<button role="switch" aria-checked="true" id="speakerPower" class="switch">
  <span>off</span>
  <span>on</span>
</button>
<label for="speakerPower" class="switch">Speaker power</label>
```

#### JavaScript

Đoạn JavaScript này định nghĩa và áp dụng một hàm để xử lý các sự kiện click trên widget switch. Hàm này thay đổi thuộc tính `aria-checked` từ `true` sang `false`, hoặc ngược lại.

```js
document.querySelectorAll(".switch").forEach((theSwitch) => {
  theSwitch.addEventListener("click", handleClickEvent);
});

function handleClickEvent(evt) {
  const el = evt.target;

  if (el.getAttribute("aria-checked") === "true") {
    el.setAttribute("aria-checked", "false");
  } else {
    el.setAttribute("aria-checked", "true");
  }
}
```

#### CSS

Mục đích của CSS là tạo giao diện cho switch gợi nhớ tới mô hình công tắc nguồn.

```css
button.switch {
  margin: 0;
  padding: 0;
  width: 70px;
  height: 26px;
  border: 2px solid black;
  display: inline-block;
  margin-right: 0.25em;
  vertical-align: middle;
  text-align: center;
  font:
    12px / 20px "Open Sans",
    "Arial",
    serif;
}

button.switch span {
  padding: 0 4px;
  pointer-events: none;
}

[role="switch"][aria-checked="false"] :first-child,
[role="switch"][aria-checked="true"] :last-child {
  background: #226622;
  color: #eeeeff;
}

[role="switch"][aria-checked="false"] :last-child,
[role="switch"][aria-checked="true"] :first-child {
  color: #bbbbdd;
}

label.switch {
  font:
    16px "Open Sans",
    "Arial",
    sans-serif;
  line-height: 20px;
  vertical-align: middle;
  user-select: none;
}
```

Phần thú vị nhất có lẽ là việc dùng bộ chọn thuộc tính và các lớp giả {{cssxref(":first-child")}} và {{cssxref(":last-child")}} để xử lý toàn bộ việc thay đổi giao diện của switch dựa trên việc nó đang bật hay tắt.

#### Kết quả

Kết quả trông như sau:

{{EmbedLiveSample("Adding_the_switch_role_in_ARIA", 600, 40)}}

## Đặc tả

{{Specifications}}

## Xem thêm

- [ARIA: checkbox role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/checkbox_role)
- [`<input type="checkbox">`](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox)
- [`aria-hidden`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-hidden)
