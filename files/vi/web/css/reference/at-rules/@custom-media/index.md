---
title: "@custom-media"
slug: Web/CSS/Reference/At-rules/@custom-media
page-type: css-at-rule
status:
  - experimental
browser-compat: css.at-rules.custom-media
sidebar: cssref
---

{{SeeCompatTable}}

At-rule CSS **`@custom-media`** định nghĩa bí danh (alias) cho các [media query](/en-US/docs/Web/CSS/Guides/Media_queries) dài hoặc phức tạp. Thay vì lặp lại cùng một `<media-query-list>` được mã hóa cứng trong nhiều at-rule {{cssxref("@media")}}, có thể định nghĩa một lần trong at-rule `@custom-media` và tham chiếu đến nó trong toàn bộ stylesheet khi cần.

## Cú pháp

```css
@custom-media <extension-name> [<media-query-list> | true | false ];

@custom-media --media-query-name (width < 1200px);
@custom-media --media-query-name (width < 1200px), (orientation: portrait);
```

### Giá trị

- `<extension-name>`
  - : Một {{cssxref("dashed-ident")}}; tên xác định media query tùy chỉnh.
- Giá trị đại diện
  - : Giá trị được đặt bí danh bởi media query tùy chỉnh. Các giá trị khả dụng bao gồm:
    - `<media-query-list>`
      - : Một [danh sách các giá trị `<media-query>`](/en-US/docs/Web/CSS/Reference/At-rules/@media#description) phân cách bằng dấu phẩy.
    - `true`
      - : Giá trị `@custom-media` luôn được đánh giá là `true`.
    - `false`
      - : Giá trị `@custom-media` luôn được đánh giá là `false`.

## Mô tả

Khi xây dựng giao diện responsive, cùng một điều kiện media thường cần được lặp lại trên nhiều at-rule {{cssxref("@media")}}, đôi khi qua các tệp và nhóm khác nhau. Việc sao chép media query làm tăng nguy cơ mắc lỗi, gây khó khăn cho việc tái cấu trúc và tạo ra chi phí bảo trì không cần thiết. Bất cứ khi nào một media query thay đổi, mọi phiên bản phải được tìm và cập nhật thủ công — một quá trình có thể vừa dễ mắc lỗi vừa khó theo dõi trong các codebase lớn.

At-rule `@custom-media` giải quyết vấn đề này bằng cách cho phép bạn định nghĩa **các bí danh có tên** cho media query. Thay vì lặp lại toàn bộ media query ở mọi nơi, bạn khai báo điều kiện media một lần là một media query tùy chỉnh và tham chiếu đến bí danh của nó trong toàn bộ stylesheet. Với cách này, việc cập nhật media query cơ bản chỉ cần thay đổi một lần ở một vị trí duy nhất.

Các media query tùy chỉnh có thể được kết hợp từ các media query khác bằng cách tham chiếu đến tên bí danh của chúng bên trong các feature của media query. Điều này cho phép xây dựng các điều kiện phong phú hơn và nhiều lớp hơn. Tuy nhiên, một media query tùy chỉnh không thể tham chiếu đến chính nó, cũng không thể tạo thành một phần của chuỗi tham chiếu vòng tròn. Bất kỳ sự phụ thuộc vòng tròn nào — trực tiếp hay gián tiếp — đều làm mất hiệu lực tất cả các media query tùy chỉnh liên quan đến vòng lặp đó.

Nếu nhiều quy tắc `@custom-media` định nghĩa cùng một tên `<dashed-ident>`, quy tắc nào nằm trong phạm vi tại thời điểm quy tắc `@media` được đánh giá sẽ được sử dụng. Các tham chiếu trước đó không được cập nhật hồi tố khi một quy tắc `@custom-media` sau đó được khai báo.

### Đánh giá media query với toán tử logic

Các media query tùy chỉnh chấp nhận toàn bộ phạm vi toán tử logic CSS — `not`, `and`, và `or` (phân cách bằng dấu phẩy hoặc sử dụng từ khóa `or`).

Vì giá trị `@custom-media` chỉ là một `<media-query-list>` thông thường, bạn có thể kết hợp, đảo ngược, hoặc nhóm các điều kiện giống như trong quy tắc `@media` thông thường.

#### Sử dụng toán tử `not`

Toán tử `not` phủ định toàn bộ điều kiện media. Điều này hữu ích khi bạn muốn một quy tắc chỉ áp dụng khi một điều kiện cụ thể là `false`.

```css
@custom-media --no-script not (script);

@media (--no-script) {
}
```

#### Sử dụng toán tử `and`

Toán tử `and` cho phép bạn kết hợp nhiều điều kiện mà tất cả phải là `true`.

```css
@custom-media --medium-screen (min-width: 40em) and (max-width: 60em);

@media (--medium-screen) {
}
```

Bí danh này chỉ khớp khi viewport nằm trong phạm vi chiều rộng được chỉ định.

#### Sử dụng toán tử `or`

Toán tử logic `or` (hoặc bí danh dấu phẩy của nó) tạo ra một media query khớp nếu bất kỳ điều kiện nào trong danh sách là `true`.

```css
@custom-media --screen-or-print-1 screen, print;
@custom-media --screen-or-print-2 screen or print;

@media (--screen-or-print-1) {
}

@media (--screen-or-print-2) {
}
```

Hai bí danh là giống nhau. Chúng được kích hoạt cho cả môi trường màn hình và in ấn.

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Cập nhật nhiều media query

Trong ví dụ này, at-rule `@custom-media` được sử dụng trên một website responsive sử dụng một breakpoint cụ thể ở nhiều chỗ:

```css
@custom-media --narrow-window (width < 32em);

@media (--narrow-window) {
}

@media (--narrow-window) and (hover) {
}

@media (--narrow-window) and (orientation: portrait) {
}
```

Nếu breakpoint cần được thay đổi, nó có thể được cập nhật ở một nơi để điều chỉnh tất cả các media query phụ thuộc trên toàn bộ trang web.

### Nhóm nhiều breakpoint responsive

Ở đây, at-rule `@custom-media` được sử dụng để đặt nhiều breakpoint ở một nơi duy nhất, cải thiện khả năng bảo trì và đơn giản hóa việc quản lý thiết kế responsive trên nhiều stylesheet:

```css
/* general.css */

@custom-media --mobile-screen (width < 480px);
@custom-media --tablet-screen (width < 768px);
@custom-media --laptop-screen (width < 1024px);
@custom-media --desktop-screen (width < 1440px);
@custom-media --widescreen (width > 1441px);
```

```css
/* layout.css */

.container {
  padding: 1rem;
}

@media (--mobile-screen) {
  .container {
    padding: 0.5rem;
  }
}

@media (--laptop-screen) {
  .container {
    max-width: 1200px;
  }
}

@media (--widescreen) {
  .container {
    max-width: 1400px;
    padding: 2rem;
  }
}
```

```css
/* typography.css */

@media (--tablet-screen) {
  .container {
    font-size: 0.9rem;
  }
}

@media (--laptop-screen) {
  .container {
    font-size: 1rem;
  }
}

@media (--widescreen) {
  .container {
    font-size: 1.1rem;
  }
}
```

Nhóm tất cả các breakpoint vào một vị trí duy nhất giúp dễ bảo trì thiết kế responsive hơn. Khi một breakpoint cần điều chỉnh, chỉ cần cập nhật một lần cho định nghĩa `@custom-media` tương ứng, đảm bảo tính nhất quán trên tất cả các stylesheet.

### Sử dụng từ khóa `true` và `false`

Ví dụ sau đây cho thấy cách các từ khóa `true` và `false` có thể được sử dụng với `@custom-media` để tạo ra các media query luôn luôn hoặc không bao giờ khớp.

```css
@custom-media --enabled true;
@custom-media --disabled false;

@media (--enabled) {
  /* Các style này luôn áp dụng */
  body {
    background-color: blue;
  }
}

@media (--disabled) {
  /* Các style này không bao giờ áp dụng */
  body {
    background-color: red;
  }
}
```

Điều này có thể hữu ích cho các cờ tính năng hoặc logic điều kiện trong stylesheet.

### Ghi đè các quy tắc `@custom-media` hiện có

Trong ví dụ này, một quy tắc `@custom-media` bị ghi đè bởi một quy tắc `@custom-media` khác sử dụng cùng tên `<dashed-ident>`.

```css
@custom-media --mobile-breakpoint (width < 320px);

@media (--mobile-breakpoint) {
  .container {
    grid-template-columns: 2fr 1fr;
  }
}

@custom-media --mobile-breakpoint (width < 480px);
```

Khi nhiều quy tắc `@custom-media` sử dụng cùng tên, quy tắc nằm trong phạm vi tại thời điểm quy tắc `@media` được đánh giá sẽ được sử dụng. Các tham chiếu trước đó không được cập nhật hồi tố khi một quy tắc `@custom-media` sau đó được khai báo.

Ví dụ: trong đoạn code trên, tham chiếu `--mobile-breakpoint` bên trong quy tắc `@media` được đánh giá là `(width < 320px)`, vì vậy quy tắc `.container` chỉ được áp dụng khi viewport nhỏ hơn 320px, mặc dù `--mobile-breakpoint` được định nghĩa lại là `(width < 480px)` sau đó trong stylesheet.

> [!NOTE]
> Hành vi ghi đè của `@custom-media` vẫn đang được thảo luận trong đặc tả CSS và có thể thay đổi trong tương lai. Xem phần [Khả năng tương thích với trình duyệt](#browser_compatibility) để biết trạng thái hỗ trợ hiện tại.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- At-rule CSS {{cssxref("@media")}}
- At-rule CSS {{cssxref("@import")}}
- [Thiết kế responsive](/en-US/docs/Learn_web_development/Core/CSS_layout/Responsive_Design)
- Module [CSS media queries](/en-US/docs/Web/CSS/Guides/Media_queries)
