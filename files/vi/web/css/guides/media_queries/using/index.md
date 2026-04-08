---
title: Using media queries
slug: Web/CSS/Guides/Media_queries/Using
page-type: guide
sidebar: cssref
---

**Media query** cho phép bạn áp dụng CSS style tùy thuộc vào loại phương tiện của thiết bị (chẳng hạn như in so với màn hình) hoặc các tính năng hay đặc tính khác như độ phân giải màn hình hay orientation, {{glossary("aspect ratio")}}, chiều rộng hay chiều cao {{glossary("viewport")}} của trình duyệt, tùy chọn người dùng như giảm chuyển động, mức sử dụng dữ liệu hoặc độ trong suốt.

Media query được sử dụng cho các mục đích sau:

- Để áp dụng style có điều kiện với [CSS](/en-US/docs/Web/CSS) {{cssxref("@media")}}, {{cssxref("@custom-media")}} và {{cssxref("@import")}} [at-rules](/en-US/docs/Web/CSS/Guides/Syntax/At-rules).
- Để nhắm mục tiêu phương tiện cụ thể cho các phần tử {{HTMLElement("style")}}, {{HTMLElement("link")}}, {{HTMLElement("source")}}, và các phần tử [HTML](/en-US/docs/Web/HTML) khác với thuộc tính `media=` hoặc `sizes="`.
- Để [kiểm tra và giám sát trạng thái phương tiện](/en-US/docs/Web/CSS/Guides/Media_queries/Testing) sử dụng các phương thức {{domxref("Window.matchMedia()")}} và {{domxref("EventTarget.addEventListener()")}}.

> [!NOTE]
> Các ví dụ trên trang này sử dụng CSS `@media` cho mục đích minh họa, nhưng cú pháp cơ bản vẫn giống nhau cho tất cả các loại media query.

## Cú pháp

Một media query bao gồm một _media type_ tùy chọn và bất kỳ số lượng biểu thức _media feature_ nào, có thể tùy chọn được kết hợp theo nhiều cách khác nhau sử dụng _toán tử logic_.
Media query không phân biệt chữ hoa chữ thường.

