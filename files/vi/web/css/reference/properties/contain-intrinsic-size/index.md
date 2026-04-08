---
title: contain-intrinsic-size
slug: Web/CSS/Reference/Properties/contain-intrinsic-size
page-type: css-shorthand-property
browser-compat: css.properties.contain-intrinsic-size
sidebar: cssref
---

[Thuộc tính viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) CSS **`contain-intrinsic-size`** đặt kích thước của một phần tử mà trình duyệt sẽ dùng cho bố cục khi phần tử đó bị ràng buộc bởi [size containment](/en-US/docs/Web/CSS/Guides/Containment/Using#size_containment).

## Thuộc tính thành phần

Thuộc tính này là viết tắt của các thuộc tính CSS sau:

- {{cssxref("contain-intrinsic-width")}}
- {{cssxref("contain-intrinsic-height")}}

## Cú pháp

```css
/* Giá trị từ khóa */
contain-intrinsic-size: none;

/* Giá trị <length> */
contain-intrinsic-size: 1000px;
contain-intrinsic-size: 10rem;

/* chiều rộng | chiều cao */
contain-intrinsic-size: 1000px 1.5em;

/* auto <length> */
contain-intrinsic-size: auto 300px;
contain-intrinsic-size: auto none;

/* auto chiều rộng | auto chiều cao */
contain-intrinsic-size: auto 300px auto 4rem;

/* Giá trị toàn cục */
contain-intrinsic-size: inherit;
contain-intrinsic-size: initial;
contain-intrinsic-size: revert;
contain-intrinsic-size: revert-layer;
contain-intrinsic-size: unset;
```

### Giá trị

Các giá trị sau có thể được chỉ định cho thuộc tính `contain-intrinsic-size`:

- `none`
  - : Phần tử không có kích thước nội tại theo (các) chiều đã cho.
- `<length>`
  - : Phần tử có {{cssxref("&lt;length&gt;")}} được chỉ định theo (các) chiều đã cho.
- `auto [<length> | none]`
  - : Giá trị được ghi nhớ của kích thước phần tử được "hiển thị bình thường" nếu tồn tại và phần tử đang bỏ qua nội dung của nó (ví dụ, khi nó nằm ngoài màn hình); ngược lại là `<length>` được chỉ định.
    Từ khóa `none` có thể được dùng thay cho `<length>` khi độ dài cố định `0px` hoạt động khác với `none` (chẳng hạn trong bố cục multi-column hay grid).

Nếu một giá trị được cung cấp dưới dạng từ khóa, độ dài hoặc cặp `auto [<length> | none]`, nó áp dụng cho cả chiều rộng và chiều cao.

Có thể chỉ định hai giá trị độ dài, áp dụng cho chiều rộng và chiều cao theo thứ tự đó.
Nếu hai cặp `auto [<length> | none]` được chỉ định, cặp đầu tiên áp dụng cho chiều rộng, cặp thứ hai cho chiều cao.

## Mô tả

Thuộc tính này thường được áp dụng cùng với các phần tử có thể kích hoạt size containment, chẳng hạn như [`contain: size`](/en-US/docs/Web/CSS/Reference/Properties/contain) và {{cssxref("content-visibility")}}.

Size containment cho phép user agent bố cục một phần tử như thể nó có kích thước cố định, ngăn các reflow không cần thiết bằng cách tránh re-render các phần tử con để xác định kích thước thực tế (từ đó cải thiện trải nghiệm người dùng).
Theo mặc định, size containment xử lý các phần tử như thể chúng không có nội dung, và có thể thu gọn bố cục giống như khi nội dung không có chiều rộng hay chiều cao.
Thuộc tính `contain-intrinsic-size` cho phép tác giả chỉ định một giá trị phù hợp để dùng làm kích thước cho bố cục.

Giá trị `auto <length>` cho phép kích thước của phần tử được lưu trữ nếu phần tử đó từng được "hiển thị bình thường" (với các phần tử con của nó), sau đó được dùng thay vì độ dài được chỉ định khi phần tử đang bỏ qua nội dung.
Điều này cho phép các phần tử ngoài màn hình với [`content-visibility: auto`](/en-US/docs/Web/CSS/Reference/Properties/content-visibility) hưởng lợi từ size containment mà không cần nhà phát triển ước tính chính xác kích thước phần tử.
Giá trị được ghi nhớ không được sử dụng nếu các phần tử con đang được hiển thị (nếu size containment được bật, `<length>` sẽ được sử dụng).

Trong các bố cục grid và multi-column, kích thước tường minh được xử lý khác với chiều cao dựa trên nội dung ngầm định.
Các phần tử có thể bố cục rất khác so với khi chỉ đơn giản là điền nội dung lên đến chiều cao đó.
Giá trị `auto none` cho phép phần tử fallback về `contain-intrinsic-size: none` nếu không có giá trị được ghi nhớ, điều này sẽ cho phép phần tử được bố cục như thể nó không có nội dung. Điều này hầu như luôn được ưu tiên hơn đặt 0px làm kích thước nội tại trong các bố cục grid và multi-column, nơi các phần tử được chứa có thể tràn ra ngoài phần tử cha và có thể dẫn đến bố cục trang không mong muốn.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Sử dụng cặp giá trị auto cho kích thước nội tại

Ví dụ này minh họa `contain-intrinsic-size: auto <length>` và `contain-intrinsic-size: auto none`, sử dụng bố cục với nhiều phần tử hiển thị theo chiều dọc có cả ước tính kích thước nội tại chính xác và không chính xác.
Sử dụng `content-visibility: auto` bỏ qua việc hiển thị các phần tử khi chúng nằm ngoài màn hình, vì vậy thuộc tính này là ứng cử viên tốt để kết hợp với `contain-intrinsic-size` để cải thiện hiệu năng hiển thị và giảm thiểu [reflow](/en-US/docs/Glossary/Reflow).

Cặp giá trị `contain-intrinsic-size: auto 500px` báo cho trình duyệt dùng 500px làm kích thước 'placeholder' (chiều rộng và chiều cao) cho phần tử khi nó nằm ngoài màn hình và trang đang được bố cục.
Khi người dùng cuộn đến phần tử và nó cần được hiển thị, trình duyệt sẽ tính toán kích thước thực tế của phần tử và nội dung của nó.
Nếu có sự khác biệt giữa kích thước placeholder và kích thước tính toán, điều này có thể buộc một bố cục mới, cùng với các thay đổi về vị trí thanh cuộn bên.

Sau khi trình duyệt có thông tin kích thước thực tế cho phần tử, nó sẽ ghi nhớ kích thước này khi phần tử cuộn ra ngoài màn hình lần nữa, và sử dụng kích thước được ghi nhớ cho các tính toán bố cục thay vì giá trị placeholder.
Lợi ích là trình duyệt không cần liên tục hiển thị nội dung phần tử để tính toán kích thước và đặc biệt hữu ích khi nội dung phức tạp hoặc phụ thuộc vào tài nguyên mạng hay JavaScript.

#### HTML

```html
<div id="container">
  <div id="auto-length-note">
    <p>
      Your browser does not support
      <code>contain-intrinsic-size: auto &lt;length&gt;</code>.
    </p>
  </div>
  <div class="auto-length">
    <p>Item one</p>
  </div>
  <div class="auto-length">
    <p>Item two</p>
  </div>
  <div class="auto-length large-intrinsic-size">
    <p class="small">Item three</p>
  </div>
  <div class="auto-length large-intrinsic-size">
    <p class="small">Item four</p>
  </div>
  <div id="auto-none-note">
    <p>
      Your browser does not support
      <code>contain-intrinsic-size: auto none</code>.
    </p>
  </div>
  <div class="auto-length none">
    <p>Item five</p>
  </div>
  <div class="auto-length none">
    <p>Item six</p>
  </div>
</div>
```

#### CSS

```css hidden
div,
p {
  padding: 1rem;
  margin-bottom: 1rem;
  font-size: 2rem;
  font-family: sans-serif;
}

code {
  background-color: lightgray;
  padding: 0.25rem;
  border-radius: 0.25rem;
}

#container {
  width: 90%;
  height: 80%;
}

.auto-length,
.auto-length.none {
  display: none;
}

#auto-length-note,
#auto-none-note {
  display: block;
  padding: 0;
}

#auto-length-note p,
#auto-none-note p {
  padding: 0.5rem;
  width: 100%;
  height: max-content;
  font-size: 1rem;
  line-height: 1.5rem;
  background-color: tomato;
}

@supports (contain-intrinsic-size: auto none) {
  .auto-length.none {
    display: block;
  }
  #auto-none-note {
    display: none;
  }
}
@supports (contain-intrinsic-size: auto 500px) {
  .auto-length {
    display: block;
  }
  #auto-length-note {
    display: none;
  }
}
```

```css
p {
  height: 500px;
  width: 500px;
  border: 4px dotted;
  background: lightblue;
}

.auto-length {
  content-visibility: auto;
  contain-intrinsic-size: auto 500px;
  background-color: linen;
  outline: 4px dotted blue;
}

.large-intrinsic-size {
  /* Setting an inaccurate intrinsic size for the element */
  contain-intrinsic-size: auto 5000px;
  background-color: lightgray;
  outline: 4px dotted red;
}

.small {
  /* This element is a lot smaller than expected */
  height: 100px;
  width: 100px;
}

.none {
  background-color: papayawhip;
  contain-intrinsic-size: auto none;
  outline: 4px dotted red;
}
```

#### Kết quả

- Hai hộp đầu tiên có kích thước nội tại khớp với kích thước thực tế, vì vậy khi chúng xuất hiện trong tầm nhìn, bố cục được tính toán lại nhưng chúng ta không thấy thay đổi trong thanh cuộn hay vị trí cuộn.

- Hộp thứ ba và thứ tư có kích thước nội tại rất lớn, vì vậy bố cục ban đầu mà trình duyệt tính toán quá lớn, và chúng ta đã làm cho các hộp này nhỏ hơn để rõ ràng khi bạn đến điểm buộc thay đổi bố cục đột ngột.

  Khi hộp thứ ba và thứ tư cuộn vào tầm nhìn, kích thước được tính toán lại, làm cho hộp và phần tử cha của nó nhỏ hơn.
  Hiệu ứng là thanh cuộn nhảy xuống trang (chúng ta đã cuộn xa hơn qua hộp so với ước tính) và thanh cuộn dài hơn, vì toàn bộ trang ngắn hơn ước tính.

- Các hộp cuối cùng có `auto none`, vì vậy chúng có kích thước ước tính bằng không.
  Khi chúng cuộn vào tầm nhìn, kích thước của phần tử và phần tử cha được tính toán lại để lớn hơn nhiều, vì vậy thanh cuộn giảm kích thước và di chuyển lên trên thanh.

Sau khi cuộn hết xuống dưới, bạn có thể cuộn lên xuống trơn tru, vì sử dụng `content-visibility: auto` lưu kích thước hiển thị thực tế của phần tử cho lần tiếp theo nó được hiển thị.

{{EmbedLiveSample('Using_auto_value_pairs_for_intrinsic_size', 800, 400)}}

### Đặt kích thước nội tại

Ví dụ này cung cấp các danh sách chọn có thể dùng để thay đổi `contain-intrinsic-size`, `content-visibility` và `contain` trên một phần tử nhằm quan sát hiệu ứng của các cài đặt khác nhau.

#### CSS

```css
#contained_element {
  border: 2px solid green;
  width: 120px;
}
.child_element {
  border: 1px solid red;
  background: blue;
  height: 50px;
  width: 150px;
}
```

#### JavaScript

Đoạn mã bên dưới thêm và xóa style cho phần tử chứa dựa trên các tùy chọn được chọn.

```js
const containedElement = document.querySelector("#contained_element");
const intrinsicSizeSelector = document.querySelector(
  "#contain_intrinsic_size_selector",
);
const containSelector = document.querySelector("#contain_selector");
const contentVisibilitySelector = document.querySelector(
  "#content_visibility_selector",
);

containedElement.style["contain-intrinsic-size"] =
  intrinsicSizeSelector.options[intrinsicSizeSelector.selectedIndex].text;
containedElement.style["contain"] =
  containSelector.options[containSelector.selectedIndex].text;
containedElement.style["content-visibility"] =
  contentVisibilitySelector.options[
    contentVisibilitySelector.selectedIndex
  ].text;

intrinsicSizeSelector.addEventListener("change", () => {
  containedElement.style["contain-intrinsic-size"] =
    intrinsicSizeSelector.options[intrinsicSizeSelector.selectedIndex].text;
});

containSelector.addEventListener("change", () => {
  containedElement.style["contain"] =
    containSelector.options[containSelector.selectedIndex].text;
});

contentVisibilitySelector.addEventListener("change", () => {
  containedElement.style["content-visibility"] =
    contentVisibilitySelector.options[
      contentVisibilitySelector.selectedIndex
    ].text;
});
```

#### HTML

HTML định nghĩa hai nút, một phần tử vùng chứa bị ràng buộc thông qua thuộc tính `content-visibility`.

```html
<p>
  <label for="contain_intrinsic_size_selector">contain-intrinsic-size:</label>
  <select id="contain_intrinsic_size_selector">
    <option>none</option>
    <option>40px 130px</option>
    <option>auto 40px auto 130px</option></select
  >;<br />

  <label for="contain_selector">contain:</label>
  <select id="contain_selector">
    <option>none</option>
    <option>size</option>
    <option>strict</option></select
  >;<br />

  <label for="content_visibility_selector">content-visibility:</label>
  <select id="content_visibility_selector">
    <option>visible</option>
    <option>auto</option>
    <option>hidden</option></select
  >;
</p>

<div id="contained_element">
  <div class="child_element"></div>
</div>
```

#### Kết quả

Dùng các bộ chọn để áp dụng style đã cho cho phần tử `div` chứa.
Lưu ý rằng khi `content-visibility` là `visible` hoặc `auto`, việc thay đổi `contain-intrinsic-size` không tạo ra sự khác biệt.
Tuy nhiên nếu nội dung bị ẩn, việc có `contain-intrinsic-size` là `none` sẽ thu gọn phần tử cha như thể phần tử con không có kích thước.

{{EmbedLiveSample('Setting the intrinsic size', '100%', 170)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("contain-intrinsic-block-size")}}
- {{CSSxRef("contain-intrinsic-inline-size")}}
- [Sử dụng CSS containment](/en-US/docs/Web/CSS/Guides/Containment/Using)
- Mô-đun [CSS containment](/en-US/docs/Web/CSS/Guides/Containment)
- [`content-visibility`: the new CSS property that boosts your rendering performance](https://web.dev/articles/content-visibility) via web.dev (2020)
