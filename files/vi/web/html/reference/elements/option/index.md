---
title: "<option>: Phần tử HTML Option"
slug: Web/HTML/Reference/Elements/option
page-type: html-element
browser-compat: html.elements.option
sidebar: htmlsidebar
---

Phần tử **`<option>`** trong [HTML](/en-US/docs/Web/HTML) được dùng để định nghĩa một mục chứa trong {{HTMLElement("select")}}, {{HTMLElement("optgroup")}}, hoặc phần tử {{HTMLElement("datalist")}}. Do đó, `<option>` có thể đại diện cho các mục menu trong popup và các danh sách mục khác trong tài liệu HTML.

{{InteractiveExample("HTML Demo: &lt;option&gt;", "tabbed-standard")}}

```html interactive-example
<label for="pet-select">Choose a pet:</label>

<select id="pet-select">
  <option value="">--Please choose an option--</option>
  <option value="dog">Dog</option>
  <option value="cat">Cat</option>
  <option value="hamster">Hamster</option>
  <option value="parrot">Parrot</option>
  <option value="spider">Spider</option>
  <option value="goldfish">Goldfish</option>
</select>
```

```css interactive-example
label {
  font-family: sans-serif;
  font-size: 1rem;
  padding-right: 10px;
}

select {
  font-size: 0.9rem;
  padding: 2px 5px;
}
```

## Thuộc tính

Phần tử này bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- [`disabled`](/en-US/docs/Web/HTML/Reference/Attributes/disabled)
  - : Nếu thuộc tính Boolean này được đặt, tùy chọn này không thể được chọn. Thường trình duyệt làm xám điều khiển như vậy và nó sẽ không nhận bất kỳ sự kiện duyệt nào, như nhấp chuột hoặc sự kiện liên quan đến tiêu điểm. Nếu thuộc tính này không được đặt, phần tử vẫn có thể bị vô hiệu hóa nếu một trong các tổ tiên của nó là phần tử {{HTMLElement("optgroup")}} bị vô hiệu hóa.
- `label`
  - : Thuộc tính này là văn bản cho nhãn chỉ ra ý nghĩa của tùy chọn. Nếu thuộc tính `label` không được định nghĩa, giá trị của nó là nội dung văn bản của phần tử.
- `selected`
  - : Nếu có, thuộc tính Boolean này cho biết tùy chọn được chọn ban đầu. Nếu phần tử `<option>` là hậu duệ của phần tử {{HTMLElement("select")}} không có thuộc tính [`multiple`](/en-US/docs/Web/HTML/Reference/Elements/select#multiple), chỉ một `<option>` duy nhất của phần tử {{HTMLElement("select")}} này có thể có thuộc tính `selected`.
- `value`
  - : Nội dung của thuộc tính này đại diện cho giá trị cần gửi cùng form, nếu tùy chọn này được chọn. Nếu thuộc tính này bị bỏ qua, giá trị được lấy từ nội dung văn bản của phần tử option.

## Tạo kiểu với CSS

Lịch sử, tạo kiểu cho các phần tử `<option>` bị giới hạn cao. [Các phần tử select có thể tùy chỉnh](/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select) giải thích các tính năng mới hơn cho phép tùy chỉnh đầy đủ chúng, giống như bất kỳ phần tử DOM thông thường nào.

### Tạo kiểu option cũ

Trong các trình duyệt không hỗ trợ các tính năng tùy chỉnh hiện đại (hoặc cơ sở mã cũ không thể sử dụng), tạo kiểu có sẵn trên các phần tử `<option>` phụ thuộc vào trình duyệt và hệ điều hành. Tùy thuộc vào hệ điều hành, {{cssxref("font-size")}} của `<select>` sở hữu được tôn trọng trong Firefox và Chromium. Chromium cũng có thể cho phép đặt {{cssxref("color")}}, {{cssxref("background-color")}}, {{cssxref("font-family")}}, {{cssxref("font-variant")}}, và {{cssxref("text-align")}}.

Bạn có thể tìm thêm chi tiết về tạo kiểu `<option>` cũ trong [hướng dẫn của chúng tôi về tạo kiểu form nâng cao](/en-US/docs/Learn_web_development/Extensions/Forms/Advanced_form_styling).

## Ví dụ

Xem {{HTMLElement("select")}} để biết ví dụ.

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories"
          >Danh mục nội dung</a
        >
      </th>
      <td>Không có.</td>
    </tr>
    <tr>
      <th scope="row">Nội dung cho phép</th>
      <td>
        Trong các phần tử <code>&lt;select&gt;</code> truyền thống, chỉ nội dung văn bản được cho phép, có thể với các ký tự thoát (như
        <code>&#x26;eacute;</code>). Trong <a href="/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select">phần tử select có thể tùy chỉnh</a>, các phần tử <code>&lt;option&gt;</code> có thể có bất kỳ nội dung tùy ý nào.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>
        Thẻ mở là bắt buộc. Thẻ đóng là tùy chọn nếu phần tử này
        được theo sau ngay bởi phần tử <code>&#x3C;option></code> khác hoặc
        {{HTMLElement("optgroup")}}, hoặc nếu phần tử cha không có
        thêm nội dung.
      </td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha cho phép</th>
      <td>
        {{HTMLElement("select")}},
        {{HTMLElement("optgroup")}} hoặc
        {{HTMLElement("datalist")}}.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/option_role"><code>option</code></a></td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA cho phép</th>
      <td>Không có <code>role</code> nào được phép</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLOptionElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử liên quan đến form khác: {{HTMLElement("form")}}, {{HTMLElement("legend")}}, {{HTMLElement("label")}}, {{HTMLElement("button")}}, {{HTMLElement("select")}}, {{HTMLElement("datalist")}}, {{HTMLElement("optgroup")}}, {{HTMLElement("fieldset")}}, {{HTMLElement("textarea")}}, {{HTMLElement("input")}}, {{HTMLElement("output")}}, {{HTMLElement("progress")}} và {{HTMLElement("meter")}}.
- [Phần tử select có thể tùy chỉnh](/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select)
