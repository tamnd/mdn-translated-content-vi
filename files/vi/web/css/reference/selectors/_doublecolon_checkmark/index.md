---
title: ::checkmark
slug: Web/CSS/Reference/Selectors/::checkmark
page-type: css-pseudo-element
status:
  - experimental
browser-compat: css.selectors.checkmark
sidebar: cssref
---

{{SeeCompatTable}}

[Phần tử giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) [CSS](/en-US/docs/Web/CSS) **`::checkmark`** nhắm vào dấu kiểm được đặt bên trong phần tử {{htmlelement("option")}} hiện đang được chọn của một [phần tử select có thể tùy chỉnh](/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select). Nó có thể được dùng để cung cấp chỉ báo trực quan về tùy chọn nào đang được chọn.

{{InteractiveExample("CSS Demo: ::checkmark")}}

```html-nolint interactive-example
<label for="pet-select">
  Select pet:
</label>
<br />
<select id="pet-select">
  <option value="cat">Cat</option>
  <option value="dog">Dog</option>
  <option value="chicken">
    Chicken
  </option>
</select>
```

```css interactive-example
option::checkmark {
  color: orange;
  font-size: 1.5rem;
}

select,
::picker(select) {
  appearance: base-select;
  width: 200px;
}

select {
  border: 2px solid #dddddd;
  background: #eeeeee;
  padding: 10px;
}

::picker(select) {
  border: none;
}

option {
  border: 2px solid #dddddd;
  background: #eeeeee;
  padding: 10px;
}

option:first-of-type {
  border-radius: 8px 8px 0 0;
}

option:last-of-type {
  border-radius: 0 0 8px 8px;
}

option:nth-of-type(odd) {
  background: white;
}

option:not(option:last-of-type) {
  border-bottom: none;
}
```

## Cú pháp

```css-nolint
::checkmark {
  /* ... */
}
```

## Mô tả

Phần tử giả `::checkmark` nhắm vào dấu kiểm được đặt bên trong `<option>` hiện đang được chọn của một [phần tử select có thể tùy chỉnh](/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select).

Nó chỉ có thể nhắm tới khi phần tử gốc có picker và đã được đặt kiểu nền qua giá trị `base-select` của thuộc tính {{cssxref("appearance")}}. Hộp được tạo ra của nó xuất hiện trước bất kỳ hộp nào được tạo ra bởi phần tử giả {{cssxref("::before")}}. Biểu tượng có thể được tùy chỉnh bằng thuộc tính {{cssxref("content")}}.

Bộ chọn `::checkmark` hữu ích ví dụ khi bạn muốn ẩn dấu kiểm, sử dụng biểu tượng tùy chỉnh, hoặc điều chỉnh vị trí hiển thị của dấu kiểm bên trong các phần tử `<option>`.

> [!NOTE]
> Phần tử giả `::checkmark` không được bao gồm trong cây trợ năng, vì vậy bất kỳ {{cssxref("content")}} được tạo ra nào được đặt trên nó sẽ không được thông báo bởi các công nghệ hỗ trợ. Bạn vẫn nên đảm bảo rằng bất kỳ biểu tượng mới nào bạn đặt có ý nghĩa trực quan phù hợp với mục đích dự kiến.

## Ví dụ

### Tùy chỉnh dấu kiểm

Để kích hoạt chức năng select có thể tùy chỉnh, cả phần tử `<select>` và picker của nó đều cần có giá trị {{cssxref("appearance")}} là `base-select`:

```css
select,
::picker(select) {
  appearance: base-select;
}
```

Giả sử [flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout) đang được dùng để bố cục các phần tử `<option>` (điều này đúng trong **các triển khai hiện tại** của select có thể tùy chỉnh), bạn có thể di chuyển dấu kiểm từ đầu hàng sang cuối bằng cách đặt giá trị {{cssxref("order")}} lớn hơn `0` trên nó, và căn chỉnh nó về cuối hàng bằng cách dùng giá trị `auto` của {{cssxref("margin-left")}} (xem [Căn chỉnh và lề tự động](/en-US/docs/Web/CSS/Guides/Box_alignment/In_flexbox#alignment_and_auto_margins)).

Giá trị của thuộc tính {{cssxref("content")}} cũng có thể được đặt thành một emoji khác để thay đổi biểu tượng hiển thị.

```css
option::checkmark {
  order: 1;
  margin-left: auto;
  content: "☑️";
}
```

Xem [Tạo kiểu cho dấu kiểm chọn hiện tại](/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select#styling_the_current_selection_checkmark) để có ví dụ đầy đủ sử dụng mã này, cùng với ví dụ trực tiếp.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{htmlelement("select")}}, {{htmlelement("option")}}, {{htmlelement("optgroup")}}, {{htmlelement("label")}}, {{htmlelement("button")}}, {{htmlelement("selectedcontent")}}
- {{cssxref("appearance")}}
- {{cssxref("::picker()", "::picker(select)")}}, {{cssxref("::picker-icon")}}
- {{cssxref(":open")}}, {{cssxref(":checked")}}
- [Phần tử select có thể tùy chỉnh](/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select)
