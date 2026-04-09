---
title: "ARIA: thuộc tính aria-invalid"
short-title: aria-invalid
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-invalid
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-invalid
sidebar: accessibilitysidebar
---

`aria-invalid` là trạng thái cho biết giá trị đã nhập không khớp với định dạng mà ứng dụng mong đợi.

## Mô tả

Thuộc tính `aria-invalid` được dùng để cho biết giá trị nhập vào một trường nhập liệu không có định dạng hoặc không phải là giá trị mà ứng dụng chấp nhận. Điều này có thể bao gồm các định dạng như địa chỉ email hoặc số điện thoại. `aria-invalid` cũng có thể được dùng để cho biết một trường bắt buộc đang để trống.

Thuộc tính `aria-invalid` có thể dùng với bất kỳ phần tử biểu mẫu HTML thông thường nào, và không bị giới hạn ở các phần tử đã được gán vai trò ARIA.

Thuộc tính này nên được đặt bằng JavaScript như kết quả của quá trình xác thực. Nếu một giá trị được xác định là không hợp lệ hoặc vượt ngoài phạm vi, hãy đặt `aria-invalid="true"` **và** thông báo cho người dùng rằng có lỗi. Để có trải nghiệm tốt hơn, hãy cung cấp gợi ý về cách sửa lỗi. Đừng đặt `aria-invalid="true"` cho các phần tử bắt buộc đang trống cho đến sau khi người dùng cố gắng gửi biểu mẫu. Họ có thể vẫn đang trong quá trình điền.

> [!NOTE]
> Khi `aria-invalid` được dùng cùng với thuộc tính `aria-required`, `aria-invalid` không nên được đặt thành true trước khi biểu mẫu được gửi - chỉ nên đặt khi phản hồi lại quá trình xác thực.

Hiện có bốn giá trị: ngoài `true` và `false`, chúng ta còn có `grammar` dùng khi phát hiện lỗi ngữ pháp và `spelling` dùng cho lỗi chính tả. Nếu thuộc tính không hiện diện, hoặc giá trị của nó là false, hoặc giá trị là chuỗi rỗng, thì giá trị mặc định false sẽ được áp dụng. Bất kỳ giá trị nào khác đều được xử lý như thể `true` đã được đặt.

### Xác thực HTML gốc

HTML có cơ chế xác thực biểu mẫu sẵn có. Khi người dùng gửi một biểu mẫu có điều khiển chứa lỗi, điều khiển biểu mẫu đầu tiên có giá trị không hợp lệ sẽ hiển thị thông báo lỗi một cách tự nhiên.

Nếu một điều khiển biểu mẫu có thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Attributes/required) mà chưa được điền, biểu mẫu sẽ không được gửi, và một thông báo lỗi sẽ xuất hiện với nội dung như "Please fill out this field" hoặc tương tự. Thông báo của xác thực gốc thay đổi theo trình duyệt, và không thể được tạo kiểu.

```html
<input type="number" step="2" min="0" max="100" required />
```

Nếu người dùng đã nhập vào ví dụ input phía trên một giá trị lớn hơn mức tối đa, nhỏ hơn mức tối thiểu, hoặc không khớp với giá trị bước nhảy, một thông báo lỗi sẽ xuất hiện. Nếu người dùng nhập "3", thông báo lỗi gốc sẽ tương tự như "Please enter a valid value."

Nếu bạn đang tự tạo kịch bản xác thực biểu mẫu, hãy đảm bảo có `aria-invalid` trên các điều khiển biểu mẫu không hợp lệ, cùng với kiểu trình bày (dùng bộ chọn thuộc tính `[aria-invalid="true"]`) và thông báo (với [`aria-errormessage`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-errormessage)) để giúp người dùng hiểu lỗi nằm ở đâu và có thể sửa thế nào.

## Giá trị

- `grammar`
  - : Phát hiện lỗi ngữ pháp.
- `false` (mặc định)
  - : Không có lỗi nào được phát hiện trong giá trị.
