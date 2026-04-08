---
title: container-type
slug: Web/CSS/Reference/Properties/container-type
page-type: css-property
browser-compat: css.properties.container-type
spec-urls:
  - https://drafts.csswg.org/css-conditional-5/#container-type
  - https://drafts.csswg.org/css-anchor-position-2/#container-type-anchored
sidebar: cssref
---

Một phần tử có thể được thiết lập thành container truy vấn bằng thuộc tính [CSS](/en-US/docs/Web/CSS) **`container-type`**. `container-type` được dùng để xác định kiểu ngữ cảnh container sử dụng trong container query. Các ngữ cảnh container có sẵn là:

- [Kích thước](/en-US/docs/Web/CSS/Guides/Containment/Container_size_and_style_queries): Cho phép áp dụng có chọn lọc các quy tắc CSS cho các con của container dựa trên điều kiện kích thước chung hoặc kích thước inline như kích thước tối đa hoặc tối thiểu, tỷ lệ khung hình hoặc hướng.
- [Trạng thái cuộn](/en-US/docs/Web/CSS/Guides/Conditional_rules/Container_scroll-state_queries): Cho phép áp dụng có chọn lọc các quy tắc CSS cho các con của container dựa trên điều kiện trạng thái cuộn như liệu container có phải là scroll container đang được cuộn một phần hoặc liệu container có phải là [snap target](/en-US/docs/Glossary/Scroll_snap#snap_target) sẽ được snap vào scroll snap container của nó.
- [Anchored](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Anchored_container_queries): Cho phép áp dụng có chọn lọc các quy tắc CSS cho các con của container dựa trên việc container có [được định vị anchor](/en-US/docs/Web/CSS/Guides/Anchor_positioning) và có [tùy chọn fallback position-try](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Try_options_hiding) được áp dụng hay không.

## Cú pháp

```css
/* Keyword values */
container-type: normal;
container-type: size;
container-type: inline-size;
container-type: scroll-state;
container-type: anchored;

/* Two values */
container-type: size scroll-state;

/* Global Values */
container-type: inherit;
container-type: initial;
container-type: revert;
container-type: revert-layer;
container-type: unset;
```

### Giá trị

Thuộc tính `container-type` có thể nhận một giá trị từ danh sách dưới đây, hoặc hai giá trị — một phải là `scroll-state` và giá trị kia có thể là `inline-size` hoặc `size`. Nói cách khác, một phần tử có thể được thiết lập thành size query container, scroll-state query container, cả hai, hoặc không phải cả hai.

- `anchored`
  - : Thiết lập query container cho anchored container query trên container. Trong trường hợp này, kích thước của phần tử không được tính toán độc lập; không có [containment](/en-US/docs/Web/CSS/Guides/Containment/Using) nào được áp dụng.
- `inline-size`
  - : Thiết lập query container cho các truy vấn về kích thước trên [trục inline](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values/Basic_concepts#block_and_inline_dimensions) của container.
    Áp dụng containment [style](/en-US/docs/Web/CSS/Reference/Properties/contain#style) và [inline-size](/en-US/docs/Web/CSS/Reference/Properties/contain#inline-size) cho phần tử. Kích thước inline của phần tử có thể được [tính toán độc lập](/en-US/docs/Web/CSS/Guides/Containment/Using#size_containment), bỏ qua các phần tử con (xem [Using CSS containment](/en-US/docs/Web/CSS/Guides/Containment/Using)).

- `normal`
  - : Giá trị mặc định. Phần tử không phải là query container cho bất kỳ container size query nào, nhưng vẫn là query container cho [container style queries](/en-US/docs/Web/CSS/Reference/At-rules/@container#container_style_queries).

- `scroll-state`
  - : Thiết lập query container cho scroll-state query trên container. Trong trường hợp này, kích thước của phần tử không được tính toán độc lập; không có containment nào được áp dụng.

- `size`
  - : Thiết lập query container cho container size query trong cả hai chiều [inline và block](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values/Basic_concepts#block_and_inline_dimensions).
    Áp dụng containment [style](/en-US/docs/Web/CSS/Reference/Properties/contain#style) và [size](/en-US/docs/Web/CSS/Reference/Properties/contain#size) cho phần tử. Size containment được áp dụng cho phần tử theo cả hướng inline và block. Kích thước của phần tử có thể được tính toán độc lập, bỏ qua các phần tử con.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{CSSSyntax}}

## Mô tả

Container query cho phép bạn áp dụng có chọn lọc các kiểu dáng bên trong container dựa trên các truy vấn điều kiện được thực hiện trên container. Quy tắc at-rule {{cssxref("@container")}} được dùng để chỉ định các kiểm tra được thực hiện trên container, và các quy tắc sẽ áp dụng cho nội dung của container nếu truy vấn trả về `true`.

Các kiểm tra container query chỉ được thực hiện trên các phần tử có thuộc tính `container-type`, định nghĩa các phần tử là size, scroll-state hoặc anchored query container, hoặc kết hợp cả hai.

### Container size query

[Container size query](/en-US/docs/Web/CSS/Guides/Containment/Container_size_and_style_queries#container_size_queries) cho phép bạn áp dụng có chọn lọc các quy tắc CSS cho các con của container dựa trên điều kiện kích thước như kích thước tối đa hoặc tối thiểu, tỷ lệ khung hình hoặc hướng.

Các size container còn được áp dụng size containment — điều này tắt khả năng lấy thông tin kích thước từ nội dung của phần tử, rất quan trọng để tránh vòng lặp vô hạn trong container query. Nếu không như vậy, một quy tắc CSS bên trong container query có thể thay đổi kích thước nội dung, điều này có thể khiến truy vấn trở thành false và thay đổi kích thước phần tử cha, điều này lại có thể thay đổi kích thước nội dung và chuyển truy vấn lại thành true, và cứ tiếp tục như vậy. Chuỗi này sẽ lặp lại vô tận.

Kích thước container phải được đặt theo ngữ cảnh, chẳng hạn như các phần tử block-level kéo dài theo toàn bộ chiều rộng của cha, hoặc được định nghĩa tường minh. Nếu không có kích thước theo ngữ cảnh hoặc tường minh, các phần tử có size containment sẽ bị thu gọn.

### Container scroll-state query

[Container scroll-state query](/en-US/docs/Web/CSS/Guides/Conditional_rules/Container_scroll-state_queries) cho phép bạn áp dụng có chọn lọc các quy tắc CSS cho các con của container dựa trên điều kiện trạng thái cuộn như:

- Nội dung container có đang được cuộn một phần không.
- Container có phải là snap target sẽ được snap vào scroll snap container không.
- Container có được định vị qua [`position: sticky`](/en-US/docs/Web/CSS/Reference/Properties/display) và đang bám vào biên của {{glossary("scroll container", "scrolling container")}} không.

Trong trường hợp đầu tiên, container được truy vấn là bản thân scroll container. Trong hai trường hợp còn lại, container được truy vấn là phần tử bị ảnh hưởng bởi vị trí cuộn của scroll container tổ tiên.

### Anchored container query

[Anchored container query](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Anchored_container_queries) cho phép bạn áp dụng có chọn lọc các quy tắc CSS cho các con của anchor-positioned container khi có position-try fallback đang hoạt động trên nó, như được chỉ định qua thuộc tính {{cssxref("position-try-fallbacks")}}.

Ví dụ, bạn có thể có phần tử tooltip định vị theo anchor, được định vị phía trên anchor của nó theo mặc định qua giá trị {{cssxref("position-area")}} là `top`, nhưng có giá trị `position-try-fallbacks` là `flip-block` được chỉ định. Điều này sẽ khiến tooltip lật theo hướng block xuống phía dưới anchor khi nó bắt đầu tràn ra khỏi đỉnh viewport. Nếu chúng ta đặt `container-type: anchored` trên nó, chúng ta có thể phát hiện khi nào position-try fallback được áp dụng qua quy tắc `@container` và áp dụng CSS kết quả.

```css
.tooltip {
  position: absolute;
  position-anchor: --myAnchor;
  position-area: top;
  position-try-fallbacks: flip-block;
  container-type: anchored;
}
```

## Ví dụ

### Thiết lập containment theo kích thước inline

Với ví dụ HTML sau đây là thành phần card có hình ảnh, tiêu đề và một số văn bản:

```html
<div class="container">
  <div class="card">
    <h3>Normal card</h3>
    <div class="content">
      Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
      tempor incididunt ut labore et dolore magna aliqua.
    </div>
  </div>
</div>

<div class="container wide">
  <div class="card">
    <h3>Wider card</h3>
    <div class="content">
      Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
      tempor incididunt ut labore et dolore magna aliqua.
    </div>
  </div>
</div>
```

Để tạo ngữ cảnh container, thêm thuộc tính `container-type` vào một phần tử.
Ví dụ sau sử dụng giá trị `inline-size` để tạo ngữ cảnh containment cho [trục inline](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values/Basic_concepts#block_and_inline_dimensions) của container:

```css
.container {
  container-type: inline-size;
  width: 300px;
  height: 120px;
}

.wide {
  width: 500px;
}
```

```css hidden
h3 {
  height: 2rem;
  margin: 0.5rem;
}

.card {
  height: 100%;
}

.content {
  background-color: wheat;
  height: 100%;
}

.container {
  margin: 1rem;
  border: 2px dashed red;
  overflow: hidden;
}
```

Viết container query thông qua quy tắc at-rule {{Cssxref("@container")}} sẽ áp dụng kiểu dáng cho các phần tử của container khi rộng hơn 400px:

```css
@container (width > 400px) {
  .card {
    display: grid;
    grid-template-columns: 1fr 2fr;
  }
}
```

{{EmbedLiveSample('Establishing_inline_size_containment', '100%', 300)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [CSS container queries](/en-US/docs/Web/CSS/Guides/Containment/Container_queries)
- [Using container size and style queries](/en-US/docs/Web/CSS/Guides/Containment/Container_size_and_style_queries)
- [Using container scroll-state queries](/en-US/docs/Web/CSS/Guides/Conditional_rules/Container_scroll-state_queries)
- [Using anchored container queries](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Anchored_container_queries)
- {{Cssxref("@container")}} at-rule
- CSS {{Cssxref("container")}} shorthand property
- CSS {{Cssxref("container-name")}} property
- CSS {{cssxref("content-visibility")}} property
