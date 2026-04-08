---
title: "@container"
slug: Web/CSS/Reference/At-rules/@container
page-type: css-at-rule
browser-compat: css.at-rules.container
spec-urls:
  - https://drafts.csswg.org/css-conditional-5/#container-type
  - https://drafts.csswg.org/css-anchor-position-2/#container-rule-anchored
sidebar: cssref
---

[Quy tắc at](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) **`@container`** [CSS](/en-US/docs/Web/CSS) là một quy tắc nhóm có điều kiện áp dụng kiểu dáng cho [bối cảnh containment](/en-US/docs/Web/CSS/Guides/Containment/Container_queries#naming_containment_contexts).
Các khai báo kiểu được lọc theo một điều kiện và áp dụng cho các phần tử bên trong container nếu điều kiện là đúng.
Điều kiện được đánh giá khi kích thước container được truy vấn, [`<style-feature>`](#truy_vấn_kiểu_dáng_container), hoặc trạng thái cuộn thay đổi.

Điều kiện phải chỉ định một hoặc cả hai {{cssxref("container-name")}} và `<container-query>`.

Thuộc tính {{cssxref("container-name")}} chỉ định một danh sách tên container truy vấn, được dùng để lọc container nào được nhắm mục tiêu bởi các quy tắc `@container`.
Các tính năng container trong `<container-query>` được đánh giá so với các container đã chọn.
Nếu không chỉ định `<container-name>`, các tính năng `<container-query>` được đánh giá so với container truy vấn tổ tiên gần nhất có [`container-type`](/en-US/docs/Web/CSS/Reference/Properties/container-type) khớp.
Nếu không chỉ định `<container-query>`, các container được đặt tên sẽ được chọn.

## Cú pháp

```css
/* Với <size-query> */
@container (width > 400px) {
  h2 {
    font-size: 1.5em;
  }
}

/* Với <container-name> tùy chọn */
@container tall (height > 30rem) {
  p {
    line-height: 1.6;
  }
}

/* Chỉ với <container-name> (query là tùy chọn) */
@container sidebar {
  h2 {
    background: blue;
  }
}

/* Với <scroll-state> */
@container scroll-state(scrollable: top) {
  .back-to-top-link {
    visibility: visible;
  }
}

/* Với truy vấn neo (anchored query) */
@container anchored(fallback: bottom) {
  .infobox::before {
    content: "▲";
    bottom: 100%;
    top: auto;
  }
}

/* Với <container-name> và <scroll-state> */
@container sticky-heading scroll-state(stuck: top) {
  h2 {
    background: purple;
    color: white;
  }
}

/* Nhiều truy vấn trong một điều kiện duy nhất */
@container (width > 400px) and style(--responsive: true) {
  h2 {
    font-size: 1.5em;
  }
}

/* Danh sách điều kiện */
@container card (width > 400px), style(--responsive: true), scroll-state(stuck: top) {
  h2 {
    font-size: 1.5em;
  }
}
```

### Tham số

- `<container-condition>`
  - : Một hoặc cả hai `<container-name>` và `<container-query>`.
    Các kiểu dáng định nghĩa trong `<stylesheet>` được áp dụng nếu điều kiện là `true`.
    - `<container-name>` {{optional_inline}}
      - : Tên của container cần truy vấn; được chỉ định là {{cssxref("ident")}}. Nếu truy vấn cho kết quả `true`, các kiểu đã khai báo được áp dụng cho các phần tử con của container.
    - `<container-query>` {{optional_inline}}
      - : Một tập hợp các tính năng được đánh giá so với container truy vấn khi kích thước, [`<style-feature>`](#truy_vấn_kiểu_dáng_container), trạng thái cuộn hoặc position-try fallback đang được áp dụng của container thay đổi.

### Từ khóa logic trong truy vấn container

Các từ khóa logic có thể được dùng để định nghĩa điều kiện container:

- `and` kết hợp hai hoặc nhiều điều kiện.
- `or` kết hợp hai hoặc nhiều điều kiện.
- `not` phủ định điều kiện. Chỉ cho phép một điều kiện 'not' trên mỗi truy vấn container và không thể dùng cùng với từ khóa `and` hoặc `or`.

```css
@container (width > 400px) and (height > 400px) {
  /* <stylesheet> */
}

@container (width > 400px) or (height > 400px) {
  /* <stylesheet> */
}

@container not (width < 400px) {
  /* <stylesheet> */
}
```

### Bối cảnh containment được đặt tên

Bối cảnh containment có thể được đặt tên bằng thuộc tính {{cssxref("container-name")}}.

```css
.post {
  container-name: sidebar;
  container-type: inline-size;
}
```

Cú pháp viết tắt cho khai báo này là dùng {{cssxref("container")}} theo dạng `container: <name> / <type>`, ví dụ:

```css
.post {
  container: sidebar / inline-size;
}
```

Trong truy vấn container, thuộc tính {{cssxref("container-name")}} được dùng để lọc tập hợp container thành những container có tên truy vấn khớp:

```css
@container sidebar (width > 400px) {
  /* <stylesheet> */
}
```

Chi tiết về cách sử dụng và các hạn chế đặt tên được mô tả trong trang {{cssxref("container-name")}}.

### Mô tả (Descriptors)

`<container-condition>` bao gồm các mô tả container [kích thước](#mô_tả_container_kích_thước), [scroll-state](#mô_tả_container_scroll-state), và [anchored](#mô_tả_container_neo).

#### Mô tả container kích thước

`<container-condition>` có thể bao gồm một hoặc nhiều truy vấn kích thước boolean, mỗi cái trong một cặp dấu ngoặc đơn. Một truy vấn kích thước gồm một mô tả kích thước, một giá trị và — tùy theo mô tả — một toán tử so sánh. Các truy vấn luôn đo [content box](/en-US/docs/Web/CSS/Reference/Values/box-edge#content-box) làm phép so sánh. Cú pháp để bao gồm nhiều điều kiện giống như truy vấn tính năng kích thước {{cssxref("@media")}}.

```css
@container (min-width: 400px) {
  /* … */
}
@container (orientation: landscape) and (width > 400px) {
  /* … */
}
@container (15em <= block-size <= 30em) {
  /* … */
}
```

- `aspect-ratio`
  - : {{cssxref("aspect-ratio")}} của container được tính bằng tỷ lệ chiều rộng so với chiều cao của container, biểu thị dưới dạng giá trị {{cssxref("ratio")}}.

- `block-size`
  - : {{cssxref("block-size")}} của container biểu thị dưới dạng giá trị {{cssxref("length")}}.

- `height`
  - : Chiều cao của container biểu thị dưới dạng giá trị {{cssxref("length")}}.

- `inline-size`
  - : {{cssxref("inline-size")}} của container biểu thị dưới dạng giá trị {{cssxref("length")}}.

- `orientation`
  - : [Hướng](/en-US/docs/Web/CSS/Reference/At-rules/@media/orientation) của container, có thể là `landscape` hoặc `portrait`.

- `width`
  - : Chiều rộng của container biểu thị dưới dạng giá trị {{cssxref("length")}}.

#### Mô tả container scroll-state

Các mô tả container scroll-state được chỉ định bên trong `<container-condition>` như một đối số cho hàm `scroll-state()`, ví dụ:

```css
@container scroll-state(scrollable: top) {
  /* … */
}
@container scroll-state(scrolled: block-end) {
  /* … */
}
@container scroll-state(stuck: inline-end) {
  /* … */
}
@container scroll-state(snapped: both) {
  /* … */
}
```

Các từ khóa được hỗ trợ cho mô tả container scroll-state bao gồm các giá trị {{glossary("physical properties", "vật lý")}} và {{glossary("flow relative values", "tương đối theo luồng")}}.

- `scrollable`
  - : Truy vấn xem container có thể cuộn theo hướng nhất định thông qua cuộn do người dùng khởi tạo, chẳng hạn như kéo thanh cuộn hoặc dùng cử chỉ trackpad. Nói cách khác, có nội dung tràn theo hướng đó có thể cuộn tới không? Các giá trị `scrollable` hợp lệ bao gồm các từ khóa sau:
    - `none`
      - : Container không phải là {{glossary("scroll container")}} hoặc không thể cuộn theo bất kỳ hướng nào.
    - `top`
      - : Container có thể cuộn về phía cạnh trên.
    - `right`
      - : Container có thể cuộn về phía cạnh bên phải.
    - `bottom`
      - : Container có thể cuộn về phía cạnh dưới.
    - `left`
      - : Container có thể cuộn về phía cạnh bên trái.
    - `x`
      - : Container có thể cuộn ngang về phía cạnh trái hoặc phải hoặc cả hai.
    - `y`
      - : Container có thể cuộn dọc về phía cạnh trên hoặc dưới hoặc cả hai.
    - `block-start`
      - : Container có thể cuộn về phía cạnh block-start.
    - `block-end`
      - : Container có thể cuộn về phía cạnh block-end.
    - `inline-start`
      - : Container có thể cuộn về phía cạnh inline-start.
    - `inline-end`
      - : Container có thể cuộn về phía cạnh inline-end.
    - `block`
      - : Container có thể cuộn theo hướng block về phía cạnh block-start hoặc block-end hoặc cả hai.
    - `inline`
      - : Container có thể cuộn theo hướng inline về phía cạnh inline-start và inline-end hoặc cả hai.

    Nếu kiểm tra vượt qua, các quy tắc bên trong khối `@container` được áp dụng cho các con của scroll container.

    Để đánh giá xem container có thể cuộn mà không quan tâm đến hướng, dùng giá trị `none` với toán tử `not`:

    ```css
    @container not scroll-state(scrollable: none) {
      /* … */
    }
    ```

- `scrolled`
  - : Truy vấn xem container gần đây nhất đã cuộn theo hướng nào. Các giá trị `scrolled` hợp lệ bao gồm các từ khóa sau:
    - `none`
      - : Container không phải là {{glossary("scroll container")}} hoặc chưa từng cuộn theo bất kỳ hướng nào.
    - `top`
      - : Container gần đây nhất đã cuộn về phía cạnh trên.
    - `right`
      - : Container gần đây nhất đã cuộn về phía cạnh bên phải.
    - `bottom`
      - : Container gần đây nhất đã cuộn về phía cạnh dưới.
    - `left`
      - : Container gần đây nhất đã cuộn về phía cạnh bên trái.
    - `x`
      - : Container gần đây nhất đã cuộn về phía cạnh trái hoặc phải.
    - `y`
      - : Container gần đây nhất đã cuộn về phía cạnh trên hoặc dưới.
    - `block-start`
      - : Container gần đây nhất đã cuộn về phía cạnh block-start.
    - `block-end`
      - : Container gần đây nhất đã cuộn về phía cạnh block-end.
    - `inline-start`
      - : Container gần đây nhất đã cuộn về phía cạnh inline-start.
    - `inline-end`
      - : Container gần đây nhất đã cuộn về phía cạnh inline-end.
    - `block`
      - : Container gần đây nhất đã cuộn về phía cạnh block-start hoặc block-end.
    - `inline`
      - : Container gần đây nhất đã cuộn về phía cạnh inline-start hoặc inline-end.

    Nếu kiểm tra trả về true, các quy tắc lồng trong khối `@container` được áp dụng cho các con của scroll container.

    Để đánh giá xem container có vừa cuộn hay không mà không quan tâm đến hướng, dùng giá trị `none` với toán tử `not`:

    ```css
    @container not scroll-state(scrolled: none) {
      /* … */
    }
    ```

- `snapped`
  - : Truy vấn xem container có được snap tới một container tổ tiên [scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap) theo trục nhất định hay không. Các giá trị `snapped` hợp lệ bao gồm các từ khóa sau:
    - `none`
      - : Container không phải là [snap target](/en-US/docs/Glossary/Scroll_snap#snap_target) của scroll container tổ tiên. Khi triển khai truy vấn `snapped: none`, các container _là_ snap target cho scroll container sẽ _không_ được áp dụng kiểu `@container`, còn các non-snap target _sẽ_ được áp dụng kiểu.
    - `x`
      - : Container là snap target cuộn ngang cho scroll container tổ tiên, tức là nó đang snap theo chiều ngang với tổ tiên.
    - `y`
      - : Container là snap target cuộn dọc cho scroll container tổ tiên, tức là nó đang snap theo chiều dọc với tổ tiên.
    - `block`
      - : Container là snap target trục block cho scroll container tổ tiên, tức là nó đang snap với tổ tiên theo hướng block.
    - `inline`
      - : Container là snap target trục inline cho scroll container tổ tiên, tức là nó đang snap với tổ tiên theo hướng inline.
    - `both`
      - : Container vừa là snap target cuộn ngang vừa cuộn dọc cho scroll container tổ tiên và đang snap với tổ tiên theo cả hai hướng. Container sẽ không khớp nếu chỉ snap theo trục ngang _hoặc_ dọc. Phải là cả hai.

    Để đánh giá container với truy vấn scroll-state `snapped` không phải `none`, nó phải là container có tổ tiên scroll container có giá trị {{cssxref("scroll-snap-type")}} khác `none`. Truy vấn `snapped: none` sẽ khớp ngay cả khi không có tổ tiên scroll container.

    Đánh giá diễn ra khi các sự kiện [`scrollsnapchanging`](/en-US/docs/Web/API/Element/scrollsnapchanging_event) kích hoạt trên snap container cuộn. Nếu kiểm tra vượt qua, các quy tắc bên trong khối `@container` được áp dụng cho các con của container.

    Để đánh giá xem container có phải là snap target mà không quan tâm đến hướng, dùng giá trị `none` với toán tử `not`:

    ```css
    @container not scroll-state(snapped: none) {
      /* … */
    }
    ```

- `stuck`
  - : Truy vấn xem container có giá trị {{cssxref("position")}} là [`sticky`](/en-US/docs/Learn_web_development/Core/CSS_layout/Positioning#sticky_positioning) có bị "dính" vào một cạnh của tổ tiên scroll container hay không. Các giá trị `stuck` hợp lệ bao gồm các từ khóa sau:
    - `none`
      - : Container không bị dính vào bất kỳ cạnh nào của container của nó. Lưu ý rằng truy vấn `none` sẽ khớp ngay cả khi container không có `position: sticky` được đặt.
    - `top`
      - : Container đang bị dính vào cạnh trên của container của nó.
    - `right`
      - : Container đang bị dính vào cạnh bên phải của container của nó.
    - `bottom`
      - : Container đang bị dính vào cạnh dưới của container của nó.
    - `left`
      - : Container đang bị dính vào cạnh bên trái của container của nó.
    - `block-start`
      - : Container đang bị dính vào cạnh block-start của container của nó.
    - `block-end`
      - : Container đang bị dính vào cạnh block-end của container của nó.
    - `inline-start`
      - : Container đang bị dính vào cạnh inline-start của container của nó.
    - `inline-end`
      - : Container đang bị dính vào cạnh inline-end của container của nó.

    Để đánh giá container với truy vấn scroll-state `stuck` không phải `none`, nó phải có `position: sticky` được đặt và nằm bên trong scroll container. Nếu kiểm tra vượt qua, các quy tắc bên trong khối `@container` được áp dụng cho các con của container `position: sticky`.

    Có thể xảy ra trường hợp hai giá trị từ các trục liền kề khớp cùng lúc:

    ```css
    @container scroll-state((stuck: top) and (stuck: left)) {
      /* … */
    }
    ```

    Tuy nhiên, hai giá trị từ các cạnh đối diện sẽ không bao giờ khớp cùng lúc:

    ```css
    @container scroll-state((stuck: left) and (stuck: right)) {
      /* … */
    }
    ```

    Để đánh giá xem container có bị dính hay không mà không quan tâm đến hướng, dùng giá trị `none` với toán tử `not`:

    ```css
    @container not scroll-state(stuck: none) {
      /* … */
    }
    ```

#### Mô tả container neo

Các mô tả container neo được chỉ định bên trong `<container-condition>` như một đối số cho hàm `anchored()`, ví dụ:

```css
@container anchored(fallback: top) {
  /* … */
}
@container anchored(fallback: flip-block flip-inline) {
  /* … */
}
@container anchored(fallback: --custom-fallback) {
  /* … */
}
```

- `fallback`
  - : Truy vấn xem một position-try fallback cụ thể có đang hoạt động trên container được neo (anchor-positioned) hay không, được chỉ định qua thuộc tính {{cssxref("position-try-fallbacks")}}. Các giá trị `fallback` hợp lệ bao gồm bất kỳ giá trị thành phần nào hợp lệ để đưa vào giá trị thuộc tính `position-try-fallbacks`.

    Nếu giá trị `fallback` được đặt tên trong kiểm tra hiện đang hoạt động trên container được neo, kiểm tra vượt qua, và các quy tắc bên trong khối `@container` được áp dụng cho các con của container được neo.

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt kiểu dáng dựa trên kích thước container

Hãy xem ví dụ sau về một thành phần card với tiêu đề và một số văn bản:

```html
<div class="post">
  <div class="card">
    <h2>Card title</h2>
    <p>Card content</p>
  </div>
</div>
```

Bối cảnh container có thể được tạo bằng thuộc tính `container-type`, trong trường hợp này dùng giá trị `inline-size` trên lớp `.post`.
Sau đó bạn có thể dùng quy tắc at `@container` để áp dụng kiểu cho phần tử với lớp `.card` trong container có chiều rộng nhỏ hơn `650px`.

```js hidden
const post = document.querySelector(".post");
const span = document.createElement("span");
span.textContent = `.post width: ${post.clientWidth}px`;
post.parentNode.insertBefore(span, post.nextSibling);
// update on resize
window.addEventListener("resize", () => {
  span.textContent = `.post width: ${post.clientWidth}px`;
});
```

```css hidden
span {
  display: block;
  text-align: center;
}
.card {
  margin: 10px;
  border: 2px dotted;
  font-size: 1.5em;
}
.post {
  border: 2px solid;
}
```

```css
/* Bối cảnh container dựa trên kích thước inline */
.post {
  container-type: inline-size;
}

/* Áp dụng kiểu nếu container hẹp hơn 650px */
@container (width < 650px) {
  .card {
    width: 50%;
    background-color: lightgray;
    font-size: 1em;
  }
}
```

{{EmbedLiveSample("Setting_styles_based_on_a_container's_size", "100%", 230)}}

### Tạo bối cảnh containment được đặt tên

Cho ví dụ HTML sau là thành phần card với tiêu đề và một số văn bản:

```html
<div class="post">
  <div class="card">
    <h2>Card title</h2>
    <p>Card content</p>
  </div>
</div>
```

Đầu tiên, tạo bối cảnh container bằng các thuộc tính `container-type` và `container-name`.
Cú pháp viết tắt cho khai báo này được mô tả trong trang {{cssxref("container")}}.

```css
.post {
  container-type: inline-size;
  container-name: summary;
}
```

Tiếp theo, nhắm mục tiêu container đó bằng cách thêm tên vào truy vấn container:

```css
@container summary (width >= 400px) {
  .card {
    font-size: 1.5em;
  }
}
```

### Truy vấn container lồng nhau

Không thể nhắm mục tiêu nhiều container trong một truy vấn container.
Có thể lồng các truy vấn container để đạt hiệu quả tương tự.

Truy vấn sau đánh giá là true và áp dụng kiểu đã khai báo nếu container có tên `summary` rộng hơn `400px` và có tổ tiên container rộng hơn `800px`:

```css
@container summary (width > 400px) {
  @container (width > 800px) {
    /* <stylesheet> */
  }
}
```

### Truy vấn kiểu dáng container

Truy vấn container cũng có thể đánh giá kiểu dáng tính toán của phần tử container. _Truy vấn kiểu dáng container_ là truy vấn `@container` sử dụng một hoặc nhiều ký pháp hàm `style()`. Cú pháp boolean và logic kết hợp các tính năng kiểu vào truy vấn kiểu giống như trong [truy vấn tính năng CSS](/en-US/docs/Web/CSS/Guides/Conditional_rules/Using_feature_queries).

```css
@container style(<style-feature>),
    not style(<style-feature>),
    style(<style-feature>) and style(<style-feature>),
    style(<style-feature>) or style(<style-feature>) {
  /* <stylesheet> */
}
```

Tham số của mỗi `style()` là một `<style-feature>` duy nhất. **`<style-feature>`** là một [khai báo](/en-US/docs/Web/CSS/Guides/Syntax/Introduction#css_declarations) CSS hợp lệ, một thuộc tính CSS, hoặc một [`<custom-property-name>`](/en-US/docs/Web/CSS/Reference/Values/var#values).

```css
@container style(--themeBackground),
    not style(background-color: red),
    style(color: green) and style(background-color: transparent),
    style(--themeColor: blue) or style(--themeColor: purple) {
  /* <stylesheet> */
}
```

Một tính năng kiểu không có giá trị đánh giá là true nếu giá trị tính toán khác với giá trị ban đầu của thuộc tính đó.

Nếu `<style-feature>` được truyền vào hàm `style()` là một khai báo, truy vấn kiểu đánh giá là true nếu giá trị của khai báo bằng với giá trị tính toán của thuộc tính đó cho container đang được truy vấn. Ngược lại, nó phân giải thành false.

Truy vấn container sau kiểm tra xem [giá trị tính toán](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#computed_value) của `--accent-color` của phần tử container có phải là `blue` không:

```css
@container style(--accent-color: blue) {
  /* <stylesheet> */
}
```

> [!NOTE]
> Nếu thuộc tính tùy chỉnh có giá trị là `blue`, mã hex tương đương `#0000ff` sẽ không khớp trừ khi thuộc tính được định nghĩa là màu với {{cssxref("@property")}} để trình duyệt có thể so sánh các giá trị tính toán đúng cách.

Các tính năng kiểu truy vấn thuộc tính viết tắt là true nếu các giá trị tính toán khớp cho từng thuộc tính longhand của nó, và false nếu không. Ví dụ, `@container style(border: 2px solid red)` sẽ phân giải thành true nếu tất cả 12 thuộc tính longhand (`border-bottom-style`, v.v.) tạo nên viết tắt đó là true.

Lưu ý rằng [`!important`](/en-US/docs/Web/CSS/Reference/Values/important) được cho phép trong truy vấn kiểu nhưng bị bỏ qua.

```css
/* !important hợp lệ nhưng không có tác dụng */
@container style(--themeColor: purple !important) {
  /* <stylesheet> */
}
```

Các giá trị toàn cục `revert` và `revert-layer` không hợp lệ như giá trị trong `<style-feature>` và khiến truy vấn kiểu container là false.

### Truy vấn scroll-state

Xem [Sử dụng truy vấn scroll-state container](/en-US/docs/Web/CSS/Guides/Conditional_rules/Container_scroll-state_queries) để biết các ví dụ về truy vấn scroll-state.

### Truy vấn neo

Xem [Sử dụng truy vấn container neo](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Anchored_container_queries) để biết các ví dụ về truy vấn neo.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng truy vấn container](/en-US/docs/Web/CSS/Guides/Containment/Container_queries)
- [Sử dụng truy vấn kích thước và kiểu container](/en-US/docs/Web/CSS/Guides/Containment/Container_size_and_style_queries)
- [Sử dụng truy vấn scroll-state container](/en-US/docs/Web/CSS/Guides/Conditional_rules/Container_scroll-state_queries)
- [Sử dụng truy vấn container neo](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Anchored_container_queries)
- {{Cssxref("container-name")}}
- {{Cssxref("container-type")}}
- {{Cssxref("contain")}}
- {{Cssxref("content-visibility")}}
- [Mô-đun CSS containment](/en-US/docs/Web/CSS/Guides/Containment)
- [Hàm quy tắc at CSS](/en-US/docs/Web/CSS/Reference/At-rules/At-rule_functions)
