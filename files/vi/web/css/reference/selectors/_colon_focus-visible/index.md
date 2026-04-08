---
title: :focus-visible
slug: Web/CSS/Reference/Selectors/:focus-visible
page-type: css-pseudo-class
browser-compat: css.selectors.focus-visible
sidebar: cssref
---

Lớp giả **`:focus-visible`** được áp dụng khi một phần tử khớp với lớp giả {{CSSxRef(":focus")}} và tác nhân người dùng ({{glossary("User Agent")}}) xác định thông qua các phương pháp heuristic rằng focus nên được hiển thị rõ ràng trên phần tử đó. (Nhiều trình duyệt hiển thị "vòng focus" theo mặc định trong trường hợp này.)

{{InteractiveExample("CSS Demo: :focus-visible", "tabbed-shorter")}}

```css interactive-example
label {
  display: block;
  margin-top: 1em;
}

input:focus-visible {
  outline: 2px solid crimson;
  border-radius: 3px;
}

select:focus-visible {
  border: 2px dashed crimson;
  border-radius: 3px;
  outline: none;
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

Bộ chọn này hữu ích để cung cấp chỉ báo focus khác nhau dựa trên phương thức nhập của người dùng (chuột so với bàn phím).

## Cú pháp

```css
:focus-visible {
  /* ... */
}
```

## :focus vs :focus-visible

Ban đầu, CSS của tác nhân người dùng đặt kiểu focus chỉ dựa trên lớp giả `:focus`, tạo kiểu cho hầu hết các phần tử được focus bằng viền vòng focus. Điều này có nghĩa là tất cả các phần tử, bao gồm tất cả các liên kết và nút, đều có vòng focus khi được focus, điều mà nhiều người thấy không đẹp mắt. Do vẻ ngoài đó, một số tác giả đã xóa kiểu viền focus mặc định của tác nhân người dùng. Việc thay đổi kiểu focus có thể làm giảm khả năng sử dụng, trong khi xóa kiểu focus khiến việc điều hướng bằng bàn phím không thể truy cập đối với người dùng có thị lực bình thường.

Các trình duyệt không còn hiển thị rõ ràng focus (chẳng hạn bằng cách vẽ một "vòng focus") xung quanh mỗi phần tử khi nó có focus. Thay vào đó, chúng sử dụng nhiều phương pháp heuristic khác nhau để chỉ cung cấp chỉ báo focus khi nó hữu ích nhất cho người dùng. Ví dụ, khi một nút được nhấp bằng thiết bị con trỏ, focus thường không được chỉ báo trực quan, nhưng khi một hộp văn bản cần nhập liệu từ người dùng có focus, focus được chỉ báo. Trong khi kiểu focus luôn bắt buộc khi người dùng điều hướng trang bằng bàn phím hoặc khi focus được quản lý qua script, kiểu focus không bắt buộc khi người dùng biết họ đang đặt focus ở đâu, chẳng hạn khi họ sử dụng thiết bị con trỏ như chuột hoặc ngón tay để đặt focus trực tiếp lên một phần tử, trừ khi phần tử đó vẫn cần sự chú ý của người dùng.

Lớp giả `:focus` luôn khớp với phần tử đang được focus. Lớp giả `:focus-visible` cũng khớp với phần tử được focus, nhưng chỉ khi người dùng cần được thông báo về vị trí focus hiện tại. Vì lớp giả `:focus-visible` khớp với phần tử được focus khi cần thiết, việc sử dụng `:focus-visible` (thay vì lớp giả `:focus`) cho phép tác giả thay đổi giao diện của chỉ báo focus mà không thay đổi thời điểm chỉ báo focus xuất hiện.

Khi lớp giả {{cssxref(":focus")}} được sử dụng, nó luôn nhắm vào phần tử đang được focus. Điều này có nghĩa là khi người dùng sử dụng thiết bị con trỏ, một vòng focus trực quan xuất hiện xung quanh phần tử được focus, điều mà một số người cho là xâm phạm. Lớp giả `:focus-visible` tôn trọng hành vi chỉ báo focus có chọn lọc của tác nhân người dùng trong khi vẫn cho phép tùy chỉnh chỉ báo focus.

## Khả năng tiếp cận

### Thị lực kém

Hãy đảm bảo rằng chỉ báo focus trực quan có thể nhìn thấy được bởi người có thị lực kém. Điều này cũng có lợi cho bất kỳ ai sử dụng màn hình trong không gian sáng (chẳng hạn như ngoài trời dưới ánh nắng mặt trời). [WCAG 2.1 SC 1.4.11 Non-Text Contrast](https://www.w3.org/WAI/WCAG21/Understanding/non-text-contrast.html) yêu cầu chỉ báo focus trực quan phải có tỷ lệ tương phản ít nhất là 3:1.

- Chỉ báo focus trực quan có thể tiếp cận: [Give Your Site Some Focus! Tips for Designing Useful and Usable Focus Indicators](https://www.deque.com/blog/give-site-focus-tips-designing-usable-focus-indicators/)

### Nhận thức

Có thể không rõ ràng tại sao chỉ báo focus xuất hiện và biến mất nếu một người đang sử dụng các hình thức nhập hỗn hợp. Đối với người dùng có vấn đề về nhận thức, hoặc ít am hiểu công nghệ, hành vi không nhất quán này đối với các phần tử tương tác có thể gây nhầm lẫn.

## Ví dụ

### So sánh :focus và :focus-visible

Ví dụ này trình bày ba cặp điều khiển. Mỗi cặp gồm một ô nhập [`text`](/en-US/docs/Web/HTML/Reference/Elements/input/text) và một nút.

- Cặp đầu tiên không thêm bất kỳ kiểu tùy chỉnh nào cho trạng thái focus, và hiển thị trường hợp mặc định.
- Cặp thứ hai thêm kiểu bằng lớp giả `:focus`.
- Cặp thứ ba thêm kiểu bằng lớp giả `:focus-visible`.

```html
<input type="text" value="Default styles" /><br />
<button>Default styles</button><br />

