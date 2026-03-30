---
title: Phông chữ web
slug: Learn_web_development/Core/Text_styling/Web_fonts
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Text_styling/Styling_links", "Learn_web_development/Core/Text_styling/Typesetting_a_homepage", "Learn_web_development/Core/Text_styling")}}

Trong bài viết đầu tiên của mô-đun, chúng ta đã khám phá các tính năng CSS cơ bản có sẵn để tạo kiểu phông chữ và văn bản. Trong bài viết này, chúng ta sẽ đi sâu hơn, khám phá phông chữ web một cách chi tiết. Chúng ta sẽ xem cách sử dụng phông chữ tùy chỉnh với trang web của bạn để cho phép tạo kiểu văn bản đa dạng và cá nhân hóa hơn.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content"
          >Cấu trúc nội dung với HTML</a
        >,
        <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">Kiến thức cơ bản về tạo kiểu CSS</a>,
        <a href="/en-US/docs/Learn_web_development/Core/Text_styling/Fundamentals">Kiến thức cơ bản về tạo kiểu văn bản và phông chữ</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
       <ul>
         <li>Hiểu rằng phông chữ web cho phép các nhà phát triển vượt ra ngoài bộ phông chữ an toàn cho web và sử dụng phông chữ tùy chỉnh trên các ứng dụng web của họ.</li>
         <li>Cài đặt cơ bản — at-rule <code>@font-face</code> và các mô tả phổ biến.</li>
         <li>Sử dụng phông chữ web với thuộc tính <code>font-family</code>.</li>
         <li>Sử dụng dịch vụ trực tuyến để tìm phông chữ web và tạo mã phông chữ web, ví dụ: <a href="https://www.fontsquirrel.com/">Font Squirrel</a> hoặc <a href="https://fonts.google.com/">Google Fonts</a>.</li>
       </ul>
      </td>
    </tr>
  </tbody>
</table>

## Tóm tắt về họ phông chữ

Như chúng ta đã xem xét trong [Kiến thức cơ bản về tạo kiểu văn bản và phông chữ](/en-US/docs/Learn_web_development/Core/Text_styling/Fundamentals), các phông chữ được áp dụng cho HTML của bạn có thể được kiểm soát bằng thuộc tính {{cssxref("font-family")}}. Thuộc tính này nhận một hoặc nhiều tên họ phông. Khi hiển thị một trang web, trình duyệt sẽ đi qua danh sách các giá trị font-family cho đến khi tìm thấy phông chữ có sẵn trên hệ thống đang chạy:

```css
p {
  font-family: "Helvetica", "Trebuchet MS", "Verdana", sans-serif;
}
```

