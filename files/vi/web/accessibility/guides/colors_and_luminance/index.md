---
title: "Trợ năng web: Hiểu về Màu sắc và Độ chói"
short-title: Colors and Luminance
slug: Web/Accessibility/Guides/Colors_and_Luminance
page-type: guide
sidebar: accessibilitysidebar
---

Việc hiểu màu sắc, độ chói và độ bão hòa là quan trọng đối với thiết kế và khả năng đọc của mọi người dùng có thị lực, nhưng chúng còn thiết yếu với những người suy giảm thị lực, có thị lực kém về màu và những người có các dạng suy giảm thần kinh, nhận thức hoặc các dạng suy giảm khác.

Các hướng dẫn trợ năng định nghĩa mức [tương phản màu](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable/Color_contrast) phù hợp cho người có thị lực giảm, đồng thời cũng đưa ra hướng dẫn để hỗ trợ người dùng có thị lực không nhạy với màu, thường được gọi là "mù màu". Hiểu màu sắc cũng quan trọng để ngăn ngừa [co giật và các phản ứng thể chất khác](/en-US/docs/Web/Accessibility/Guides/Seizure_disorders) ở những người có rối loạn tiền đình hoặc các rối loạn thần kinh khác.

## Tổng quan

Việc chọn màu và cách sử dụng màu là một thành phần quan trọng của trợ năng. Nhìn bề ngoài, chủ đề này có vẻ đơn giản. Tuy nhiên, nó là một chủ đề phức tạp vì cảm nhận màu sắc phụ thuộc nhiều vào sinh lý của mắt và quá trình xử lý của não người, chứ không chỉ là ánh sáng phát ra từ màn hình máy tính.

### Môi trường và cảm nhận

