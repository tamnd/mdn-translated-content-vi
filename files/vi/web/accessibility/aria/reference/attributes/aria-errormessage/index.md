---
title: "ARIA: thuộc tính aria-errormessage"
short-title: aria-errormessage
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-errormessage
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-errormessage
sidebar: accessibilitysidebar
---

Thuộc tính `aria-errormessage` trên một đối tượng xác định phần tử (hoặc các phần tử) cung cấp thông báo lỗi cho đối tượng đó.

## Mô tả

Khi có lỗi do người dùng tạo ra, bạn muốn cho người dùng biết lỗi tồn tại và chỉ cho họ cách sửa. Có hai thuộc tính bạn cần dùng: đặt [`aria-invalid="true"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-invalid) để xác định đối tượng đang ở trạng thái lỗi, sau đó thêm thuộc tính `aria-errormessage` với giá trị là `id` của phần tử (hoặc các phần tử) chứa văn bản thông báo lỗi cho đối tượng đó.

Thuộc tính `aria-errormessage` chỉ nên được dùng khi giá trị của đối tượng không hợp lệ; tức khi [`aria-invalid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-invalid) được đặt thành `true`. Nếu đối tượng hợp lệ và bạn vẫn bao gồm thuộc tính `aria-errormessage`, hãy bảo đảm phần tử được tham chiếu bị ẩn, vì thông báo nó chứa không còn liên quan.

Khi `aria-errormessage` còn liên quan, phần tử (hoặc các phần tử) mà nó tham chiếu phải hiển thị để người dùng có thể thấy hoặc nghe thông báo lỗi.

Nhiều lúc, bạn sẽ muốn phần tử chứa thông báo lỗi là một [vùng trực tiếp ARIA](/en-US/docs/Web/Accessibility/ARIA/Guides/Live_regions), chẳng hạn khi thông báo lỗi được hiển thị cho người dùng sau khi họ nhập một giá trị không hợp lệ. Thông báo lỗi nên mô tả điều gì sai và cho người dùng biết cần gì để làm cho đối tượng hợp lệ. Việc thêm thông báo lỗi như một vùng trực tiếp ARIA cho công nghệ hỗ trợ biết rằng người dùng có thể được lợi từ nội dung thông báo lỗi, ngay cả khi thông báo lỗi đó lẽ ra không được truyền đạt cho người dùng.

Hãy bao gồm một thông báo lỗi hiển thị và liên kết đối tượng không hợp lệ với thuộc tính `aria-errormessage` nếu lỗi có thể thấy rõ bằng mắt và cần mô tả tường minh về lỗi.

## Ví dụ

Chúng ta tạo một số kiểu để:

1. Ẩn tất cả các thông báo lỗi,
2. Làm cho các đối tượng không hợp lệ trông giống là không hợp lệ, và
3. Hiển thị các thông báo lỗi là anh em đứng sau một đối tượng không hợp lệ.

Chúng ta dùng `aria-invalid="true"` để xác định các đối tượng không hợp lệ:

```css
.errormessage {
  visibility: hidden;
}

[aria-invalid="true"] {
  outline: 2px solid red;
}

[aria-invalid="true"] ~ .errormessage {
  visibility: visible;
}
```

Khi một đối tượng không hợp lệ, chúng ta dùng JavaScript để thêm `aria-invalid="true"`. CSS ở trên làm cho `.errormessage` đứng sau đối tượng không hợp lệ trở nên hiển thị.

```html
<p>
  <label for="email">Địa chỉ email:</label>
  <input
    type="email"
    name="email"
    id="email"
    aria-invalid="true"
    aria-errormessage="err1" />
  <span id="err1" class="errormessage">Lỗi: Nhập một địa chỉ email hợp lệ</span>
</p>
```

Khi chúng ta chuyển từ hợp lệ sang không hợp lệ, thay đổi JavaScript duy nhất cho ví dụ này là cập nhật `aria-invalid` trên đối tượng input email. Vì thông báo lỗi đứng sau input và trở nên hiển thị cũng như có trong cây khả năng tiếp cận, chúng ta có thể giữ ví dụ của mình đơn giản. Chúng ta cũng có thể đã áp dụng thuộc tính [`aria-live`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-live) hoặc dùng vai trò vùng trực tiếp như [`alert`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/alert_role).

## Giá trị

- Danh sách tham chiếu ID
  - : `id` hoặc danh sách các `id` phần tử được phân tách bằng khoảng trắng chứa thông báo lỗi cho phần tử hiện tại.

## Giao diện liên quan

- {{domxref("Element.ariaErrorMessageElements")}}
  - : Thuộc tính `ariaErrorMessageElements` là một phần của giao diện của mỗi phần tử.
    Giá trị của nó là một mảng các lớp con của {{domxref("Element")}} phản ánh các tham chiếu `id` trong thuộc tính `aria-errormessage` ([với một số lưu ý](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references)).
- {{domxref("ElementInternals.ariaErrorMessageElements")}}
  - : Thuộc tính `ariaErrorMessageElements` là một phần của giao diện của mỗi phần tử tùy chỉnh.
    Giá trị của nó là một mảng các lớp con của {{domxref("Element")}} phản ánh các tham chiếu `id` trong thuộc tính `aria-errormessage` ([với một số lưu ý](/en-US/docs/Web/API/Document_Object_Model/Reflected_attributes#reflected_element_references)).

## Vai trò liên quan

Được dùng trong các vai trò:

- [`application`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/application_role)
- [`checkbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/checkbox_role)
- [`combobox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role)
- [`gridcell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/gridcell_role)
- [`listbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/listbox_role)
- [`radiogroup`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/radiogroup_role)
- [`slider`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/slider_role)
- [`spinbutton`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/spinbutton_role)
- [`textbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role)
- [`tree`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tree_role)

Kế thừa từ các vai trò:

- [`columnheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/columnheader_role)
- [`rowheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowheader_role)
- [`searchbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/searchbox_role)
- [`switch`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/switch_role)
- [`treegrid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treegrid_role)

## Đặc tả

{{Specifications}}

## Xem thêm

- CSS {{CSSxref(':invalid')}} pseudoclass
- [`aria-invalid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-invalid)
- [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby)
- [`aria-live`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-live)