Hệ thống này hoạt động tốt, nhưng theo truyền thống, lựa chọn phông chữ của các nhà phát triển web bị hạn chế. Chỉ có một số ít phông chữ bạn có thể đảm bảo có sẵn trên tất cả các hệ thống phổ biến — các cái gọi là [Phông chữ an toàn cho web](/en-US/docs/Learn_web_development/Core/Text_styling/Fundamentals#web_safe_fonts). Bạn có thể sử dụng font stack để chỉ định các phông chữ ưu tiên, tiếp theo là các phông chữ an toàn cho web thay thế, tiếp theo là phông chữ hệ thống mặc định. Tuy nhiên, điều này làm tăng khối lượng công việc của bạn do việc kiểm tra cần thiết để đảm bảo thiết kế của bạn hoạt động với từng phông chữ.

## Phông chữ web

Có một lựa chọn thay thế hoạt động tốt. CSS cho phép bạn chỉ định các tệp phông chữ, có sẵn trên web, để được tải xuống cùng với trang web của bạn khi nó được truy cập. Điều này có nghĩa là bất kỳ trình duyệt nào hỗ trợ tính năng CSS này đều có thể hiển thị các phông chữ bạn đã chọn cụ thể. Tuyệt vời! Cú pháp cần thiết trông đại khái như thế này:

Trước tiên, bạn có một bộ quy tắc {{cssxref("@font-face")}} ở đầu CSS, chỉ định (các) tệp phông chữ cần tải xuống:

```css
@font-face {
  font-family: "myFont";
  src: url("myFont.woff2");
}
```

Bên dưới điều này, bạn sử dụng tên họ phông được chỉ định bên trong {{cssxref("@font-face")}} để áp dụng phông chữ tùy chỉnh của mình cho bất cứ thứ gì bạn thích, như bình thường:

```css
html {
  font-family: "myFont", "Bitstream Vera Serif", serif;
}
```

Cú pháp trở nên phức tạp hơn một chút so với điều này. Chúng ta sẽ đi vào chi tiết hơn bên dưới.

Đây là một số điều quan trọng cần ghi nhớ về phông chữ web:

1. Phông chữ thường không miễn phí để sử dụng mà không có hạn chế. Bạn phải trả tiền cho chúng và/hoặc tuân theo các điều kiện cấp phép khác, chẳng hạn như ghi công tác giả phông chữ trong mã của bạn (hoặc trên trang web của bạn). Bạn không nên đánh cắp phông chữ và sử dụng chúng mà không cho công nhận đúng cách.
2. Tất cả các trình duyệt lớn đều hỗ trợ WOFF/WOFF2 (Web Open Font Format phiên bản 1 và 2). Ngay cả các trình duyệt cũ hơn như IE9 (được phát hành vào năm 2011) đều hỗ trợ định dạng WOFF.
3. WOFF2 hỗ trợ toàn bộ các thông số kỹ thuật TrueType và OpenType, bao gồm phông chữ biến, phông chữ chromatic và bộ sưu tập phông chữ.
4. Thứ tự bạn liệt kê các tệp phông chữ rất quan trọng. Nếu bạn cung cấp cho trình duyệt danh sách nhiều tệp phông chữ để tải xuống, trình duyệt sẽ chọn tệp phông chữ đầu tiên mà nó có thể sử dụng. Đó là lý do tại sao định dạng bạn liệt kê đầu tiên nên là định dạng ưu tiên — tức là WOFF2 — với các định dạng cũ hơn được liệt kê sau đó. Các trình duyệt không hiểu một định dạng sau đó sẽ chuyển sang định dạng tiếp theo trong danh sách.
5. Nếu bạn cần làm việc với các trình duyệt cũ, bạn nên cung cấp EOT (Embedded Open Type), TTF (TrueType Font), và SVG phông chữ web để tải xuống. Bài viết này giải thích cách sử dụng Fontsquirrel Webfont Generator để tạo ra các tệp cần thiết.

Bạn có thể sử dụng [Firefox Font Editor](https://firefox-source-docs.mozilla.org/devtools-user/page_inspector/how_to/edit_fonts/index.html) để điều tra và thao tác các phông chữ đang được sử dụng trên trang của bạn, cho dù chúng là phông chữ web hay không.

## Thêm phông chữ web của riêng bạn

Với điều này trong tâm trí, hãy xây dựng một ví dụ phông chữ web cơ bản từ các nguyên tắc đầu tiên. Bạn nên sử dụng các tệp [web-font-start.html](https://github.com/mdn/learning-area/blob/main/css/styling-text/web-fonts/web-font-start.html) và [web-font-start.css](https://github.com/mdn/learning-area/blob/main/css/styling-text/web-fonts/web-font-start.css) làm điểm xuất phát để thêm mã của bạn vào (xem [ví dụ trực tiếp](https://mdn.github.io/learning-area/css/styling-text/web-fonts/web-font-start.html)). Hãy tạo một bản sao của các tệp này trong một thư mục mới trên máy tính của bạn ngay bây giờ. Trong tệp `web-font-start.css`, bạn sẽ tìm thấy một số CSS tối giản để xử lý bố cục cơ bản và dàn chữ của ví dụ.

### Tìm kiếm phông chữ

Cho ví dụ này, chúng ta sẽ sử dụng hai phông chữ web: một cho các tiêu đề và một cho văn bản nội dung. Để bắt đầu, chúng ta cần tìm các tệp phông chữ chứa các phông chữ đó. Phông chữ được tạo bởi các nhà sản xuất phông và được lưu trữ trong các định dạng tệp khác nhau. Nói chung có ba loại trang web nơi bạn có thể lấy phông chữ:

- Nhà phân phối phông chữ miễn phí: Đây là trang web cung cấp phông chữ miễn phí để tải xuống (vẫn có thể có một số điều kiện cấp phép, chẳng hạn như ghi công tác giả phông chữ). Ví dụ bao gồm [Font Squirrel](https://www.fontsquirrel.com/), [DaFont](https://www.dafont.com/), và [Everything Fonts](https://everythingfonts.com/).
- Nhà phân phối phông chữ trả phí: Đây là trang web cung cấp phông chữ có tính phí, chẳng hạn như [fonts.com](https://www.fonts.com/) hoặc [myfonts.com](https://www.myfonts.com/). Bạn cũng có thể mua phông chữ trực tiếp từ các nhà sản xuất phông, ví dụ: [Linotype](https://www.linotype.com/), [Monotype](https://www.monotype.com/), hoặc [Exljbris](https://www.exljbris.com/).
- Dịch vụ phông chữ trực tuyến: Đây là trang web lưu trữ và phục vụ phông chữ cho bạn, giúp cho toàn bộ quá trình dễ dàng hơn. Xem phần [Sử dụng dịch vụ phông chữ trực tuyến](#using_an_online_font_service) để biết thêm chi tiết.

Hãy tìm một số phông chữ! Truy cập [Font Squirrel](https://www.fontsquirrel.com/) và chọn hai phông chữ: một phông chữ thú vị đẹp cho các tiêu đề (có thể là phông chữ display hoặc slab serif đẹp), và một phông chữ ít bắt mắt hơn nhưng dễ đọc hơn cho các đoạn văn. Khi bạn đã tìm thấy phông chữ, nhấn nút tải xuống và lưu tệp trong cùng thư mục với các tệp HTML và CSS bạn đã lưu trước đó. Không quan trọng chúng là TTF (True Type Fonts) hay OTF (Open Type Fonts).

Giải nén hai gói phông chữ (Phông chữ web thường được phân phối trong các tệp ZIP chứa (các) tệp phông và thông tin cấp phép). Bạn có thể tìm thấy nhiều tệp phông trong gói — một số phông được phân phối theo họ với các biến thể khác nhau có sẵn — ví dụ: thin, medium, bold, italic, thin italic, v.v. Cho ví dụ này, chúng ta chỉ muốn bạn quan tâm đến một tệp phông duy nhất cho mỗi lựa chọn.

> [!NOTE]
> Trong Font Squirrel, ở phần "Find fonts" ở cột bên phải, bạn có thể nhấp vào các thẻ và phân loại khác nhau để lọc các lựa chọn được hiển thị.

### Tạo mã cần thiết

Bây giờ bạn sẽ cần tạo mã cần thiết (và các định dạng phông). Đối với mỗi phông chữ, hãy thực hiện các bước sau:

1. Đảm bảo bạn đã đáp ứng bất kỳ yêu cầu cấp phép nào nếu bạn định sử dụng điều này trong một dự án thương mại và/hoặc Web.
2. Truy cập [Webfont Generator](https://transfonter.org/) của Transfonter.
3. Tải lên hai tệp phông của bạn bằng nút _Add fonts_.
4. Nhấp vào _Convert_.
5. Nhấp vào _Download_.

Sau khi tệp ZIP được tải xuống, giải nén nó và chuyển nó vào cùng thư mục với HTML và CSS của bạn.

### Triển khai mã trong bản demo của bạn

Bên trong thư mục đã giải nén, bạn sẽ thấy một số mục hữu ích:

- Hai phiên bản của mỗi phông chữ: các tệp `.woff`, `.woff2`.
- Một tệp HTML demo cho mỗi phông — tải chúng trong trình duyệt của bạn để xem phông chữ trông như thế nào trong các bối cảnh sử dụng khác nhau.
- Một tệp `stylesheet.css`, chứa mã @font-face đã được tạo mà bạn sẽ cần.

Để triển khai các phông chữ này trong bản demo của bạn, hãy làm theo các bước sau:

1. Đổi tên thư mục đã giải nén thành tên dễ và đơn giản, như `fonts`.
2. Mở tệp `stylesheet.css` và sao chép hai bộ quy tắc `@font-face` vào tệp `web-font-start.css` của bạn — bạn cần đặt chúng ở đầu trang, trước bất kỳ CSS nào của bạn, vì phông chữ cần được nhập trước khi bạn có thể sử dụng chúng trên trang web của mình.
3. Mỗi hàm `url()` trỏ đến một tệp phông mà chúng ta muốn nhập vào CSS của mình. Chúng ta cần đảm bảo rằng đường dẫn đến các tệp là chính xác, vì vậy hãy thêm `fonts/` vào đầu mỗi đường dẫn (điều chỉnh khi cần thiết).
4. Bây giờ bạn có thể sử dụng các phông chữ này trong font stack của mình, giống như bất kỳ phông chữ an toàn cho web hay phông chữ hệ thống mặc định nào. Ví dụ:

   ```css
   @font-face {
     font-family: "zantrokeregular";
     src:
       url("fonts/zantroke-webfont.woff2") format("woff2"),
       url("fonts/zantroke-webfont.woff") format("woff");
     font-weight: normal;
     font-style: normal;
     font-display: swap;
   }
   ```

   ```css
   font-family: "zantrokeregular", serif;
   ```

Bạn sẽ có một trang demo với một số phông chữ đẹp. Vì các phông chữ khác nhau được tạo ra ở các kích thước khác nhau, bạn có thể phải điều chỉnh kích thước, khoảng cách, v.v. để cải thiện giao diện và cảm giác.

![The finished design of a Web font exercise. The page has two headings and three paragraphs. The page contains different fonts and text at different sizes.](web-font-example.png)

> [!NOTE]
> Nếu bạn gặp bất kỳ vấn đề gì khi làm cho điều này hoạt động, hãy so sánh phiên bản của bạn với các tệp đã hoàn thành — xem [web-font-finished.html](https://github.com/mdn/learning-area/blob/main/css/styling-text/web-fonts/web-font-finished.html) và [web-font-finished.css](https://github.com/mdn/learning-area/blob/main/css/styling-text/web-fonts/web-font-finished.css). Bạn cũng có thể tải xuống [mã từ GitHub](https://github.com/mdn/learning-area/tree/main/css/styling-text/web-fonts) hoặc [chạy ví dụ đã hoàn thành trực tiếp](https://mdn.github.io/learning-area/css/styling-text/web-fonts/web-font-finished.html).

## Sử dụng dịch vụ phông chữ trực tuyến

Các dịch vụ phông chữ trực tuyến thường lưu trữ và phục vụ phông chữ cho bạn, vì vậy bạn không cần lo lắng về việc viết mã `@font-face`. Thay vào đó, bạn thường chỉ cần chèn một hoặc hai dòng mã đơn giản vào trang web của mình để làm cho mọi thứ hoạt động. Ví dụ bao gồm [Adobe Fonts](https://fonts.adobe.com/) và [Cloud.typography](https://www.typography.com/webfonts). Hầu hết các dịch vụ này dựa trên đăng ký, với ngoại lệ đáng chú ý là [Google Fonts](https://fonts.google.com/), một dịch vụ miễn phí hữu ích, đặc biệt để kiểm tra nhanh và viết demo.

Hầu hết các dịch vụ này đều dễ sử dụng. Hãy xem nhanh Google Fonts để bạn có thể hiểu ý tưởng. Một lần nữa, hãy sử dụng các bản sao của `web-font-start.html` và `web-font-start.css` làm điểm xuất phát.

1. Truy cập [Google Fonts](https://fonts.google.com/).
2. Tìm một vài phông chữ bạn thích bằng các bộ lọc và thanh tìm kiếm.
3. Nhấp vào một phông chữ để mở trang chi tiết của nó.
4. Khi bạn tìm thấy một phông chữ bạn thích, hãy nhấp vào nút **Get font** trên trang chi tiết của nó để thêm nó vào trang phông chữ đã chọn. Nếu bạn muốn thêm một phông chữ khác, hãy nhấp nút quay lại của trình duyệt và tìm kiếm lại.
5. Sau khi bạn đã chọn xong phông chữ, hãy nhấp vào nút **Get embed code** trên trang phông chữ đã chọn và sao chép các phần tử `<link>` được cung cấp.
6. Dán các phần tử `<link>` vào `<head>` của tài liệu HTML của bạn, phía trên bất kỳ liên kết stylesheet nào đã có.
7. Sao chép các quy tắc CSS `font-family` được cung cấp và sử dụng chúng trong CSS của bạn để áp dụng phông chữ, theo cách tương tự như trong hướng dẫn trước.

> [!NOTE]
> Bạn có thể tìm thấy phiên bản đã hoàn chỉnh tại [google-font.html](https://github.com/mdn/learning-area/blob/main/css/styling-text/web-fonts/google-font.html) và [google-font.css](https://github.com/mdn/learning-area/blob/main/css/styling-text/web-fonts/google-font.css), nếu bạn cần kiểm tra công việc của mình với của chúng tôi ([xem trực tiếp](https://mdn.github.io/learning-area/css/styling-text/web-fonts/google-font.html)).

## @font-face chi tiết hơn

Hãy khám phá cú pháp `@font-face` được tạo ra cho bạn bởi Transfonter. Các bộ quy tắc sẽ trông đại khái như thế này:

```css
@font-face {
  font-family: "zantrokeregular";
  src:
    url("zantroke-webfont.woff2") format("woff2"),
    url("zantroke-webfont.woff") format("woff");
  font-weight: normal;
  font-style: normal;
  font-display: swap;
}
```

Hãy đi qua nó để xem nó làm gì:

- `font-family`: Dòng này chỉ định tên bạn muốn tham chiếu đến phông chữ. Đây có thể là bất cứ thứ gì bạn thích miễn là bạn sử dụng nó nhất quán xuyên suốt CSS của mình.
- `src`: Các dòng này chỉ định đường dẫn đến các tệp phông chữ cần nhập vào CSS của bạn (phần `url`), và định dạng của mỗi tệp phông (phần `format`). Phần sau trong mỗi trường hợp là tùy chọn, nhưng hữu ích khi khai báo vì nó cho phép các trình duyệt xác định phông nào có thể sử dụng nhanh hơn. Nhiều khai báo có thể được liệt kê, phân cách bằng dấu phẩy. Vì trình duyệt sẽ tìm kiếm qua chúng theo các quy tắc của cascade, tốt nhất là khai báo các định dạng ưu tiên của bạn, như WOFF2, ở đầu.
- {{cssxref("@font-face/font-weight", "font-weight")}}/{{cssxref("@font-face/font-style", "font-style")}}: Các dòng này chỉ định phông chữ có độ đậm nào và liệu nó có nghiêng hay không. Nếu bạn đang nhập nhiều độ đậm của cùng một phông, bạn có thể chỉ định độ đậm/kiểu của chúng là gì, sau đó sử dụng các giá trị `font-weight`/`font-style` khác nhau để chọn giữa chúng, thay vì phải đặt cho tất cả các thành viên của họ phông những tên khác nhau. [@font-face tip: define font-weight and font-style to keep your CSS simple](https://www.456bereastreet.com/archive/201012/font-face_tip_define_font-weight_and_font-style_to_keep_your_css_simple/) của Roger Johansson trình bày cần làm gì chi tiết hơn.
- {{cssxref("@font-face/font-display", "font-display")}}: Dòng này chỉ định cách phông chữ được hiển thị trong khi nó đang tải.

> [!NOTE]
> Bạn cũng có thể chỉ định các giá trị {{cssxref("@font-face/font-variation-settings", "font-variation-settings")}} và {{cssxref("@font-face/font-stretch", "font-stretch")}} cụ thể cho phông chữ web của bạn. Trong các trình duyệt mới hơn, bạn cũng có thể chỉ định một giá trị {{cssxref("@font-face/unicode-range", "unicode-range")}}, là một phạm vi ký tự cụ thể bạn có thể muốn sử dụng ra khỏi phông chữ web. Trong các trình duyệt hỗ trợ, phông chữ sẽ chỉ được tải xuống nếu trang chứa những ký tự được chỉ định đó, tiết kiệm các lượt tải xuống không cần thiết. [Creating Custom Font Stacks with Unicode-Range](https://24ways.org/2011/creating-custom-font-stacks-with-unicode-range/) của Drew McLellan cung cấp một số ý tưởng hữu ích về cách tận dụng điều này.

## Tóm tắt

Bây giờ bạn đã làm việc qua các bài viết về kiến thức cơ bản tạo kiểu văn bản, đã đến lúc kiểm tra sự hiểu biết của bạn với thử thách của chúng ta cho mô-đun: Dàn chữ trang chủ trường cộng đồng.

## Xem thêm

- [Variable fonts guide](/en-US/docs/Web/CSS/Guides/Fonts/Variable_fonts)
- [Fonts knowledge](https://fonts.google.com/knowledge), Google Fonts

{{PreviousMenuNext("Learn_web_development/Core/Text_styling/Styling_links", "Learn_web_development/Core/Text_styling/Typesetting_a_homepage", "Learn_web_development/Core/Text_styling")}}
