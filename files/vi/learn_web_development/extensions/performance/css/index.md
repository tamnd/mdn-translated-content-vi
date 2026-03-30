---
title: Tối ưu hóa hiệu suất CSS
short-title: CSS có hiệu suất cao
slug: Learn_web_development/Extensions/Performance/CSS
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Performance/HTML", "Learn_web_development/Extensions/Performance/business_case_for_performance", "Learn_web_development/Extensions/Performance")}}

Khi phát triển một trang web, bạn cần xem xét cách trình duyệt xử lý CSS trên trang web của bạn. Để giảm thiểu bất kỳ vấn đề hiệu suất nào mà CSS có thể gây ra, bạn nên tối ưu hóa nó. Ví dụ, bạn nên tối ưu hóa CSS để giảm thiểu [chặn kết xuất](/en-US/docs/Glossary/Render_blocking) và giảm thiểu số lần tính toán lại bố cục (reflow) cần thiết. Bài viết này hướng dẫn bạn qua các kỹ thuật tối ưu hóa hiệu suất CSS chính.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <a
          href="/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Installing_software"
          >Phần mềm cơ bản đã được cài đặt</a
        >, và kiến thức cơ bản về
        <a href="/en-US/docs/Learn_web_development/Getting_started/Your_first_website"
          >các công nghệ web phía client</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Tìm hiểu về ảnh hưởng của CSS đến hiệu suất trang web và cách tối ưu hóa CSS để cải thiện hiệu suất.
      </td>
    </tr>
  </tbody>
</table>

## Tối ưu hóa hay không tối ưu hóa

Câu hỏi đầu tiên bạn nên trả lời trước khi bắt đầu tối ưu hóa CSS của mình là "tôi cần tối ưu hóa điều gì?". Một số mẹo và kỹ thuật được thảo luận dưới đây là các phương pháp hay nhất sẽ mang lại lợi ích cho hầu hết mọi dự án web, trong khi một số chỉ cần thiết trong các tình huống nhất định. Cố gắng áp dụng tất cả các kỹ thuật này ở mọi nơi có thể là không cần thiết và có thể là lãng phí thời gian của bạn. Bạn nên tìm ra những tối ưu hóa hiệu suất nào thực sự cần thiết trong mỗi dự án.

