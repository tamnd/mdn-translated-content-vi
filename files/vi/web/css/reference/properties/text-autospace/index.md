---
title: text-autospace
slug: Web/CSS/Reference/Properties/text-autospace
page-type: css-property
browser-compat: css.properties.text-autospace
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`text-autospace`** cho phép bạn chỉ định khoảng cách được áp dụng giữa các ký tự Trung/Nhật/Hàn (CJK) và các ký tự không phải CJK.

## Cú pháp

```css
text-autospace: normal;
text-autospace: no-autospace;
text-autospace: ideograph-alpha;
text-autospace: ideograph-numeric;
text-autospace: punctuation;
text-autospace: insert;
text-autospace: replace;
text-autospace: ideograph-alpha ideograph-numeric punctuation;
text-autospace: ideograph-alpha ideograph-numeric;
text-autospace: ideograph-alpha ideograph-numeric insert;
text-autospace: auto;

/* Giá trị toàn cục */
text-autospace: inherit;
text-autospace: initial;
text-autospace: revert;
text-autospace: revert-layer;
text-autospace: unset;
```

### Giá trị

- `normal`
  - : Tạo ra hành vi mặc định là tự động áp dụng khoảng cách giữa các ký tự CJK và không phải CJK, và xung quanh dấu câu. Giá trị này có tác dụng tương đương với việc áp dụng cả [`ideograph-alpha`](#ideograph-alpha) và [`ideograph-numeric`](#ideograph-numeric).
- `<autospace>`
  - : Cung cấp nhiều quyền kiểm soát hơn đối với hành vi khoảng cách. Nhận từ khóa `no-autospace`, hoặc kết hợp một hoặc nhiều giá trị `ideograph-alpha`, `ideograph-numeric` và `punctuation`, tùy chọn theo sau là `insert` hoặc `replace`.
    - `no-autospace`
      - : Tắt khoảng cách tự động giữa các ký tự CJK và không phải CJK.
    - `ideograph-alpha`
      - : Chỉ thêm khoảng cách giữa các ký tự chữ tượng hình (như Katakana và chữ Hán) và các chữ cái không phải chữ tượng hình (như Latin). Không thêm khoảng cách giữa ký tự chữ tượng hình và số không phải chữ tượng hình.
    - `ideograph-numeric`
      - : Chỉ thêm khoảng cách giữa các ký tự chữ tượng hình (như Katakana và chữ Hán) và các số không phải chữ tượng hình (như Latin). Không thêm khoảng cách giữa ký tự chữ tượng hình và chữ cái không phải chữ tượng hình.
    - `punctuation`
      - : Thêm khoảng cách không ngắt xung quanh dấu câu theo yêu cầu của quy ước chữ nghĩa riêng của từng ngôn ngữ.
    - `insert`
      - : Chỉ thêm khoảng cách được chỉ định nếu không có khoảng trắng hiện có giữa các chữ viết chữ tượng hình và không phải chữ tượng hình.
    - `replace`
      - : Thay thế khoảng trắng hiện có (chẳng hạn [U+0020](/en-US/docs/Glossary/Whitespace)) giữa các ký tự chữ tượng hình và không phải chữ tượng hình bằng khoảng cách được chỉ định.
- `auto`
  - : Để trình duyệt chọn khoảng cách phù hợp về mặt chữ nghĩa. Khoảng cách có thể khác nhau giữa các trình duyệt và nền tảng.

> [!NOTE]
> Nếu không chỉ định `insert` hoặc `replace`, hành vi sẽ giống như `insert`.

> [!NOTE]
> Thuộc tính này có tính cộng dồn với các thuộc tính {{CSSXRef("word-spacing")}} và {{CSSXRef("letter-spacing")}}. Lượng khoảng cách được đóng góp bởi cài đặt `letter-spacing` sẽ được cộng thêm vào khoảng cách tạo ra bởi `text-autospace`. Tương tự với `word-spacing`.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

Ví dụ này hiển thị sự khác biệt giữa các giá trị khác nhau của `text-autospace`. Hãy thử chọn một giá trị từ hộp thả xuống để xem nó ảnh hưởng đến khoảng cách trong văn bản như thế nào.

```html hidden
<form>
  <label for="autospace">Choose value for <code>text-autospace:</code></label>
  <select name="autospace" id="autospace">
    <option selected value="no-autospace">no-autospace</option>
    <option value="normal">normal</option>
    <option value="ideograph-alpha">ideograph-alpha</option>
    <option value="ideograph-numeric">ideograph-numeric</option>
  </select>
</form>
<div class="unsupported">
  <code>text-autospace</code> is not supported in your browser.
</div>
```

```html
<main>
  <figure class="no-autospace">
    <figcaption>
      <code>
        text-autospace: <span id="autospace-value">no-autospace</span>;
      </code>
    </figcaption>
    <div>
      <p>HTML超文本标记语言</p>
      <p>42四十二</p>
    </div>
  </figure>
</main>
```

```css
.no-autospace {
  text-autospace: no-autospace;
}
.auto {
  text-autospace: auto;
}
.normal {
  text-autospace: normal;
}
.ideograph-alpha {
  text-autospace: ideograph-alpha;
}
.ideograph-numeric {
  text-autospace: ideograph-numeric;
}
```

```css hidden
figure {
  margin: 1rem;
  div {
    font-size: 2rem;
    padding: 1rem;
    font-family: sans-serif;
    border: tomato solid 1px;
  }
  p {
    margin: 0;
  }
}
main {
  max-width: max-content;
}
@supports not (text-autospace: normal) {
  form {
    display: none;
  }
  .unsupported {
    color: red;
  }
}
@supports (text-autospace: normal) {
  .unsupported {
    display: none;
  }
}
```

```js hidden
const chose = document.querySelector("#autospace");
const fig = document.querySelector("figure");
const codeValue = document.querySelector("#autospace-value");
chose.addEventListener("change", (e) => {
  fig.className = e.target.value;
  codeValue.innerText = e.target.value;
});
```

{{EmbedLiveSample("Example", 200, 200)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref('text-spacing-trim')}}
- Đơn vị [`ic`](/en-US/docs/Web/CSS/Guides/Values_and_units/Numeric_data_types#local_font-relative_lengths) và [`ric`](/en-US/docs/Web/CSS/Guides/Values_and_units/Numeric_data_types#root_font-relative_lengths)
- Mô-đun [CSS Text](/en-US/docs/Web/CSS/Guides/Text)
