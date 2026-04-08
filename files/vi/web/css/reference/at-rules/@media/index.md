---
title: "@media"
slug: Web/CSS/Reference/At-rules/@media
page-type: css-at-rule
browser-compat: css.at-rules.media
sidebar: cssref
---

At-rule **`@media`** [CSS](/en-US/docs/Web/CSS) [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) có thể được dùng để áp dụng một phần của stylesheet dựa trên kết quả của một hoặc nhiều [media query](/en-US/docs/Web/CSS/Guides/Media_queries/Using). Với nó, bạn chỉ định một media query và một khối CSS để áp dụng cho tài liệu khi và chỉ khi media query khớp với thiết bị mà nội dung đang được sử dụng.

> [!NOTE]
> Trong JavaScript, các quy tắc được tạo bằng `@media` có thể được truy cập với giao diện mô hình đối tượng CSS {{domxref("CSSMediaRule")}}.

{{InteractiveExample("CSS Demo: @media", "tabbed-standard")}}

```css interactive-example
abbr {
  color: #860304;
  font-weight: bold;
  transition: color 0.5s ease;
}

@media (hover: hover) {
  abbr:hover {
    color: #001ca8;
    transition-duration: 0.5s;
  }
}

@media not all and (hover: hover) {
  abbr::after {
    content: " (" attr(title) ")";
  }
}
```

```html interactive-example
<p>
  <abbr title="National Aeronautics and Space Administration">NASA</abbr> is a
  U.S. government agency that is responsible for science and technology related
  to air and space.
</p>
```

## Cú pháp

```css
/* At the top level of your code */
@media screen and (width >= 900px) {
  article {
    padding: 1rem 3rem;
  }
}

/* Nested within another conditional at-rule */
@supports (display: flex) {
  @media screen and (width >= 900px) {
    article {
      display: flex;
    }
  }
}
```

At-rule `@media` có thể được đặt ở cấp cao nhất của code hoặc lồng bên trong bất kỳ conditional group at-rule nào khác.