Để làm điều này, bạn cần [đo lường hiệu suất](/en-US/docs/Learn_web_development/Extensions/Performance/Measuring_performance) của trang web. Như liên kết trước cho thấy, có nhiều cách khác nhau để đo lường hiệu suất, một số liên quan đến [các API hiệu suất](/en-US/docs/Web/API/Performance_API) phức tạp. Cách tốt nhất để bắt đầu, tuy nhiên, là tìm hiểu cách sử dụng các công cụ như các công cụ [mạng](/en-US/docs/Learn_web_development/Extensions/Performance/Measuring_performance#network_monitor_tools) và [hiệu suất](/en-US/docs/Learn_web_development/Extensions/Performance/Measuring_performance#performance_monitor_tools) tích hợp trong trình duyệt, để xem các phần tải trang nào đang mất nhiều thời gian và cần tối ưu hóa.

## Tối ưu hóa kết xuất

Trình duyệt tuân theo một đường dẫn kết xuất cụ thể — vẽ chỉ xảy ra sau bố cục, xảy ra sau khi cây kết xuất được tạo ra, điều này đến lượt nó yêu cầu cả hai cây DOM và CSSOM.

Hiển thị cho người dùng một trang không có kiểu và sau đó vẽ lại sau khi các kiểu CSS đã được phân tích sẽ là trải nghiệm người dùng kém. Vì lý do này, CSS là chặn kết xuất cho đến khi trình duyệt xác định rằng CSS là cần thiết. Trình duyệt có thể vẽ trang sau khi nó đã tải xuống CSS và xây dựng [mô hình đối tượng CSS (CSSOM)](/en-US/docs/Glossary/CSSOM).

Để tối ưu hóa việc xây dựng CSSOM và cải thiện hiệu suất trang, bạn có thể làm một hoặc nhiều điều sau dựa trên trạng thái hiện tại của CSS:

- **Loại bỏ các kiểu không cần thiết**: Điều này có vẻ hiển nhiên, nhưng thật ngạc nhiên khi có bao nhiêu nhà phát triển quên dọn sạch các quy tắc CSS không sử dụng được thêm vào stylesheet của họ trong quá trình phát triển và cuối cùng không được sử dụng. Tất cả các kiểu đều được phân tích, dù chúng có được sử dụng trong quá trình bố cục và vẽ hay không, vì vậy có thể tăng tốc kết xuất trang bằng cách loại bỏ những kiểu không sử dụng. Như [How Do You Remove Unused CSS From a Site?](https://css-tricks.com/how-do-you-remove-unused-css-from-a-site/) (csstricks.com, 2019) tóm tắt, đây là vấn đề khó giải quyết cho một codebase lớn, và không có viên đạn bạc nào để tìm và loại bỏ CSS không sử dụng một cách đáng tin cậy. Bạn cần làm công việc khó khăn là giữ CSS của mình theo mô-đun và cẩn thận và có chủ ý về những gì được thêm vào và loại bỏ.

- **Chia CSS thành các mô-đun riêng biệt**: Giữ CSS theo mô-đun có nghĩa là CSS không cần thiết khi tải trang có thể được tải sau, giảm thời gian CSS ban đầu chặn kết xuất và tải. Cách đơn giản nhất để làm điều này là chia CSS của bạn thành các tệp riêng biệt và chỉ tải những gì cần thiết:

  ```html
  <!-- Loading and parsing styles.css is render-blocking -->
  <link rel="stylesheet" href="styles.css" />

  <!-- Loading and parsing print.css is not render-blocking -->
  <link rel="stylesheet" href="print.css" media="print" />

  <!-- Loading and parsing mobile.css is not render-blocking on large screens -->
  <link
    rel="stylesheet"
    href="mobile.css"
    media="screen and (width <= 480px)" />
  ```

  Ví dụ trên cung cấp ba bộ kiểu — kiểu mặc định sẽ luôn tải, kiểu chỉ tải khi tài liệu đang được in, và kiểu chỉ được tải bởi các thiết bị có màn hình hẹp. Theo mặc định, trình duyệt giả định rằng mỗi stylesheet được chỉ định là chặn kết xuất. Bạn có thể cho trình duyệt biết khi nào một stylesheet nên được áp dụng bằng cách thêm thuộc tính `media` chứa [media query](/en-US/docs/Web/CSS/Guides/Media_queries/Using). Khi trình duyệt thấy một stylesheet mà nó chỉ cần áp dụng trong một tình huống cụ thể, nó vẫn tải xuống stylesheet, nhưng không chặn kết xuất. Bằng cách tách CSS thành nhiều tệp, tệp chặn kết xuất chính, trong trường hợp này là `styles.css`, nhỏ hơn nhiều, giảm thời gian kết xuất bị chặn.

- **Thu nhỏ (minification) và nén CSS**: Thu nhỏ liên quan đến việc loại bỏ tất cả khoảng trắng trong tệp chỉ có để dễ đọc cho con người, sau khi mã được đưa vào sản xuất. Bạn có thể giảm đáng kể thời gian tải bằng cách thu nhỏ CSS. Thu nhỏ thường được thực hiện như một phần của quá trình xây dựng (ví dụ, hầu hết các framework JavaScript sẽ thu nhỏ mã khi bạn xây dựng dự án sẵn sàng để triển khai). Ngoài việc thu nhỏ, hãy đảm bảo rằng server lưu trữ trang web của bạn sử dụng nén như gzip trên các tệp trước khi phục vụ chúng.

- **Đơn giản hóa bộ chọn**: Mọi người thường viết bộ chọn phức tạp hơn mức cần thiết để áp dụng các kiểu cần thiết. Điều này không chỉ làm tăng kích thước tệp, mà còn tăng thời gian phân tích cho các bộ chọn đó. Ví dụ:

  ```css
  /* Very specific selector */
  body div#main-content article.post h2.headline {
    font-size: 24px;
  }

  /* You probably only need this */
  .headline {
    font-size: 24px;
  }
  ```

  Làm cho bộ chọn của bạn ít phức tạp và cụ thể hơn cũng tốt cho việc bảo trì. Dễ hiểu những gì các bộ chọn đơn giản đang làm, và dễ ghi đè các kiểu khi cần sau này nếu các bộ chọn ít [cụ thể](/en-US/docs/Learn_web_development/Core/Styling_basics/Handling_conflicts#specificity_2) hơn.

- **Đừng áp dụng kiểu cho nhiều phần tử hơn mức cần thiết**: Một lỗi phổ biến là áp dụng kiểu cho tất cả các phần tử bằng cách sử dụng [bộ chọn phổ quát](/en-US/docs/Web/CSS/Reference/Selectors/Universal_selectors), hoặc ít nhất là cho nhiều phần tử hơn mức cần thiết. Loại tạo kiểu này có thể ảnh hưởng đến hiệu suất một cách tiêu cực, đặc biệt là trên các trang web lớn hơn.

  ```css
  /* Selects every element inside the <body> */
  body * {
    font-size: 14px;
    display: flex;
  }
  ```

  Hãy nhớ rằng nhiều thuộc tính (chẳng hạn như {{cssxref("font-size")}}) kế thừa giá trị của chúng từ cha mẹ của chúng, vì vậy bạn không cần áp dụng chúng ở mọi nơi. Và các công cụ mạnh mẽ như [Flexbox](/en-US/docs/Learn_web_development/Core/CSS_layout/Flexbox) cần được sử dụng một cách tiết kiệm. Sử dụng chúng ở mọi nơi có thể gây ra tất cả các loại hành vi không mong đợi.

- **Giảm các yêu cầu HTTP hình ảnh bằng CSS sprites**: [CSS sprites](https://css-tricks.com/css-sprites/) là một kỹ thuật đặt một số hình ảnh nhỏ (chẳng hạn như biểu tượng) mà bạn muốn sử dụng trên trang web của mình vào một tệp hình ảnh duy nhất, và sau đó sử dụng các giá trị {{cssxref("background-position")}} khác nhau để hiển thị đoạn hình ảnh mà bạn muốn hiển thị ở mỗi vị trí khác nhau. Điều này có thể giảm đáng kể số lượng yêu cầu HTTP cần thiết để tải xuống hình ảnh.

- **Preload các tài nguyên quan trọng**: Bạn có thể sử dụng [`rel="preload"`](/en-US/docs/Web/HTML/Reference/Attributes/rel/preload) để biến các phần tử {{htmlelement("link")}} thành preloaders cho các tài nguyên quan trọng. Điều này bao gồm các tệp CSS, phông chữ và hình ảnh:

  ```html
  <link rel="preload" href="style.css" as="style" />

  <link
    rel="preload"
    href="ComicSans.woff2"
    as="font"
    type="font/woff2"
    crossorigin />

  <link
    rel="preload"
    href="bg-image-wide.png"
    as="image"
    media="(width > 600px)" />
  ```

  Với `preload`, trình duyệt sẽ tải xuống các tài nguyên được tham chiếu càng sớm càng tốt và làm cho chúng có sẵn trong bộ nhớ đệm trình duyệt để chúng sẵn sàng sử dụng sớm hơn khi chúng được tham chiếu trong mã tiếp theo. Hữu ích khi preload các tài nguyên có mức độ ưu tiên cao mà người dùng sẽ gặp sớm trên trang để trải nghiệm càng mượt mà càng tốt. Lưu ý cách bạn cũng có thể sử dụng các thuộc tính `media` để tạo các preloader đáp ứng.

  Xem thêm [Preload các tài nguyên quan trọng để cải thiện tốc độ tải](https://web.dev/articles/preload-critical-assets) trên web.dev (2020)

## Xử lý hoạt ảnh

Hoạt ảnh có thể cải thiện hiệu suất cảm nhận, làm cho giao diện cảm thấy nhanh nhẹn hơn và làm cho người dùng cảm thấy tiến trình đang được thực hiện khi họ đang chờ trang tải (vòng quay tải, ví dụ). Tuy nhiên, hoạt ảnh lớn hơn và số lượng hoạt ảnh cao hơn đương nhiên sẽ yêu cầu nhiều sức mạnh xử lý hơn để xử lý, điều này có thể làm suy giảm hiệu suất.

Lời khuyên đơn giản nhất là giảm bớt tất cả các hoạt ảnh không cần thiết. Bạn cũng có thể cung cấp cho người dùng điều khiển/tùy chọn trang web để tắt hoạt ảnh nếu họ đang sử dụng thiết bị có công suất thấp hoặc thiết bị di động với dung lượng pin hạn chế. Bạn cũng có thể sử dụng JavaScript để kiểm soát liệu hoạt ảnh có được áp dụng cho trang ngay từ đầu hay không. Ngoài ra còn có một media query gọi là {{cssxref("@media/prefers-reduced-motion")}} có thể được sử dụng để phục vụ các kiểu hoạt ảnh hoặc không dựa trên tùy chọn cấp độ hệ điều hành của người dùng cho hoạt ảnh.

Đối với các hoạt ảnh DOM thiết yếu, bạn được khuyến nghị sử dụng [hoạt ảnh CSS](/en-US/docs/Web/CSS/Guides/Animations/Using) khi có thể, thay vì hoạt ảnh JavaScript ([Web Animations API](/en-US/docs/Web/API/Web_Animations_API) cung cấp cách trực tiếp kết nối vào hoạt ảnh CSS bằng JavaScript).

### Chọn thuộc tính để hoạt ảnh

Tiếp theo, hiệu suất hoạt ảnh phụ thuộc nhiều vào những thuộc tính bạn đang hoạt ảnh. Một số thuộc tính, khi được hoạt ảnh, kích hoạt [tính toán lại bố cục (reflow)](/en-US/docs/Glossary/Reflow) (và do đó cũng là [vẽ lại (repaint)](/en-US/docs/Glossary/Repaint)) và nên được tránh. Chúng bao gồm các thuộc tính:

- Thay đổi kích thước của phần tử, chẳng hạn như {{cssxref("width")}}, {{cssxref("height")}}, {{cssxref("border")}} và {{cssxref("padding")}}.
- Định vị lại phần tử, chẳng hạn như {{cssxref("margin")}}, {{cssxref("top")}}, {{cssxref("bottom")}}, {{cssxref("left")}} và {{cssxref("right")}}.
- Thay đổi bố cục của phần tử, chẳng hạn như {{cssxref("align-content")}}, {{cssxref("align-items")}} và {{cssxref("flex")}}.
- Thêm các hiệu ứng hình ảnh thay đổi hình học phần tử, chẳng hạn như {{cssxref("box-shadow")}}.

Các trình duyệt hiện đại đủ thông minh để chỉ vẽ lại khu vực đã thay đổi của tài liệu, chứ không phải toàn bộ trang. Kết quả là, các hoạt ảnh lớn hơn tốn kém hơn.

Nếu có thể, tốt hơn là hoạt ảnh các thuộc tính không gây ra tính toán lại bố cục (reflow)/vẽ lại (repaint). Điều này bao gồm:

- [Transforms](/en-US/docs/Web/CSS/Guides/Transforms)
- {{cssxref("opacity")}}
- {{cssxref("filter")}}

### Hoạt ảnh trên GPU

Để cải thiện hiệu suất hơn nữa, bạn nên xem xét việc chuyển công việc hoạt ảnh ra khỏi luồng chính và lên GPU của thiết bị (còn được gọi là compositing). Điều này được thực hiện bằng cách chọn các loại hoạt ảnh cụ thể mà trình duyệt sẽ tự động gửi đến GPU để xử lý; chúng bao gồm:

- Hoạt ảnh biến đổi 3D như [`transform: translateZ()`](/en-US/docs/Web/CSS/Reference/Properties/transform) và {{cssxref("transform-function/rotate3d")}}.
- Các phần tử có một số thuộc tính khác được hoạt ảnh như [`position: fixed`](/en-US/docs/Web/CSS/Reference/Properties/position).
- Các phần tử có {{cssxref("will-change")}} được áp dụng (xem phần bên dưới).
- Một số phần tử được kết xuất trong layer của riêng chúng, bao gồm [`<video>`](/en-US/docs/Web/HTML/Reference/Elements/video), [`<canvas>`](/en-US/docs/Web/HTML/Reference/Elements/canvas) và [`<iframe>`](/en-US/docs/Web/HTML/Reference/Elements/iframe).

Hoạt ảnh trên GPU có thể cải thiện hiệu suất, đặc biệt là trên di động. Tuy nhiên, việc chuyển hoạt ảnh sang GPU không phải lúc nào cũng đơn giản. Đọc [CSS GPU Animation: Doing It Right](https://www.smashingmagazine.com/2016/12/gpu-animation-doing-it-right/) (smashingmagazine.com, 2016) để phân tích rất hữu ích và chi tiết.

## Tối ưu hóa thay đổi phần tử với `will-change`

Trình duyệt có thể thiết lập các tối ưu hóa trước khi một phần tử thực sự thay đổi. Những loại tối ưu hóa này có thể tăng khả năng phản hồi của trang bằng cách thực hiện công việc tiềm năng tốn kém trước khi cần. Thuộc tính CSS {{cssxref("will-change")}} gợi ý cho trình duyệt cách một phần tử được mong đợi thay đổi.

> [!NOTE]
> `will-change` được dự định sử dụng như biện pháp cuối cùng để cố gắng giải quyết các vấn đề hiệu suất hiện có. Nó không nên được sử dụng để lường trước các vấn đề hiệu suất.

```css
.element {
  will-change: opacity, transform;
}
```

## Tối ưu hóa cho chặn kết xuất

CSS có thể phạm vi các kiểu cho các điều kiện cụ thể với media queries. Media queries quan trọng cho thiết kế web đáp ứng và giúp chúng ta tối ưu hóa đường dẫn kết xuất quan trọng. Trình duyệt chặn kết xuất cho đến khi nó phân tích tất cả các kiểu này nhưng sẽ không chặn kết xuất trên các kiểu mà nó biết sẽ không sử dụng, chẳng hạn như các stylesheet in. Bằng cách chia CSS thành nhiều tệp dựa trên media queries, bạn có thể ngăn chặn chặn kết xuất trong quá trình tải xuống CSS không sử dụng. Để tạo liên kết CSS không chặn, hãy di chuyển các kiểu không được sử dụng ngay lập tức, chẳng hạn như kiểu in, vào tệp riêng biệt, thêm [`<link>`](/en-US/docs/Web/HTML/Reference/Elements/link) vào đánh dấu HTML, và thêm media query, trong trường hợp này là stylesheet in.

```html
<!-- Loading and parsing styles.css is render-blocking -->
<link rel="stylesheet" href="styles.css" />

<!-- Loading and parsing print.css is not render-blocking -->
<link rel="stylesheet" href="print.css" media="print" />

<!-- Loading and parsing mobile.css is not render-blocking on large screens -->
<link rel="stylesheet" href="mobile.css" media="screen and (width <= 480px)" />
```

Theo mặc định, trình duyệt giả định rằng mỗi stylesheet được chỉ định là chặn kết xuất. Cho trình duyệt biết khi nào stylesheet nên được áp dụng bằng cách thêm thuộc tính `media` với [media query](/en-US/docs/Web/CSS/Guides/Media_queries/Using). Khi trình duyệt thấy một stylesheet mà nó biết rằng nó chỉ cần áp dụng cho một tình huống cụ thể, nó vẫn tải xuống stylesheet, nhưng không chặn kết xuất. Bằng cách tách CSS thành nhiều tệp, tệp chặn kết xuất chính, trong trường hợp này là `styles.css`, nhỏ hơn nhiều, giảm thời gian kết xuất bị chặn.

## Cải thiện hiệu suất phông chữ

Phần này chứa một số mẹo hữu ích để cải thiện hiệu suất phông chữ web.

Nói chung, hãy suy nghĩ cẩn thận về các phông chữ bạn sử dụng trên trang web của mình. Một số tệp phông chữ có thể rất lớn (nhiều megabyte). Mặc dù có thể hấp dẫn khi sử dụng nhiều phông chữ để tạo sự phấn khích về mặt hình ảnh, điều này có thể làm chậm đáng kể thời gian tải trang và làm cho trang web của bạn trông lộn xộn. Bạn có thể chỉ cần khoảng hai hoặc ba phông chữ, và bạn có thể dùng ít hơn nếu bạn chọn sử dụng [phông chữ an toàn web](/en-US/docs/Learn_web_development/Core/Text_styling/Fundamentals#web_safe_fonts).

### Tải phông chữ

Hãy nhớ rằng phông chữ chỉ được tải khi nó thực sự được áp dụng cho một phần tử bằng thuộc tính {{cssxref("font-family")}}, không phải khi nó được tham chiếu lần đầu bằng quy tắc {{cssxref("@font-face")}}:

```css
/* Font not loaded here */
@font-face {
  font-family: "Open Sans";
  src: url("OpenSans-Regular-webfont.woff2") format("woff2");
}

h1,
h2,
h3 {
  /* It is actually loaded here */
  font-family: "Open Sans", sans-serif;
}
```

Do đó, sẽ có lợi khi sử dụng `rel="preload"` để tải các phông chữ quan trọng sớm, để chúng có sẵn nhanh hơn khi thực sự cần:

```html
<link
  rel="preload"
  href="OpenSans-Regular-webfont.woff2"
  as="font"
  type="font/woff2"
  crossorigin />
```

Điều này có khả năng mang lại lợi ích hơn nếu khai báo `font-family` của bạn được ẩn bên trong stylesheet bên ngoài lớn, và sẽ không được tiếp cận cho đến khi muộn hơn đáng kể trong quá trình phân tích. Tuy nhiên, đây là sự đánh đổi — các tệp phông chữ khá lớn, và nếu bạn preload quá nhiều, bạn có thể trì hoãn các tài nguyên khác.

Bạn cũng có thể xem xét:

- Sử dụng [`rel="preconnect"`](/en-US/docs/Web/HTML/Reference/Attributes/rel/preconnect) để tạo kết nối sớm với nhà cung cấp phông chữ. Xem [Preconnect to critical third-party origins](https://web.dev/articles/font-best-practices#preconnect_to_critical_third-party_origins) để biết chi tiết.
- Sử dụng [CSS Font Loading API](/en-US/docs/Web/API/CSS_Font_Loading_API) để tùy chỉnh hành vi tải phông chữ qua JavaScript.

### Chỉ tải các glyph bạn cần

Khi chọn phông chữ cho nội dung thân bài, khó hơn để chắc chắn về các glyph sẽ được sử dụng trong đó, đặc biệt nếu bạn đang xử lý nội dung do người dùng tạo và/hoặc nội dung qua nhiều ngôn ngữ.

Tuy nhiên, nếu bạn biết bạn sẽ sử dụng một bộ glyph cụ thể (ví dụ, glyph cho tiêu đề hoặc ký tự dấu câu cụ thể chỉ), bạn có thể giới hạn số lượng glyph trình duyệt phải tải xuống. Điều này có thể được thực hiện bằng cách tạo một tệp phông chữ chỉ chứa tập hợp con cần thiết. Một quá trình gọi là [subsetting](https://fonts.google.com/knowledge/glossary/subsetting). Mô tả [`unicode-range`](/en-US/docs/Web/CSS/Reference/At-rules/@font-face/unicode-range) `@font-face` sau đó có thể được sử dụng để chỉ định khi nào phông chữ tập hợp con của bạn được sử dụng. Nếu trang không sử dụng bất kỳ ký tự nào trong phạm vi này, phông chữ không được tải xuống.

```css
@font-face {
  font-family: "Open Sans";
  src: url("OpenSans-Regular-webfont.woff2") format("woff2");
  unicode-range: U+0025-00FF;
}
```

### Định nghĩa hành vi hiển thị phông chữ với mô tả `font-display`

Được áp dụng cho quy tắc `@font-face`, mô tả [`font-display`](/en-US/docs/Web/CSS/Reference/At-rules/@font-face/font-display) định nghĩa cách trình duyệt tải và hiển thị các tệp phông chữ, cho phép văn bản xuất hiện với phông chữ dự phòng trong khi phông chữ tải, hoặc không tải được. Điều này cải thiện hiệu suất bằng cách làm cho văn bản có thể nhìn thấy thay vì có màn hình trống, với sự đánh đổi là xuất hiện văn bản chưa được tạo kiểu.

```css
@font-face {
  font-family: "someFont";
  src: url("/path/to/fonts/someFont.woff") format("woff");
  font-weight: normal;
  font-style: normal;
  font-display: fallback;
}
```

## Tối ưu hóa tính toán lại kiểu với CSS containment

Bằng cách sử dụng các thuộc tính được định nghĩa trong mô-đun [CSS containment](/en-US/docs/Web/CSS/Guides/Containment), bạn có thể hướng dẫn trình duyệt cô lập các phần khác nhau của trang và tối ưu hóa kết xuất của chúng một cách độc lập với nhau. Điều này cho phép cải thiện hiệu suất trong kết xuất các phần riêng lẻ. Ví dụ, bạn có thể chỉ định cho trình duyệt không kết xuất một số vùng chứa nhất định cho đến khi chúng hiển thị trong viewport.

Thuộc tính {{cssxref("contain")}} cho phép tác giả chỉ định chính xác [loại containment](/en-US/docs/Web/CSS/Guides/Containment/Using) nào họ muốn áp dụng cho từng vùng chứa riêng lẻ trên trang. Điều này cho phép trình duyệt tính toán lại bố cục, kiểu, vẽ, kích thước, hoặc bất kỳ tổ hợp nào trong số đó cho một phần hạn chế của DOM.

```css
article {
  contain: content;
}
```

Thuộc tính {{cssxref("content-visibility")}} là một phím tắt hữu ích, cho phép các tác giả áp dụng một bộ containment mạnh mẽ trên một tập hợp các vùng chứa và chỉ định rằng trình duyệt không nên bố cục và kết xuất các vùng chứa đó cho đến khi cần.

Một thuộc tính thứ hai, {{cssxref("contain-intrinsic-size")}}, cũng có sẵn, cho phép bạn cung cấp kích thước giữ chỗ cho các vùng chứa trong khi chúng đang chịu ảnh hưởng của containment. Điều này có nghĩa là các vùng chứa sẽ chiếm không gian ngay cả khi nội dung của chúng chưa được kết xuất, cho phép containment thực hiện điều kỳ diệu hiệu suất của nó mà không có rủi ro dịch chuyển thanh cuộn và jank khi các phần tử kết xuất và hiện ra. Điều này cải thiện chất lượng trải nghiệm người dùng khi nội dung được tải.

```css
article {
  content-visibility: auto;
  contain-intrinsic-size: 1000px;
}
```

## Tối ưu hóa bộ chọn `:has()`

Lớp giả {{cssxref(":has", ":has()")}} cho phép khả năng chọn lọc mạnh mẽ nhưng yêu cầu sử dụng cẩn thận để tránh các vấn đề thắt cổ chai về hiệu suất. Để có hướng dẫn chi tiết về cách viết bộ chọn `:has()` hiệu quả, xem [Các cân nhắc về hiệu suất trong tài liệu tham khảo `:has()`](/en-US/docs/Web/CSS/Reference/Selectors/:has#performance_considerations).

## Xem thêm

- [Hiệu suất hoạt ảnh CSS](/en-US/docs/Web/Performance/Guides/CSS_JavaScript_animation_performance)
- [Các phương pháp hay nhất cho phông chữ](https://web.dev/articles/font-best-practices) trên web.dev (2022)
- [content-visibility: thuộc tính CSS mới tăng hiệu suất kết xuất của bạn](https://web.dev/articles/content-visibility) trên web.dev (2022)

{{PreviousMenuNext("Learn_web_development/Extensions/Performance/HTML", "Learn_web_development/Extensions/Performance/business_case_for_performance", "Learn_web_development/Extensions/Performance")}}
