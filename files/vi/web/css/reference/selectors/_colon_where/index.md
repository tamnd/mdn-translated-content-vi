---
title: :where()
slug: Web/CSS/Reference/Selectors/:where
page-type: css-pseudo-class
browser-compat: css.selectors.where
sidebar: cssref
---

Hàm lớp giả **`:where()`** trong [CSS](/en-US/docs/Web/CSS) nhận một danh sách bộ chọn làm đối số và chọn bất kỳ phần tử nào có thể được chọn bởi một trong các bộ chọn trong danh sách đó.

Sự khác biệt giữa `:where()` và {{cssxref(":is()")}} là `:where()` luôn có [độ ưu tiên](/en-US/docs/Web/CSS/Guides/Cascade/Specificity) là 0, trong khi `:is()` lấy độ ưu tiên của bộ chọn cụ thể nhất trong các đối số của nó.

{{InteractiveExample("CSS Demo: :where", "tabbed-shorter")}}

```css interactive-example
ol {
  list-style-type: upper-alpha;
  color: darkblue;
}

/* Not applied to ol, because of lower specificity */
:where(ol, ul, menu:unsupported) :where(ol, ul) {
  color: green;
}

:where(ol, ul) :where(ol, ul) ol {
  list-style-type: lower-greek;
  color: chocolate;
}
```

```html interactive-example
<ol>
  <li>Saturn</li>
  <li>
    <ul>
      <li>Mimas</li>
      <li>Enceladus</li>
      <li>
        <ol>
          <li>Voyager</li>
          <li>Cassini</li>
        </ol>
      </li>
      <li>Tethys</li>
    </ul>
  </li>
  <li>Uranus</li>
  <li>
    <ol>
      <li>Titania</li>
      <li>Oberon</li>
    </ol>
  </li>
</ol>
```

## Cú pháp

```css-nolint
:where(<complex-selector-list>) {
  /* ... */
}
```

### Tham số

Lớp giả `:where()` yêu cầu một [danh sách bộ chọn](/en-US/docs/Web/CSS/Guides/Selectors/Selector_structure#selector_list), tức là danh sách được phân tách bằng dấu phẩy gồm một hoặc nhiều bộ chọn, làm đối số. Danh sách không được chứa [phần tử giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements), nhưng bất kỳ bộ chọn đơn giản, ghép, và phức tạp nào khác đều được phép.

### Phân tích bộ chọn linh hoạt

Đặc tả định nghĩa `:is()` và `:where()` chấp nhận một [danh sách bộ chọn linh hoạt](/en-US/docs/Web/CSS/Reference/Selectors/Selector_list#forgiving_selector_list).

Trong CSS, khi sử dụng danh sách bộ chọn, nếu bất kỳ bộ chọn nào không hợp lệ thì toàn bộ danh sách được coi là không hợp lệ. Khi sử dụng `:is()` hoặc `:where()`, thay vì toàn bộ danh sách bị coi là không hợp lệ nếu một bộ chọn không phân tích được, bộ chọn không đúng hoặc không được hỗ trợ sẽ bị bỏ qua và các bộ chọn còn lại được sử dụng.

```css
:where(:valid, :unsupported) {
  /* … */
}
```

Vẫn phân tích đúng và khớp `:valid` ngay cả trong các trình duyệt không hỗ trợ `:unsupported`, trong khi:

```css
:valid,
:unsupported {
  /* … */
}
```

Sẽ bị bỏ qua trong các trình duyệt không hỗ trợ `:unsupported` dù họ hỗ trợ `:valid`.

## Ví dụ

### So sánh :where() và :is()

Ví dụ này cho thấy cách `:where()` hoạt động và minh họa sự khác biệt giữa `:where()` và `:is()`.

Lấy HTML sau:

```html
<article>
  <h2>:is()-styled links</h2>
  <section class="is-styling">
    <p>
      Here is my main content. This
      <a href="https://mozilla.org">contains a link</a>.
    </p>
  </section>

  <aside class="is-styling">
    <p>
      Here is my aside content. This
      <a href="https://developer.mozilla.org">also contains a link</a>.
    </p>
  </aside>

  <footer class="is-styling">
    <p>
      This is my footer, also containing
      <a href="https://github.com/mdn">a link</a>.
    </p>
  </footer>
</article>

<article>
  <h2>:where()-styled links</h2>
  <section class="where-styling">
    <p>
      Here is my main content. This
      <a href="https://mozilla.org">contains a link</a>.
    </p>
  </section>

  <aside class="where-styling">
    <p>
      Here is my aside content. This
      <a href="https://developer.mozilla.org">also contains a link</a>.
    </p>
  </aside>

  <footer class="where-styling">
    <p>
      This is my footer, also containing
      <a href="https://github.com/mdn">a link</a>.
    </p>
  </footer>
</article>
```

Trong ví dụ có phần cố ý này, chúng ta có hai bài viết mỗi bài chứa một section, một aside, và một footer. Chúng khác nhau ở các class dùng để đánh dấu các phần tử con.

Để gom nhóm việc chọn các liên kết trong khi vẫn giữ riêng biệt kiểu `is-styling` và `where-styling`, chúng ta _có thể_ dùng `:is()` hoặc `:where()` theo cách sau:

```css
html {
  font-family: sans-serif;
  font-size: 150%;
}

:is(section.is-styling, aside.is-styling, footer.is-styling) a {
  color: red;
}

:where(section.where-styling, aside.where-styling, footer.where-styling) a {
  color: orange;
}
```

Tuy nhiên, nếu sau này chúng ta muốn ghi đè màu sắc của các liên kết trong footer bằng bộ chọn ghép gồm các bộ chọn kiểu có độ ưu tiên thấp?

```css
footer a {
  color: blue;
}
```

Điều này sẽ không hoạt động với các liên kết đỏ vì các bộ chọn bên trong `:is()` đóng góp vào độ ưu tiên của bộ chọn tổng thể, và bộ chọn class có độ ưu tiên cao hơn bộ chọn phần tử.

Tuy nhiên, các bộ chọn bên trong `:where()` có độ ưu tiên là 0, nên liên kết footer màu cam sẽ bị ghi đè bởi bộ chọn ghép chỉ gồm kiểu phần tử.

> [!NOTE]
> Bạn cũng có thể tìm thấy ví dụ này trên GitHub; xem [is-where](https://mdn.github.io/css-examples/is-where/).

{{EmbedLiveSample('Examples', '100%', 600)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref(":is()")}}
- [Danh sách bộ chọn](/en-US/docs/Web/CSS/Reference/Selectors/Selector_list)
- [Web components](/en-US/docs/Web/API/Web_components)
- [Danh sách bộ chọn linh hoạt](https://drafts.csswg.org/selectors-4/#typedef-forgiving-selector-list) qua csswg.org.
