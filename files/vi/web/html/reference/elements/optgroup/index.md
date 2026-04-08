---
title: "<optgroup>: Phần tử nhóm Option"
slug: Web/HTML/Reference/Elements/optgroup
page-type: html-element
browser-compat: html.elements.optgroup
sidebar: htmlsidebar
---

Phần tử **`<optgroup>`** trong [HTML](/en-US/docs/Web/HTML) tạo ra một nhóm các tùy chọn trong phần tử {{HTMLElement("select")}}.

Trong [các phần tử `<select>` có thể tùy chỉnh](/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select), phần tử {{htmlelement("legend")}} được cho phép là con của `<optgroup>`, để cung cấp nhãn dễ nhắm mục tiêu và tạo kiểu. Điều này thay thế bất kỳ văn bản nào được đặt trong thuộc tính `label` của phần tử `<optgroup>`, và nó có cùng ngữ nghĩa.

{{InteractiveExample("HTML Demo: &lt;optgroup&gt;", "tabbed-standard")}}

```html interactive-example
<label for="dino-select">Choose a dinosaur:</label>
<select id="dino-select">
  <optgroup label="Theropods">
    <option>Tyrannosaurus</option>
    <option>Velociraptor</option>
    <option>Deinonychus</option>
  </optgroup>
  <optgroup label="Sauropods">
    <option>Diplodocus</option>
    <option>Saltasaurus</option>
    <option>Apatosaurus</option>
  </optgroup>
</select>
```

```css interactive-example
label {
  display: block;
  margin-bottom: 10px;
}
```

> [!NOTE]
> Các phần tử optgroup không thể được lồng vào nhau.

## Thuộc tính

Phần tử này bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- [`disabled`](/en-US/docs/Web/HTML/Reference/Attributes/disabled)
  - : Nếu thuộc tính Boolean này được đặt, không có mục nào trong nhóm tùy chọn này có thể được chọn. Thường trình duyệt làm xám điều khiển như vậy và nó sẽ không nhận bất kỳ sự kiện duyệt nào, như nhấp chuột hoặc sự kiện liên quan đến tiêu điểm.
- `label`
  - : Tên của nhóm các tùy chọn, mà trình duyệt có thể sử dụng khi gắn nhãn các tùy chọn trong giao diện người dùng. Thuộc tính này là bắt buộc nếu phần tử này được sử dụng.

## Ví dụ

```html
<select>
  <optgroup label="Group 1">
    <option>Option 1.1</option>
  </optgroup>
  <optgroup label="Group 2">
    <option>Option 2.1</option>
    <option>Option 2.2</option>
  </optgroup>
  <optgroup label="Group 3" disabled>
    <option>Option 3.1</option>
    <option>Option 3.2</option>
    <option>Option 3.3</option>
  </optgroup>
</select>
```

### Kết quả

{{EmbedLiveSample("Examples")}}

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
      <td>Không hoặc nhiều phần tử {{HTMLElement("option")}}. Trong <a href="/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select">phần tử select có thể tùy chỉnh</a>, phần tử {{htmlelement("legend")}} được cho phép là con của <code>&lt;optgroup&gt;</code>.</td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>
        Thẻ mở là bắt buộc. Thẻ đóng là tùy chọn nếu phần tử này
        được theo sau ngay bởi phần tử <code>&#x3C;optgroup></code> khác, hoặc
        nếu phần tử cha không có thêm nội dung.
      </td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha cho phép</th>
      <td>Phần tử {{HTMLElement("select")}}.</td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role"><code>group</code></a></td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA cho phép</th>
      <td>Không có <code>role</code> nào được phép</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLOptGroupElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử liên quan đến form khác: {{HTMLElement("form")}}, {{HTMLElement("legend")}}, {{HTMLElement("label")}}, {{HTMLElement("button")}}, {{HTMLElement("select")}}, {{HTMLElement("datalist")}}, {{HTMLElement("option")}}, {{HTMLElement("fieldset")}}, {{HTMLElement("textarea")}}, {{HTMLElement("input")}}, {{HTMLElement("output")}}, {{HTMLElement("progress")}} và {{HTMLElement("meter")}}.
- [Phần tử select có thể tùy chỉnh](/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select)