<input class="focus-only" type="text" value=":focus" /><br />
<button class="focus-only">:focus</button><br />

<input class="focus-visible-only" type="text" value=":focus-visible" /><br />
<button class="focus-visible-only">:focus-visible</button>
```

```css
input,
button {
  margin: 10px;
}

.focus-only:focus {
  outline: 2px solid black;
}

.focus-visible-only:focus-visible {
  outline: 4px dashed darkorange;
}
```

Nếu bạn nhấp lần lượt vào từng phần tử, bạn sẽ thấy rằng khi `:focus` được dùng để tạo kiểu vòng focus, tác nhân người dùng vẽ vòng focus khi người dùng nhấp vào nút. Tuy nhiên, khi `:focus-visible` được dùng để tạo kiểu vòng focus, tác nhân người dùng không vẽ vòng focus khi người dùng nhấp vào nút, giống như trong trường hợp mặc định.

Nếu bạn sau đó dùng Tab để di chuyển qua từng phần tử, bạn sẽ thấy rằng trong cả ba trường hợp — mặc định, `:focus`, và `:focus-visible` — tác nhân người dùng đều vẽ vòng focus xung quanh nút khi người dùng điều hướng đến nó bằng bàn phím.

Điều này cho thấy cách `:focus-visible` giúp nhà thiết kế tuân theo logic của trình duyệt trong việc xác định khi nào nên hiển thị vòng focus.

{{EmbedLiveSample("Comparing :focus and :focus-visible", "100%", 300)}}

### Cung cấp fallback cho :focus

Nếu code của bạn cần hoạt động trên các phiên bản trình duyệt cũ không hỗ trợ `:focus-visible`, hãy kiểm tra hỗ trợ `:focus-visible` bằng {{cssxref("@supports")}} và lặp lại cùng kiểu focus trong đó, nhưng bên trong quy tắc `:focus`. Lưu ý rằng ngay cả khi bạn không chỉ định gì cho `:focus`, các trình duyệt cũ sẽ chỉ hiển thị viền gốc của nền tảng, điều này có thể là đủ.

```html
<button class="button with-fallback" type="button">Button with fallback</button>
<button class="button without-fallback" type="button">
  Button without fallback
</button>
```

```css
.button {
  margin: 10px;
  border: 2px solid darkgray;
  border-radius: 4px;
}

.button:focus-visible {
  /* Draw the focus when :focus-visible is supported */
  outline: 3px solid deepskyblue;
  outline-offset: 3px;
}

@supports not selector(:focus-visible) {
  .button.with-fallback:focus {
    /* Fallback for browsers without :focus-visible support */
    outline: 3px solid deepskyblue;
    outline-offset: 3px;
  }
}
```

{{EmbedLiveSample("Selectively_showing_the_focus_indicator", "100%", 72)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef(":focus")}}
- {{CSSxRef(":focus-within")}}