- [Media type](/en-US/docs/Web/CSS/Reference/At-rules/@media#media_types) xác định danh mục thiết bị rộng mà media query áp dụng: `all`, `print`, `screen`.

  Loại này là tùy chọn (giả định là `all`) ngoại trừ khi sử dụng toán tử logic `only`.

- [Media feature](/en-US/docs/Web/CSS/Reference/At-rules/@media#media_features) mô tả một đặc tính cụ thể của {{glossary("user agent")}}, thiết bị đầu ra, hoặc môi trường:
  - {{cssxref("@media/any-hover", "any-hover")}}
  - {{cssxref("@media/any-pointer", "any-pointer")}}
  - {{cssxref("@media/aspect-ratio", "aspect-ratio")}}
  - {{cssxref("@media/color", "color")}}
  - {{cssxref("@media/color-gamut", "color-gamut")}}
  - {{cssxref("@media/color-index", "color-index")}}
  - {{cssxref("@media/device-aspect-ratio", "device-aspect-ratio")}} {{deprecated_inline}}
  - {{cssxref("@media/device-height", "device-height")}} {{deprecated_inline}}
  - {{cssxref("@media/device-posture", "device-posture")}}
  - {{cssxref("@media/device-width", "device-width")}} {{deprecated_inline}}
  - {{cssxref("@media/display-mode", "display-mode")}}
  - {{cssxref("@media/dynamic-range", "dynamic-range")}}
  - {{cssxref("@media/forced-colors", "forced-colors")}}
  - {{cssxref("@media/grid", "grid")}}
  - {{cssxref("@media/height", "height")}}
  - {{cssxref("@media/hover", "hover")}}
  - {{cssxref("@media/inverted-colors", "inverted-colors")}}
  - {{cssxref("@media/monochrome", "monochrome")}}
  - {{cssxref("@media/orientation", "orientation")}}
  - {{cssxref("@media/overflow-block", "overflow-block")}}
  - {{cssxref("@media/overflow-inline", "overflow-inline")}}
  - {{cssxref("@media/pointer", "pointer")}}
  - {{cssxref("@media/prefers-color-scheme", "prefers-color-scheme")}}
  - {{cssxref("@media/prefers-contrast", "prefers-contrast")}}
  - {{cssxref("@media/prefers-reduced-motion", "prefers-reduced-motion")}}
  - {{cssxref("@media/prefers-reduced-transparency", "prefers-reduced-transparency")}}
  - {{cssxref("@media/resolution", "resolution")}}
  - {{cssxref("@media/scripting", "scripting")}}
  - {{cssxref("@media/update", "update")}}
  - {{cssxref("@media/video-dynamic-range", "video-dynamic-range")}}
  - {{cssxref("@media/width", "width")}}

  Ví dụ, tính năng {{cssxref("@media/hover", "hover")}} cho phép một query kiểm tra xem thiết bị có hỗ trợ hover qua các phần tử hay không.
  Biểu thức media feature kiểm tra sự hiện diện hoặc giá trị của chúng, và hoàn toàn tùy chọn.
  Mỗi biểu thức media feature phải được bao quanh bởi dấu ngoặc đơn.

- [Toán tử logic](/en-US/docs/Web/CSS/Reference/At-rules/@media#logical_operators) có thể được sử dụng để tạo ra một media query phức tạp: `not`, `and`, và `only`.
  Bạn cũng có thể kết hợp nhiều media query thành một quy tắc duy nhất bằng cách phân cách chúng bằng dấu phẩy.

Một media query tính toán thành `true` khi media type (nếu được chỉ định) khớp với thiết bị mà tài liệu đang được hiển thị _và_ tất cả các biểu thức media feature tính toán thành true.
Các query liên quan đến media type không xác định luôn là false.

> [!NOTE]
> Một style sheet có media query gắn vào thẻ {{HTMLElement("link")}} của nó [vẫn sẽ tải xuống](https://scottjehl.github.io/CSS-Download-Tests/) ngay cả khi query trả về `false`, việc tải xuống sẽ xảy ra nhưng ưu tiên tải xuống sẽ thấp hơn nhiều.
> Tuy nhiên, nội dung của nó sẽ không áp dụng trừ khi và cho đến khi kết quả của query thay đổi thành `true`.
> Bạn có thể đọc lý do tại sao điều này xảy ra trong blog của Tomayac [Why Browser Download Stylesheet with Non-Matching Media Queries](https://medium.com/@tomayac/why-browsers-download-stylesheets-with-non-matching-media-queries-eb61b91b85a2).

## Nhắm mục tiêu media type

Media type mô tả danh mục chung của một thiết bị nhất định.
Mặc dù các trang web thường được thiết kế với màn hình trong tâm trí, bạn có thể muốn tạo style nhắm mục tiêu các thiết bị đặc biệt như máy in hoặc screen reader dựa trên âm thanh.
Ví dụ, CSS này nhắm mục tiêu máy in:

```css
@media print {
  /* … */
}
```

Bạn cũng có thể nhắm mục tiêu nhiều thiết bị.
Ví dụ, quy tắc `@media` này sử dụng hai media query để nhắm mục tiêu cả thiết bị màn hình và in:

```css
@media screen, print {
  /* … */
}
```

Xem [media type](/en-US/docs/Web/CSS/Reference/At-rules/@media#media_types) để biết danh sách các media type có sẵn.
Vì media type mô tả thiết bị theo các thuật ngữ rất rộng, hầu hết các media type được xác định ban đầu đã bị loại bỏ, chỉ còn `screen`, `print`, và `all`. Để nhắm mục tiêu các thuộc tính cụ thể hơn, sử dụng _media feature_ thay thế.

## Nhắm mục tiêu media feature

Media feature mô tả các đặc tính cụ thể của một {{glossary("user agent")}}, thiết bị đầu ra, hoặc môi trường nhất định.
Ví dụ, bạn có thể áp dụng các style cụ thể cho màn hình rộng, máy tính sử dụng chuột, hoặc thiết bị đang được sử dụng trong điều kiện ánh sáng yếu.
Ví dụ này áp dụng style khi cơ chế nhập liệu _chính_ của người dùng (chẳng hạn như chuột) có thể hover qua các phần tử:

```css
@media (hover: hover) {
  /* … */
}
```

Media feature có thể là range hoặc discrete.

_Discrete feature_ lấy giá trị của chúng từ một tập hợp {{glossary("enumerated")}} các giá trị từ khóa có thể. Ví dụ, tính năng discrete `orientation` chấp nhận `landscape` hoặc `portrait`.

```css
@media print and (orientation: portrait) {
  /* … */
}
```

Nhiều _range feature_ có thể được tiền tố với "min-" hoặc "max-" để biểu thị các ràng buộc "điều kiện tối thiểu" hoặc "điều kiện tối đa".
Ví dụ, CSS này sẽ chỉ áp dụng style nếu chiều rộng {{glossary("viewport")}} của trình duyệt của bạn bằng hoặc hẹp hơn 1250px:

```css
@media (max-width: 1250px) {
  /* … */
}
```

Các media query sau tương đương với ví dụ trên:

```css
@media (width <= 1250px) {
  /* … */
}

@media (1250px >= width) {
  /* … */
}
```

Với các range feature của media query, bạn có thể sử dụng tiền tố `min-` và `max-` bao gồm hoặc toán tử cú pháp range ngắn gọn hơn `<=` và `>=`.

Các media query sau là tương đương:

```css
@media (min-width: 30em) and (max-width: 50em) {
  /* … */
}

@media (30em <= width <= 50em) {
  /* … */
}

@media (50em >= width >= 30em) {
  /* … */
}
```

Các so sánh range trên là bao gồm. Để loại trừ giá trị so sánh, sử dụng `<` và/hoặc `>`.

```css
@media (30em < width < 50em) {
  /* … */
}

@media (50em > width > 30em) {
  /* … */
}
```

Nếu bạn tạo một media feature query mà không chỉ định giá trị, các style lồng nhau sẽ được sử dụng miễn là giá trị của tính năng không phải là `0` hoặc `none`.
Ví dụ, CSS này sẽ áp dụng cho bất kỳ thiết bị nào có màn hình màu:

```css
@media (color) {
  /* … */
}
```

Nếu một tính năng không áp dụng cho thiết bị mà trình duyệt đang chạy, các biểu thức liên quan đến media feature đó luôn là false.

Để biết thêm ví dụ về [Media feature](/en-US/docs/Web/CSS/Reference/At-rules/@media#media_features), vui lòng xem trang tham chiếu cho từng tính năng cụ thể.

## Tạo media query phức tạp

Đôi khi bạn có thể muốn tạo một media query phụ thuộc vào nhiều điều kiện. Đây là lúc _toán tử logic_ xuất hiện: `not`, `and`, và `only`.
Hơn nữa, bạn có thể kết hợp nhiều media query thành một danh sách phân cách bằng dấu phẩy; điều này cho phép bạn áp dụng các style giống nhau trong các tình huống khác nhau, với các media query chứa được đánh giá như là thành phần logic `or`: được hiểu như thể mỗi media query nằm trong dấu ngoặc đơn với `or` giữa chúng.

Trong ví dụ trước, chúng ta đã thấy toán tử `and` được sử dụng để nhóm một _loại_ phương tiện với một _tính năng_ phương tiện.
Toán tử `and` cũng có thể kết hợp nhiều media feature trong một media query duy nhất.
Toán tử `not` phủ định một media query, hoặc một media feature khi được sử dụng với dấu ngoặc, về cơ bản đảo ngược ý nghĩa thông thường của chúng.
Toán tử `or` có thể, trong các điều kiện nhất định, được sử dụng để kết hợp nhiều media feature trong một media query duy nhất.
Cuối cùng, toán tử `only` được sử dụng để ngăn các trình duyệt cũ hơn áp dụng style mà không đánh giá các biểu thức media feature nhưng nó không có hiệu lực trong các trình duyệt hiện đại.

> [!NOTE]
> Trong hầu hết các trường hợp, media type `all` được sử dụng theo mặc định khi không có loại nào khác được chỉ định.
> Tuy nhiên, nếu bạn sử dụng toán tử `only`, bạn phải chỉ định rõ ràng một media type. Bạn có thể thấy `only screen` hoặc `only print` như một tổng thể.

### Kết hợp nhiều loại hoặc tính năng

Từ khóa `and` kết hợp một media feature với một media type _hoặc_ các media feature khác.
Ví dụ này kết hợp hai media feature để hạn chế style cho các thiết bị có orientation ngang với chiều rộng ít nhất là 30 em:

```css
@media (width >= 30em) and (orientation: landscape) {
  /* … */
}
```

Để giới hạn style cho các thiết bị có màn hình, bạn có thể xích các media feature với media type `screen`:

```css
@media screen and (width >= 30em) and (orientation: landscape) {
  /* … */
}
```

### Kiểm tra nhiều query

Bạn có thể sử dụng danh sách media query phân cách bằng dấu phẩy để áp dụng style khi thiết bị của người dùng khớp với bất kỳ loại phương tiện, tính năng hoặc trạng thái nào.

Quy tắc sau chứa hai media query. Các style của khối sẽ áp dụng nếu thiết bị của người dùng có chiều cao 680px hoặc cao hơn _hoặc_ nếu viewport trình duyệt ở chế độ dọc (chiều cao viewport lớn hơn chiều rộng viewport):

```css
@media (height >= 680px), screen and (orientation: portrait) {
  /* … */
}
```

Trong ví dụ này, nếu người dùng đang in sang PDF và chiều cao trang là 800px, media query trả về true vì thành phần query đầu tiên — kiểm tra xem viewport có chiều cao `680px` hoặc cao hơn — là true.
Tương tự, nếu người dùng đang dùng smartphone ở chế độ dọc với chiều cao viewport là 480px, media query trả về true vì thành phần query thứ hai là true.

Trong danh sách media query phân cách bằng dấu phẩy, các media query riêng lẻ kết thúc tại dấu phẩy hoặc, trong trường hợp media query cuối cùng trong danh sách, tại dấu ngoặc mở (`{`).

### Đảo ngược ý nghĩa của query

Từ khóa `not` đảo ngược ý nghĩa của một media query duy nhất. Ví dụ, các style CSS trong media query này sẽ áp dụng cho mọi thứ _ngoại trừ_ phương tiện in:

```css
@media not print {
  /* … */
}
```

`not` chỉ phủ định media query mà nó được áp dụng. `not`, không có dấu ngoặc đơn, phủ định tất cả các tính năng trong media query mà nó được chứa. Điều này có nghĩa là, trong một danh sách media query phân cách bằng dấu phẩy, mỗi `not` áp dụng cho một query duy nhất mà nó được chứa, áp dụng cho _tất cả_ các tính năng trong query duy nhất đó. Trong ví dụ này, `not` áp dụng cho media query đầu tiên `screen and (color)`, kết thúc tại dấu phẩy đầu tiên:

```css
@media not screen and (color), print and (color) {
  /* … */
}
```

Vì query bắt đầu bằng media type `screen`, bạn _không thể_ bao `screen and (color)` trong dấu ngoặc đơn. Mặt khác, nếu media query của bạn chỉ bao gồm các tính năng, thì bạn _phải_ đặt query trong ngoặc đơn:

```css
@media not ((width > 1000px) and (color)), print and (color) {
  /* … */
}
```

Dấu ngoặc đơn giới hạn các thành phần của query được phủ định. Ví dụ, để chỉ phủ định query `(width > 1000px)`:

```css
@media (not (width > 1000px)) and (color), print and (color) {
  /* … */
}
```

`not` chỉ phủ định query ở bên phải nó. Trong ví dụ này, chúng ta phủ định media feature `hover` nhưng không phủ định media type `screen`:

```css
@media screen and not (hover) {
  /* … */
}
```

`not (hover)` khớp nếu thiết bị không có khả năng hover. Trong trường hợp này, do thứ tự của nó, `not` áp dụng cho `hover` nhưng không phải cho `screen`.

### Cải thiện khả năng tương thích với trình duyệt cũ

Từ khóa `only` ngăn các trình duyệt cũ hơn không hỗ trợ media query với media feature áp dụng các style đã cho.
_Nó không có hiệu lực trên các trình duyệt hiện đại._

```css
@media only screen and (color) {
  /* … */
}
```

### Kiểm tra nhiều tính năng với `or`

Bạn có thể sử dụng `or` để kiểm tra sự khớp trong số nhiều hơn một tính năng, phân giải thành `true` nếu bất kỳ tính năng nào là true.
Ví dụ, query sau kiểm tra các thiết bị có màn hình đơn sắc hoặc khả năng hover:

```css
@media (not (color)) or (hover) {
  /* … */
}
```

Lưu ý rằng bạn không thể sử dụng toán tử `or` ở cùng cấp với các toán tử `and` và `not`. Bạn có thể phân cách các media feature bằng dấu phẩy hoặc sử dụng dấu ngoặc đơn để nhóm các biểu thức con của media feature để làm rõ thứ tự đánh giá.

Ví dụ, các query sau đây đều hợp lệ:

```css
@media ((color) and (hover)) or (monochrome) {
  /* … */
}

/* or */
@media (color) and (hover), (monochrome) {
  /* … */
}
```

## Xem thêm

- [@media](/en-US/docs/Web/CSS/Reference/At-rules/@media)
- [Container queries](/en-US/docs/Web/CSS/Guides/Containment/Container_queries)
- [Kiểm tra media query theo chương trình](/en-US/docs/Web/CSS/Guides/Media_queries/Testing)
- [CSS Animations Between Media Queries](https://davidwalsh.name/animate-media-queries)
- [Extended Mozilla media features](/en-US/docs/Web/CSS/Reference/Mozilla_extensions#media_features)
- [Extended WebKit media features](/en-US/docs/Web/CSS/Reference/Webkit_extensions#media_features)
