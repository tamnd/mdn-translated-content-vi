---
title: "ARIA: vai trò checkbox"
short-title: checkbox
slug: Web/Accessibility/ARIA/Reference/Roles/checkbox_role
page-type: aria-role
sidebar: accessibilitysidebar
---

Vai trò `checkbox` dành cho các điều khiển tương tác có thể được chọn hoặc bỏ chọn. Các phần tử chứa `role="checkbox"` cũng phải bao gồm thuộc tính [`aria-checked`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-checked) để hiển thị trạng thái checkbox cho công nghệ trợ năng.

```html
<span
  role="checkbox"
  aria-checked="false"
  tabindex="0"
  aria-labelledby="chk1-label"></span>
<label id="chk1-label">Ghi nhớ tùy chọn của tôi</label>
```

> [!NOTE]
> Quy tắc đầu tiên của ARIA là: nếu một phần tử hoặc thuộc tính HTML gốc đã có ngữ nghĩa và hành vi mà bạn cần, hãy dùng nó thay vì tái sử dụng một phần tử rồi thêm ARIA. Thay vào đó, hãy dùng [checkbox HTML gốc của `<input type="checkbox">`](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox) (kèm một {{HTMLElement('label')}} liên kết), vốn tự nhiên cung cấp đầy đủ chức năng cần thiết:

```html
<input type="checkbox" id="chk1-label" name="RememberPreferences" />
<label for="chk1-label">Ghi nhớ tùy chọn của tôi</label>
```

## Mô tả

