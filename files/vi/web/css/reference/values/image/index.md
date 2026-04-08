---
title: <image>
slug: Web/CSS/Reference/Values/image
page-type: css-type
browser-compat: css.types.image
sidebar: cssref
---

Kiểu dữ liệu **`<image>`** của [CSS](/vi/docs/Web/CSS) đại diện cho một hình ảnh hai chiều.

## Cú pháp

Kiểu dữ liệu `<image>` có thể được biểu diễn bằng bất kỳ cách nào sau đây:

- Một hình ảnh được biểu thị bởi kiểu dữ liệu {{cssxref("url_value", "&lt;url&gt;")}}
- Một kiểu dữ liệu {{cssxref("gradient")}}
- Một phần của trang web, được xác định bởi hàm {{CSSxRef("element","element()")}}
- Một hình ảnh, đoạn hình ảnh hoặc mảng màu đồng nhất, được xác định bởi hàm {{CSSxRef("image/image","image()")}}
- Sự kết hợp của hai hoặc nhiều hình ảnh được xác định bởi hàm {{CSSxRef("cross-fade","cross-fade()")}}.
- Một lựa chọn hình ảnh được chọn dựa trên độ phân giải được xác định bởi hàm {{CSSxRef("image/image-set","image-set()")}}.
- Được tạo bởi một [paint worklet](/vi/docs/Web/API/CSS_Painting_API) với hàm {{CSSxRef("image/paint","paint()")}}.

## Mô tả

CSS có thể xử lý các loại hình ảnh sau:

