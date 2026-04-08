---
title: :state()
slug: Web/CSS/Reference/Selectors/:state
page-type: css-pseudo-class
browser-compat: css.selectors.state
sidebar: cssref
---

**`:state()`** là [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/en-US/docs/Web/CSS) khớp với các [phần tử tùy chỉnh](/en-US/docs/Web/API/Web_components/Using_custom_elements) có trạng thái tùy chỉnh được chỉ định.

## Cú pháp

```css-nolint
:state(<custom identifier>) {
  /* ... */
}
```

### Tham số

Lớp giả `:state()` nhận một định danh tùy chỉnh làm đối số, đại diện cho trạng thái của phần tử tùy chỉnh cần khớp.

## Mô tả

Các phần tử có thể chuyển đổi giữa các trạng thái do tương tác của người dùng và các yếu tố khác.
Ví dụ: một phần tử có thể ở trạng thái "hover" khi người dùng di chuột qua phần tử đó, hoặc một liên kết có thể ở trạng thái "visited" sau khi người dùng nhấp vào nó.
Các phần tử được cung cấp bởi trình duyệt có thể được tạo kiểu dựa trên các trạng thái này bằng cách sử dụng các lớp giả CSS như {{cssxref(":hover")}} và {{cssxref(":visited")}}.
Tương tự, các [phần tử tùy chỉnh tự trị](/en-US/docs/Web/API/Web_components/Using_custom_elements#types_of_custom_element) (các phần tử tùy chỉnh không được dẫn xuất từ các phần tử tích hợp sẵn) có thể hiển thị các trạng thái của chúng, cho phép các trang sử dụng phần tử đó tạo kiểu cho chúng bằng lớp giả CSS `:state()`.

Các trạng thái của phần tử tùy chỉnh được biểu diễn bằng các giá trị chuỗi.
Các giá trị này được thêm vào hoặc xóa khỏi đối tượng [`CustomStateSet`](/en-US/docs/Web/API/CustomStateSet) được liên kết với phần tử.
Lớp giả CSS `:state()` khớp với một phần tử khi định danh được truyền làm đối số xuất hiện trong `CustomStateSet` của phần tử.

Lớp giả `:state()` cũng có thể được dùng để khớp với các trạng thái tùy chỉnh bên trong phần triển khai của phần tử tùy chỉnh.
Điều này đạt được bằng cách sử dụng `:state()` bên trong hàm lớp giả [`:host()`](/en-US/docs/Web/CSS/Reference/Selectors/:host_function), chỉ khớp với một trạng thái bên trong shadow DOM của phần tử tùy chỉnh hiện tại.

Ngoài ra, phần tử giả [`::part()`](/en-US/docs/Web/CSS/Reference/Selectors/::part) theo sau bởi lớp giả `:state()` cho phép khớp với các [shadow part](/en-US/docs/Web/CSS/Guides/Shadow_parts) của phần tử tùy chỉnh đang ở một trạng thái cụ thể. (**Shadow part** là các phần của shadow tree của phần tử tùy chỉnh được hiển thị một cách tường minh cho trang chứa để tạo kiểu.)

## Ví dụ

### Khớp với trạng thái tùy chỉnh

CSS này cho thấy cách thay đổi đường viền của phần tử tùy chỉnh tự trị `<labeled-checkbox>` thành `red` khi nó ở trạng thái "checked".

```css
labeled-checkbox {
  border: dashed red;
}
labeled-checkbox:state(checked) {
  border: solid;
}
```

Để xem ví dụ trực tiếp của đoạn mã này, xem ví dụ [Matching the custom state of a custom checkbox element](/en-US/docs/Web/API/CustomStateSet#matching_the_custom_state_of_a_custom_checkbox_element) trên trang `CustomStateSet`.

### Khớp với trạng thái tùy chỉnh trong shadow DOM của phần tử tùy chỉnh

Ví dụ này cho thấy cách lớp giả `:state()` có thể được dùng bên trong hàm lớp giả [`:host()`](/en-US/docs/Web/CSS/Reference/Selectors/:host_function) để khớp với các trạng thái tùy chỉnh bên trong phần triển khai của phần tử tùy chỉnh.

CSS sau chèn một `[x]` màu xám trước phần tử khi nó ở trạng thái "checked".

```css
:host(:state(checked))::before {
  content: "[x]";
}
```

Để xem ví dụ trực tiếp của đoạn mã này, xem ví dụ [Matching the custom state of a custom checkbox element](/en-US/docs/Web/API/CustomStateSet#matching_the_custom_state_of_a_custom_checkbox_element) trên trang `CustomStateSet`.

### Khớp với trạng thái tùy chỉnh trong shadow part

Ví dụ này cho thấy cách lớp giả `:state()` có thể được dùng để nhắm đến các [shadow part](/en-US/docs/Web/CSS/Guides/Shadow_parts) của phần tử tùy chỉnh.

Các shadow part được định nghĩa và đặt tên bằng thuộc tính [`part`](/en-US/docs/Web/HTML/Reference/Global_attributes/part).
Ví dụ: xét một phần tử tùy chỉnh có tên `<question-box>` sử dụng phần tử tùy chỉnh `<labeled-checkbox>` làm shadow part có tên `checkbox`:

```js
shadowRoot.innerHTML = `<labeled-checkbox part='checkbox'>Yes</labeled-checkbox>`;
```

CSS bên dưới cho thấy cách phần tử giả [`::part()`](/en-US/docs/Web/CSS/Reference/Selectors/::part) có thể được dùng để khớp với shadow part `'checkbox'`.
Sau đó, nó cho thấy cách phần tử giả `::part()` theo sau bởi lớp giả `:state()` có thể được dùng để khớp với cùng một part khi nó ở trạng thái `checked`.

```css
question-box::part(checkbox) {
  color: red;
}

question-box::part(checkbox):state(checked) {
  color: green;
  outline: dashed 1px green;
}
```

Để xem ví dụ trực tiếp của đoạn mã này, xem ví dụ [Matching a custom state in a shadow part of a custom element](/en-US/docs/Web/API/CustomStateSet#matching_a_custom_state_in_a_shadow_part_of_a_custom_element) trên trang `CustomStateSet`.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`CustomStateSet`](/en-US/docs/Web/API/CustomStateSet)
- [Lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes)
- [Học: Lớp giả và phần tử giả](/en-US/docs/Learn_web_development/Core/Styling_basics/Pseudo_classes_and_elements)
- [Custom states and custom state pseudo-class CSS selectors](/en-US/docs/Web/API/Web_components/Using_custom_elements#custom_states_and_custom_state_pseudo-class_css_selectors) trong [Using custom elements](/en-US/docs/Web/API/Web_components/Using_custom_elements)
