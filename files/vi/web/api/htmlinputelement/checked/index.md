---
title: "HTMLInputElement: thuộc tính checked"
short-title: checked
slug: Web/API/HTMLInputElement/checked
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.checked
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`checked`** của giao diện {{DOMxRef("HTMLInputElement")}} xác định trạng thái được chọn hiện tại của phần tử; nghĩa là, điều khiển biểu mẫu đang được chọn hay không.

Thuộc tính boolean `checked` liên quan đến các loại đầu vào `radio` ([`<input type="radio">`](/en-US/docs/Web/HTML/Reference/Elements/input/radio)) và `checkbox` ([`<input type="checkbox">`](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox)).

Sự hiện diện của thuộc tính HTML [`checked`](/en-US/docs/Web/HTML/Reference/Elements/input#checked) cho biết hộp kiểm được chọn theo mặc định. Nó không cho biết liệu hộp kiểm này hiện có đang được chọn hay không: nếu trạng thái của hộp kiểm thay đổi, thuộc tính nội dung này không phản ánh thay đổi; chỉ có thuộc tính IDL `checked` của `HTMLInputElement` được cập nhật. Thuộc tính `checked` được phản ánh bởi thuộc tính {{domxref("HTMLInputElement.defaultChecked", "defaultChecked")}}.

Khi thuộc tính `checked` của đầu vào radio là `true`, tất cả các đầu vào radio khác có cùng {{DOMxRef("HTMLInputElement.name", "name")}} sẽ là `false`. Nếu bất kỳ nút radio nào trong nhóm nút radio cùng tên là {{DOMxRef("HTMLInputElement.required", "required")}}, miễn là một nút trong nhóm được `checked`, thuộc tính chỉ đọc {{domxref('ValidityState.valueMissing','valueMissing')}} của đối tượng {{domxref('ValidityState')}} cho mỗi nút radio trong nhóm sẽ là `false`.

Giá trị của hộp kiểm chỉ được bao gồm trong dữ liệu gửi khi gửi biểu mẫu nếu `checked` là true. Giá trị của thuộc tính {{DOMxRef("HTMLInputElement.indeterminate")}} không ảnh hưởng đến giá trị `checked` của hộp kiểm.

## Giá trị

Một boolean.

## Ví dụ

```js
const inputElement = document.getElementById("contactMail");
console.log(inputElement.checked);
inputElement.checked = true;
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("input")}}
- {{DOMXref("HTMLInputElement.validity")}}
- Lớp giả {{cssxref(":checked")}}
