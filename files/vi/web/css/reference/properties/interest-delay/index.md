---
title: interest-delay
slug: Web/CSS/Reference/Properties/interest-delay
page-type: css-shorthand-property
status:
  - experimental
browser-compat: css.properties.interest-delay
sidebar: cssref
---

{{SeeCompatTable}}

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`interest-delay`** chỉ định độ trễ giữa thời điểm người dùng thể hiện sự quan tâm đến phần tử [interest invoker](/en-US/docs/Web/API/Popover_API/Using_interest_invokers) và sự kiện {{domxref("HTMLElement.interest_event", "interest")}} được kích hoạt, cũng như độ trễ giữa thời điểm người dùng mất quan tâm và sự kiện {{domxref("HTMLElement.loseinterest_event", "loseinterest")}} được kích hoạt.

## Các thuộc tính thành phần

Thuộc tính `interest-delay` là dạng viết tắt của các thuộc tính sau:

- {{cssxref("interest-delay-start")}}
- {{cssxref("interest-delay-end")}}

## Cú pháp

```css
/* Giá trị đơn */
interest-delay: normal;
interest-delay: 2s;
interest-delay: 250ms;

/* Hai giá trị */
interest-delay: 1s normal;
interest-delay: 0s 500ms;

/* Giá trị toàn cục */
interest-delay: inherit;
interest-delay: initial;
interest-delay: revert;
interest-delay: revert-layer;
interest-delay: unset;
```

### Giá trị

Thuộc tính `interest-delay` nhận một hoặc hai giá trị. Giá trị đầu tiên thiết lập độ trễ trước khi sự quan tâm được thể hiện (`interest-delay-start`); giá trị thứ hai, nếu được cung cấp, thiết lập độ trễ trước khi sự quan tâm bị mất (`interest-delay-end`). Mỗi giá trị có thể là từ khóa `normal` hoặc giá trị {{cssxref("&lt;time&gt;")}}:

- `normal`
  - : Đặt độ trễ về mặc định của trình duyệt. Đây là giá trị khởi tạo.
- {{cssxref("&lt;time&gt;")}}
  - : Đặt độ trễ thành một khoảng thời gian cụ thể. Giá trị phải dương, nếu không thuộc tính sẽ không hợp lệ.

## Mô tả

Phần tử điều khiển như {{htmlelement("a")}} hoặc {{htmlelement("button")}} có thể được đặt làm [interest invoker](/en-US/docs/Web/API/Popover_API/Using_interest_invokers) bằng cách gán cho nó thuộc tính [`interestfor`](/en-US/docs/Web/HTML/Reference/Elements/a#interestfor). Giá trị của nó phải là `id` của phần tử đích. Khi mối quan hệ này được thiết lập, phần tử đích bị ảnh hưởng khi người dùng "thể hiện sự quan tâm" đến phần tử invoker (ví dụ: bằng cách di chuột hoặc focus vào nó). Trường hợp sử dụng phổ biến là hiển thị popover khi hover hoặc focus. Khi người dùng "mất quan tâm", hiệu ứng dừng lại.

Khi người dùng thể hiện hoặc mất quan tâm, hiệu ứng liên quan không bắt đầu hoặc dừng lại ngay lập tức — trình duyệt thêm một độ trễ ngắn (có thể khác nhau tùy trình duyệt). Điều này ngăn [preview popovers](/en-US/docs/Web/API/Popover_API/Using_interest_invokers#using_interest_invokers_for_creating_preview_popovers), chẳng hạn, xuất hiện ngay lập tức khi người dùng hover qua một liên kết, điều có thể gây khó chịu và phân tâm trên trang có nhiều liên kết.

Thuộc tính `interest-delay` cho phép bạn tùy chỉnh những độ trễ này. Bạn có thể dùng `interest-delay` để chỉ định độ trễ trước khi hiệu ứng quan tâm bắt đầu (được chỉ định bởi thuộc tính {{cssxref("interest-delay-start")}}) và độ trễ trước khi hiệu ứng quan tâm kết thúc (được chỉ định bởi thuộc tính {{cssxref("interest-delay-end")}}) trong một khai báo duy nhất.

Thuộc tính `interest-delay` có thể nhận một hoặc hai giá trị. Các giá trị này có thể là từ khóa `normal`, thiết lập độ trễ mặc định của trình duyệt, hoặc giá trị {{cssxref("&lt;time&gt;")}}, thiết lập độ trễ tùy chỉnh.
Nếu chỉ có một giá trị được chỉ định, nó áp dụng cho cả {{cssxref("interest-delay-start")}} và {{cssxref("interest-delay-end")}}. Nếu có hai giá trị được chỉ định, giá trị đầu tiên thiết lập {{cssxref("interest-delay-start")}} và giá trị thứ hai thiết lập {{cssxref("interest-delay-end")}}.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Tạo hiệu ứng `interest-delay` cơ bản

Trong ví dụ này, chúng ta minh họa cách `interest-delay` ảnh hưởng đến hành vi của interest invoker.

#### HTML

Đánh dấu bao gồm một {{htmlelement("button")}}, một {{htmlelement("p")}}, và một {{htmlelement("input")}} kiểu `checkbox`. Chúng ta chỉ định `<button>` là một interest invoker bằng cách gán cho nó thuộc tính `interestfor` có giá trị khớp với `id` của phần tử `<p>`. Điều này làm cho đoạn văn trở thành phần tử đích. Đoạn văn được chuyển thành popover bằng cách gán thuộc tính [`popover`](/en-US/docs/Web/HTML/Reference/Global_attributes/popover), ban đầu ẩn nó đi.

```html live-sample___interest-invoker-delay
<button interestfor="mypopover">Button</button>
<p id="mypopover" popover>Hover tooltip</p>
<form>
  <input type="checkbox" id="apply-delay" />
  <label for="apply-delay">
    Apply an <code>interest-delay</code> of <code>1s 2s</code>
  </label>
</form>
```

#### CSS

Trong CSS, chúng ta định nghĩa quy tắc `.delay` áp dụng giá trị `interest-delay` là `1s 2s` cho bất kỳ interest invoker nào có class `delay`. Chúng ta sẽ thiết lập class này trên `<button>` khi checkbox được tích bằng JavaScript.

```css live-sample___interest-invoker-delay
.delay {
  interest-delay: 1s 2s;
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

Bây giờ hãy tích checkbox và thử lại các hành động tương tự. Lần này, popover sẽ xuất hiện sau độ trễ `1s` khi quan tâm được thể hiện, và ẩn sau độ trễ `2s` khi quan tâm bị mất.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("interest-delay-start")}}, {{cssxref("interest-delay-end")}}
- [Popover API](/en-US/docs/Web/API/Popover_API)
- [Using interest invokers](/en-US/docs/Web/API/Popover_API/Using_interest_invokers)
- [CSS basic user interface](/en-US/docs/Web/CSS/Guides/Basic_user_interface) module
