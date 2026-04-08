---
title: interest-delay-end
slug: Web/CSS/Reference/Properties/interest-delay-end
page-type: css-shorthand-property
status:
  - experimental
browser-compat: css.properties.interest-delay-end
sidebar: cssref
---

{{SeeCompatTable}}

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`interest-delay-end`** chỉ định độ trễ giữa thời điểm người dùng mất quan tâm đến phần tử [interest invoker](/en-US/docs/Web/API/Popover_API/Using_interest_invokers) và sự kiện {{domxref("HTMLElement.loseinterest_event", "loseinterest")}} được kích hoạt.

Cả hai thuộc tính `interest-delay-end` và {{cssxref("interest-delay-start")}} đều có thể được đặt bằng dạng viết tắt {{cssxref("interest-delay")}}.

## Cú pháp

```css
/* Từ khóa hoặc độ trễ tùy chỉnh */
interest-delay-end: normal;
interest-delay-end: 2s;
interest-delay-end: 250ms;

/* Giá trị toàn cục */
interest-delay-end: inherit;
interest-delay-end: initial;
interest-delay-end: revert;
interest-delay-end: revert-layer;
interest-delay-end: unset;
```

### Giá trị

- `normal`
  - : Đặt độ trễ về mặc định của trình duyệt. Đây là giá trị khởi tạo.
- {{cssxref("&lt;time>")}}
  - : Đặt độ trễ thành một khoảng thời gian cụ thể. Giá trị phải dương, nếu không thuộc tính sẽ không hợp lệ.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Tạo hiệu ứng `interest-delay-end` cơ bản

Trong ví dụ này, chúng ta minh họa cách `interest-delay-end` ảnh hưởng đến hành vi của interest invoker.

#### HTML

Đánh dấu bao gồm một {{htmlelement("button")}}, một {{htmlelement("p")}}, và một {{htmlelement("input")}} kiểu `checkbox`. Chúng ta chỉ định `<button>` là một interest invoker bằng cách gán cho nó thuộc tính `interestfor`, có giá trị khớp với `id` của phần tử `<p>`. Điều này làm cho đoạn văn trở thành phần tử đích. Đoạn văn được chuyển thành popover bằng cách gán thuộc tính [`popover`](/en-US/docs/Web/HTML/Reference/Global_attributes/popover), ban đầu ẩn nó đi.

```html live-sample___interest-invoker-delay
<button interestfor="mypopover">Button</button>
<p id="mypopover" popover>Hover tooltip</p>
<form>
  <input type="checkbox" id="apply-delay" />
  <label for="apply-delay">
    Apply an <code>interest-delay-end</code> of <code>2s</code>
  </label>
</form>
```

#### CSS

Trong CSS, chúng ta chỉ định một quy tắc với selector `.delay` áp dụng giá trị `interest-delay-end` là `2s` cho bất kỳ interest invoker nào có class `delay`. Chúng ta sẽ thiết lập điều này trên `<button>` khi checkbox được tích bằng JavaScript.

```css live-sample___interest-invoker-delay
.delay {
  interest-delay-end: 2s;
}
```

#### JavaScript

Trong script, chúng ta lấy tham chiếu đến `<button>` và checkbox, sau đó tạo một event listener bật/tắt class `delay` trên `<button>` mỗi khi giá trị checkbox thay đổi (khi được tích hoặc bỏ tích).

```js live-sample___interest-invoker-delay
const btn = document.querySelector("button");
const checkbox = document.querySelector("input");
checkbox.addEventListener("change", () => {
  btn.classList.toggle("delay");
});
```

#### Kết quả

Kết quả hiển thị như sau:

{{embedlivesample("interest-invoker-delay", "100%", "100")}}

Hãy thử thể hiện sự quan tâm đến button (ví dụ: bằng cách hover hoặc focus vào nó) rồi mất quan tâm để quan sát popover hiện và ẩn. Mặc định, popover hiện và ẩn sau một khoảng trễ rất ngắn.

Bây giờ hãy tích checkbox và thử lại các hành động tương tự. Lần này, độ trễ giữa thể hiện quan tâm và popover xuất hiện không bị ảnh hưởng, nhưng độ trễ giữa mất quan tâm và popover biến mất sẽ tăng lên `2s`.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("interest-delay-start")}}, {{cssxref("interest-delay")}}
- [Popover API](/en-US/docs/Web/API/Popover_API)
- [Using interest invokers](/en-US/docs/Web/API/Popover_API/Using_interest_invokers)
- [CSS basic user interface](/en-US/docs/Web/CSS/Guides/Basic_user_interface) module
