---
title: "Element: thuộc tính ariaAutoComplete"
short-title: ariaAutoComplete
slug: Web/API/Element/ariaAutoComplete
page-type: web-api-instance-property
browser-compat: api.Element.ariaAutoComplete
---

{{APIRef("DOM")}}

Thuộc tính **`ariaAutoComplete`** của giao diện {{domxref("Element")}} phản chiếu giá trị của thuộc tính [`aria-autocomplete`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-autocomplete), cho biết liệu việc nhập văn bản có thể kích hoạt hiển thị một hoặc nhiều dự đoán về giá trị người dùng định nhập cho combobox, searchbox hoặc textbox và chỉ rõ cách các dự đoán sẽ được trình bày nếu chúng được tạo.

## Giá trị

Một chuỗi với một trong các giá trị sau:

- `"inline"`
  - : Khi người dùng đang nhập liệu, văn bản gợi ý một cách hoàn thành đầu vào đã cung cấp có thể được chèn động sau dấu nháy.
- `"list"`
  - : Khi người dùng đang nhập liệu, một phần tử chứa tập hợp các giá trị có thể hoàn thành đầu vào đã cung cấp có thể được hiển thị.
- `"both"`
  - : Khi người dùng đang nhập liệu, một phần tử chứa tập hợp các giá trị có thể hoàn thành đầu vào đã cung cấp có thể được hiển thị. Nếu được hiển thị, một giá trị trong tập hợp sẽ được tự động chọn và văn bản cần thiết để hoàn thành giá trị đã chọn tự động xuất hiện sau dấu nháy trong đầu vào.
- `"none"`
  - : Khi người dùng đang nhập liệu, không có hiển thị gợi ý tự động nào cố gắng dự đoán cách người dùng định hoàn thành đầu vào.

## Ví dụ

Trong ví dụ này, thuộc tính `aria-autocomplete` trên phần tử có ID `animal` được đặt thành `"inline"`. Sử dụng `ariaAutoComplete` chúng ta cập nhật giá trị thành `"list"`, đây là giá trị dự kiến cho một combobox gọi popup `listbox`.

```html
<div class="animals-combobox">
  <label for="animal">Animal</label>
  <input
    id="animal"
    type="text"
    role="combobox"
    aria-autocomplete="inline"
    aria-controls="animals-listbox"
    aria-expanded="false"
    aria-haspopup="listbox" />
  <ul id="animals-listbox" role="listbox" aria-label="Animals">
    <li id="animal-cat" role="option">Cat</li>
    <li id="animal-dog" role="option">Dog</li>
  </ul>
</div>
```

```js
let el = document.getElementById("animal");
console.log(el.ariaAutoComplete); // inline
el.ariaAutoComplete = "list";
console.log(el.ariaAutoComplete); // list
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
