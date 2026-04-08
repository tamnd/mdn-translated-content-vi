---
title: interest-delay-start
slug: Web/CSS/Reference/Properties/interest-delay-start
page-type: css-shorthand-property
status:
  - experimental
browser-compat: css.properties.interest-delay-start
sidebar: cssref
---

{{SeeCompatTable}}

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`interest-delay-start`** chỉ định độ trễ giữa thời điểm người dùng thể hiện sự quan tâm đến phần tử [interest invoker](/en-US/docs/Web/API/Popover_API/Using_interest_invokers) và sự kiện {{domxref("HTMLElement.interest_event", "interest")}} được kích hoạt.

Cả hai thuộc tính `interest-delay-start` và {{cssxref("interest-delay-end")}} đều có thể được đặt bằng dạng viết tắt {{cssxref("interest-delay")}}.

## Cú pháp

```css
/* Từ khóa hoặc độ trễ tùy chỉnh */
interest-delay-start: normal;
interest-delay-start: 2s;
interest-delay-start: 250ms;

/* Giá trị toàn cục */
interest-delay-start: inherit;
interest-delay-start: initial;
interest-delay-start: revert;
interest-delay-start: revert-layer;
interest-delay-start: unset;
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

### Tạo hiệu ứng `interest-delay-start` cơ bản

Trong ví dụ này, chúng ta minh họa cách `interest-delay-start` ảnh hưởng đến hành vi của interest invoker.

#### HTML

Đánh dấu bao gồm một {{htmlelement("button")}}, một {{htmlelement("p")}}, và một {{htmlelement("input")}} kiểu `checkbox`. Chúng ta chỉ định `<button>` là một interest invoker bằng cách gán cho nó thuộc tính `interestfor`, có giá trị khớp với `id` của phần tử `<p>`. Điều này làm cho đoạn văn trở thành phần tử đích. Đoạn văn được chuyển thành popover bằng cách gán thuộc tính [`popover`](/en-US/docs/Web/HTML/Reference/Global_attributes/popover), ban đầu ẩn nó đi.

```html live-sample___interest-invoker-delay
<button interestfor="mypopover">Button</button>
<p id="mypopover" popover>Hover tooltip</p>
<form>
  <input type="checkbox" id="apply-delay" />
  <label for="apply-delay">
    Apply an <code>interest-delay-start</code> of <code>2s</code>
  </label>
</form>
```

#### CSS

Trong CSS, chúng ta chỉ định một quy tắc với selector `.delay` áp dụng giá trị `interest-delay-start` là `2s` cho bất kỳ interest invoker nào có class `delay`. Chúng ta sẽ thiết lập điều này trên `<button>` khi checkbox được tích bằng JavaScript.

```css live-sample___interest-invoker-delay
.delay {
  interest-delay-start: 2s;
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

Bây giờ hãy tích checkbox và thử lại các hành động tương tự. Lần này, popover sẽ xuất hiện sau độ trễ `2s` khi quan tâm được thể hiện. Độ trễ sau khi mất quan tâm sẽ không bị ảnh hưởng.

### Xóa `interest-delay-start` sau khi quan tâm đã được thể hiện

Trong ví dụ này, chúng ta cho thấy cách xóa `interest-delay-start` khỏi nhiều phần tử interest invoker sau khi quan tâm đã được thể hiện trên một trong số chúng.

Đây là một kỹ thuật hữu ích. Việc popover xuất hiện ngay khi quan tâm được thể hiện trên bất kỳ invoker nào sẽ tạo ra trải nghiệm người dùng gây phân tâm và khó chịu, đó là lý do tại sao trình duyệt thêm một khoảng trễ nhỏ theo mặc định (xem [mô tả `interest-delay`](/en-US/docs/Web/CSS/Reference/Properties/interest-delay#description) để biết thêm chi tiết). Tuy nhiên, một khi người dùng đã thể hiện quan tâm đến một invoker, việc cho phép họ chuyển giữa các invoker khác một cách nhanh chóng mà không có độ trễ sẽ thuận tiện hơn.

#### HTML

Đánh dấu bao gồm ba phần tử `<button>` được bọc trong đoạn văn có class `container`, và một đoạn văn khác được chuyển thành popover bằng thuộc tính `popover`. Cả ba button đều được thiết lập là interest invoker và tham chiếu đến popover làm đích bằng thuộc tính `interestfor`.

```html live-sample___interest-delay-remove-on-interest
<p class="container">
  <button interestfor="mypopover">Button 1</button>
  <button interestfor="mypopover">Button 2</button>
  <button interestfor="mypopover">Button 3</button>
</p>
<p id="mypopover" popover>Hover tooltip</p>
```

#### CSS

Trong CSS, chúng ta áp dụng giá trị `interest-delay-start` là `1s` cho các button, sau đó đặt vị trí popover bên dưới button nào đang được thể hiện quan tâm bằng cách gán giá trị {{cssxref("position-area")}} là `bottom` (xem [Popover anchoring positioning](/en-US/docs/Web/API/Popover_API/Using#popover_anchor_positioning) để biết thêm thông tin).

```css live-sample___interest-delay-remove-on-interest
button {
  interest-delay-start: 1s;
}

#mypopover {
  position-area: bottom;
}
```

Cuối cùng, chúng ta kết hợp pseudo-class {{cssxref(":interest-source")}} với pseudo-class {{cssxref(":has()")}} để áp dụng `interest-delay-start: 0s` cho tất cả button bên trong đoạn văn, nhưng chỉ khi đoạn văn chứa một button mà quan tâm đã được thể hiện (tức là, được khớp bởi `button:interest-source`).

```css live-sample___interest-delay-remove-on-interest
.container:has(button:interest-source) button {
  interest-delay-start: 0s;
}
```

#### Kết quả

Kết quả hiển thị như sau:

{{embedlivesample("interest-delay-remove-on-interest", "100%", "100")}}

Hãy thử thể hiện quan tâm đến bất kỳ button nào và chú ý rằng khi bạn ngay lập tức thể hiện quan tâm đến button khác, popover xuất hiện mà không có độ trễ. Nếu bạn ngừng thể hiện quan tâm đến các button và bắt đầu lại, độ trễ ban đầu sẽ trở lại.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("interest-delay-end")}}, {{cssxref("interest-delay")}}
- [Popover API](/en-US/docs/Web/API/Popover_API)
- [Using interest invokers](/en-US/docs/Web/API/Popover_API/Using_interest_invokers)
- [CSS basic user interface](/en-US/docs/Web/CSS/Guides/Basic_user_interface) module
