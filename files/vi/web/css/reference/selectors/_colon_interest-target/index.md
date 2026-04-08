---
title: :interest-target
slug: Web/CSS/Reference/Selectors/:interest-target
page-type: css-pseudo-class
status:
  - experimental
browser-compat: css.selectors.interest-target
sidebar: cssref
---

{{SeeCompatTable}}

[Lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/en-US/docs/Web/CSS) **`:interest-target`** đại diện cho phần tử đích liên kết với một [interest invoker](/en-US/docs/Web/API/Popover_API/Using_interest_invokers) khi người dùng thể hiện sự quan tâm tới invoker đó.

## Cú pháp

```css
:interest-target {
  /* ... */
}
```

## Ví dụ

### Chọn phần tử đích liên kết với interest invoker

Trong ví dụ này, chúng ta minh họa cách dùng `:interest-target` để áp dụng kiểu cho phần tử đích của interest invoker khi người dùng thể hiện sự quan tâm tới invoker.

#### HTML

Đoạn markup bao gồm một {{htmlelement("button")}} và một {{htmlelement("p")}}. Chúng ta chỉ định `<button>` là interest invoker bằng cách gán thuộc tính `interestfor` có giá trị khớp với `id` của phần tử `<p>`, khiến đoạn văn trở thành phần tử đích.

```html live-sample___interest-target
<button interestfor="mytarget">Button</button>
<p id="mytarget">A paragraph</p>
```

#### CSS

Trong CSS, chúng ta chỉ định một quy tắc với bộ chọn `:interest-target`, áp dụng một tập hợp kiểu cụ thể cho phần tử `<p>` khi người dùng thể hiện sự quan tâm tới `<button>`. Một số kiểu khác được áp dụng cho `<button>` đã được ẩn để ngắn gọn.

```css hidden live-sample___interest-target
body {
  margin: 10px;
}

button {
  padding: 5px 10px;
  border: 1px solid #dddddd;
  border-radius: 5px;
  background-color: #eeeeee;

  cursor: pointer;
}
```

```css live-sample___interest-target
p:interest-target {
  font-size: 1.5em;
  font-family: sans-serif;
  padding: 10px;
  background-color: hotpink;
  color: purple;
}
```

#### Kết quả

Kết quả hiển thị như sau:

{{embedlivesample("interest-target", "100%", "150")}}

Hãy thử thể hiện sự quan tâm tới nút (ví dụ bằng cách di chuột hoặc focus vào nó), và chú ý cách điều này khiến các kiểu hiển thị trước đó được áp dụng cho đoạn văn.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref(":interest-source")}}
- [Popover API](/en-US/docs/Web/API/Popover_API)
- [Using interest invokers](/en-US/docs/Web/API/Popover_API/Using_interest_invokers)
- Module [CSS selectors](/en-US/docs/Web/CSS/Guides/Selectors)
