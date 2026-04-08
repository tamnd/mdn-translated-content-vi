---
title: Applying color to HTML elements using CSS
short-title: Applying color
slug: Web/CSS/Guides/Colors/Applying_color
page-type: guide
sidebar: cssref
---

Với [CSS](/en-US/docs/Web/CSS), có rất nhiều cách để thêm màu sắc vào các [phần tử](/en-US/docs/Web/HTML/Reference/Elements) [HTML](/en-US/docs/Web/HTML) nhằm tạo ra giao diện mong muốn. Hướng dẫn này là phần giới thiệu về cách CSS có thể được sử dụng để áp dụng màu sắc cho các phần tử HTML. Hướng dẫn này bao gồm [danh sách các thuộc tính CSS thiết lập màu trong giá trị của chúng](#các_thuộc_tính_có_thể_có_màu) và cách sử dụng màu sắc cả [trong stylesheet](#chỉ_định_màu_sắc_làm_giá_trị_trong_stylesheet) lẫn [theo các cách khác](#các_cách_khác_để_sử_dụng_màu_sắc).

> [!NOTE]
> Điều quan trọng là [sử dụng màu sắc một cách khôn ngoan](/en-US/docs/Web/CSS/Guides/Colors/Using_color_wisely). Luôn chọn màu phù hợp, đảm bảo độ tương phản giữa văn bản và nền đủ để đảm bảo khả năng đọc, và luôn lưu ý đến nhu cầu của những người có khả năng thị giác khác nhau.

Để tìm hiểu thêm về màu sắc CSS là kiểu dữ liệu, xem tài liệu tham chiếu [kiểu dữ liệu CSS `<color>`](/en-US/docs/Web/CSS/Reference/Values/color_value) và [hướng dẫn giá trị màu CSS](/en-US/docs/Web/CSS/Guides/Colors/Color_values).

## Các thuộc tính có thể có màu

Ở cấp độ phần tử, mọi thứ trong HTML đều có thể được áp dụng màu sắc. Hãy xem các mục khác nhau được hiển thị trên trang — như văn bản, đường viền, v.v. Chúng tôi sẽ cung cấp danh sách các thuộc tính CSS áp dụng màu sắc cho từng mục.

Ở cấp độ cơ bản, thuộc tính {{cssxref("color")}} xác định màu nền trước của nội dung phần tử HTML và thuộc tính {{cssxref("background-color")}} xác định màu nền của phần tử. Chúng có thể được sử dụng trên hầu hết mọi phần tử.

### Văn bản

Bất cứ khi nào một phần tử được hiển thị, các thuộc tính này được sử dụng để xác định màu của văn bản, nền của nó và bất kỳ trang trí nào trên văn bản.

- {{cssxref("color")}}
  - : Màu sử dụng khi vẽ văn bản và bất kỳ [trang trí văn bản](/en-US/docs/Learn_web_development/Core/Text_styling/Fundamentals#font_style_font_weight_text_transform_and_text_decoration) nào (chẳng hạn như thêm gạch dưới hoặc gạch trên, gạch ngang, v.v.).

- {{cssxref("background-color")}}
  - : Màu nền của văn bản.

- {{cssxref("text-shadow")}}
  - : Cấu hình hiệu ứng bóng đổ áp dụng cho văn bản. Trong số các tùy chọn cho bóng có màu cơ sở của bóng (sau đó được làm mờ và pha trộn với nền dựa trên các thông số khác). Xem [Text drop shadows](/en-US/docs/Learn_web_development/Core/Text_styling/Fundamentals#text_drop_shadows) để tìm hiểu thêm.

- {{cssxref("text-decoration-color")}}
  - : Màu mặc định của các trang trí văn bản (như gạch chân, gạch ngang, v.v.) là [`currentColor`](/en-US/docs/Web/CSS/Reference/Values/color_value#currentcolor_keyword). Từ khóa này đại diện cho giá trị hiện tại của thuộc tính `color`. Tuy nhiên, bạn có thể ghi đè giá trị đó và sử dụng màu khác cho chúng bằng thuộc tính `text-decoration-color`.

- {{cssxref("text-emphasis-color")}}
  - : Màu sử dụng khi hiển thị các ký hiệu nhấn mạnh bên cạnh mỗi ký tự trong văn bản. Điều này chủ yếu được sử dụng khi vẽ văn bản cho các ngôn ngữ Đông Á.

- {{cssxref("caret-color")}}
  - : Màu sử dụng khi vẽ {{Glossary("caret")}} (đôi khi được gọi là con trỏ nhập văn bản) bên trong phần tử. Điều này chỉ hữu ích trong các phần tử có thể chỉnh sửa, chẳng hạn như {{HTMLElement("input")}} và {{HTMLElement("textarea")}} hoặc các phần tử có thuộc tính HTML [`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable) được đặt thành `true`.

### Hộp

Mỗi phần tử là một hộp với một số loại nội dung, và có nền và đường viền ngoài bất kỳ nội dung nào hộp có thể chứa.

- [Đường viền](#đường_viền_2)
  - : Xem phần [Đường viền](#đường_viền_2) để biết danh sách các thuộc tính CSS bạn có thể sử dụng để đặt màu cho đường viền của hộp.

- {{cssxref("background-color")}}
  - : Màu nền sử dụng trong các vùng của phần tử không có nội dung nền trước.

- {{cssxref("box-shadow")}}
  - : Cấu hình các hiệu ứng bóng đổ inset và drop shadow trên hộp. Trong số các tùy chọn cho mỗi bóng có màu cơ sở của bóng (sau đó được làm mờ và pha trộn với bất kỳ nền nào dựa trên các thông số khác).

- {{cssxref("column-rule-color")}}
  - : Màu sử dụng khi vẽ đường phân cách các cột văn bản khi sử dụng [CSS multi-column layout](/en-US/docs/Web/CSS/Guides/Multicol_layout).

- {{cssxref("outline-color")}}
  - : Màu sử dụng khi vẽ outline xung quanh bên ngoài phần tử. Outline này khác với border ở chỗ nó không chiếm không gian trong tài liệu. Outline không tham gia vào [box model](/en-US/docs/Learn_web_development/Core/Styling_basics/Box_model), chồng lên các nội dung khác. Outline thường được sử dụng làm chỉ báo focus, cho biết phần tử nào hiện có focus và sẽ nhận các sự kiện nhập bàn phím.

### Đường viền

Bất kỳ phần tử nào cũng có thể có đường viền vẽ xung quanh nó. Đường viền phần tử cơ bản là một đường thẳng được vẽ xung quanh các cạnh của nội dung phần tử. Xem [The box model](/en-US/docs/Learn_web_development/Core/Styling_basics/Box_model) để tìm hiểu về mối quan hệ giữa các phần tử và đường viền của chúng, và bài viết [Styling borders using CSS](/en-US/docs/Learn_web_development/Core/Styling_basics/Backgrounds_and_borders) để tìm hiểu thêm về áp dụng style cho đường viền.

Bạn có thể sử dụng thuộc tính shorthand {{cssxref("border")}}, cho phép bạn cấu hình mọi thứ về đường viền trong một lần (bao gồm các tính năng không phải màu sắc như [chiều rộng](/en-US/docs/Web/CSS/Reference/Properties/border-width), [kiểu](/en-US/docs/Web/CSS/Reference/Properties/border-style) (solid, dashed, v.v.), v.v.).

- Shorthand {{cssxref("border-color")}}
  - : Chỉ định một màu duy nhất để sử dụng cho mọi cạnh của đường viền phần tử.

- {{cssxref("border-left-color")}}, {{cssxref("border-right-color")}}, {{cssxref("border-top-color")}} và {{cssxref("border-bottom-color")}}
  - : Cho phép bạn đặt màu của cạnh tương ứng của đường viền phần tử.

- {{cssxref("border-block-start-color")}} và {{cssxref("border-block-end-color")}}
  - : Với những thuộc tính này, bạn có thể đặt màu được sử dụng để vẽ đường viền gần nhất với điểm đầu và điểm cuối của khối mà đường viền bao quanh. Trong chế độ viết từ trái sang phải (như tiếng Anh), đường viền đầu khối là cạnh trên và cuối khối là cạnh dưới. Điều này khác với đầu và cuối inline, là cạnh trái và phải (tương ứng với nơi mỗi dòng văn bản trong hộp bắt đầu và kết thúc).

- {{cssxref("border-inline-start-color")}} và {{cssxref("border-inline-end-color")}}
  - : Chúng cho phép bạn tô màu các cạnh của đường viền gần nhất với điểm bắt đầu và kết thúc của các dòng văn bản trong hộp. Cạnh nào đây sẽ thay đổi tùy thuộc vào các thuộc tính {{cssxref("writing-mode")}}, {{cssxref("direction")}} và {{cssxref("text-orientation")}}, thường (nhưng không phải lúc nào cũng) được sử dụng để điều chỉnh hướng văn bản dựa trên ngôn ngữ đang hiển thị. Ví dụ, nếu văn bản của hộp đang được hiển thị từ phải sang trái, thì `border-inline-start-color` được áp dụng cho cạnh phải của đường viền.

## Chỉ định màu sắc làm giá trị trong stylesheet

Bây giờ bạn đã biết [các thuộc tính CSS nào cho phép bạn áp dụng màu sắc cho các phần tử](#các_thuộc_tính_có_thể_có_màu), bạn có thể bắt đầu thêm màu sắc vào trang web của mình. Hãy xem một số ví dụ về sử dụng màu sắc trong {{Glossary("stylesheet")}}. Trong ví dụ này, chúng ta sử dụng một số thuộc tính đã đề cập trước đó, với khái niệm áp dụng màu sắc trong CSS là như nhau bất kể thuộc tính.

Hãy xem kết quả trước, rồi mới xem mã cần tạo ra nó:

{{EmbedLiveSample("Specifying colors as values in stylesheets", 650, 150)}}

### HTML

HTML chịu trách nhiệm tạo ra ví dụ trên được hiển thị ở đây:

```html
<div class="wrapper">
  <div class="boxLeft">
    <p>This is the first box.</p>
  </div>
  <div class="boxRight">
    <p>This is the second box.</p>
  </div>
</div>
```

Ở đây chúng ta có một {{HTMLElement("div")}} wrapper chứa hai `<div>` con, mỗi cái có một đoạn văn con duy nhất ({{HTMLElement("p")}}). Mỗi `<div>` nội dung được tạo kiểu khác nhau.

### CSS

Hãy xem từng phần CSS tạo ra kết quả trên.

> [!NOTE]
> Chúng ta đang sử dụng nhiều [loại giá trị màu CSS khác nhau](/en-US/docs/Web/CSS/Guides/Colors/Color_values) trong ví dụ này để minh họa cách sử dụng. Điều này không được khuyến nghị cho mã sản xuất. Khi viết CSS, hãy sử dụng loại giá trị trực quan nhất cho bạn và nhóm của bạn.

```css
.wrapper {
  height: 110px;
  padding: 10px;
  display: flex;
  gap: 10px;
  text-align: center;
  font:
    28px "Marker Felt",
    "Zapfino",
    cursive;
  border: 6px solid mediumturquoise;
}

div {
  flex: 1;
}
```

Class `.wrapper` được sử dụng để gán style cho {{HTMLElement("div")}} bao bọc tất cả nội dung khác. Nó thiết lập chiều cao của container bằng {{cssxref("height")}}, cho phép chiều rộng của phần tử block-level này mặc định là 100% của phần tử cha. Đặt {{cssxref("display")}} thành `flex` và thêm {{cssxref("gap")}} `10px` tạo ra một flex container để bố trí các con cạnh nhau với khoảng cách giữa tất cả các con. Chúng ta sử dụng {{cssxref("flex")}} để cho các con flex mở rộng lấp đầy container; nó không ảnh hưởng đến bản thân flex container.

Điều thú vị hơn trong thảo luận của chúng ta ở đây là việc sử dụng thuộc tính {{cssxref("border")}} để thiết lập đường viền xung quanh cạnh ngoài của phần tử. Đường viền này là một đường liền, dày 6 pixel, có [named color](/en-US/docs/Web/CSS/Reference/Values/named-color) `mediumturquoise`.

Trong wrapper, chúng ta có hộp bên trái và hộp bên phải.

```css
.boxLeft {
  background-color: rgb(245 130 130);
  outline: 2px solid darkred;
}
```

Class `.boxLeft`, dùng để tạo kiểu cho hộp bên trái, thiết lập màu của nền và outline:

- Màu nền của hộp được đặt bằng cách thay đổi giá trị của thuộc tính CSS {{cssxref("background-color")}} thành `rgb(245 130 130)`, sử dụng ký hiệu hàm {{CSSXref("color_value/rgb", "rgb()")}}.
- Một outline được định nghĩa cho hộp. Không giống như {{cssxref("border")}} thường được sử dụng hơn, {{cssxref("outline")}} hoàn toàn không ảnh hưởng đến bố cục; nó vẽ lên trên bất cứ thứ gì có thể ở bên ngoài hộp phần tử thay vì dành chỗ như `border`. Outline này là đường liền màu đỏ đậm dày hai pixel. Lưu ý việc sử dụng từ khóa `darkred` khi chỉ định màu sắc.
- Lưu ý rằng chúng ta không đặt màu văn bản một cách rõ ràng. Điều đó có nghĩa là giá trị của {{cssxref("color")}} sẽ được kế thừa từ phần tử chứa gần nhất định nghĩa nó. Theo mặc định, đó là màu đen.

```css
.boxRight {
  background-color: hwb(270deg 63% 13%);
  outline: 4px dashed #6e1478;
  color: hsl(0deg 95% 95%);
  text-decoration-line: underline;
  text-decoration-style: wavy;
  text-decoration-color: #8f8;
  text-decoration: underline wavy #8f8;
  text-shadow: 2px 2px 3px black;
}
```

> [!NOTE]
> Chúng ta đã bao gồm các style `text-decoration-*` riêng biệt vì Safari không hỗ trợ {{cssxref("text-decoration")}} như thuộc tính shorthand.

Cuối cùng, class `.boxRight` đặt một số style trên hộp được vẽ ở bên phải. Sau đó các màu sau đây được thiết lập (sử dụng năm cách khác nhau để khai báo [giá trị màu](/en-US/docs/Web/CSS/Guides/Colors/Color_values)):

- `background-color` được đặt bằng ký hiệu hàm {{CSSXref("color_value/hwb", "hwb()")}} — `hwb(270deg 63% 13%)`. Đây là màu tím nhạt.
- `outline` của hộp được sử dụng để chỉ định rằng hộp phải được bao bọc bằng một đường đứt nét dày bốn pixel có màu tím đậm hơn một chút bằng {{cssxref("hex-color")}} sáu chữ số `#6e1478`.
- Màu nền trước (văn bản) được chỉ định bằng cách đặt thuộc tính {{cssxref("color")}} bằng ký hiệu hàm {{CSSXref("color_value/hsl", "hsl()")}} — `hsl(0deg 95% 95%)`. Đây là màu hồng rất nhạt.
- Chúng ta thêm một đường gợn sóng màu xanh lá dưới văn bản với shorthand {{cssxref("text-decoration")}}, cùng với longhand cho khả năng tương thích trình duyệt. Chúng ta đã sử dụng {{cssxref("hex-color")}} 3 chữ số `#8f8`, tương đương với `#88ff88`.
- Cuối cùng, một chút bóng được thêm vào văn bản bằng {{cssxref("text-shadow")}}. Tham số `color` của nó được đặt thành `black`, một giá trị {{cssxref("named-color")}}.

Chúng ta đã sử dụng năm cú pháp màu khác nhau để minh họa những gì có thể. Trong thực tế, bạn và nhóm của bạn nên chọn một ký hiệu màu ưa thích, với mọi người làm việc trên cơ sở mã đều sử dụng cùng cú pháp màu.

## Các cách khác để sử dụng màu sắc

CSS không phải là công nghệ web duy nhất hỗ trợ màu sắc. Các ví dụ khác bao gồm:

- [Canvas API](/en-US/docs/Web/API/Canvas_API) của HTML
  - : Cho phép bạn vẽ đồ họa bitmap 2D trong phần tử {{HTMLElement("canvas")}}. Xem [hướng dẫn Canvas](/en-US/docs/Web/API/Canvas_API/Tutorial) để tìm hiểu thêm.
- [SVG](/en-US/docs/Web/SVG) (Scalable Vector Graphics)
  - : Cho phép bạn tạo hình ảnh bằng các lệnh vẽ các hình dạng, mẫu và đường thẳng cụ thể. Các lệnh SVG được định dạng dưới dạng XML, và có thể được nhúng trực tiếp vào trang web hoặc đặt trong trang bằng phần tử {{HTMLElement("img")}}, giống như bất kỳ loại hình ảnh nào khác.
- [WebGL](/en-US/docs/Web/API/WebGL_API)
  - : Web Graphics Library là API dựa trên OpenGL ES để vẽ đồ họa 2D và 3D hiệu năng cao trên Web. Xem [hướng dẫn WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial) để tìm hiểu thêm. Xem thêm [WebGPU](/en-US/docs/Web/API/WebGPU_API), kế thừa của WebGL dành cho GPU hiện đại.

> [!NOTE]
> Một vài thuộc tính HTML hiện đã lỗi thời chấp nhận màu sắc làm giá trị, chẳng hạn như `bgcolor` và `vlink`. Các thuộc tính này chỉ chấp nhận giá trị {{cssxref("named-color")}} và {{cssxref("hex-color")}} ba hoặc sáu chữ số.

## Xem thêm

- Kiểu dữ liệu {{cssxref("&lt;color&gt;")}}
- [Hướng dẫn giá trị màu CSS](/en-US/docs/Web/CSS/Guides/Colors/Color_values)
- [Sử dụng màu sắc một cách khôn ngoan](/en-US/docs/Web/CSS/Guides/Colors/Using_color_wisely)
- [Mô-đun CSS color](/en-US/docs/Web/CSS/Guides/Colors)
- [Vẽ đồ họa](/en-US/docs/Learn_web_development/Extensions/Client-side_APIs/Drawing_graphics)
