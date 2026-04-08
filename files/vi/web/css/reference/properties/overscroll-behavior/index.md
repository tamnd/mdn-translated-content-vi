---
title: overscroll-behavior
slug: Web/CSS/Reference/Properties/overscroll-behavior
page-type: css-shorthand-property
browser-compat: css.properties.overscroll-behavior
sidebar: cssref
---

Thuộc tính [CSS](/vi/docs/Web/CSS) **`overscroll-behavior`** xác định hành vi của trình duyệt khi đến ranh giới của vùng cuộn.

{{InteractiveExample("CSS Demo: overscroll-behavior")}}

```css interactive-example-choice
overscroll-behavior: auto;
```

```css interactive-example-choice
overscroll-behavior: contain;
```

```css interactive-example-choice
overscroll-behavior: none;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="example-container">
    <div class="box">
      This is a scrollable container. Michaelmas term lately over, and the Lord
      Chancellor sitting in Lincoln's Inn Hall. Implacable November weather. As
      much mud in the streets as if the waters had but newly retired from the
      face of the earth.
      <br /><br />
      Lorem Ipsum has been the industry's standard dummy text ever since the
      1500s, when an unknown printer took a galley of type and scrambled it to
      make a type specimen book. It has survived not only five centuries, but
      also the leap into electronic typesetting, remaining essentially
      unchanged.
    </div>
    <div id="example-element">
      This is the inner container. Focus on this container, scroll to the bottom
      and when you reach the bottom keep scrolling.
      <p>
        If you have
        <code class="language-css">overscroll-behavior: auto;</code> selected
        the outer container will start to scroll.
      </p>
      If you have
      <code class="language-css">overscroll-behavior: contain;</code> selected,
      the outer container will not scroll unless you move your cursor out of the
      inner container and try to perform scroll on the outer container.
    </div>
  </div>
</section>
```

```css interactive-example
.example-container {
  width: 35em;
  height: 18em;
  border: medium dotted;
  padding: 0.75em;
  text-align: left;
  overflow: auto;
  display: flex;
}

.box {
  width: 50%;
}

#example-element {
  width: 50%;
  height: 12em;
  border: medium dotted #1b76c4;
  padding: 0.3em;
  margin: 0 0.3em;
  text-align: left;
  overflow: auto;
  overscroll-behavior: contain;
}
```

## Thuộc tính cấu thành

Thuộc tính này là viết tắt cho các thuộc tính CSS sau:

- {{Cssxref("overscroll-behavior-x")}}
- {{Cssxref("overscroll-behavior-y")}}

## Cú pháp

```css
/* Giá trị từ khóa */
overscroll-behavior: auto; /* default */
overscroll-behavior: contain;
overscroll-behavior: none;

/* Hai giá trị */
overscroll-behavior: auto contain;

/* Giá trị toàn cục */
overscroll-behavior: inherit;
overscroll-behavior: initial;
overscroll-behavior: revert;
overscroll-behavior: revert-layer;
overscroll-behavior: unset;
```

Thuộc tính `overscroll-behavior` được chỉ định là một hoặc hai từ khóa được chọn từ danh sách giá trị bên dưới.

Hai từ khóa chỉ định giá trị `overscroll-behavior` trên các trục `x` và `y` tương ứng. Nếu chỉ có một giá trị được chỉ định, cả x và y đều được giả định có cùng giá trị.

### Giá trị

- `auto`
  - : Hành vi tràn cuộn mặc định xảy ra như bình thường.
- `contain`
  - : Hành vi tràn cuộn mặc định (ví dụ: hiệu ứng "nảy") được quan sát bên trong phần tử nơi giá trị này được đặt. Tuy nhiên, không có chuỗi cuộn nào xảy ra trên các vùng cuộn lân cận; các phần tử bên dưới sẽ không cuộn. Giá trị `contain` vô hiệu hóa điều hướng trình duyệt gốc, bao gồm cử chỉ kéo để làm mới theo chiều dọc và điều hướng vuốt theo chiều ngang.