Để thảo luận về cú pháp media query, hãy xem [Using media queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using#syntax).

## Mô tả

`<media-query-list>` của media query bao gồm [`<media-type>`s](#media_types), [`<media-feature>s`](#media_features), và [toán tử logic](#logical_operators).

### Loại phương tiện

_`<media-type>`_ mô tả danh mục chung của thiết bị.
Trừ khi sử dụng toán tử logic `only`, loại phương tiện là tùy chọn và kiểu `all` được ngầm hiểu.

- `all`
  - : Phù hợp với tất cả các thiết bị.
- `print`
  - : Dành cho tài liệu phân trang và các tài liệu được xem trên màn hình ở chế độ xem trước khi in. (Hãy xem [paged media](/en-US/docs/Web/CSS/Guides/Paged_media) để biết thông tin về các vấn đề định dạng cụ thể cho các định dạng này.)
- `screen`
  - : Dành chủ yếu cho màn hình.

> [!NOTE]
> CSS2.1 và [Media Queries 3](https://drafts.csswg.org/mediaqueries-3/#background) đã xác định một số loại phương tiện bổ sung (`tty`, `tv`, `projection`, `handheld`, `braille`, `embossed`, và `aural`), nhưng chúng đã bị phản đối trong [Media Queries 4](https://drafts.csswg.org/mediaqueries/#media-types) và không nên được sử dụng.

### Tính năng phương tiện

_`<media feature>`_ mô tả các đặc điểm cụ thể của {{glossary("user agent")}}, thiết bị đầu ra, hoặc môi trường.
Các biểu thức tính năng phương tiện kiểm tra sự hiện diện, giá trị, hoặc phạm vi giá trị của chúng, và hoàn toàn tùy chọn. Mỗi biểu thức tính năng phương tiện phải được bao quanh bởi dấu ngoặc đơn.

- {{cssxref("@media/any-hover", "any-hover")}}
  - : Có cơ chế đầu vào nào có sẵn cho phép người dùng di chuột qua các phần tử không?
- {{cssxref("@media/any-pointer", "any-pointer")}}
  - : Có bất kỳ cơ chế đầu vào có sẵn nào là thiết bị trỏ không, và nếu có, nó chính xác đến mức nào?
- {{cssxref("@media/aspect-ratio", "aspect-ratio")}}
  - : {{glossary("aspect ratio")}} chiều rộng so với chiều cao của viewport.
- {{cssxref("@media/color", "color")}}
  - : Số bit mỗi thành phần màu của thiết bị đầu ra, hoặc không nếu thiết bị không phải màu.
- {{cssxref("@media/color-gamut", "color-gamut")}}
  - : Phạm vi màu xấp xỉ được hỗ trợ bởi tác nhân người dùng và thiết bị đầu ra.
- {{cssxref("@media/color-index", "color-index")}}
  - : Số mục trong bảng tra cứu màu của thiết bị đầu ra, hoặc không nếu thiết bị không sử dụng bảng đó.
- {{cssxref("@media/device-aspect-ratio", "device-aspect-ratio")}}
  - : Tỷ lệ chiều rộng so với chiều cao của thiết bị đầu ra. Không còn dùng trong Media Queries Level 4.
- {{cssxref("@media/device-height", "device-height")}}
  - : Chiều cao của bề mặt kết xuất của thiết bị đầu ra. Không còn dùng trong Media Queries Level 4.
- {{cssxref("@media/device-posture", "device-posture")}}
  - : Phát hiện tư thế hiện tại của thiết bị, tức là viewport đang ở trạng thái phẳng hay gập. Được định nghĩa trong [Device Posture API](/en-US/docs/Web/API/Device_Posture_API).
- {{cssxref("@media/device-width", "device-width")}}
  - : Chiều rộng của bề mặt kết xuất của thiết bị đầu ra. Không còn dùng trong Media Queries Level 4.
- {{cssxref("@media/display-mode", "display-mode")}}
  - : Chế độ hiển thị của ứng dụng: ví dụ, chế độ [fullscreen](/en-US/docs/Web/CSS/Reference/At-rules/@media/display-mode#fullscreen) hoặc [picture-in-picture](/en-US/docs/Web/CSS/Reference/At-rules/@media/display-mode#picture-in-picture).
    Thêm vào trong Media Queries Level 5.
- {{cssxref("@media/dynamic-range", "dynamic-range")}}
  - : Sự kết hợp của độ sáng, tỷ lệ tương phản, và độ sâu màu được hỗ trợ bởi tác nhân người dùng và thiết bị đầu ra. Thêm vào trong Media Queries Level 5.
- {{cssxref("@media/forced-colors", "forced-colors")}}
  - : Phát hiện xem tác nhân người dùng có hạn chế bảng màu không.
    Thêm vào trong Media Queries Level 5.
- {{cssxref("@media/grid", "grid")}}
  - : Thiết bị sử dụng màn hình grid hay bitmap?
- {{cssxref("@media/height", "height")}}
  - : Chiều cao của viewport.
- {{cssxref("@media/horizontal-viewport-segments", "horizontal-viewport-segments")}}
  - : Phát hiện xem thiết bị có một số lượng phân đoạn viewport nhất định được bố trí theo chiều ngang không.
- {{cssxref("@media/hover", "hover")}}
  - : Cơ chế đầu vào chính có cho phép người dùng di chuột qua các phần tử không?
- {{cssxref("@media/inverted-colors", "inverted-colors")}}
  - : Tác nhân người dùng hoặc hệ điều hành nền tảng có đang đảo ngược màu sắc không?
    Thêm vào trong Media Queries Level 5.
- {{cssxref("@media/monochrome", "monochrome")}}
  - : Bit mỗi pixel trong bộ đệm khung đơn sắc của thiết bị đầu ra, hoặc không nếu thiết bị không phải đơn sắc.
- {{cssxref("@media/orientation", "orientation")}}
  - : Hướng của viewport.
- {{cssxref("@media/overflow-block", "overflow-block")}}
  - : Thiết bị đầu ra xử lý nội dung tràn viewport dọc theo trục block như thế nào?
- {{cssxref("@media/overflow-inline", "overflow-inline")}}
  - : Nội dung tràn viewport dọc theo trục inline có thể cuộn không?
- {{cssxref("@media/pointer", "pointer")}}
  - : Cơ chế đầu vào chính có phải là thiết bị trỏ không, và nếu có, nó chính xác đến mức nào?
- {{cssxref("@media/prefers-color-scheme", "prefers-color-scheme")}}
  - : Phát hiện xem người dùng thích màu sáng hay tối.
    Thêm vào trong Media Queries Level 5.
- {{cssxref("@media/prefers-contrast", "prefers-contrast")}}
  - : Phát hiện xem người dùng có yêu cầu hệ thống tăng hoặc giảm lượng tương phản giữa các màu liền kề không.
    Thêm vào trong Media Queries Level 5.
- {{cssxref("@media/prefers-reduced-data", "prefers-reduced-data")}}
  - : Phát hiện xem người dùng có yêu cầu nội dung web tiêu thụ ít lưu lượng internet hơn không.
- {{cssxref("@media/prefers-reduced-motion", "prefers-reduced-motion")}}
  - : Người dùng thích ít chuyển động hơn trên trang.
    Thêm vào trong Media Queries Level 5.
- {{cssxref("@media/prefers-reduced-transparency", "prefers-reduced-transparency")}}
  - : Phát hiện xem người dùng có bật cài đặt trên thiết bị của họ để giảm các hiệu ứng lớp trong suốt hoặc bán trong suốt được sử dụng trên thiết bị không.
- {{cssxref("@media/resolution", "resolution")}}
  - : Mật độ pixel của thiết bị đầu ra.
- {{cssxref("@media/scan", "scan")}}
  - : Đầu ra hiển thị là lũy tiến hay xen kẽ.
- {{cssxref("@media/scripting", "scripting")}}
  - : Phát hiện xem scripting (tức là JavaScript) có sẵn không.
    Thêm vào trong Media Queries Level 5.
- {{cssxref("@media/shape", "shape")}}
  - : Phát hiện hình dạng của thiết bị để phân biệt màn hình hình chữ nhật và hình tròn.
- {{cssxref("@media/update", "update")}}
  - : Thiết bị đầu ra có thể sửa đổi giao diện nội dung với tần suất bao nhiêu.
- {{cssxref("@media/vertical-viewport-segments", "vertical-viewport-segments")}}
  - : Phát hiện xem thiết bị có một số lượng phân đoạn viewport nhất định được bố trí theo chiều dọc không. Thêm vào trong Media Queries Level 5.
- {{cssxref("@media/video-dynamic-range", "video-dynamic-range")}}
  - : Sự kết hợp của độ sáng, tỷ lệ tương phản, và độ sâu màu được hỗ trợ bởi mặt phẳng video của tác nhân người dùng và thiết bị đầu ra. Thêm vào trong Media Queries Level 5.
- {{cssxref("@media/width", "width")}}
  - : Chiều rộng của viewport bao gồm chiều rộng của thanh cuộn.
- {{cssxref("@media/-moz-device-pixel-ratio", "-moz-device-pixel-ratio")}}
  - : Số pixel thiết bị trên mỗi pixel CSS. Thay vào đó hãy sử dụng tính năng [`resolution`](/en-US/docs/Web/CSS/Reference/At-rules/@media/resolution) với đơn vị `dppx`.
- {{cssxref("@media/-webkit-animation", "-webkit-animation")}}
  - : Trình duyệt hỗ trợ {{cssxref("animation")}} CSS có tiền tố `-webkit`. Thay vào đó hãy sử dụng feature query [`@supports (animation)`](/en-US/docs/Web/CSS/Reference/At-rules/@supports).
- {{cssxref("@media/-webkit-device-pixel-ratio", "-webkit-device-pixel-ratio")}}
  - : Số pixel thiết bị trên mỗi pixel CSS. Thay vào đó hãy sử dụng tính năng [`resolution`](/en-US/docs/Web/CSS/Reference/At-rules/@media/resolution) với đơn vị `dppx`.
- {{cssxref("@media/-webkit-transform-2d", "-webkit-transform-2d")}}
  - : Trình duyệt hỗ trợ {{cssxref("transform")}} CSS 2D có tiền tố `-webkit`. Thay vào đó hãy sử dụng feature query [`@supports (transform)`](/en-US/docs/Web/CSS/Reference/At-rules/@supports).
- {{cssxref("@media/-webkit-transform-3d", "-webkit-transform-3d")}}
  - : Trình duyệt hỗ trợ {{cssxref("transform")}} CSS 3D có tiền tố `-webkit`. Thay vào đó hãy sử dụng feature query [`@supports (transform)`](/en-US/docs/Web/CSS/Reference/At-rules/@supports).
- {{cssxref("@media/-webkit-transition", "-webkit-transition")}}
  - : Trình duyệt hỗ trợ {{cssxref("transition")}} CSS có tiền tố `-webkit`. Thay vào đó hãy sử dụng feature query [`@supports (transition)`](/en-US/docs/Web/CSS/Reference/At-rules/@supports).

### Toán tử logic

Các _toán tử logic_ `not`, `and`, `only`, và `or` có thể được dùng để tạo ra các media query phức tạp.
Bạn cũng có thể kết hợp nhiều media query vào một quy tắc duy nhất bằng cách phân cách chúng bằng dấu phẩy.

- `and`
  - : Được dùng để kết hợp nhiều tính năng phương tiện vào một media query duy nhất, yêu cầu mỗi tính năng được kết hợp phải trả về `true` để query là `true`.
    Nó cũng được dùng để kết hợp các tính năng phương tiện với các loại phương tiện.
- `not`
  - : Được dùng để phủ định một media query, trả về `true` nếu query sẽ trả về `false` nếu không có nó.
    Nếu có trong danh sách các query phân cách bằng dấu phẩy, nó sẽ chỉ phủ định query cụ thể mà nó được áp dụng.

    > [!NOTE]
    > Trong Level 3, từ khóa `not` không thể được dùng để phủ định một biểu thức tính năng phương tiện riêng lẻ, chỉ toàn bộ media query.

- `only`
  - : Áp dụng kiểu dáng chỉ khi toàn bộ query khớp.
    Nó hữu ích để ngăn các trình duyệt cũ hơn áp dụng các kiểu dáng được chọn.
    Khi không sử dụng `only`, các trình duyệt cũ hơn sẽ diễn giải query `screen and (width <= 500px)` là `screen`, bỏ qua phần còn lại của query, và áp dụng các kiểu dáng của nó trên tất cả các màn hình.
    Nếu bạn sử dụng toán tử `only`, bạn _cũng phải_ chỉ định loại phương tiện.
- `,` (dấu phẩy)
  - : Dấu phẩy được dùng để kết hợp nhiều media query vào một quy tắc duy nhất.
    Mỗi query trong danh sách phân cách bằng dấu phẩy được xử lý riêng biệt với nhau.
    Do đó, nếu bất kỳ query nào trong danh sách là `true`, toàn bộ câu lệnh media trả về `true`.
    Nói cách khác, danh sách hoạt động như toán tử logic `or`.
- `or`
  - : Tương đương với toán tử `,`. Thêm vào trong Media Queries Level 4.

### Gợi ý client tác nhân người dùng

Một số media query có các [gợi ý client tác nhân người dùng](/en-US/docs/Web/HTTP/Guides/Client_hints) tương ứng.
Đây là các HTTP header yêu cầu nội dung được tối ưu hóa trước cho yêu cầu phương tiện cụ thể.
Chúng bao gồm {{HTTPHeader("Sec-CH-Prefers-Color-Scheme")}} và {{HTTPHeader("Sec-CH-Prefers-Reduced-Motion")}}.

## Cú pháp chính thức

{{csssyntax}}

## Khả năng tiếp cận

Để phù hợp nhất với những người điều chỉnh kích thước văn bản của trang web, hãy sử dụng [`em`](/en-US/docs/Web/CSS/Guides/Values_and_units/Numeric_data_types) khi bạn cần {{cssxref("&lt;length&gt;")}} cho [media query](/en-US/docs/Web/CSS/Guides/Media_queries/Using) của mình.

Cả [`em`](/en-US/docs/Web/CSS/Guides/Values_and_units/Numeric_data_types) và [`px`](/en-US/docs/Web/CSS/Guides/Values_and_units/Numeric_data_types) đều là các đơn vị hợp lệ, nhưng [`em`](/en-US/docs/Web/CSS/Guides/Values_and_units/Numeric_data_types) hoạt động tốt hơn nếu người dùng thay đổi kích thước văn bản trình duyệt.

Cũng hãy xem xét sử dụng media query hoặc [gợi ý client tác nhân người dùng HTTP](/en-US/docs/Web/HTTP/Guides/Client_hints#user_agent_client_hints) để cải thiện trải nghiệm người dùng.
Ví dụ, media query [`prefers-reduced-motion`](/en-US/docs/Web/CSS/Reference/At-rules/@media/prefers-reduced-motion) hoặc HTTP header tương đương {{HTTPHeader("Sec-CH-Prefers-Reduced-Motion")}}) có thể được dùng để giảm thiểu lượng hoạt ảnh hoặc chuyển động được sử dụng dựa trên tùy chọn của người dùng.

## Bảo mật

Vì media query cung cấp thông tin về các khả năng — và theo đó, các tính năng và thiết kế — của thiết bị mà người dùng đang làm việc, có khả năng chúng có thể bị lạm dụng để xây dựng một ["dấu vân tay"](/en-US/docs/Glossary/Fingerprinting) nhận dạng thiết bị, hoặc ít nhất là phân loại nó ở một mức độ chi tiết nhất định có thể không mong muốn đối với người dùng.

Do khả năng này, trình duyệt có thể chọn làm mờ các giá trị được trả về theo một cách nào đó để ngăn chúng được sử dụng để nhận dạng chính xác một máy tính. Trình duyệt cũng có thể cung cấp các biện pháp bổ sung trong lĩnh vực này; ví dụ, nếu cài đặt "Resist Fingerprinting" của Firefox được bật, nhiều media query báo cáo các giá trị mặc định thay vì các giá trị đại diện cho trạng thái thiết bị thực tế.

## Ví dụ

### Kiểm tra loại phương tiện in ấn và màn hình

```css
@media print {
  body {
    font-size: 10pt;
  }
}

@media screen {
  body {
    font-size: 13px;
  }
}

@media screen, print {
  body {
    line-height: 1.2;
  }
}
```

Cú pháp phạm vi cho phép các media query ít dài dòng hơn khi kiểm tra bất kỳ tính năng nào chấp nhận một phạm vi, như được hiển thị trong các ví dụ bên dưới:

```css
@media (height > 600px) {
  body {
    line-height: 1.4;
  }
}

@media (400px <= width <= 700px) {
  body {
    line-height: 1.4;
  }
}
```

Để xem thêm ví dụ, hãy xem [Using media queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Module [CSS media queries](/en-US/docs/Web/CSS/Guides/Media_queries)
- [Using media queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
- Giao diện {{domxref("CSSMediaRule")}}
- At-rule CSS {{cssxref("@custom-media")}}
- [Extended Mozilla media features](/en-US/docs/Web/CSS/Reference/Mozilla_extensions#media_features)
- [Extended WebKit media features](/en-US/docs/Web/CSS/Reference/Webkit_extensions#media_features)
