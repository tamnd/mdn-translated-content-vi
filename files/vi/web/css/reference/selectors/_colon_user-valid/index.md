---
title: :user-valid
slug: Web/CSS/Reference/Selectors/:user-valid
page-type: css-pseudo-class
browser-compat: css.selectors.user-valid
sidebar: cssref
---

Lớp giả **`:user-valid`** trong [CSS](/en-US/docs/Web/CSS) đại diện cho bất kỳ phần tử biểu mẫu đã được kiểm tra hợp lệ nào mà giá trị của nó vượt qua kiểm tra dựa trên [các ràng buộc kiểm tra hợp lệ](/en-US/docs/Web/HTML/Guides/Constraint_validation). Tuy nhiên, không giống {{cssxref(":valid")}}, nó chỉ khớp khi người dùng đã tương tác với phần tử.

Lớp giả này được áp dụng nếu ô điều khiển biểu mẫu hợp lệ và bất kỳ điều nào sau đây đã xảy ra:

- Người dùng đã thực hiện thay đổi với ô điều khiển biểu mẫu và xác nhận thay đổi đó, chẳng hạn bằng cách chuyển focus sang nơi khác.
- Người dùng đã cố gắng gửi biểu mẫu, dù không thực hiện thay đổi nào đối với ô điều khiển.
- Giá trị không hợp lệ khi ô điều khiển nhận được focus, và người dùng đã thực hiện thay đổi khiến giá trị trở nên hợp lệ, dù focus vẫn còn trong ô điều khiển.

Sau khi lớp giả này được áp dụng, tác nhân người dùng sẽ kiểm tra lại tính hợp lệ của ô điều khiển ở mỗi lần nhấn phím khi ô điều khiển có focus.

- Nếu ô điều khiển có focus và giá trị không hợp lệ khi nhận focus, hãy kiểm tra lại ở mỗi lần nhấn phím.

Kết quả là nếu ô điều khiển hợp lệ khi người dùng bắt đầu tương tác, kiểu hiển thị hợp lệ chỉ thay đổi khi người dùng chuyển focus sang ô điều khiển khác. Tuy nhiên, nếu người dùng đang cố sửa một giá trị đã được đánh dấu lỗi trước đó, ô điều khiển sẽ hiển thị ngay khi giá trị trở nên hợp lệ. Các mục bắt buộc chỉ bị đánh dấu là không hợp lệ nếu người dùng thay đổi chúng hoặc cố gửi một giá trị không hợp lệ chưa được thay đổi.

## Cú pháp

```css
:user-valid {
  /* ... */
}
```

## Ví dụ

### Đặt màu sắc và ký hiệu cho :user-valid

Trong ví dụ sau, viền xanh và ✅ chỉ hiển thị khi người dùng đã tương tác với trường.
Hãy thử thay đổi địa chỉ email thành một email hợp lệ khác để xem hiệu ứng.

```html
<form>
  <label for="email">Email *: </label>
  <input
    id="email"
    name="email"
    type="email"
    value="test@example.com"
    required />
  <span></span>
</form>
```

```css
input:user-valid {
  border: 2px solid green;
}

input:user-valid + span::before {
  content: "✓";
  color: green;
}
```

{{EmbedLiveSample("Setting_a_color_and_symbol_on_user-valid", 140, 100)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef(":valid")}}
- {{CSSxRef(":invalid")}}
- {{CSSxRef(":required")}}
- {{CSSxRef(":optional")}}
- {{CSSxRef(":user-invalid")}}