- `none`
  - : Không có chuỗi cuộn nào xảy ra đến các vùng cuộn lân cận, và hành vi tràn cuộn mặc định bị ngăn chặn.

## Mô tả

Theo mặc định, các trình duyệt di động thường cung cấp hiệu ứng "nảy" hoặc thậm chí làm mới trang khi đầu hoặc cuối của trang (hoặc vùng cuộn khác) được chạm đến. Bạn cũng có thể nhận thấy rằng khi có hộp thoại với nội dung cuộn ở đầu trang cũng có nội dung cuộn, khi ranh giới {{Glossary("Scroll_boundary", "cuộn")}} của hộp thoại được đạt đến, trang bên dưới sẽ bắt đầu cuộn — đây được gọi là {{Glossary("Scroll_chaining", "chuỗi cuộn")}}.

Trong một số trường hợp, những hành vi này không mong muốn. Bạn có thể sử dụng `overscroll-behavior` để loại bỏ chuỗi cuộn không mong muốn và hành vi "kéo để làm mới" kiểu ứng dụng Facebook/Twitter của trình duyệt.

Lưu ý rằng thuộc tính này chỉ áp dụng cho {{Glossary("Scroll_container", "scroll containers")}}. Đặc biệt, vì [`<iframe>`](/vi/docs/Web/HTML/Reference/Elements/iframe) không phải là scroll container, việc đặt thuộc tính này trên iframe không có tác dụng. Để kiểm soát chuỗi cuộn từ iframe, hãy đặt `overscroll-behavior` trên cả phần tử [`<html>`](/vi/docs/Web/HTML/Reference/Elements/html) và [`<body>`](/vi/docs/Web/HTML/Reference/Elements/body) của tài liệu iframe.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Ngăn phần tử bên dưới cuộn

Trong [ví dụ overscroll-behavior](https://mdn.github.io/css-examples/overscroll-behavior/) của chúng ta (xem thêm [mã nguồn](https://github.com/mdn/css-examples/tree/main/overscroll-behavior)), chúng ta trình bày một danh sách toàn trang các liên hệ giả, và một hộp thoại chứa cửa sổ trò chuyện.

![A popup chat window titled 'Active chat', showing a conversation between Chris and Bob. Behind the chat window is a contact list titled 'overscroll-behavior demo'.](example.png)

Cả hai vùng này đều cuộn; thông thường nếu bạn cuộn cửa sổ trò chuyện cho đến khi chạm ranh giới cuộn, cửa sổ liên hệ bên dưới sẽ bắt đầu cuộn theo, điều này không mong muốn. Điều này có thể được ngăn chặn bằng cách sử dụng `overscroll-behavior-y` (`overscroll-behavior` cũng hoạt động) trên cửa sổ trò chuyện, như sau:

```css
.messages {
  height: 220px;
  overflow: auto;
  overscroll-behavior-y: contain;
}
```

Chúng ta cũng muốn loại bỏ các hiệu ứng tràn cuộn tiêu chuẩn khi các liên hệ được cuộn đến đầu hoặc cuối (ví dụ: Chrome trên Android làm mới trang khi bạn cuộn qua ranh giới trên cùng). Điều này có thể được ngăn chặn bằng cách đặt `overscroll-behavior: none` trên phần tử {{htmlelement("html")}}:

```css
html {
  margin: 0;
  overscroll-behavior: none;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Mô-đun [CSS overscroll behavior](/vi/docs/Web/CSS/Guides/Overscroll_behavior)
- Mô-đun [CSS scroll anchoring](/vi/docs/Web/CSS/Guides/Scroll_anchoring)
- [Take control of your scroll: customizing pull-to-refresh and overflow effects](https://developer.chrome.com/blog/overscroll-behavior) trên developer.chrome.com (2017)
