---
title: "HTML attribute: disabled"
short-title: disabled
slug: Web/HTML/Reference/Attributes/disabled
page-type: html-attribute
browser-compat:
  - html.elements.button.disabled
  - html.elements.fieldset.disabled
  - html.elements.input.disabled
  - html.elements.optgroup.disabled
  - html.elements.option.disabled
  - html.elements.select.disabled
  - html.elements.textarea.disabled
sidebar: htmlsidebar
---

Thuộc tính Boolean **`disabled`**, khi có mặt, làm cho phần tử không thể thay đổi, không thể lấy tiêu điểm, hoặc thậm chí không được gửi cùng với biểu mẫu. Người dùng không thể chỉnh sửa hay tập trung vào điều khiển, cũng như các điều khiển biểu mẫu con của nó.

{{InteractiveExample("HTML Demo: disabled", "tabbed-standard")}}

```html interactive-example
<form>
  <label for="name">Name:</label>
  <input id="name" name="name" type="text" />

  <label for="emp">Employed:</label>
  <select id="emp" name="emp" disabled>
    <option>No</option>
    <option>Yes</option>
  </select>

  <label for="empDate">Employment Date:</label>
  <input id="empDate" name="empDate" type="date" disabled />

  <label for="resume">Resume:</label>
  <input id="resume" name="resume" type="file" />
</form>
```

```css interactive-example
label {
  display: block;
  margin-top: 1em;
}

*:disabled {
  background-color: dimgrey;
  color: linen;
  opacity: 1;
}
```

## Tổng quan

Nếu thuộc tính `disabled` được chỉ định trên điều khiển biểu mẫu, phần tử và các điều khiển biểu mẫu con của nó không tham gia vào xác nhận ràng buộc. Trình duyệt thường làm mờ các điều khiển đó và nó sẽ không nhận bất kỳ sự kiện duyệt nào, như nhấp chuột hoặc sự kiện liên quan đến tiêu điểm.

Thuộc tính `disabled` được hỗ trợ bởi {{ HTMLElement("button") }}, {{ HTMLElement("fieldset") }}, {{ HTMLElement("optgroup") }}, {{ HTMLElement("option") }}, {{ HTMLElement("select") }}, {{ HTMLElement("textarea") }} và {{ HTMLElement("input")}}.

Thuộc tính Boolean disabled này cho biết rằng người dùng không thể tương tác với điều khiển hoặc các điều khiển con của nó. Nếu thuộc tính này không được chỉ định, điều khiển kế thừa cài đặt của nó từ phần tử chứa, ví dụ `fieldset`; nếu không có phần tử chứa nào có thuộc tính `disabled` được đặt, và điều khiển bản thân không có thuộc tính đó, thì điều khiển được bật. Nếu được khai báo trên {{ HTMLElement("optgroup") }}, select vẫn tương tác (trừ khi bị vô hiệu hóa bằng cách khác), nhưng không có mục nào trong nhóm tùy chọn có thể được chọn.

> [!NOTE]
> Nếu {{ HTMLElement("fieldset") }} bị vô hiệu hóa, các điều khiển biểu mẫu con đều bị vô hiệu hóa, ngoại trừ các điều khiển biểu mẫu bên trong {{ HTMLElement("legend") }}.

Khi phần tử hỗ trợ có thuộc tính `disabled` được áp dụng, lớp giả {{cssxref(":disabled")}} cũng áp dụng cho nó. Ngược lại, các phần tử hỗ trợ thuộc tính `disabled` nhưng không có thuộc tính được đặt khớp với lớp giả {{cssxref(":enabled")}}.

Thuộc tính Boolean này ngăn người dùng tương tác với button. Nếu thuộc tính này không được đặt, button vẫn có thể bị vô hiệu hóa từ phần tử chứa, ví dụ {{htmlelement('fieldset')}}; nếu không có phần tử chứa nào có thuộc tính `disabled` được đặt, thì button được bật.

Firefox sẽ, không giống các trình duyệt khác, duy trì trạng thái disabled động của {{htmlelement('button')}} qua các lần tải trang. Sử dụng thuộc tính [`autocomplete`](/en-US/docs/Web/HTML/Reference/Attributes/autocomplete) để kiểm soát tính năng này.

### Tương tác thuộc tính