Điều khiển biểu mẫu checkbox HTML gốc ([`<input type="checkbox">`](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox)) có hai trạng thái ("đã chọn" hoặc "chưa chọn"), với trạng thái [`indeterminate`](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox#indeterminate_state_checkboxes) có thể đặt bằng JavaScript. Tương tự, một phần tử có `role="checkbox"` có thể hiển thị ba trạng thái thông qua thuộc tính `aria-checked`: `true`, `false`, hoặc `mixed`.

Vì checkbox là một điều khiển tương tác, nó phải có thể nhận tiêu điểm và truy cập bằng bàn phím. Nếu vai trò được áp dụng cho một phần tử không thể nhận tiêu điểm, hãy dùng thuộc tính [`tabindex`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex) để thay đổi điều này. Phím tắt kỳ vọng để kích hoạt checkbox là phím <kbd>Space</kbd>.

Nhà phát triển phải thay đổi giá trị của thuộc tính `aria-checked` một cách động khi checkbox được kích hoạt.

### Tất cả phần tử con đều mang tính trình bày

Có một số loại thành phần giao diện người dùng khi được biểu diễn trong một API trợ năng của nền tảng thì chỉ có thể chứa văn bản. Các API trợ năng không có cách nào biểu diễn các phần tử ngữ nghĩa nằm bên trong một `checkbox`. Để xử lý giới hạn này, trình duyệt sẽ tự động áp dụng vai trò [`presentation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role) cho tất cả phần tử con của bất kỳ phần tử `checkbox` nào, vì đó là vai trò không hỗ trợ phần tử con ngữ nghĩa.

Ví dụ, hãy xét phần tử `checkbox` sau, trong đó có chứa một tiêu đề.

```html
<div role="checkbox"><h6>Tên checkbox của tôi</h6></div>
```

Vì các phần tử con của `checkbox` đều mang tính trình bày, đoạn mã sau là tương đương:

```html
<div role="checkbox"><h6 role="presentation">Tên checkbox của tôi</h6></div>
```

Từ góc nhìn của người dùng công nghệ trợ năng, tiêu đề không tồn tại vì các đoạn mã trên tương đương với nội dung sau trong [cây trợ năng](/en-US/docs/Glossary/Accessibility_tree):

```html
<div role="checkbox">Tên checkbox của tôi</div>
```

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

- [`aria-checked`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-checked)
  - : Giá trị của `aria-checked` xác định trạng thái của checkbox. Thuộc tính này có một trong ba giá trị có thể:
    - `true`
      - : Checkbox đã được chọn.
    - `false`
      - : Checkbox chưa được chọn.
    - `mixed`
      - : Checkbox được chọn một phần, hoặc ở trạng thái không xác định.

- `tabindex="0"`
  - : Dùng để làm cho nó có thể nhận tiêu điểm, ताकि người dùng công nghệ trợ năng có thể tab tới và bắt đầu đọc ngay.

### Tương tác bàn phím

| Phím             | Chức năng          |
| ---------------- | ------------------ |
| <kbd>Space</kbd> | Kích hoạt checkbox |

### JavaScript bắt buộc

#### Trình xử lý sự kiện bắt buộc

- `onclick`
  - : Xử lý các cú nhấp chuột trên cả checkbox và nhãn liên quan sẽ thay đổi trạng thái của checkbox bằng cách thay đổi giá trị thuộc tính `aria-checked` và giao diện của checkbox để nó trông như đã chọn hoặc chưa chọn đối với người dùng nhìn thấy được
- `onKeyDown`
  - : Xử lý trường hợp người dùng nhấn phím <kbd>Space</kbd> để thay đổi trạng thái của checkbox bằng cách thay đổi giá trị thuộc tính `aria-checked` và giao diện của checkbox để nó trông như đã chọn hoặc chưa chọn đối với người dùng nhìn thấy được

## Ví dụ

Ví dụ sau tạo một phần tử checkbox vốn không có ngữ nghĩa bằng CSS và JavaScript để xử lý trạng thái đã chọn hoặc chưa chọn của phần tử.

### HTML

```html
<span
  role="checkbox"
  id="chkPref"
  aria-checked="false"
  tabindex="0"
  aria-labelledby="chk1-label"></span>
<label id="chk1-label">Ghi nhớ tùy chọn của tôi</label>
```

### CSS

```css
[role="checkbox"] {
  padding: 5px;
}

[role="checkbox"]:focus {
  border: 2px solid #0198e1;
}

[aria-checked="true"]::before {
  content: "[x]";
}

[aria-checked="false"]::before {
  content: "[ ]";
}
```

### JavaScript

```js
const item = document.getElementById("chkPref");
const label = document.getElementById("chk1-label");

function changeCheckbox(code) {
  const checked = item.getAttribute("aria-checked");

  if (code && code !== "Space") {
    return;
  }
  if (checked === "true") {
    item.setAttribute("aria-checked", "false");
  } else {
    item.setAttribute("aria-checked", "true");
  }
}

item.addEventListener("keydown", (event) => {
  changeCheckbox(event.code);
});

label.addEventListener("keydown", (event) => {
  changeCheckbox(event.code);
});

item.addEventListener("click", changeCheckbox);
label.addEventListener("click", changeCheckbox);
```

{{EmbedLiveSample("Examples", 230, 250)}}

## Các vấn đề về trợ năng

Khi vai trò `checkbox` được thêm vào một phần tử, user agent nên làm như sau:

- Hiển thị phần tử là có vai trò `checkbox` trong API trợ năng của hệ điều hành.
- Khi giá trị `aria-checked` thay đổi, gửi một sự kiện thay đổi trạng thái có thể truy cập.

Các sản phẩm công nghệ trợ năng nên làm như sau:

- Trình đọc màn hình nên thông báo phần tử là một checkbox, và tùy chọn cung cấp hướng dẫn về cách kích hoạt nó.

Người triển khai checkbox nên làm như sau:

- Bảo đảm checkbox có thể được tiếp cận và tương tác bằng cả điều khiển bàn phím lẫn nhấp chuột
- Giữ thuộc tính `aria-checked` luôn cập nhật sau các tương tác của người dùng
- Cung cấp kiểu hiển thị cho biết khi checkbox đang có tiêu điểm

> [!NOTE]
> Quan điểm có thể khác nhau về cách công nghệ trợ năng nên xử lý kỹ thuật này. Thông tin ở trên chỉ là một trong các quan điểm đó và có thể thay đổi.

## Thực hành tốt nhất

Quy tắc đầu tiên của ARIA là: nếu một phần tử hoặc thuộc tính HTML gốc có ngữ nghĩa và hành vi mà bạn cần, hãy dùng nó thay vì tái tạo lại phần tử rồi thêm một vai trò, trạng thái hoặc thuộc tính ARIA để làm cho nó có thể truy cập. Vì vậy, nên dùng [checkbox HTML](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox) gốc bằng điều khiển biểu mẫu thay vì viết lại chức năng checkbox bằng JavaScript và ARIA.

## Xem thêm

- [`<input type="checkbox">`](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox)
- [ARIA: `radio` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/radio_role)
- [ARIA: `menuitem` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitem_role)
- [ARIA: `menuitemcheckbox` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemcheckbox_role)
- [ARIA: `menuitemradio` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemradio_role)
- [ARIA: `switch` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/switch_role)
- [ARIA: `option` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/option_role)
