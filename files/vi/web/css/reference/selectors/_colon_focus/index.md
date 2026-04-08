---
title: :focus
slug: Web/CSS/Reference/Selectors/:focus
page-type: css-pseudo-class
browser-compat: css.selectors.focus
sidebar: cssref
---

**`:focus`** là [lớp giả (pseudo-class)](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) trong [CSS](/en-US/docs/Web/CSS), đại diện cho một phần tử (chẳng hạn như ô nhập liệu trong biểu mẫu) đang nhận focus. Nó thường được kích hoạt khi người dùng nhấp hoặc chạm vào một phần tử, hoặc chọn nó bằng phím <kbd>Tab</kbd> trên bàn phím.

{{InteractiveExample("CSS Demo: :focus", "tabbed-shorter")}}

```css interactive-example
label {
  display: block;
  margin-top: 1em;
}

input:focus {
  background-color: lightblue;
}

select:focus {
  background-color: ivory;
}
```

```html interactive-example
<form>
  <p>Which flavor would you like to order?</p>
  <label>Full Name: <input name="firstName" type="text" /></label>
  <label
    >Flavor:
    <select name="flavor">
      <option>Cherry</option>
      <option>Green Tea</option>
      <option>Moose Tracks</option>
      <option>Mint Chip</option>
    </select>
  </label>
</form>
```

> [!NOTE]
> Lớp giả này chỉ áp dụng cho chính phần tử đang được focus. Sử dụng {{CSSxRef(":focus-within")}} nếu bạn muốn chọn một phần tử _chứa_ một phần tử đang được focus.

## Cú pháp

```css
:focus {
  /* ... */
}
```

## Khả năng tiếp cận

Hãy đảm bảo rằng chỉ báo focus trực quan có thể nhìn thấy được bởi người có thị lực kém. Điều này cũng có lợi cho bất kỳ ai sử dụng màn hình trong không gian sáng (chẳng hạn như ngoài trời dưới ánh nắng mặt trời). [WCAG 2.1 SC 1.4.11 Non-Text Contrast](https://www.w3.org/WAI/WCAG21/Understanding/non-text-contrast.html) yêu cầu chỉ báo focus trực quan phải có tỷ lệ tương phản ít nhất là 3:1.

- Chỉ báo focus trực quan có thể tiếp cận: [Give Your Site Some Focus! Tips for Designing Useful and Usable Focus Indicators](https://www.deque.com/blog/give-site-focus-tips-designing-usable-focus-indicators/)

### `:focus { outline: none; }`

Không bao giờ chỉ đơn giản là xóa viền focus (chỉ báo focus trực quan) mà không thay thế bằng một viền focus đáp ứng [WCAG 2.1 SC 1.4.11 Non-Text Contrast](https://www.w3.org/WAI/WCAG21/Understanding/non-text-contrast.html).

- Mẹo nhanh: [Never remove CSS outlines](https://www.a11yproject.com/posts/never-remove-css-outlines/)

## Ví dụ

### HTML

```html
<div><input class="red-input" value="I'll be red when focused." /></div>
<div><input class="blue-input" value="I'll be blue when focused." /></div>
```

### CSS

```css
.red-input:focus {
  background: yellow;
  color: red;
}

.blue-input:focus {
  background: yellow;
  color: blue;
}
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef(":focus-visible")}}
- {{CSSxRef(":focus-within")}}
