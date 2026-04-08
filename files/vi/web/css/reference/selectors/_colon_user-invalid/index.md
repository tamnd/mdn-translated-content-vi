---
title: :user-invalid
slug: Web/CSS/Reference/Selectors/:user-invalid
page-type: css-pseudo-class
browser-compat: css.selectors.user-invalid
sidebar: cssref
---

Lớp giả **`:user-invalid`** trong [CSS](/en-US/docs/Web/CSS) đại diện cho bất kỳ phần tử biểu mẫu đã được kiểm tra hợp lệ nào mà giá trị của nó không hợp lệ dựa trên [các ràng buộc kiểm tra hợp lệ](/en-US/docs/Web/HTML/Guides/Constraint_validation), sau khi người dùng đã tương tác với nó.

Lớp giả `:user-invalid` phải khớp với phần tử {{CSSxRef(":invalid")}}, {{CSSxRef(":out-of-range")}}, hoặc phần tử trống nhưng có {{CSSxRef(":required")}} trong khoảng thời gian từ khi người dùng cố gắng gửi biểu mẫu đến trước khi người dùng tương tác lại với phần tử biểu mẫu đó.

## Cú pháp

```css
:user-invalid {
  /* ... */
}
```

## Ví dụ

### Đặt màu sắc và ký hiệu cho :user-invalid

Trong ví dụ sau, viền đỏ và ❌ chỉ hiển thị khi người dùng đã tương tác với trường.
Hãy thử nhập nội dung không phải địa chỉ email để xem hiệu ứng.

```html
<form>
  <label for="email">Email *: </label>
  <input id="email" name="email" type="email" required />
  <span></span>
</form>
```

```css
input:user-invalid {
  border: 2px solid red;
}

input:user-invalid + span::before {
  content: "✖";
  color: red;
}
```

{{EmbedLiveSample("Setting_a_color_and_symbol_on_user-invalid", 140, 100)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef(":valid")}}
- {{CSSxRef(":invalid")}}
- {{CSSxRef(":required")}}
- {{CSSxRef(":optional")}}
- {{CSSxRef(":user-valid")}}