- Hình ảnh có _kích thước cố hữu_ (kích thước tự nhiên), như JPEG, PNG, hoặc [định dạng raster](https://en.wikipedia.org/wiki/Raster_graphics) khác.
- Hình ảnh có _nhiều kích thước cố hữu_, tồn tại trong nhiều phiên bản bên trong một tệp duy nhất, như một số định dạng .ico. (Trong trường hợp này, kích thước cố hữu sẽ là kích thước của hình ảnh lớn nhất về diện tích và có {{glossary("aspect ratio")}} gần nhất với hộp chứa.)
- Hình ảnh không có kích thước cố hữu nhưng có _tỉ lệ khung hình cố hữu_ giữa chiều rộng và chiều cao, như SVG hoặc [định dạng vector](https://en.wikipedia.org/wiki/Vector_graphics) khác.
- Hình ảnh không có _cả kích thước cố hữu lẫn tỉ lệ khung hình cố hữu_, như gradient CSS.

CSS xác định _kích thước cụ thể_ của một đối tượng bằng cách sử dụng (1) _kích thước cố hữu_ của nó; (2) _kích thước được chỉ định_, được xác định bởi các thuộc tính CSS như {{CSSxRef("width")}}, {{CSSxRef("height")}}, hoặc {{CSSxRef("background-size")}}; và (3) _kích thước mặc định_, được xác định bởi loại thuộc tính mà hình ảnh được sử dụng:

| Loại đối tượng (Thuộc tính CSS)                                                              | Kích thước đối tượng mặc định                                                                                             |
| -------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| {{CSSxRef("background-image")}}                                                              | Kích thước của vùng định vị nền của phần tử                                                                               |
| {{CSSxRef("list-style-image")}}                                                              | Kích thước của ký tự `1em`                                                                                                |
| {{CSSxRef("border-image-source")}}                                                           | Kích thước của vùng hình ảnh viền của phần tử                                                                             |
| {{CSSxRef("cursor")}}                                                                        | Kích thước do trình duyệt xác định phù hợp với kích thước con trỏ thông thường trên hệ thống của máy khách               |
| {{CSSxRef("mask-image")}}                                                                    | ?                                                                                                                         |
| {{CSSxRef("shape-outside")}}                                                                 | ?                                                                                                                         |
| {{CSSxRef("mask-border-source")}}                                                            | ?                                                                                                                         |
| {{cssxref("symbols()")}} cho @counter-style                                                  | Tính năng có nguy cơ. Nếu được hỗ trợ, kích thước do trình duyệt xác định phù hợp với kích thước con trỏ thông thường    |
| {{CSSxRef("content")}} cho pseudo-element ({{CSSxRef("::after")}}/{{CSSxRef("::before")}}) | Hình chữ nhật 300px × 150px                                                                                               |

Kích thước đối tượng cụ thể được tính bằng thuật toán sau:

- Nếu kích thước được chỉ định xác định _cả chiều rộng và chiều cao_, các giá trị này được sử dụng làm kích thước đối tượng cụ thể.
- Nếu kích thước được chỉ định chỉ xác định _chiều rộng hoặc chỉ chiều cao_, giá trị còn thiếu được xác định bằng tỉ lệ cố hữu nếu có, kích thước cố hữu nếu giá trị được chỉ định khớp, hoặc kích thước đối tượng mặc định cho giá trị còn thiếu đó.
- Nếu kích thước được chỉ định không xác định _cả chiều rộng lẫn chiều cao_, kích thước đối tượng cụ thể được tính để khớp với tỉ lệ khung hình cố hữu của hình ảnh nhưng không vượt quá kích thước đối tượng mặc định theo bất kỳ chiều nào. Nếu hình ảnh không có tỉ lệ khung hình cố hữu, tỉ lệ khung hình cố hữu của đối tượng mà nó áp dụng được sử dụng; nếu đối tượng này không có, chiều rộng hoặc chiều cao còn thiếu được lấy từ kích thước đối tượng mặc định.

> [!NOTE]
> Không phải tất cả các trình duyệt đều hỗ trợ mọi loại hình ảnh trên mọi thuộc tính. Xem [phần khả năng tương thích trình duyệt](#browser_compatibility) để biết chi tiết.

## Khả năng tiếp cận

Các trình duyệt không cung cấp bất kỳ thông tin đặc biệt nào về hình ảnh nền cho công nghệ hỗ trợ. Điều này quan trọng chủ yếu đối với trình đọc màn hình, vì trình đọc màn hình sẽ không thông báo sự hiện diện của nó và do đó không truyền đạt bất cứ điều gì cho người dùng. Nếu hình ảnh chứa thông tin quan trọng để hiểu mục đích tổng thể của trang, tốt hơn là mô tả nó theo cách ngữ nghĩa trong tài liệu.

- [MDN Understanding WCAG, Guideline 1.1 explanations](/vi/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.1_—_providing_text_alternatives_for_non-text_content)
- [Understanding Success Criterion 1.1.1 | W3C Understanding WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/text-equiv-all.html)

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Hình ảnh hợp lệ

```css example-good
url("test.jpg")               /* Một <url>, miễn là test.jpg là hình ảnh thực */
linear-gradient(blue, red)  /* Một <gradient> */
element(#real-id)            /* Một phần của trang web, được tham chiếu bằng hàm element(),
                               nếu "real-id" là một ID tồn tại trên trang */
image(ltr "arrow.png#xywh=0,0,16,16", red)
                            /* Phần 16x16 của <url>, bắt đầu từ góc trên, trái của hình ảnh gốc
                               miễn là arrow.png là hình ảnh được hỗ trợ, nếu không thì một mảng màu đỏ.
                               Nếu ngôn ngữ là rtl, hình ảnh sẽ bị lật ngang. */
cross-fade(20% url("twenty.png"), url("eighty.png"))
                            /* hình ảnh cross faded, với twenty có 20% độ mờ
                               và eighty có 80% độ mờ. */
image-set("test.jpg' 1x, 'test-2x.jpg" 2x)
                            /* lựa chọn hình ảnh với độ phân giải khác nhau */
```

### Hình ảnh không hợp lệ

```css example-bad
"no-url.jpg"           /* File hình ảnh phải được định nghĩa bằng hàm url(). */
url("report.pdf")      /* File được trỏ đến bởi hàm url() phải là hình ảnh. */
element(#fakeid)     /* ID phần tử phải là ID tồn tại trên trang. */
image(z.jpg#xy=0,0)  /* Fragment không gian phải được viết theo định dạng xywh=#,#,#,# */
image-set("cat.jpg" 1x, "dog.jpg" 1x) /* mọi hình ảnh trong image set phải có độ phân giải khác nhau */
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("gradient")}}
- {{CSSxRef("element","element()")}}
- {{CSSxRef("image/image", "image()")}}
- {{CSSxRef("image/image-set","image-set()")}}
- {{CSSxRef("cross-fade","cross-fade()")}}