- `spelling`
  - : Phát hiện lỗi chính tả.
- `true`
  - : Giá trị do người dùng nhập đã không vượt qua quá trình xác thực.

Bất kỳ giá trị nào không có trong danh sách này sẽ được coi là `true`.

## Ví dụ

Đoạn mã sau cho thấy một phiên bản đơn giản của hai trường biểu mẫu với hàm xác thực được gắn vào sự kiện blur. Lưu ý rằng vì giá trị mặc định của `aria-invalid` là `false`, nên về mặt nghiêm ngặt không bắt buộc phải thêm thuộc tính này vào input.

```html
<ul>
  <li>
    <label for="name">Họ và tên</label>
    <input
      type="text"
      name="name"
      id="name"
      aria-required="true"
      aria-invalid="false" />
  </li>
  <li>
    <label for="email">Địa chỉ email</label>
    <input
      type="email"
      name="email"
      id="email"
      aria-required="true"
      aria-invalid="false" />
  </li>
</ul>
```

```js
document.getElementById("name").addEventListener("blur", () => {
  checkValidity("name", " ", "Tên không hợp lệ (cần cả họ và tên)");
});

document.getElementById("email").addEventListener("blur", () => {
  checkValidity("email", "@", "Địa chỉ email không hợp lệ");
});
```

Lưu ý rằng không nhất thiết phải xác thực các trường ngay khi blur; ứng dụng có thể chờ đến khi biểu mẫu được gửi (mặc dù điều này không hẳn là khuyến nghị).

Đoạn mã dưới đây cho thấy một hàm xác thực, chỉ kiểm tra sự hiện diện của một ký tự cụ thể (trong thực tế, quá trình xác thực có thể sẽ phức tạp hơn):

```js
function checkValidity(id, searchTerm, msg) {
  const elem = document.getElementById(id);
  if (elem.value.includes(searchTerm)) {
    elem.setAttribute("aria-invalid", "false");
    updateAlert();
  } else {
    elem.setAttribute("aria-invalid", "true");
    updateAlert(msg);
  }
}
```

Đoạn mã dưới đây cho thấy các hàm cảnh báo, dùng để thêm (hoặc gỡ bỏ) thông báo lỗi:

```js
function updateAlert(msg) {
  const oldAlert = document.getElementById("alert");
  if (oldAlert) {
    oldAlert.remove();
  }

  if (msg) {
    const newAlert = document.createElement("div");
    newAlert.setAttribute("role", "alert");
    newAlert.setAttribute("id", "alert");
    const content = document.createTextNode(msg);
    newAlert.appendChild(content);
    document.body.appendChild(newAlert);
  }
}
```

Lưu ý rằng cảnh báo đã được đặt vai trò ARIA là [`alert`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/alert_role).

## Giao diện liên quan

- {{domxref("Element.ariaInvalid")}}
  - : Thuộc tính [`ariaInvalid`](/en-US/docs/Web/API/Element/ariaInvalid), thuộc giao diện {{domxref("Element")}}, phản ánh giá trị của thuộc tính `aria-invalid`, cho biết phần tử có được hiển thị cho API trợ năng hay không.
- {{domxref("ElementInternals.ariaInvalid")}}
  - : Thuộc tính [`ariaInvalid`](/en-US/docs/Web/API/ElementInternals/ariaInvalid), thuộc giao diện {{domxref("ElementInternals")}}, phản ánh giá trị của thuộc tính `aria-invalid`.

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

Kế thừa vào vai trò:

- [`columnheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/columnheader_role)
- [`rowheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowheader_role)
- [`searchbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/searchbox_role)
- [`switch`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/switch_role)
- [`treegrid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treegrid_role)

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [`aria-errormessage`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-errormessage)
- CSS {{CSSXRef(':valid')}} pseudoclass
- CSS {{CSSXRef(':invalid')}} pseudoclass
- [Form Validation](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation) tutorial
