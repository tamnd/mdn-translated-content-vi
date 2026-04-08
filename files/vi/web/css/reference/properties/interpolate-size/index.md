---
title: interpolate-size
slug: Web/CSS/Reference/Properties/interpolate-size
page-type: css-property
status:
  - experimental
browser-compat: css.properties.interpolate-size
sidebar: cssref
---

{{seecompattable}}

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`interpolate-size`** cho phép bạn bật [hoạt hình](/en-US/docs/Web/CSS/Guides/Animations) và [chuyển tiếp](/en-US/docs/Web/CSS/Guides/Transitions) giữa giá trị {{cssxref("&lt;length-percentage&gt;")}} và {{glossary("intrinsic size")}}, {{cssxref("fit-content")}}, hoặc {{cssxref("max-content")}}.

Thuộc tính này thường được dùng để tạo hoạt hình cho {{cssxref("width")}} và/hoặc {{cssxref("height")}} của một container giữa `<length-percentage>` và kích thước đầy đủ của nội dung (tức là giữa trạng thái "đóng" và "mở" hay "ẩn" và "hiện") khi tạo hoạt hình cho thuộc tính CSS không phải box-model như {{cssxref("transform")}} không phải là giải pháp khả thi.

> [!NOTE]
> Hành vi được chọn bởi `interpolate-size` không thể được bật mặc định trên toàn web vì nhiều trang web sử dụng stylesheet giả định rằng các giá trị kích thước nội tại không thể được tạo hoạt hình. Việc bật mặc định sẽ gây ra một số vấn đề về tương thích ngược (xem [thảo luận CSS WG](https://github.com/w3c/csswg-drafts/issues/626#issuecomment-2071016522) liên quan).

## Cú pháp

```css
/* Giá trị từ khóa */
interpolate-size: allow-keywords;
interpolate-size: numeric-only;

/* Giá trị toàn cục */
interpolate-size: inherit;
interpolate-size: initial;
interpolate-size: revert;
interpolate-size: revert-layer;
interpolate-size: unset;
```

### Giá trị

- `allow-keywords`
  - : Bật [nội suy](/en-US/docs/Glossary/Interpolation) giữa giá trị {{cssxref("length-percentage")}} và giá trị kích thước nội tại, để cho phép tạo hoạt hình giữa hai giá trị.
- `numeric-only`
  - : Hành vi mặc định — các giá trị kích thước nội tại không thể được nội suy.

## Mô tả

Đặt `interpolate-size: allow-keywords` bật nội suy giữa giá trị {{cssxref("length-percentage")}} và giá trị kích thước nội tại. Lưu ý rằng nó không bật tạo hoạt hình giữa hai giá trị kích thước nội tại. Một đầu của hoạt hình phải là `<length-percentage>`.

Giá trị `interpolate-size` được kế thừa, vì vậy việc tạo hoạt hình đến (hoặc từ) giá trị kích thước nội tại có thể được bật cho toàn bộ tài liệu bằng cách đặt nó trên root của tài liệu:

```css
:root {
  interpolate-size: allow-keywords;
}
```

Nếu bạn muốn giới hạn phạm vi, bạn có thể đặt nó trên phần tử container liên quan. Ví dụ sau chỉ bật nội suy kích thước nội tại cho {{htmlelement("main")}} và các phần tử con của nó:

```css
main {
  interpolate-size: allow-keywords;
}
```

> [!NOTE]
> Giá trị trả về của hàm {{cssxref("calc-size()")}} cũng có thể được nội suy. Thực tế, việc bao gồm `calc-size()` trong giá trị thuộc tính tự động áp dụng `interpolate-size: allow-keywords` cho lựa chọn. Tuy nhiên, vì `interpolate-size` được kế thừa như đã giải thích ở trên, nó là giải pháp ưu tiên để bật hoạt hình kích thước nội tại trong hầu hết các trường hợp. Bạn chỉ nên dùng `calc-size()` để bật hoạt hình kích thước nội tại nếu chúng cũng cần tính toán.

### Các giá trị có thể được nội suy

Các giá trị nội tại sau đây hiện có thể được chọn vào hoạt hình:

- `auto`
- {{cssxref("min-content")}}
- {{cssxref("max-content")}}
- {{cssxref("fit-content")}}
- `content` (dành cho các container được định kích thước bằng {{cssxref("flex-basis")}}).

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Sử dụng `interpolate-size` cơ bản

Ví dụ này minh họa cách đặt `interpolate-size: allow-keywords` trên tài liệu để bật hoạt hình liên quan đến kích thước nội tại. Demo có một badge nhân vật/"thẻ tên", có thể hover hoặc focus để hiển thị thông tin về nhân vật. Việc hiển thị được xử lý bởi chuyển tiếp {{cssxref("height")}} giữa một độ dài cố định và `max-content`.

#### HTML

HTML chứa một phần tử {{htmlelement("section")}} với [`tabindex="0"`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex) được đặt trên nó để nó có thể nhận focus từ bàn phím. `<section>` chứa các phần tử {{htmlelement("header")}} và {{htmlelement("main")}}, mỗi phần tử có nội dung con riêng.

```html
<section tabindex="0">
  <header>
    <h2>Tanuki</h2>
  </header>
  <main>
    <p>Tanuki is the silent phantom of MDN.</p>
    <ul>
      <li><strong>Height</strong>: 3.03m</li>
      <li><strong>Weight</strong>: 160kg</li>
      <li><strong>Tech Fu</strong>: 7</li>
      <li><strong>Bad Jokes</strong>: 9</li>
    </ul>
  </main>
</section>
```

#### CSS

```css hidden
* {
  box-sizing: border-box;
}

section {
  font-family: "Helvetica", "Arial", sans-serif;
  width: 175px;
  border-radius: 5px;
  background: #eeeeee;
  box-shadow:
    inset 1px 1px 4px rgb(255 255 255 / 0.5),
    inset -1px -1px 4px rgb(0 0 0 / 0.5);
}

header {
  padding: 0.7rem;
  border-bottom: 2px solid #cccccc;
}

main {
  padding: 10px;
}

h2 {
  margin: 0;
  font-weight: normal;
  font-size: 1.1rem;
  text-align: center;
  letter-spacing: 1px;
}

p,
li {
  font-size: 0.8rem;
  line-height: 1.5;
}

p {
  margin-top: 0;
}
```

Trong CSS, trước tiên chúng ta đặt `interpolate-size: allow-keywords` trên {{cssxref(":root")}}, để bật nó cho toàn bộ tài liệu.

```css
:root {
  interpolate-size: allow-keywords;
}
```

Sau đó chúng ta đặt {{cssxref("height")}} của `<section>` thành `2.5rem` và {{cssxref("overflow")}} thành `hidden` để chỉ hiển thị `<header>` theo mặc định, sau đó chỉ định `transition` tạo hoạt hình cho `height` của `<section>` trong 1 giây khi trạng thái thay đổi. Cuối cùng, chúng ta đặt `height` của `<section>` trên {{cssxref(":hover")}} và {{cssxref(":focus")}} thành `max-content`.

```css
section {
  height: 2.5rem;
  overflow: hidden;
  transition: height ease 1s;
}

section:hover,
section:focus {
  height: max-content;
}
```

Phần còn lại của CSS đã bị ẩn để ngắn gọn.

#### Kết quả

Hãy thử hover qua `<section>` hoặc focus vào nó qua bàn phím — nó sẽ tạo hoạt hình đến chiều cao đầy đủ, hiển thị toàn bộ nội dung.

{{ EmbedLiveSample('Basic `interpolate-size` usage', '100%', '225') }}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("calc-size()")}}
- [Animate to height: auto; (and other intrinsic sizing keywords) in CSS](https://developer.chrome.com/docs/css-ui/animate-to-height-auto) trên developer.chrome.com (2024)
