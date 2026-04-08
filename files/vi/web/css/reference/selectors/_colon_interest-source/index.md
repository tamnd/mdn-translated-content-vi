---
title: :interest-source
slug: Web/CSS/Reference/Selectors/:interest-source
page-type: css-pseudo-class
status:
  - experimental
browser-compat: css.selectors.interest-source
sidebar: cssref
---

{{SeeCompatTable}}

[Lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/en-US/docs/Web/CSS) **`:interest-source`** đại diện cho phần tử [interest invoker](/en-US/docs/Web/API/Popover_API/Using_interest_invokers) khi người dùng thể hiện sự quan tâm tới nó.

## Cú pháp

```css
:interest-source {
  /* ... */
}
```

## Ví dụ

### Chọn phần tử interest invoker

Trong ví dụ này, chúng ta minh họa cách dùng `:interest-source` để áp dụng kiểu cho phần tử interest invoker khi người dùng thể hiện sự quan tâm tới nó.

#### HTML

Đoạn markup bao gồm một {{htmlelement("button")}} và một {{htmlelement("p")}}. Chúng ta chỉ định `<button>` là interest invoker bằng cách gán thuộc tính `interestfor` có giá trị khớp với `id` của phần tử `<p>`, khiến đoạn văn trở thành phần tử đích. Đoạn văn được chuyển thành popover bằng cách gán thuộc tính [`popover`](/en-US/docs/Web/HTML/Reference/Global_attributes/popover), giúp ẩn nó ban đầu.

```html live-sample___interest-source
<button interestfor="mypopover">Button</button>
<p id="mypopover" popover>A hover tooltip</p>
```

#### CSS

Trong CSS, chúng ta chỉ định một quy tắc với bộ chọn `:interest-source` để áp dụng tổ hợp {{cssxref("background-color")}} và {{cssxref("color")}} cụ thể cho `<button>` khi người dùng thể hiện sự quan tâm tới nó. Một số kiểu khác được áp dụng cho `<button>` đã được ẩn để ngắn gọn.

```css hidden live-sample___interest-source
button {
  margin: 10px;
  padding: 5px 10px;
  border: 1px solid #dddddd;
  border-radius: 5px;
  font-size: 1.5em;
  background-color: #eeeeee;

  cursor: pointer;
}
```

```css live-sample___interest-source
button:interest-source {
  background-color: hotpink;
  color: purple;
}
```

#### Kết quả

Kết quả hiển thị như sau:

{{embedlivesample("interest-source", "100%", "100")}}

Hãy thử thể hiện sự quan tâm tới nút (ví dụ bằng cách di chuột hoặc focus vào nó), và chú ý cách tổ hợp màu `hotpink` và `purple` chỉ được áp dụng khi có sự quan tâm.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref(":interest-target")}}
- [Popover API](/en-US/docs/Web/API/Popover_API)
- [Using interest invokers](/en-US/docs/Web/API/Popover_API/Using_interest_invokers)
- Module [CSS selectors](/en-US/docs/Web/CSS/Guides/Selectors)
