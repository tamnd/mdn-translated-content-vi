---
title: <meta name="viewport">
short-title: viewport
slug: Web/HTML/Reference/Elements/meta/name/viewport
page-type: html-attribute-value
browser-compat: html.elements.meta.name.viewport
sidebar: htmlsidebar
---

Giá trị **`viewport`** cho thuộc tính [`name`](/en-US/docs/Web/HTML/Reference/Elements/meta/name) của phần tử {{htmlelement("meta")}} cung cấp gợi ý về cách {{glossary("viewport")}} nên được định kích thước.

Nếu được chỉ định, bạn xác định các hành vi liên quan đến viewport bằng cách sử dụng thuộc tính [`content`](/en-US/docs/Web/HTML/Reference/Elements/meta#content) trong phần tử `<meta>` dưới dạng danh sách phân tách bằng dấu phẩy gồm một hoặc nhiều giá trị.

## Ghi chú sử dụng

Một phần tử `<meta name="viewport">` có các thuộc tính bổ sung sau:

- [`content`](/en-US/docs/Web/HTML/Reference/Elements/meta#content)
  - : Thuộc tính `content` phải được xác định và giá trị của nó đặt các hành vi liên quan đến viewport khác nhau.
    Giá trị của nó là danh sách phân tách bằng dấu phẩy gồm một hoặc nhiều cặp khóa-giá trị được chỉ định dưới dạng `key=value`. Các khóa sau được xác định:
    - `width`
      - : Kiểm soát độ rộng pixel (tối thiểu) của viewport (xem [chiều rộng viewport và chiều rộng màn hình](#viewport_width_and_screen_width)). Có thể được đặt thành một số nguyên dương tính bằng pixel từ 1 đến 10000 (như `width=600`) hoặc thành giá trị đặc biệt `device-width`, là kích thước vật lý của màn hình thiết bị tính bằng pixel CSS. Giá trị này thiết lập giá trị của đơn vị [`vw`](/en-US/docs/Web/CSS/Reference/Values/length#relative_length_units_based_on_viewport).
    - `height`
      - : Kiểm soát chiều cao pixel (tối thiểu) của viewport (xem [chiều rộng viewport và chiều rộng màn hình](#viewport_width_and_screen_width)). Có thể được đặt thành một số nguyên dương tính bằng pixel từ 1 đến 10000 (như `height=400`) hoặc thành giá trị đặc biệt `device-height`, là kích thước vật lý của màn hình thiết bị tính bằng pixel CSS. Giá trị này thiết lập giá trị của đơn vị [`vh`](/en-US/docs/Web/CSS/Reference/Values/length#relative_length_units_based_on_viewport).
    - `initial-scale`
      - : Xác định tỷ lệ giữa chiều rộng thiết bị (`device-width` ở chế độ dọc hoặc `device-height` ở chế độ ngang) và kích thước viewport.
        Có thể là một số từ `0.0` đến `10.0`.
    - `maximum-scale`
      - : Xác định mức phóng to tối đa.
        Phải lớn hơn hoặc bằng `minimum-scale` hoặc hành vi không xác định.
        Cài đặt trình duyệt có thể bỏ qua quy tắc này, và iOS10+ bỏ qua nó theo mặc định.
        Có thể là một số từ `0.0` đến `10.0`.
    - `minimum-scale`
      - : Xác định mức thu nhỏ tối thiểu.
        Phải nhỏ hơn hoặc bằng `maximum-scale` hoặc hành vi không xác định.
        Cài đặt trình duyệt có thể bỏ qua quy tắc này, và iOS10+ bỏ qua nó theo mặc định.
        Có thể là một số từ `0.0` đến `10.0`.
    - `user-scalable`
      - : Một boolean chỉ ra liệu người dùng có thể phóng to trang web hay không.
        Cài đặt trình duyệt có thể bỏ qua quy tắc này, và iOS10+ bỏ qua nó theo mặc định.
        Có thể là `yes` hoặc `no`, mặc định là `yes`.
        > [!WARNING]
        > Việc vô hiệu hóa khả năng phóng to bằng cách đặt `user-scalable` thành giá trị `no` ngăn người dùng bị suy giảm thị lực có thể đọc và hiểu nội dung trang. Ngoài ra, WCAG yêu cầu tối thiểu 2× tỷ lệ; tuy nhiên, thực hành tốt nhất là cho phép zoom 5×. Để biết thêm thông tin, hãy xem:
        >
        > - [Hướng dẫn MDN về WCAG, Giải thích Hướng dẫn 1.4](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.4_make_it_easier_for_users_to_see_and_hear_content_including_separating_foreground_from_background)
        > - [Understanding Success Criterion 1.4.4 | W3C Understanding WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-scale.html)
    - `interactive-widget`
      - : Chỉ định hiệu ứng mà các widget UI tương tác, chẳng hạn như bàn phím ảo, có trên viewport của trang.
        Có thể là từ khóa `resizes-visual`, `resizes-content`, hoặc `overlays-content`.
        - `resizes-visual`: {{Glossary("visual viewport")}} được thay đổi kích thước bởi widget tương tác. Đây là mặc định.
        - `resizes-content`: {{Glossary("viewport")}} được thay đổi kích thước bởi widget tương tác.
        - `overlays-content`: Cả viewport lẫn visual viewport đều không bị thay đổi kích thước bởi widget tương tác.

        Khi {{Glossary("viewport")}} được thay đổi kích thước, [khối chứa](/en-US/docs/Web/CSS/Guides/Display/Containing_block) ban đầu cũng được thay đổi kích thước, từ đó ảnh hưởng đến kích thước được tính toán của [các đơn vị viewport](/en-US/docs/Web/CSS/Reference/Values/length#relative_length_units_based_on_viewport).

    - `viewport-fit`
      - : Xác định các phần có thể xem của trang web.
        Có thể là một trong các từ khóa `auto`, `contain`, hoặc `cover`.
        - `auto`: Không ảnh hưởng đến viewport bố cục ban đầu, và toàn bộ trang web có thể xem được.
        - `contain`: Viewport được thu nhỏ để vừa với hình chữ nhật lớn nhất được nội tiếp trong màn hình.
        - `cover`: Viewport được thu phóng để lấp đầy màn hình thiết bị.
          Rất khuyến nghị sử dụng các biến [safe area inset](/en-US/docs/Web/CSS/Reference/Values/env) để đảm bảo nội dung quan trọng không bị che khuất ngoài màn hình.

### Chiều rộng viewport và chiều rộng màn hình

{{glossary("viewport")}} của trình duyệt là khu vực của cửa sổ mà nội dung web có thể được nhìn thấy. Kích thước viewport cần được tính toán trước khi nội dung của trang có thể được bố cục — trang có thể tràn khỏi viewport, trong trường hợp đó trình duyệt cung cấp các thanh cuộn để người dùng cuộn xung quanh và truy cập toàn bộ nội dung, nhưng kích thước viewport là hướng dẫn cho việc bao nhiêu không gian, đặc biệt là theo chiều ngang, nội dung nên vừa vào.

Một số thiết bị di động và các màn hình hẹp khác hiển thị các trang trong một cửa sổ hoặc viewport ảo rộng hơn màn hình, và sau đó thu nhỏ kết quả được hiển thị để vừa với kích thước màn hình. Người dùng sau đó có thể phóng to và di chuyển để xem xét kỹ hơn các khu vực khác nhau của trang. Ví dụ, nếu một màn hình di động có chiều rộng 640px, các trang có thể được hiển thị với viewport ảo là 980px, và sau đó sẽ được thu nhỏ để vừa với không gian 640px. Điều này được thực hiện vì không phải tất cả các trang đều được tối ưu hóa cho thiết bị di động và bị hỏng (hoặc ít nhất là trông xấu) khi được hiển thị ở chiều rộng viewport nhỏ. Viewport ảo này là một cách để làm cho các trang không được tối ưu hóa cho thiết bị di động trông tốt hơn trên các thiết bị màn hình hẹp. Tuy nhiên, cơ chế này không tốt lắm cho các trang được tối ưu hóa cho màn hình hẹp bằng cách sử dụng [media queries](/en-US/docs/Web/CSS/Guides/Media_queries) — nếu viewport ảo là 980px chẳng hạn, các media query kích hoạt ở 640px hoặc 480px hoặc ít hơn sẽ không bao giờ được sử dụng, hạn chế hiệu quả của các kỹ thuật thiết kế đáp ứng như vậy. Phần tử `<meta>` viewport giảm thiểu vấn đề này về viewport ảo trên các thiết bị màn hình hẹp.

Cài đặt phổ biến nhất là như sau, đặt viewport để khớp với chiều rộng của thiết bị và hiển thị nội dung ở mức zoom 100%:

```html
<meta name="viewport" content="width=device-width, initial-scale=1" />
```

Các trang có thể đặt viewport của chúng thành một kích thước cụ thể. Ví dụ, định nghĩa `"width=320, initial-scale=1"` có thể được sử dụng để vừa chính xác vào màn hình điện thoại nhỏ ở chế độ dọc. Điều này có thể gây ra vấn đề khi trình duyệt hiển thị một trang ở kích thước lớn hơn. Để khắc phục điều này, các trình duyệt sẽ mở rộng chiều rộng viewport nếu cần thiết để lấp đầy màn hình ở tỷ lệ được yêu cầu. Điều này đặc biệt hữu ích trên các thiết bị màn hình lớn.

Đối với các trang đặt tỷ lệ ban đầu hoặc tỷ lệ tối đa, điều này có nghĩa là thuộc tính `width` thực sự chuyển thành chiều rộng viewport _tối thiểu_. Ví dụ, nếu bố cục của bạn cần ít nhất 500 pixel chiều rộng thì bạn có thể sử dụng markup sau. Khi màn hình rộng hơn 500 pixel, trình duyệt sẽ mở rộng viewport (thay vì phóng to) để vừa với màn hình:

```html
<meta name="viewport" content="width=500, initial-scale=1" />
```

### Mật độ màn hình

Độ phân giải màn hình đã tăng lên đến mức các pixel riêng lẻ không thể phân biệt được bằng mắt người. Ví dụ, smartphone thường có màn hình nhỏ với độ phân giải lên đến 1920–1080 pixel (≈400dpi). Do đó, nhiều trình duyệt có thể hiển thị các trang của chúng ở kích thước vật lý nhỏ hơn bằng cách dịch nhiều pixel phần cứng cho mỗi "pixel" CSS. Ban đầu, điều này gây ra vấn đề về khả năng sử dụng và khả năng đọc trên nhiều trang web được tối ưu hóa cho cảm ứng.

Trên màn hình dpi cao, các trang có `initial-scale=1` sẽ thực sự được phóng to bởi các trình duyệt. Văn bản của chúng sẽ mượt mà và sắc nét, nhưng hình ảnh bitmap có thể không tận dụng được độ phân giải màn hình đầy đủ. Để có được hình ảnh sắc nét hơn trên các màn hình này, các nhà phát triển web có thể muốn thiết kế hình ảnh — hoặc toàn bộ bố cục — ở tỷ lệ cao hơn so với kích thước cuối cùng của chúng và sau đó thu nhỏ chúng bằng CSS hoặc các thuộc tính viewport.

Tỷ lệ pixel mặc định phụ thuộc vào mật độ hiển thị. Trên màn hình có mật độ nhỏ hơn 200dpi, tỷ lệ là 1.0. Trên màn hình có mật độ từ 200 đến 300dpi, tỷ lệ là 1.5. Đối với màn hình có mật độ trên 300dpi, tỷ lệ là phần nguyên (_mật độ_/150dpi). Lưu ý rằng tỷ lệ mặc định chỉ đúng khi tỷ lệ viewport bằng 1. Nếu không, mối quan hệ giữa các pixel CSS và {{glossary("device pixel", "pixel thiết bị")}} phụ thuộc vào mức zoom hiện tại.

## Ví dụ

### Sử dụng kích thước meta viewport

Ví dụ sau đây cho biết với trình duyệt rằng trang nên được hiển thị ở chiều rộng thiết bị:

```html
<meta name="viewport" content="width=device-width" />
```

### Sử dụng media query với meta viewport

Giá trị `content` sau sử dụng nhiều từ khóa gợi ý với trình duyệt để sử dụng chế độ toàn màn hình, cùng với `viewport-fit`, giúp tránh các vết cắt màn hình như các notch thiết bị di động:

```html
<meta
  name="viewport"
  content="width=device-width, initial-scale=1.0, viewport-fit=cover" />
```

### Hiệu ứng của các widget UI tương tác

Các widget UI tương tác của trình duyệt có thể ảnh hưởng đến kích thước viewport của trang. Widget UI phổ biến nhất như vậy là bàn phím ảo. Để kiểm soát hành vi thay đổi kích thước nào mà trình duyệt nên sử dụng, hãy đặt thuộc tính `interactive-widget`.

Theo mặc định, bàn phím ảo chỉ thay đổi kích thước visual viewport, điều này không ảnh hưởng đến bố cục của trang. Bạn có thể làm cho bố cục trang thích nghi với sự hiện diện của bàn phím ảo bằng cách đặt thuộc tính `interactive-widget` thành `resizes-content`:

```html
<meta name="viewport" content="interactive-widget=resizes-content" />
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuật ngữ {{glossary("viewport")}}
- [Chuẩn bị cho các thay đổi hành vi thay đổi kích thước viewport sắp có trong Chrome trên Android](https://developer.chrome.com/blog/viewport-resize-behavior/) trên developer.chrome.com
- [Viewport di động cho trải nghiệm đáp ứng](https://experienceleague.adobe.com/en/docs/target/using/experiences/vec/mobile-viewports) trên Adobe Experience League
