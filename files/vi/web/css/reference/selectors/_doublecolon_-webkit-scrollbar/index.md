---
title: ::-webkit-scrollbar
slug: Web/CSS/Reference/Selectors/::-webkit-scrollbar
page-type: css-pseudo-element
status:
  - non-standard
browser-compat:
  - css.selectors.-webkit-scrollbar
  - css.selectors.-webkit-scrollbar-button
  - css.selectors.-webkit-scrollbar-thumb
  - css.selectors.-webkit-scrollbar-track
  - css.selectors.-webkit-scrollbar-track-piece
  - css.selectors.-webkit-scrollbar-corner
  - css.selectors.-webkit-resizer
sidebar: cssref
---

{{Non-standard_Header}}

Phần tử giả CSS `::-webkit-scrollbar` ảnh hưởng đến kiểu dáng của thanh cuộn của phần tử khi phần tử đó có nội dung tràn có thể cuộn.

Các thuộc tính tiêu chuẩn {{cssxref("scrollbar-color")}} và {{cssxref("scrollbar-width")}} có thể được dùng như giải pháp thay thế cho các trình duyệt không hỗ trợ phần tử giả này và các phần tử giả `::-webkit-scrollbar-*` liên quan (xem [Khả năng tương thích trình duyệt](#browser_compatibility)).

> [!NOTE]
> Nếu {{cssxref("scrollbar-color")}} và {{cssxref("scrollbar-width")}} được hỗ trợ và có bất kỳ giá trị nào khác `auto`, chúng sẽ ghi đè kiểu dáng của `::-webkit-scrollbar-*`.
> Xem [Thêm phương án dự phòng cho kiểu thanh cuộn](#adding_a_fallback_for_scrollbar_styles) để biết thêm chi tiết.

## Bộ chọn thanh cuộn CSS

Bạn có thể sử dụng các phần tử giả sau để tùy chỉnh các phần khác nhau của thanh cuộn cho các trình duyệt WebKit:

- `::-webkit-scrollbar` — toàn bộ thanh cuộn.
- `::-webkit-scrollbar-button` — các nút trên thanh cuộn (mũi tên hướng lên và xuống để cuộn từng dòng một).
- `::-webkit-scrollbar:horizontal` — thanh cuộn ngang.
- `::-webkit-scrollbar-thumb` — tay cầm cuộn có thể kéo.
- `::-webkit-scrollbar-track` — đường ray (thanh tiến trình) của thanh cuộn, nơi có một thanh xám trên thanh trắng.
- `::-webkit-scrollbar-track-piece` — phần đường ray (thanh tiến trình) không bị tay cầm che khuất.
- `::-webkit-scrollbar:vertical` — thanh cuộn dọc.
- `::-webkit-scrollbar-corner` — góc dưới của thanh cuộn, nơi thanh cuộn ngang và dọc gặp nhau. Đây thường là góc dưới bên phải của cửa sổ trình duyệt.
- `::-webkit-resizer` — tay cầm thay đổi kích thước có thể kéo xuất hiện ở góc dưới của một số phần tử.

## Khả năng tiếp cận

Tác giả nên tránh tạo kiểu cho thanh cuộn, vì việc thay đổi giao diện thanh cuộn khỏi mặc định [làm giảm tính nhất quán bên ngoài](https://inclusivedesignprinciples.info/#be-consistent), gây ảnh hưởng tiêu cực đến khả năng sử dụng. Nếu cần tạo kiểu cho thanh cuộn, hãy đảm bảo có đủ độ tương phản màu sắc và vùng chạm phải rộng và cao ít nhất 44px. Xem [Kỹ thuật cho WCAG 2.0: G183: Sử dụng tỷ lệ tương phản 3:1](https://www.w3.org/TR/WCAG20-TECHS/G183.html) và [Hiểu WCAG 2.1: Kích thước mục tiêu](https://www.w3.org/WAI/WCAG21/Understanding/target-size.html).

## Ví dụ

### Tạo kiểu thanh cuộn sử dụng `-webkit-scrollbar`

#### CSS

```css
.visible-scrollbar,
.invisible-scrollbar,
.mostly-customized-scrollbar {
  display: block;
  width: 10em;
  overflow: auto;
  height: 2em;
  padding: 1em;
  margin: 1em auto;
  outline: 2px dashed cornflowerblue;
}

.invisible-scrollbar::-webkit-scrollbar {
  display: none;
}

/* Demonstrate a "mostly customized" scrollbar
 * (won't be visible otherwise if width/height is specified) */
.mostly-customized-scrollbar::-webkit-scrollbar {
  width: 5px;
  height: 8px;
  background-color: #aaaaaa; /* or add it to the track */
}

/* Add a thumb */
.mostly-customized-scrollbar::-webkit-scrollbar-thumb {
  background: black;
}
```

#### HTML

```html
<div class="visible-scrollbar">
  <h3>Visible scrollbar</h3>
  <p>
    Etiam sagittis sem sed lacus laoreet, eu fermentum eros auctor. Proin at
    nulla elementum, consectetur ex eget, commodo ante. Sed eros mi, bibendum ut
    dignissim et, maximus eget nibh. Phasellus blandit quam turpis, at mollis
    velit pretium ut. Nunc consequat efficitur ultrices. Nullam hendrerit
    posuere est. Nulla libero sapien, egestas ac felis porta, cursus ultricies
    quam. Vestibulum tincidunt accumsan sapien, a fringilla dui semper in.
    Vivamus consectetur ipsum a ornare blandit. Aenean tempus at lorem sit amet
    faucibus. Curabitur nibh justo, faucibus sed velit cursus, mattis cursus
    dolor. Pellentesque id pretium est. Quisque convallis nisi a diam malesuada
    mollis. Aliquam at enim ligula.
  </p>
</div>

<div class="invisible-scrollbar">
  <h3>Invisible scrollbar</h3>
  <p>
    Thisisaveeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeerylongword
  </p>
</div>

<div class="mostly-customized-scrollbar">
  <h3>Custom scrollbar</h3>
  <p>
    Thisisaveeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeerylongword<br />
    And pretty tall<br />
    thing with weird scrollbars.<br />
    Who thought scrollbars could be made weird?
  </p>
</div>
```

#### Kết quả

{{EmbedLiveSample("styling_scrollbars_using_-webkit-scrollbar", 600, 300)}}

### Thêm phương án dự phòng cho kiểu thanh cuộn

Bạn có thể sử dụng quy tắc at {{cssxref("@supports")}} để phát hiện xem trình duyệt có hỗ trợ các thuộc tính tiêu chuẩn {{cssxref("scrollbar-color")}} và {{cssxref("scrollbar-width")}} không, và nếu không thì sử dụng phương án dự phòng với các phần tử giả `::-webkit-scrollbar-*`.
Ví dụ sau đây cho thấy cách áp dụng màu sắc cho thanh cuộn bằng {{cssxref("scrollbar-color")}} nếu được hỗ trợ và bằng các phần tử giả `::-webkit-scrollbar-*` nếu không được hỗ trợ.

#### HTML

```html
<div class="scroll-box">
  <h1>Yoshi</h1>
  <p>
    Yoshi is a fictional dinosaur who appears in video games published by
    Nintendo. Yoshi debuted in Super Mario World (1990) on the SNES as Mario and
    Luigi's sidekick.
  </p>
  <p>
    Throughout the mainline Super Mario series, Yoshi typically serves as
    Mario's trusted steed.
  </p>
  <p>
    With a gluttonous appetite, Yoshi can gobble enemies with his long tongue,
    and lay eggs that doubly function as projectiles.
  </p>
</div>
```

#### CSS

```css hidden
.scroll-box {
  overflow: auto;
  width: 20rem;
  height: 5rem;
  border: 2px solid cornflowerblue;
  margin: 2rem auto;
  font-family: monospace;
}
```

```css
/* For browsers that support `scrollbar-*` properties */
@supports (scrollbar-color: auto) {
  .scroll-box {
    scrollbar-color: aquamarine cornflowerblue;
  }
}

/* Otherwise, use `::-webkit-scrollbar-*` pseudo-elements */
@supports selector(::-webkit-scrollbar) {
  .scroll-box::-webkit-scrollbar {
    background: aquamarine;
  }
  .scroll-box::-webkit-scrollbar-thumb {
    background: cornflowerblue;
  }
}
```

#### Kết quả

Trong ví dụ bên dưới, bạn có thể cuộn hộp có viền theo chiều dọc để xem hiệu ứng của việc tạo kiểu cho thanh cuộn.

{{EmbedLiveSample("adding_a_fallback_to_standard_scrollbar_style_properties")}}

## Đặc tả

Không thuộc về bất kỳ tiêu chuẩn nào.

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("scrollbar-width")}}
- {{CSSxRef("scrollbar-color")}}
- [Don't use custom scrollbars](https://ericwbailey.website/published/dont-use-custom-css-scrollbars/) (2023)
- [Scrollbar styling](https://developer.chrome.com/docs/css-ui/scrollbar-styling) on developer.chrome.com (2024)
- [Styling Scrollbars](https://webkit.org/blog/363/styling-scrollbars/) on WebKit.org (2009)