Môi trường có ảnh hưởng. Việc cảm nhận một màu trong một căn phòng sáng sẽ khác với cảm nhận cùng màu đó trên cùng màn hình máy tính trong một căn phòng tối. Với trợ năng, một số tổ hợp màu nhất định có tác động lớn hơn những tổ hợp khác. Cỡ chữ, [kiểu chữ](https://www.nngroup.com/articles/glanceable-fonts/) (một số font quá mảnh hoặc quá cầu kỳ đến mức tự nó đã tạo ra vấn đề trợ năng), màu nền, kích thước vùng nền xung quanh văn bản, thậm chí mật độ điểm ảnh, và nhiều yếu tố khác đều ảnh hưởng đến cách màu sắc được hiển thị từ màn hình.

Khoảng cách của người xem với màn hình, nền xung quanh, tình trạng mắt của họ, và nhiều yếu tố khác đều ảnh hưởng đến cách màu sắc được tiếp nhận. Cách người xem cảm nhận màu sau khi ánh sáng đi vào mắt lại là một vấn đề khác nữa, và có thể bị ảnh hưởng bởi sức khỏe tổng thể. May mắn là có các [media query](/en-US/docs/Web/CSS/Reference/At-rules/@media) cho phép nhà phát triển cung cấp kiểu dựa trên tùy chọn của người dùng, bao gồm tùy chọn [contrast](/en-US/docs/Web/CSS/Reference/At-rules/@media/prefers-contrast) và [color scheme](/en-US/docs/Web/CSS/Reference/At-rules/@media/prefers-color-scheme).

Khi được hỗ trợ, giao diện [Ambient Light Sensor](/en-US/docs/Web/API/AmbientLightSensor) trả về mức sáng hiện tại hoặc độ rọi của ánh sáng xung quanh thiết bị, cho phép trang web nhận biết sự thay đổi trong cường độ ánh sáng và từ đó điều chỉnh văn bản phù hợp. Ngoài ra, các media query nói trên cho phép nhà phát triển cung cấp trải nghiệm thay thế khi tùy chọn của người dùng cho biết mức tương phản mong muốn, tự động điều chỉnh mức độ này tùy theo vị trí của người dùng và loại màn hình họ đang dùng.

### Độ chói và cảm nhận

Màu sắc, độ tương phản và độ chói là những khái niệm trung tâm và quan trọng nhất khi tạo nội dung web có màu sắc nhưng vẫn có trợ năng. Tuy nhiên, độ chói đặc biệt quan trọng vì hiểu nó là gì và nó được sử dụng như thế nào sẽ giúp tăng trợ năng cho cả người mù màu lẫn người vẫn nhìn thấy màu. Tương phản độ chói giúp người mù màu phân biệt sáng và tối.

Độ chói phải được xác định trước khi có thể tính độ tương phản. Khi nói về tương phản màu, các công thức của W3C đang tích hợp độ chói chứ không chỉ các màu ("hue") bản thân chúng.

### Thuật ngữ

Thuật ngữ có thể gây nhầm lẫn vì các từ khác nhau thường mô tả cùng một thứ. "Luminance" và "Saturation" đặc biệt quan trọng cần dùng đúng. Ví dụ, "saturation" ở một số nơi được gọi là "chroma". Ở nơi khác, "chroma" và "saturation" là hai khái niệm khác nhau. Chữ "L" trong không gian màu HSL đôi khi được gọi là "luminosity", lúc khác là "lightness". Ngay cả những thứ tưởng như đơn giản, như đặt tên màu phổ biến, cũng có thể gây tranh luận. Ví dụ, màu "crimson red" có thể được mô tả bằng giá trị hex là `#990000` theo một số người và `#DC143C` theo số khác. Trong tài liệu này, chúng tôi sẽ dùng thuật ngữ như được định nghĩa trên trang CSS {{cssxref("named-color")}}.

Khi làm việc với màu sắc, điều quan trọng là phải biết mình đang làm việc trong "không gian màu" nào, vì các không gian màu khác nhau ánh xạ tới các hệ đo khác nhau.

Trong in ấn màu, máy in của bạn có thể có các hộp mực cyan, magenta, yellow và black (CMYK). CMYK là một mô hình trừ, trong đó bốn loại mực _loại bỏ_ các bước sóng ánh sáng cụ thể, chỉ phản xạ lại dải hẹp mà mỗi loại mực tương ứng. RGB là một mô hình cộng, trong đó các ánh sáng đỏ, xanh lá và xanh dương được thêm vào với tỷ lệ khác nhau.

Hiện nay, {{glossary("RGB", "không gian màu RGB")}} là không gian mà các nhà phát triển web chủ yếu làm việc. Dù không gian HEX, RGB và HSL được ký hiệu khác nhau, trình duyệt sẽ tự động chuyển đổi giá trị giữa các ký hiệu màu này. [Các mô-đun màu CSS](/en-US/docs/Web/CSS/Guides/Colors) cung cấp thêm các không gian màu khác. Tuy nhiên, vì RGB hiện vẫn chiếm ưu thế trong việc đo đầu ra màu, phần lớn phép tính trong tài liệu này được giả định là dùng không gian màu RGB và, cụ thể hơn, là không gian sRGB.

## Không gian màu sRGB

Màu sắc có nhiều cách được định nghĩa, như có thể thấy trong kiểu dữ liệu {{cssxref("&lt;color&gt;")}}, bao gồm RGB, RGB thập phân, RGB phần trăm, HSL, HWB, LCH, Lab và CMYK, cùng nhiều kiểu khác.

Với các nhu cầu kỹ thuật số, phần lớn công nghệ lịch sử đều nằm trong không gian màu RGB. Mô hình màu RGB được mở rộng để bao gồm "alpha" - RGBA - để cho phép chỉ định độ mờ của màu. Các phương pháp khác để đo màu liên quan đến phép đo bằng các không gian màu khác và được hỗ trợ trên màn hình cũng như trình duyệt hiện đại. Dù vậy, các phép đo màu trong không gian RGB vẫn chiếm ưu thế, kể cả trong sản xuất video.

Các công nghệ như [OpenGL](https://en.wikipedia.org/wiki/OpenGL) và [Direct3D](https://en.wikipedia.org/wiki/Direct3D) có hỗ trợ đường cong gamma sRGB, mặc dù một số bài viết về OpenGL tham chiếu việc dùng RGBA thay vì sRGB. WebGL thường ở định dạng RGBA; xem ví dụ về cách dùng nó trong "[Clearing with colors](/en-US/docs/Web/API/WebGL_API/By_example/Clearing_with_colors)".

### Các giá trị màu CSS

Điều quan trọng là phải biết rằng ngay cả trong một {{glossary("color space")}}, như không gian màu {{glossary("RGB")}}, cũng có nhiều biến thể khác nhau. Ví dụ, các biến thể của không gian màu RGB gồm **RGB**, **sRGB**, **Adobe RGB**, **Adobe Wide Gamut RGB**, và **RGBA**, cùng nhiều biến thể khác.

Đây là các ví dụ về các ký hiệu CSS dùng để định nghĩa màu. Ở đây màu ví dụ cho mỗi ký hiệu là một magenta hoàn toàn không trong suốt:

```css
/* named color */
color: magenta;

/* sRGB value with percentage values */
color: rgb(100% 0% 100%);
color: rgb(100% 0% 100% / 100%);

/* by sRGB numeric values */
color: rgb(255 0 255);
color: rgb(255 0 255 / 1);

/* legacy rgb and rgba notation */
color: rgb(100%, 0%, 100%);
color: rgba(255, 0, 255, 1);

/* by sRGB value in hex */
color: #f0f; /* #rgb, a shorthand for #rrggbb */
color: #ff00ff; /* #rrggbb */
color: #f0ff; /* #rgba */
color: #ff00ffff; /* #rrggbbaa */

/* by HSL representation of the sRGB value */
color: hsl(300 100% 50%);
color: hsl(300deg 100% 50% / 100%);

/* by HWB representation of the sRGB value */
color: hwb(300deg 0% 0%);
color: hwb(300 0% 0% / 1);

/* by Lab representation of the sRGB value */
color: lab(60 93.56 -60.5);
color: lab(60 93.56 -60.5 / 1);

/* representation in the CIELAB color spaces */
color: oklch(0.7 0.32 328.37);
color: oklch(0.7 0.32 328.37 / 1);

/* color() function in the XYZ color space */
color: color(xyz-d65 0.59 0.28 0.96);
color: color(xyz-d65 0.59 0.28 0.96 / 1);
```

Ví dụ đầu tiên dùng một trong các {{cssxref("named-color")}} đã được định nghĩa.

Chúng ta có thể đặt trực tiếp các giá trị sRGB dưới dạng phần trăm, trong đó 0% là tắt (đen) và 100% là giá trị đầy đủ của màu đó. Các giá trị được sắp theo thứ tự đỏ, xanh lá và xanh dương. Chúng ta cũng có thể đặt trực tiếp giá trị sRGB bằng số từ 0 đến 255.

Tiếp theo là các giá trị màu hex. Hệ thập lục phân là hệ số cơ số 16, trong đó số nguyên 0-255 được biểu diễn bằng hai chữ số từ 0-15, dùng các ký tự 0-9 và a-f cho 10-15. Vì vậy, `ff` = `255`, `00` = `0`, và `d5` = `200`. Ký hiệu '#' đứng trước màu để chỉ ra rằng giá trị đó là hex.

Nếu mọi giá trị đều là các cặp chữ số giống nhau, giá trị có thể được viết bằng các chữ số đơn mà trình duyệt sẽ tự nhân đôi. Vì vậy `f00` giống `ff0000`. Nếu có bộ số thứ tư, thì giá trị đó là A trong RGBA, tức kênh alpha định nghĩa độ trong suốt theo mức độ mờ của màu. Giá trị càng cao thì màu càng đậm đặc và do đó càng ít trong suốt. Trong các ví dụ trên, giá trị alpha là `f`, `ff`, `1`, và `100%` cho trường hợp hoàn toàn không trong suốt.

Ví dụ này cũng cho thấy cú pháp cũ của cả [`rgb()` và `rgba()`](/en-US/docs/Web/CSS/Reference/Values/color_value/rgb#examples). Cú pháp cũ của các hàm màu là phân tách bằng dấu phẩy, với một hàm riêng khi có kênh alpha. Các hàm màu mới chỉ có một cú pháp với các giá trị được phân tách bằng khoảng trắng (thay vì dấu phẩy), trong đó kênh alpha, nếu có, được đặt sau một dấu gạch chéo. Cú pháp hiện đại cho phép trộn số và phần trăm, và hỗ trợ từ khóa `none`; cú pháp cũ phân tách bằng dấu phẩy thì không.

Các ví dụ sau cho thấy "HSL", viết tắt của _Hue, Saturation, and Lightness_. Nhiều người cho rằng giá trị màu HSL trực quan hơn RGB. Màu tạo ra từ các thiết lập này vẫn nằm trong không gian màu sRGB, nhưng {{cssxref("color_value/hsl")}} là một cú pháp trực quan với nhiều người. Hue được điều chỉnh như một góc, và rất dễ tạo giao diện người dùng dùng núm xoay hoặc điều khiển tròn để chỉnh hue. Lưu ý rằng màu HSL bao gồm _lightness_, không phải _luminance_, và đây là một cân nhắc quan trọng.

Ví dụ tiếp theo là "HWB", viết tắt của _Hue, Whiteness, and Blackness_. Với cả `hsl()` và {{cssxref("color_value/hwb")}}, giá trị đầu tiên có thể là một giá trị {{cssxref("number")}} hoặc {{cssxref("angle")}}. Khi không có đơn vị, giá trị được hiểu là độ `deg`.

Có nhiều hàm và không gian màu khác nữa. Ba ví dụ cuối cùng minh họa việc biểu diễn magenta bằng các hàm {{cssxref("color_value/lab")}}, {{cssxref("color_value/oklch")}} và {{cssxref("color_value/color")}}.

### Chuyển đổi

Như đã thấy, một màu trong cùng một không gian màu có thể được biểu diễn theo nhiều cách. Khi xem cách không gian màu RGB được dùng để mô tả màu "magenta", bạn có thể thấy cùng một màu có thể được biểu diễn bằng một số hex rút gọn ba chữ số, chuyển thành giá trị rgb dưới dạng hex sáu chữ số, hoặc dưới dạng giá trị rgba được viết theo phần trăm.

RGB thiên về phần cứng, phản ánh việc sử dụng màn hình CRT. Nhiều nhà phát triển và nhà thiết kế thích tính trực quan của ký hiệu {{cssxref("color_value/hsl")}}. May mắn là trình duyệt tự động chuyển từ RGB sang HSL, và việc shift-click vào màu trong công cụ dành cho nhà phát triển của trình duyệt cũng cung cấp chức năng chuyển đổi.

Ngoài công cụ dành cho nhà phát triển, nhiều công cụ khác có thể chuyển RGB sang HSL cho bạn và cung cấp cả dạng hex RGB lẫn cú pháp hàm CSS. Một ví dụ rất tốt là "[mini color selector](https://colortutorial.design/microColorsC.html)" của Tom Jewett, với các tùy chọn HSL, RGB và Hex để kiểm tra tương phản ngay trong trình duyệt. Lưu ý rằng bộ chọn màu trong công cụ dành cho nhà phát triển và công cụ này đều cung cấp giá trị WCAG [color contrast](https://webaim.org/resources/contrastchecker/).

![Bộ chọn màu với HSL và RGB, cùng các giá trị tương phản màu.](microcolorsc.jpg)

Như đã đề cập, [mô-đun màu CSS](/en-US/docs/Web/CSS/Guides/Colors) bao gồm việc bổ sung các colorspace khác, bao gồm ký hiệu màu hàm {{cssxref("color_value/lch")}} và {{cssxref("color_value/oklch")}}, cùng hệ tọa độ màu {{cssxref("color_value/lab")}} và {{cssxref("color_value/oklab")}}, có thể chỉ định bất kỳ màu nào nhìn thấy được. Dù vậy, sRGB vẫn là colorspace mặc định và được ưu tiên cho trợ năng vì tính phổ biến của nó.

Tuy nhiên, đối với trợ năng, các tiêu chuẩn và hướng dẫn hiện nay chủ yếu vẫn được viết bằng không gian màu sRGB, đặc biệt khi áp dụng cho các tỷ lệ tương phản màu.

> [!NOTE]
> Gần như tất cả hệ thống dùng để xem nội dung Web ngày nay đều giả định mã hóa sRGB. Trừ khi biết chắc rằng một không gian màu khác sẽ được dùng để xử lý và hiển thị nội dung, tác giả nên đánh giá bằng colorspace sRGB. Nếu dùng các không gian màu khác, hãy áp dụng các nguyên tắc về [minimum contrast ratios](https://webaim.org/articles/contrast/#sc143).

### Truy vấn giá trị màu

Phương thức {{domxref('Window.getComputedStyle()')}} trả về giá trị bằng thang RGB Decimal Reference hoặc thông qua `color(srgb...)`. Ví dụ, gọi `Window.getComputedStyle()` trên một `<div>` có `background-color: red` sẽ trả về màu nền tính toán là `rgb(255, 0, 0)` - tham chiếu RGB Decimal. Tuy nhiên, khi [dùng màu tương đối](/en-US/docs/Web/CSS/Guides/Colors/Using_relative_colors) (ví dụ `background-color: rgb(from blue 255 0 0)`), việc gọi `Window.getComputedStyle()` sẽ trả về màu nền tính toán là `color(srgb 1 0 0)`. Vì gắn chặt với phần cứng máy tính, `Window.getComputedStyle()` đo màu theo RGB, chứ không phải theo cách mắt người cảm nhận màu.

### Mù màu đỏ / xanh lá

Protanopia là một khiếm khuyết thị giác màu mà mắt không có nón đỏ; sRGB vẫn có thể được cảm nhận qua các nón xanh lá, nhưng tối hơn so với thị lực bình thường. Cả khiếm khuyết protan (thiếu đỏ) và deutan (thiếu xanh lá) đều gây khó khăn trong việc phân biệt _giữa_ đỏ và xanh lá.

Các công cụ dành cho nhà phát triển có thể giúp mô phỏng sự khác biệt thị giác màu ngay trong trình duyệt của bạn. Ví dụ, Accessibility Inspector của Firefox cho phép mô phỏng protanopia, deuteranopia, tritanopia, achromatopsia và mất tương phản ngay trong bảng accessibility.

![Đoạn giao diện trong công cụ dành cho nhà phát triển Firefox hiển thị popup mô phỏng](simulate_color_differences.jpg)

## Độ chói và tương phản

### Tương phản

Tương phản giữa các màu ("hue") là một thành phần then chốt, nhưng chỉ dùng màu ("hue") thôi là chưa đủ để tạo nội dung có trợ năng. Như đã nói trước đó, mọi phép tính tương phản đều phải bao gồm độ chói.

Ngoài ra, "hình dạng" của chính văn bản cũng quan trọng. Chữ mảnh sẽ khó đọc hơn chữ đậm; mọi kiểu chữ đều cần không gian để "thở" đối với cảm nhận của con người.

### Tương phản và cỡ chữ

[Các hướng dẫn về tương phản trong WCAG](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.4_make_it_easier_for_users_to_see_and_hear_content_including_separating_foreground_from_background) định nghĩa văn bản "lớn" là văn bản có `18pt` (xấp xỉ `24px`) trở lên khi {{cssxref('font-weight')}} là `normal`, và `14pt` (xấp xỉ `18.7px`) cho văn bản `bold`. WCAG nêu rằng:

_Văn bản lớn hơn và có nét ký tự rộng hơn sẽ dễ đọc hơn ở mức tương phản thấp. Vì vậy, yêu cầu tương phản cho văn bản lớn được hạ xuống. Điều này cho phép tác giả dùng dải lựa chọn màu rộng hơn cho văn bản lớn, có ích cho thiết kế trang, đặc biệt là tiêu đề._

Mặc dù văn bản lớn không cần độ tương phản nền cao như văn bản nhỏ, việc tăng cỡ chữ không phải là phương thuốc vạn năng.

Chữ in "bình thường" thường được xem là 11.5pt đến 12pt, tương đương 16px trên màn hình. Dù chữ nhỏ hơn có thể vẫn nhận ra được - người dùng có thể phân biệt chữ với độ chính xác khoảng ~70% - nhưng như vậy chưa hẳn là đọc được. Cỡ chữ 16px thường đọc được với người có thị lực bình thường. Người có thị lực 20/40 cần gấp đôi mức đó, khoảng 31px. Đó là lý do WCAG yêu cầu người dùng có thể phóng to bất kỳ văn bản nào.

Trong khi văn bản quá nhỏ thì khó đọc, văn bản quá lớn cũng vậy. Với người có thị lực 20/20, khi cỡ chữ lớn hơn khoảng 96px, tốc độ đọc sẽ giảm. Ngoài ra, khi có sự chênh lệch lớn giữa cỡ chữ nhỏ nhất và lớn nhất trên một trang, văn bản lớn hơn sẽ khó đọc hơn nếu người dùng phóng to văn bản nhỏ hơn trên trang, vì hầu hết trình duyệt phóng to tất cả văn bản khi người dùng zoom.

Nói chung, đối với trợ năng, tương phản càng cao càng tốt. Điều đó thay đổi với hoạt ảnh. Hoạt ảnh "an toàn hơn" là hoạt ảnh có ít tương phản hơn, không phải nhiều hơn. Để biết thêm về tương phản màu trong hoạt ảnh, xem [Three Flashes or Below Threshold Understanding SC 2.3.1](https://www.w3.org/TR/UNDERSTANDING-WCAG20/seizure-does-not-violate.html)

Ngoài ra, lưu ý rằng các biểu tượng cũng cần đủ tương phản để nhận biết. Xem [WCAG 2.1 technique G207](https://www.w3.org/WAI/WCAG21/Techniques/general/G207)

### Độ chói

Chính sự khác biệt về độ chói của màu sắc giúp chúng ta nhìn thấy tương phản. Độ chói tương đối được định nghĩa trong WCAG là "độ sáng tương đối của bất kỳ điểm nào trong một colorspace, được chuẩn hóa về 0 cho màu đen tối nhất và 1 cho màu trắng sáng nhất."

Tuyên bố này tất nhiên là chính xác, nhưng có thể gây nhầm lẫn khi dùng để tham chiếu đến không gian màu RGB, vốn là một số nguyên từ 0 đến 255. Trắng có độ chói tương đối 100%, đen có độ chói tương đối 0% (trong phần lớn, nhưng không phải tất cả, tài liệu). Diễn giải theo tiêu chuẩn W3C ở trên, điều đó có nghĩa là trắng, được chuẩn hóa về 1, sẽ có giá trị RGB là `rgb(255 255 255)`, còn đen, được chuẩn hóa về 0, sẽ có giá trị RGB là `rgb(0 0 0)`. Lưu ý rằng đen và trắng cũng có thể được viết là `rgb(100% 100% 100%)` và `rgb(0% 0% 0%)`, tương ứng, và cách này có thể trực quan hơn.

Vậy các số từ 0 đến 255 này đến từ đâu? Trong lịch sử, các bộ xử lý đồ họa lưu các kênh màu dưới dạng một byte, nghĩa là dải số nguyên từ 0 đến 255.

Độ chói của các màu cơ bản là khác nhau. Ví dụ, vàng có độ chói lớn hơn xanh dương. Điều này được thiết kế như vậy, _để đạt được sự căn chỉnh trắng của màn hình_, theo tài liệu NASA "[Luminance Contrast in Color Graphics](https://web.archive.org/web/20250216024807/https://colorusage.arc.nasa.gov/design_lum_1.php)"

Tỷ lệ tương phản màu là vô nghĩa nếu không có thành phần độ chói, và khi độ chói đã được xác định, tỷ lệ tương phản màu cũng có thể được xác định.

Xét theo cảm nhận của con người, sự khác biệt về độ chói quan trọng hơn sự khác biệt về màu sắc. Điều này quan trọng vì tương phản độ chói giúp phát triển nội dung mà ngay cả người mù màu cũng có thể nhìn thấy. Với hiểu biết này, độ chói có thể được điều chỉnh để những màu khó nhìn vì độ chói thấp có thể dễ đọc hơn bằng cách đặt chúng trên nền có độ chói tương phản. Một nghiên cứu thú vị của NASA về màu xanh dương, chẳng hạn, lưu ý rằng màu này, vốn có độ chói thấp, có thể đọc được nếu _care was taken to achieve adequate luminance contrast_ (từ bài viết [Designing with blue](https://web.archive.org/web/20250216024807/https://colorusage.arc.nasa.gov/blue_2.php))

Các phép tính độ chói tương đối không hề đơn giản. May mắn là có các [bộ kiểm tra độ chói và tương phản trực tuyến](https://www.siegemedia.com/contrast-ratio), và thậm chí có hướng dẫn về cách [tính độ chói tương đối](https://w3c.github.io/wcag/guidelines/22/#dfn-relative-luminance).

## Cảm nhận màu sắc

Màu sắc là cảm nhận của chúng ta về dải hẹp của ánh sáng khả kiến, từ đỏ qua vàng và xanh lá đến xanh dương. Độ nhạy của chúng ta với các hue màu khác nhau là không giống nhau. Các tế bào nhạy sáng trong [mắt](https://www.verywellhealth.com/eye-cones-5088699), gọi là nón, được tinh chỉnh để cảm nhận một số màu hơn các màu khác. Khoảng 65% nón _nhạy nhất_ với vùng vàng/xanh lá, nhưng cũng phản ứng với đỏ (chúng ta sẽ gọi là các "nón đỏ"). 30% nhạy với xanh lá, và chỉ [5% nhạy với xanh dương](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0144891#sec001). Dù số lượng nón nhạy xanh dương ít hơn rất nhiều so với hai loại còn lại, các nón này lại rất nhạy, phần nào bù cho số lượng ít của chúng.

Xanh dương đậm, nguyên chất được cảm nhận khác với các màu khác vì nón xanh dương không góp phần vào độ chói và chúng ta có ít nón xanh dương hơn nón đỏ hay nón xanh lá.

![Bên trái là mô hình khảm nón của thị lực bình thường, bên phải là của người bị protanopia, khi họ thiếu nón đỏ.](conemosaics.jpg)

Bên trái là mô hình khảm nón trung tâm của thị lực bình thường, và bên phải là của người bị protanopia, một dạng khiếm khuyết thị lực màu, khi họ thiếu nón đỏ. (Minh họa bởi Mark Fairchild của RIT, [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:ConeMosaics.jpg))

Các nón đỏ và xanh lá kết hợp với nhau để tạo độ chói, mà ta có thể hiểu là độ sáng/tối mà không xét đến hue. Riêng các nón đỏ, xanh lá và xanh dương cho phép thị lực bình thường cảm nhận hàng triệu màu. Đối với trợ năng, điều quan trọng là não xử lý độ chói tách biệt với màu sắc (hue và độ rực).

Độ chói cung cấp chi tiết thị giác tinh, bao gồm phân biệt đường viền và văn bản. Hue và độ rực chỉ mang một phần ba mức chi tiết của độ chói. Nén dữ liệu hình ảnh tận dụng thực tế này. Ví dụ, [h.264 video codec](/en-US/docs/Web/Media/Guides/Formats/Video_codecs) lấy mẫu màu ở độ phân giải chỉ bằng một phần tư độ phân giải của độ chói.

Với trợ năng, điều này có nghĩa là tương phản độ chói đặc biệt quan trọng đối với văn bản. Màu sắc, ở khía cạnh hue và độ rực, quan trọng để _phân biệt_ các mục như các đường khác nhau trên bản đồ hoặc các cột trong biểu đồ.

Một điểm quan trọng khác là màu sắc hoặc độ chói bao quanh một màu. Màu sắc trông khác nhau tùy vào màu bao quanh chúng. Trong hình sau, cả các chấm vàng và các ô vuông xám đều là cùng một màu sRGB. Nhận thức màu phụ thuộc ngữ cảnh khiến chúng trông khác nhau; quá trình xử lý hình ảnh của não bạn điều chỉnh cảm nhận dựa trên việc nó nghĩ rằng đó là bóng hay không.

![Ảnh bàn cờ, nơi các màu giống nhau trông khác nhau nếu chúng ở trong bóng](yellowdotcheckershadow_dlyon.png)

Các chấm vàng trong hình này là cùng một màu trên màn hình của bạn, nhưng chúng trông khác nhau do ngữ cảnh. (Ảnh D.Lyon)

Nhận thức của chúng ta về tương phản, độ sáng và màu sắc bị ảnh hưởng bởi ngữ cảnh của các màu gần đó và các đặc điểm khác của một thiết kế hay hình ảnh. Điều này làm cho việc dự đoán tương phản trở nên khó khăn. Nó không chỉ đơn thuần là một tỷ lệ toán học giữa hai màu.

Tóm lại, màu sắc liên quan đến sinh lý con người và cách não bộ cảm nhận không kém gì việc đo ánh sáng từ màn hình máy tính. Cũng cần hiểu rằng môi trường ánh sáng xung quanh ảnh hưởng đến khả năng cảm nhận màu và tương phản. Ánh sáng và các phép đo của nó là tuyến tính, nhưng thị giác và nhận thức của con người thì không.

## Thích nghi

Mắt chúng ta không thích nghi giống nhau, theo cùng một cách, khi đi từ vùng sáng sang vùng tối và ngược lại. Điều này là do cách sinh lý của mắt được tạo nên. Nó ảnh hưởng đến khả năng đọc văn bản trên nền. Ít nhất có hai loại thích nghi xảy ra: thích nghi cục bộ và thích nghi với môi trường xung quanh.

Thích nghi cục bộ xảy ra ngay trên "trang" mà người đọc đang nhìn. Ví dụ, nếu bạn có chữ xanh trong một vùng tô xám "highlight", mắt bạn sẽ cảm nhận phần chữ xanh chính xác đó cùng vùng xám được tô khác đi nếu nó nằm trong một {{HTMLElement("div")}} màu đen, hoặc một màu trắng. Điều này được gọi là thích nghi _cục bộ_. Sự khác biệt trong khả năng cảm nhận văn bản này xảy ra ngay cả khi ánh sáng môi trường trong phòng không thay đổi.

Hàm ý ở đây là các nhà phát triển web muốn cải thiện khả năng đọc văn bản trên nền có thể tận dụng các nguyên lý của thích nghi cục bộ.

Thích nghi trong bóng tối với độ chói thấp diễn ra chậm. Khi bạn đi từ ngoài trời nắng vào một căn phòng tối, bạn đang trải nghiệm thích nghi trong bóng tối. Có thể mất vài phút để điều chỉnh.

Thích nghi trong ánh sáng là ngược lại. Đi từ phòng tối ra ánh nắng chói chang thì nhanh hơn nhưng cũng có thể gây khó chịu.

Hàm ý là các nhà phát triển web muốn cải thiện khả năng đọc văn bản khi điều kiện ánh sáng môi trường của căn phòng thay đổi có thể tận dụng giao diện `AmbientLightSensor` và media query [`prefers-contrast`](/en-US/docs/Web/CSS/Reference/At-rules/@media/prefers-contrast).

## Độ bão hòa

Độ bão hòa xứng đáng được nhắc riêng trong các thảo luận về màu sắc ("hue") và trợ năng. Nói chung, phần lớn sự chú ý tập trung vào độ chói khi cố bảo đảm đủ tương phản giữa văn bản và nền, hoặc khi đánh giá khả năng gây co giật đối với những người nhạy cảm với co giật do ánh sáng. Tuy nhiên, một khía cạnh của màu ("hue"), độc lập với độ chói, đáng được chú ý đặc biệt khi xét về trợ năng: khái niệm độ bão hòa. Điều này là do khả năng gây co giật ở những người dễ bị co giật do ánh sáng, bất kể độ chói của màu. Như đã bàn trong [trường hợp đặc biệt của màu đỏ](#the_special_case_of_red), [Harding et al. 2005](https://onlinelibrary.wiley.com/doi/pdf/10.1111/j.1528-1167.2005.31305.x) ghi nhận rằng, _bất kể độ chói, sự chuyển đổi đến hoặc đi từ một màu đỏ bão hòa cũng được xem là rủi ro_.

Độ bão hòa đôi khi được mô tả là "độ tinh khiết" hoặc "độ mạnh" của một màu. Dù đây là các định nghĩa tốt cho "pigment" trong bộ sơn của họa sĩ, chúng không chính xác bằng định nghĩa màu trên màn hình máy tính.

Khi nói về màu trên màn hình, các màu bão hòa là một bước sóng cụ thể. Dù định nghĩa độ bão hòa cho mỗi không gian màu có thể khác nhau, độ bão hòa vẫn có thể đo được khá dễ dàng. Điều quan trọng là phải biết bạn đang làm việc trong không gian màu nào và sẵn sàng chuyển đổi nếu cần.

Các không gian màu thường được cân nhắc nhất khi nói về độ nhạy sáng là RGB, HSL và HSV, còn được gọi là HSB. Không gian màu HSV, viết tắt của _hue_, _saturation_ và _value_, cùng từ đồng nghĩa HSB, viết tắt của _hue_, _saturation_ và _brightness_, được biểu diễn trong CSS bằng {{cssxref("color_value/hwb")}} cho _hue_, _whiteness_ và _blackness_.

Điều quan trọng là phải biết mình đang làm việc với không gian màu nào. Ví dụ, màu bão hòa có độ sáng `0.5` trong HSL, còn trong HWB thì có giá trị `1`. Độ bão hòa trong không gian màu RGB thường được biểu thị bằng giá trị RGB `255` hoặc `100%` cho màu đang xét. Ví dụ, một màu đỏ bão hòa có giá trị hex `#ff0000` sẽ có giá trị RGB `rgb(255 0 0)` và giá trị HSL `hsl(0 100% 50%)`. Một màu đỏ bão hòa khác với giá trị hex `#ff3300` sẽ có giá trị RGB `rgb(255 51 0)` và HSL `hsl(12 100% 50%)`. Cả hai đều là màu đỏ "bão hòa". Chúng là hai "hue" khác nhau nhưng đều được xem là màu bão hòa.

Độ bão hòa không phải là độ sáng. Độ sáng nói đến mức trắng hay đen được trộn vào một màu. Có thể giảm độ bão hòa bằng cách thêm trắng, đen hoặc xám vào màu; nói tiếp ví dụ này, độ sáng có thể tăng bằng cách thêm trắng, làm giảm độ bão hòa. Một ví dụ điển hình là thêm trắng vào đỏ để tạo ra màu hồng. Hồng được xem là một màu đỏ đã khử bão hòa.

### Độ bão hòa và độ chói

Độ bão hòa bị giảm ở các cực trị của độ chói và ở các cực trị của đen và trắng. Trong tài liệu của NASA về [effect of luminance on saturation](https://web.archive.org/web/20250216024807/https://colorusage.arc.nasa.gov/design_lum_1.php), họ chỉ ra rằng độ bão hòa giảm ở độ chói thấp, và cũng "…the loss of saturation at high luminances–the colors converge on white."

## Các tổ hợp màu

Chỉ độ tương phản thôi là chưa đủ khi xét đến trợ năng. Trong hoạt ảnh, một số tổ hợp màu dễ gây co giật do ánh sáng hơn những tổ hợp khác đối với người nhạy cảm. Ví dụ, các nhấp nháy luân phiên giữa đỏ và xanh dương có vấn đề hơn nhiều so với luân phiên giữa xanh lá và xanh dương. Có giả thuyết cho rằng điều này là do các nón "đỏ" trong mắt chúng ta, vốn có xu hướng tập trung quanh fovea (gần trung tâm), nằm ở vị trí vật lý khác với các nón "xanh dương", vốn nằm xa fovea hơn, về phía rìa. Các tín hiệu điện từ mắt đến não còn rất nhiều thông tin phải xử lý khi não tổng hợp chúng.

Một số màu có khả năng [gây co giật động kinh](https://www.epilepsy.com/sites/default/files/2022-10/Epilepsia_2022_fisher_visually_sensitive_seizures.pdf). Những phức tạp ẩn bên dưới động lực học của não có thể bị điều chỉnh mạnh hơn bởi một số tổ hợp màu so với tổ hợp khác. Ví dụ, kích thích nhấp nháy đỏ-xanh dương gây kích thích vỏ não lớn hơn so với kích thích đỏ-xanh lá hoặc xanh dương-xanh lá.

Một số tổ hợp màu có thể rất vấn đề trên màn hình máy tính hoặc thiết bị di động, và một số tổ hợp màu có thể làm trầm trọng thêm một số dạng suy giảm. Tổ hợp đỏ/xanh dương là một ví dụ như vậy.

- Đừng bao giờ chỉ dựa vào hue để phân biệt chi tiết. Cần có đủ tương phản độ chói.
- Màu xanh lá trên màn hình đóng góp phần lớn độ chói (ánh sáng), nên nó thường là một phần đáng kể của các màu sáng hơn.

### Làm việc với màu xanh dương

Một số người không thể phân biệt tất cả các màu. Một số màu, như xanh dương thuần, có độ chói thấp. Các màu có độ chói thấp nên là màu tối hơn trong một cặp màu tương phản. Màu xanh dương cũng có độ phân giải rất thấp. Có ít nón nhạy xanh dương hơn nhiều, chúng nằm rải ở vùng ngoại vi thị giác và không có ở vùng nhìn trung tâm. Mắt người nhìn xanh dương ở độ phân giải thấp hơn xanh lá và đỏ.

Điều này dẫn tới một số hướng dẫn khi dùng màu xanh dương:

- Xanh dương thuần thường nên là màu tối hơn trong hai màu.
- Khi dùng xanh dương làm màu sáng hơn trong hai màu, hãy thêm xanh lá để tăng tương phản và cải thiện khả năng đọc.

Bản chất của ánh sáng xanh dương khiến nó hội tụ ở vị trí khác trên võng mạc so với đỏ, nên một màu đỏ thuần và một màu xanh dương thuần đặt sát nhau có thể "rung" khi ở cạnh nhau.

## Trường hợp đặc biệt của màu đỏ

Không phải mọi màu ("hue") đều được não chúng ta xử lý giống nhau. Nói chung, sinh lý và tâm lý con người bị ảnh hưởng bởi màu đỏ theo những cách khác với các màu khác. Chúng ta phản ứng với màu sắc cả về sinh lý lẫn tâm lý. Ví dụ, đã được chứng minh rằng [một số màu có khả năng gây động kinh hơn các màu khác](https://www.sciencedaily.com/releases/2009/09/090925092858.htm). Một số thiết bị cung cấp [thiết lập "grayscale" như một tùy chọn trợ năng](https://ask.metafilter.com/312049/What-is-the-grayscale-setting-for-in-accessibility-options)" có thể giúp những người nhạy sáng. Để mô phỏng thiết lập grayscale, hãy dùng thuộc tính CSS {{cssxref("filter")}} với hàm {{cssxref("filter-function/grayscale")}} hoặc {{cssxref("filter-function/saturate")}} {{cssxref("filter-function")}}.

### Màu đỏ bão hòa

"Saturated Red" là một trường hợp đặc biệt nguy hiểm, và có các bài kiểm tra riêng cho nó.

Khái niệm độ bão hòa màu là một khái niệm khó hiểu nếu chỉ nhìn vào số và thuật ngữ, nên hãy xem hình bên dưới để minh họa khái niệm này:

![Độ bão hòa đỏ từ Wikimedia Commons, svg được lưu thành png. Ghi công: Datumizer [CC0]](320px-red_saturations.svg.png)

Cùng một "màu" chuyển từ ít bão hòa nhất ở bên trái sang bão hòa nhất ở bên phải.

_Có thể có nhiều hơn một màu "đỏ" được xem là đỏ "bão hòa"._ Ví dụ, màu `#990000` với `hsl(0 100% 30%)` là hoàn toàn bão hòa nhưng kém sáng hơn các màu mô tả ở trên. Tương tự, màu `#8b0000` cũng có độ bão hòa 100%.

Không phải tất cả các màu đỏ bão hòa đều được biểu diễn tốt trong phổ RGB hoặc các phổ khác thường dùng trong phát triển web. Theo trang Wikipedia về "Shades of Red", màu "Carmine" là một màu đỏ bão hòa, trong dạng pigment chủ yếu chứa ánh sáng đỏ có bước sóng dài hơn 600nm; bài viết đặc biệt lưu ý rằng "Carmine" gần với cực của phổ. Điều này đưa nó vượt xa các gamut tiêu chuẩn (RGB và CMYK), và giá trị RGB được cho chỉ là một xấp xỉ kém chính xác.

### Nhấp nháy đỏ bão hòa

Ngoài việc môi trường đỏ ảnh hưởng đến chức năng nhận thức của những người bị chấn thương sọ não, màu trong dải bước sóng đỏ còn đòi hỏi chú ý và kiểm thử đặc biệt.

Gregg Vanderheiden, khi thử nghiệm _Photosensitive epilepsy analysis tool_, ghi nhận tỷ lệ co giật cao hơn nhiều so với dự kiến. Họ phát hiện ra rằng chúng ta nhạy hơn nhiều với việc nhấp nháy đỏ bão hòa. (Xem video, [The Photosensitive epilepsy analysis tool](https://www.pbs.org/video/university-place-the-photosensitive-epilepsy-analysis-tool-ep-429/).)

### Nhấp nháy và co giật

Nhấp nháy sáng/tối liên tục với tần suất cao hơn ba lần mỗi giây đã được chứng minh có thể gây co giật quang ở một số người. Cũng đã phát hiện rằng một số mẫu rất đều, có độ tương phản cao, như các sọc đen trắng song song, cũng có thể gây co giật.

[Harding et al. 2005](https://onlinelibrary.wiley.com/doi/pdf/10.1111/j.1528-1167.2005.31305.x) đưa ra một số hướng dẫn cơ bản:

1. Một, hai hoặc ba nhấp nháy trong một giây là chấp nhận được, nhưng không nên có chuỗi nhấp nháy nếu trong một giây có hơn ba lần nhấp nháy.
2. Khi hiển thị các sọc sáng/tối, mẫu nên có không quá năm cặp sọc sáng-tối nếu các sọc đổi hướng, dao động, nhấp nháy hoặc đảo tương phản; hoặc không quá tám cặp sọc sáng-tối nếu mẫu không thay đổi hoặc đang trôi đi liên tục và mượt theo một hướng.

Để biết thêm khuyến nghị, xem bài viết [Photic- and Pattern-induced Seizures: Expert Consensus of the Epilepsy Foundation of America](https://onlinelibrary.wiley.com/doi/epdf/10.1111/j.1528-1167.2005.31405.x).

## Các khía cạnh tâm sinh lý của màu sắc

Màu sắc ở khía cạnh hue và độ bão hòa có thể ảnh hưởng đến tâm trạng, và nâng cao - hoặc làm giảm - trải nghiệm tương tác của chúng ta.

### Ví dụ về tác động của màu sắc vượt ra ngoài thị giác

- **Màu sắc có thể phụ thuộc văn hóa:** [A Cross-Cultural Study of the Affective Meanings of Color](https://journals.sagepub.com/doi/10.1177/002202217300400201)
- **Màu sắc ảnh hưởng đến cảm xúc của chúng ta:** [Color and emotion: effects of hue, saturation, and brightness](https://pubmed.ncbi.nlm.nih.gov/28612080/)
- **Tương phản cao hơn cũng có thể tác động tích cực đến cảm xúc:** [Emotion Variation from Controlling Contrast of Visual Contents through EEG-Based Deep Emotion Recognition](https://pubmed.ncbi.nlm.nih.gov/32823741/)
- **Một số màu có thể ảnh hưởng đến cảm nhận về thời gian:** [Color and time perception: Evidence for temporal overestimation of blue stimuli](https://pubmed.ncbi.nlm.nih.gov/29374198/)
- **Màu xanh dương cũng có ảnh hưởng đáng kể đến độ sáng và chói:** [Blue and glare & brightness](https://pubmed.ncbi.nlm.nih.gov/31288107/)
- **Kính phủ tông đỏ có thể mang lại cảm giác hạnh phúc hoặc vui vẻ hơn:** [Looking Through "Rose-Tinted" Glasses: The Influence of Tint on Visual Affective Processing](https://pubmed.ncbi.nlm.nih.gov/31244627/)
- **Màu đỏ được biết là có ảnh hưởng đáng kể đến hành vi của chúng ta:** [How the Color Red Influences Our Behavior](https://www.scientificamerican.com/article/how-the-color-red-influences-our-behavior/), Scientific American, S. Martinez-Conde, Stephen L. Macknik
- **Môi trường đỏ:** Các nghiên cứu cho thấy với những người bị chấn thương sọ não, [chức năng nhận thức giảm trong môi trường đỏ](https://pubmed.ncbi.nlm.nih.gov/20649469/).

## Xem thêm

- [Accessibility](/en-US/docs/Web/Accessibility)
- [Accessibility learning path](/en-US/docs/Learn_web_development/Core/Accessibility)
- Thuộc tính CSS {{cssxref("color")}}
- Kiểu dữ liệu CSS {{cssxref("&lt;color&gt;")}}
- [Web accessibility for seizures and physical reactions](/en-US/docs/Web/Accessibility/Guides/Seizure_disorders)
- [How the Color Red Influences Our Behavior](https://www.scientificamerican.com/article/how-the-color-red-influences-our-behavior/) Scientific American By Susana Martinez-Conde, Stephen L. Macknik on November 1, 2014
- [Red Desaturation](https://www.smartoptometry.app/red-desaturation/) Mắt người rất nhạy với màu đỏ, nên các bác sĩ nhãn khoa dùng nó để kiểm tra, đánh giá mức độ toàn vẹn của dây thần kinh thị giác.
- [Photic- and pattern-induced seizures: expert consensus of the Epilepsy Foundation of America Working Group](https://onlinelibrary.wiley.com/doi/pdf/10.1111/j.1528-1167.2005.31305.x)