Sự khác biệt giữa `disabled` và [`readonly`](/en-US/docs/Web/HTML/Reference/Attributes/readonly) là các điều khiển read-only vẫn có thể hoạt động và vẫn có thể lấy tiêu điểm, trong khi các điều khiển disabled không thể nhận tiêu điểm và không được gửi cùng với biểu mẫu và nói chung không hoạt động như điều khiển cho đến khi chúng được bật.

Vì trường disabled không thể thay đổi giá trị của nó, [`required`](/en-US/docs/Web/HTML/Reference/Attributes/required) không có bất kỳ hiệu ứng nào trên input cũng có thuộc tính `disabled` được chỉ định. Ngoài ra, vì các phần tử trở nên bất biến, hầu hết các thuộc tính khác, chẳng hạn như [`pattern`](/en-US/docs/Web/HTML/Reference/Attributes/pattern), không có hiệu ứng, cho đến khi điều khiển được bật.

> [!NOTE]
> Thuộc tính `required` không được phép trên input có thuộc tính `disabled` được chỉ định.

### Khả năng sử dụng

Trình duyệt hiển thị các điều khiển biểu mẫu disabled theo màu xám vì các điều khiển biểu mẫu disabled không thể thay đổi, sẽ không nhận tiêu điểm hoặc bất kỳ sự kiện duyệt nào, như nhấp chuột hoặc sự kiện liên quan đến tiêu điểm, và không được gửi cùng với biểu mẫu.

Nếu có mặt trên các phần tử hỗ trợ, lớp giả {{cssxref(':disabled')}} sẽ khớp. Nếu thuộc tính không được bao gồm, lớp giả {{cssxref(':enabled')}} sẽ khớp. Nếu phần tử không hỗ trợ thuộc tính disabled, thuộc tính sẽ không có hiệu ứng, bao gồm cả việc không dẫn đến khớp bởi lớp giả `:disabled` và `:enabled`.

### Xác nhận ràng buộc

Nếu phần tử bị `disabled`, thì giá trị của phần tử không thể nhận tiêu điểm và không thể được cập nhật bởi người dùng, và không tham gia vào xác nhận ràng buộc.

## Ví dụ

Khi các điều khiển biểu mẫu bị vô hiệu hóa, nhiều trình duyệt sẽ hiển thị chúng trong màu xám nhạt hơn theo mặc định. Dưới đây là ví dụ về checkbox bị vô hiệu hóa, nút radio, {{ HTMLElement("option") }} và {{ HTMLElement("optgroup") }}, cũng như một số điều khiển biểu mẫu bị vô hiệu hóa thông qua thuộc tính disabled được đặt trên phần tử `{{ HTMLElement("fieldset")}}` tổ tiên. {{ HTMLElement("option") }}s bị vô hiệu hóa, nhưng {{ HTMLElement("select") }} chính nó thì không. Chúng ta có thể đã vô hiệu hóa toàn bộ {{ HTMLElement("select") }} bằng cách thêm thuộc tính vào phần tử đó thay vì các con của nó.

```html
<fieldset>
  <legend>Checkboxes</legend>
  <p>
    <label>
      <input type="checkbox" name="ch-box" value="regular" /> Regular
    </label>
  </p>
  <p>
    <label>
      <input type="checkbox" name="ch-box" value="disabled" disabled /> disabled
    </label>
  </p>
</fieldset>

<fieldset>
  <legend>Radio buttons</legend>
  <p>
    <label> <input type="radio" name="radio" value="regular" /> Regular </label>
  </p>
  <p>
    <label>
      <input type="radio" name="radio" value="disabled" disabled /> disabled
    </label>
  </p>
</fieldset>

<p>
  <label
    >Select an option:
    <select>
      <optgroup label="Group 1">
        <option>Option 1.1</option>
      </optgroup>
      <optgroup label="Group 2">
        <option>Option 2.1</option>
        <option disabled>Option 2.2</option>
        <option>Option 2.3</option>
      </optgroup>
      <optgroup label="Group 3" disabled>
        <option>Disabled 3.1</option>
        <option>Disabled 3.2</option>
        <option>Disabled 3.3</option>
      </optgroup>
    </select>
  </label>
</p>

<fieldset disabled>
  <legend>Disabled fieldset</legend>
  <p>
    <label>
      Name: <input type="radio" name="radio" value="regular" /> Regular
    </label>
  </p>
  <p>
    <label>Number: <input type="number" /></label>
  </p>
</fieldset>
```

{{EmbedLiveSample('Examples', 500, 450)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref(':disabled')}} và {{cssxref(':enabled')}}
