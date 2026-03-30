---
title: "CSS: Tạo kiểu cho nội dung"
short-title: Tạo kiểu cho nội dung
slug: Learn_web_development/Getting_started/Your_first_website/Styling_the_content
page-type: tutorial-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Getting_started/Your_first_website/Creating_the_content", "Learn_web_development/Getting_started/Your_first_website/Adding_interactivity", "Learn_web_development/Getting_started/Your_first_website")}}

CSS (Cascading Style Sheets — Bảng kiểu tầng) là mã tạo kiểu cho nội dung web. Bài viết này hướng dẫn bạn những kiến thức cơ bản về CSS — cách hoạt động và cách cải thiện giao diện và cảm nhận của cấu trúc nội dung bạn đã tạo trong bài viết trước.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc cơ bản với hệ điều hành máy tính của bạn, phần mềm cơ bản bạn sẽ dùng để xây dựng trang web và hệ thống tệp.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Mục đích và chức năng của CSS.</li>
          <li>Các thành phần cơ bản của cú pháp CSS — bộ quy tắc, bộ chọn, khai báo, thuộc tính, giá trị thuộc tính.</li>
          <li>Các chức năng CSS phổ biến bao gồm mô hình hộp, thay đổi màu sắc và phông chữ, và định vị các phần tử HTML.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## CSS là gì?

Giống như HTML, CSS không phải là ngôn ngữ lập trình. Nó cũng không phải là ngôn ngữ đánh dấu. **CSS là ngôn ngữ bảng kiểu (style sheet language).** CSS được dùng để tạo kiểu cho các phần tử HTML: bạn chọn các phần tử muốn tạo kiểu và đặt giá trị cho các thuộc tính kiểu dáng của chúng, xác định cách chúng sẽ trông.

Hãy xem lại ví dụ HTML cơ bản từ bài viết [Tạo nội dung](/en-US/docs/Learn_web_development/Getting_started/Your_first_website/Creating_the_content):

```html live-sample___basic-html live-sample___basic-css
<p>Instructions for life:</p>

<ul>
  <li>Eat</li>
  <li>Sleep</li>
  <li>Repeat</li>
</ul>
```

Kết quả hiển thị riêng lẻ như sau:

{{EmbedLiveSample("basic-html", "100%", "140px")}}

Nếu chúng ta thêm một số CSS vào, chúng ta có thể thay đổi cách HTML trông. Đoạn mã sau chọn phần tử {{htmlelement("p")}} và đặt cho nó một [phông chữ](/en-US/docs/Web/CSS/Reference/Properties/font-family) khác và màu văn bản đỏ {{cssxref("color")}}. Sau đó nó chọn tất cả các phần tử {{htmlelement("li")}} và đặt cho mỗi phần tử màu nền xanh vàng {{cssxref("background-color")}}, đường viền đen đặc 1 pixel {{cssxref("border")}}, và [lề dưới](/en-US/docs/Web/CSS/Reference/Properties/margin-bottom) 5 pixel:

```css live-sample___basic-css
p {
  font-family: sans-serif;
  color: red;
}

li {
  background-color: greenyellow;
  border: 1px solid black;
  margin-bottom: 5px;
}
```

Với CSS được áp dụng vào HTML, bản demo hiện hiển thị như thế này:

{{EmbedLiveSample("basic-css", "100%", "160px")}}

Như bạn có thể thấy, chỉ với một chút CSS, chúng ta đã có thể thay đổi giao diện của một danh sách bình thường.

CSS có nhiều chức năng khác, từ chỉ định hình nền và gradient, đến kiểm soát kiểu chữ và hành vi cuộn, đến thêm hoạt ảnh và xây dựng toàn bộ bố cục trang web.

## Áp dụng CSS vào HTML

Khi sử dụng CSS, điều đầu tiên cần làm đúng là đảm bảo rằng CSS của bạn được áp dụng thành công vào HTML. Trong phần này, chúng ta sẽ thêm một **bảng kiểu** (stylesheet) CSS vào `first-website` của bạn và áp dụng nó vào trang.

1. Bên trong thư mục `first-website`, tạo thêm một thư mục mới gọi là `styles`.
2. Sử dụng trình soạn thảo văn bản, dán đoạn CSS sau vào một tệp mới, sẽ đặt màu văn bản đỏ cho các phần tử `<p>` của bạn. Hữu ích để bắt đầu với thứ gì đó như thế này để kiểm tra xem bảng kiểu của bạn có được áp dụng đúng vào HTML không.

   ```css
   p {
     color: red;
   }
   ```

3. Lưu tệp trong thư mục `styles` với tên tệp `style.css`.
4. Mở tệp `index.html`. Dán dòng sau vào bên trong phần đầu HTML (giữa thẻ {{HTMLElement("head")}} và `</head>`):

   ```html
   <link href="styles/style.css" rel="stylesheet" />
   ```

5. Lưu `index.html` và tải trong trình duyệt. Bạn sẽ thấy gì đó như thế này:

![Logo Mozilla và một số đoạn văn. Văn bản đoạn văn đã được tạo kiểu màu đỏ bởi CSS của chúng ta.](website-screenshot-styled.png)

Nếu văn bản đoạn văn có màu đỏ, xin chúc mừng! CSS của bạn đang hoạt động. Nếu không, hãy xem lại các bước trên và kiểm tra cẩn thận rằng bạn đã làm theo đúng từng bước.

## Kiến thức cơ bản về cú pháp CSS

Trong ví dụ CSS trước, `p` được gọi là **bộ chọn** (selector) — nó chọn (các) phần tử để tạo kiểu. Cụ thể, `p` chọn tất cả các đoạn văn trong HTML. Dòng bên trong dấu ngoặc nhọn (`{ }`) được gọi là **khai báo** (declaration) — nó đặt giá trị cho một thuộc tính cụ thể. Trong trường hợp này, **thuộc tính** (property) là `color`, kiểm soát màu văn bản của các đoạn văn, và **giá trị thuộc tính** (property value) được đặt là `red`.

Toàn bộ cấu trúc được gọi là **bộ quy tắc** (ruleset). (Thuật ngữ _ruleset_ thường được gọi tắt là _rule_ — quy tắc.)

Hãy xem một bộ quy tắc khác, lần này với nhiều khai báo:

```css
p {
  color: red;
  width: 500px;
  border: 1px solid black;
}
```

Trong một bộ quy tắc, bạn phải dùng dấu chấm phẩy (`;`) để phân tách một khai báo với khai báo tiếp theo. Trong mỗi khai báo, bạn phải dùng dấu hai chấm (`:`) để phân tách thuộc tính và giá trị của nó.

Bạn cũng có thể thêm nhiều bộ chọn trong một quy tắc, được phân tách bằng dấu phẩy, để chọn nhiều phần tử. Ví dụ:

```css
p,
.my-class,
#my-id {
  color: red;
}
```

Trong quy tắc CSS này, chúng ta đã thêm bộ chọn **phần tử** (hay **kiểu** — type) chọn một phần tử HTML cụ thể. Chúng ta cũng đã thêm hai loại bộ chọn khác, không liên quan đến phần còn lại của hướng dẫn này. Nếu bạn tò mò về những gì chúng làm, hãy xem hướng dẫn [Bộ chọn cơ bản](/en-US/docs/Learn_web_development/Core/Styling_basics/Basic_selectors) của chúng tôi.

> [!NOTE]
> [Write your first lines of CSS!](https://scrimba.com/the-frontend-developer-career-path-c0j/~015?via=mdn) của Scrimba <sup>[_MDN learning partner_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup> cung cấp phần giới thiệu tương tác hữu ích về cú pháp CSS.

## Cải thiện văn bản

Hãy quay lại ví dụ của chúng ta và sử dụng CSS để cải thiện giao diện của văn bản. Chúng ta sẽ đặt phông chữ mới cho trang và thay đổi một số cài đặt văn bản cho các phần tử khác nhau.

1. Trước tiên, hãy tìm [kết quả từ Google Fonts](/en-US/docs/Learn_web_development/Getting_started/Your_first_website/What_will_your_website_look_like#choosing_a_font) mà bạn đã lưu trước đó. Nếu bạn chưa chọn phông chữ, hãy theo liên kết và thực hiện ngay bây giờ.
2. Thêm các phần tử {{htmlelement("link")}} vào bên trong {{HTMLElement("head")}} của `index.html`, ngay trước thẻ đóng `</head>`. Chúng sẽ trông giống như thế này:

   ```html
   <link rel="preconnect" href="https://fonts.googleapis.com" />
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
   <link
     href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap"
     rel="stylesheet" />
   ```

   Đoạn mã này liên kết trang của bạn với một bảng kiểu được lưu trữ bởi dịch vụ Google Fonts, tải phông chữ bạn đã chọn.

3. Tiếp theo, đến tệp `style.css` và xóa quy tắc hiện có. Chúng ta không còn muốn các đoạn văn có màu đỏ nữa.
4. Thêm các dòng sau vào `style.css`:

   ```css
   html {
     /* px có nghĩa là "pixel". Cỡ chữ cơ bản hiện là 10 pixel chiều cao */
     font-size: 10px;
     /* Thay thế PLACEHOLDER bằng giá trị thuộc tính font-family bạn lấy từ Google Fonts */
     font-family: PLACEHOLDER;
   }
   ```

   > [!NOTE]
   > Bất cứ thứ gì trong CSS nằm giữa `/*` và `*/` là **chú thích CSS** (CSS comment), bị trình duyệt bỏ qua. Chú thích CSS là cách để bạn thêm ghi chú hữu ích về mã hoặc logic của mình, mà không ảnh hưởng đến cách trang web được hiển thị.

5. Thay thế dòng giữ chỗ `font-family` bằng dòng `font-family` từ mã Google Fonts của bạn, ví dụ:

   ```css
   font-family: "Roboto", sans-serif;
   ```

   Thuộc tính `font-family` đặt (các) phông chữ bạn muốn áp dụng cho HTML. Quy tắc này xác định phông chữ cơ sở toàn cục và cỡ chữ cho toàn bộ trang. Tất cả các phần tử bên trong phần tử {{HTMLElement("html")}} sẽ kế thừa cùng `font-size` và `font-family`.

6. Bây giờ hãy đặt một số kiểu phông chữ và văn bản trên các phần tử [`<h1>`](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements), {{htmlelement("li")}} và {{htmlelement("p")}}. Chúng ta sẽ đặt các giá trị {{cssxref("font-size")}} mới cho mỗi phần tử. Chúng ta cũng sẽ căn giữa tiêu đề bằng {{cssxref("text-align")}} và tăng {{cssxref("line-height")}} và {{cssxref("letter-spacing")}} của các đoạn văn và mục danh sách để làm cho nội dung thân trang dễ đọc hơn.

   ```css
   h1 {
     font-size: 60px;
     text-align: center;
   }

   p,
   li {
     font-size: 16px;
     line-height: 2;
     letter-spacing: 1px;
   }
   ```

7. Lưu mã và tải HTML trong trình duyệt (làm mới nếu bạn đã mở từ trước). Công việc đang thực hiện của bạn sẽ trông tương tự như thế này:

   ![Logo Mozilla và một số đoạn văn. Phông chữ sans-serif đã được đặt, cỡ chữ, chiều cao dòng và khoảng cách chữ được điều chỉnh, và tiêu đề trang chính đã được căn giữa](website-screenshot-font-small.png)

   > [!NOTE]
   > Hãy thử điều chỉnh các giá trị `px` cho đến khi bạn có cỡ chữ ưa thích cho tiêu đề và văn bản thân trang.

## CSS và mô hình hộp

Điều bạn sẽ nhận thấy về CSS khi bạn sử dụng nhiều hơn là rất nhiều thứ trong đó liên quan đến các hộp (box). Hầu hết các phần tử HTML trên trang đều có thể được coi là các hộp nằm trên (hoặc cạnh) các hộp khác. Bạn có thể đặt các giá trị trên các hộp này cho kích thước, màu sắc, vị trí, v.v. Điều này được gọi là [**mô hình hộp**](/en-US/docs/Learn_web_development/Core/Styling_basics/Box_model) (box model).

![Ba hộp nằm bên trong nhau. Từ ngoài vào trong chúng được gán nhãn lề (margin), đường viền (border) và khoảng đệm (padding)](box-model.png)

Mỗi hộp chiếm không gian trên trang của bạn có các thuộc tính như:

- {{cssxref("padding")}}: Khoảng đệm xung quanh nội dung. Trong ví dụ trước, đó là khoảng cách xung quanh văn bản đoạn văn.
- {{cssxref("border")}}: Đường viền đặc ngay bên ngoài khoảng đệm.
- {{cssxref("margin")}}: Lề bên ngoài đường viền.

Trong phần này, chúng ta cũng sử dụng các thuộc tính sau, một số đã gặp trước đó:

- {{cssxref("width")}}: Chiều rộng của một phần tử.
- {{cssxref("background-color")}}: Màu nền phía sau nội dung và khoảng đệm của phần tử.
- {{cssxref("color")}}: Màu của nội dung phần tử (thường là văn bản).
- {{cssxref("text-shadow")}}: Bóng đổ trên văn bản bên trong một phần tử.
- {{cssxref("display")}}: Chế độ hiển thị của một phần tử (về cơ bản đề cập đến cách nó xuất hiện hoặc được bố trí trên trang web).

Trong mỗi phần tiếp theo:

1. Thêm đoạn mã CSS được cung cấp vào cuối tệp `style.css` của bạn.
2. Lưu tệp và làm mới trình duyệt để xem CSS đã ảnh hưởng đến việc hiển thị HTML như thế nào.
3. Đọc phần giải thích được cung cấp để giúp bạn hiểu cách CSS hoạt động.
4. Nếu bạn cảm thấy muốn thử, hãy thử nghiệm bằng cách thay đổi các giá trị thuộc tính để tùy chỉnh thêm trang của bạn.

## Thay đổi màu trang

Thêm đoạn sau:

```css
html {
  background-color: #00539f;
}
```

Quy tắc này đặt màu nền cho toàn bộ trang. Thay đổi mã màu thành màu bạn đã chọn trong [Trang web của bạn trông như thế nào?](/en-US/docs/Learn_web_development/Getting_started/Your_first_website/What_will_your_website_look_like#choosing_a_theme_color).

## Tạo kiểu cho body

Tiếp theo, thêm quy tắc này:

```css
body {
  width: 600px;
  margin: 0 auto;
  background-color: #ff9500;
  padding: 0 20px 20px 20px;
  border: 5px solid black;
}
```

Đoạn mã trên đặt các giá trị mới cho một số thuộc tính của phần tử {{htmlelement("body")}}. Hãy đi qua từng dòng:

- `width: 600px;`: Điều này buộc body luôn rộng 600 pixel.
- `margin: 0 auto;`: Khi bạn đặt hai giá trị cho thuộc tính như `margin` hoặc `padding`, giá trị đầu tiên ảnh hưởng đến phía trên _và_ dưới của phần tử (đặt thành `0` trong trường hợp này); giá trị thứ hai ảnh hưởng đến phía trái _và_ phải. `auto` là một giá trị đặc biệt phân chia đều không gian ngang sẵn có giữa trái và phải.
- `background-color: #FF9500;`: Đặt màu nền của phần tử. Dự án của chúng ta sử dụng màu cam đỏ cho màu nền `<body>` để tương phản với màu xanh đậm dùng cho phần tử {{htmlelement("html")}}.
- `padding: 0 20px 20px 20px;`: Đặt bốn giá trị cho khoảng đệm. Mục tiêu là đặt một khoảng cách xung quanh nội dung. Trong ví dụ này, không có khoảng đệm ở trên cùng của body, và 20 pixel ở bên phải, dưới và trái. Các giá trị đặt khoảng đệm trên cùng, bên phải, dưới cùng và bên trái, theo thứ tự đó.
- `border: 5px solid black;`: Đặt các giá trị cho chiều rộng, kiểu và màu của đường viền. Trong trường hợp này, đó là đường viền đen đặc rộng 5 pixel xung quanh tất cả các cạnh của body.

### Ghi chú về thuộc tính rút gọn

Các giá trị thuộc tính CSS đặt nhiều thuộc tính cùng một lúc được gọi là **thuộc tính rút gọn** (shorthand property). Ví dụ: `padding: 0 20px 20px 20px` tương đương với bốn thuộc tính sau:

```css
padding-top: 0;
padding-right: 20px;
padding-bottom: 20px;
padding-left: 20px;
```

> [!NOTE]
> [Margin/padding shorthand](https://scrimba.com/frontend-path-c0j/~0g?via=mdn) của Scrimba <sup>[_MDN learning partner_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup> là một bài học tương tác cung cấp hướng dẫn thực tế về cách sử dụng thuộc tính rút gọn cho lề và khoảng đệm.

## Định vị và tạo kiểu cho tiêu đề trang chính

Bây giờ thêm đoạn này:

```css
h1 {
  margin: 0;
  padding: 20px 0;
  color: #00539f;
  text-shadow: 3px 3px 1px black;
}
```

Bạn có thể nhận thấy một khoảng trống khó chịu ở đầu body. Điều đó xảy ra vì trình duyệt áp dụng kiểu mặc định cho phần tử `<h1>`. Điều đó có vẻ như ý tưởng tồi, nhưng mục đích là cung cấp khả năng đọc cơ bản cho các trang chưa có kiểu. Để loại bỏ khoảng trống, chúng ta ghi đè kiểu mặc định của trình duyệt bằng cài đặt `margin: 0;`.

Tiếp theo, chúng ta đặt khoảng đệm trên và dưới của tiêu đề là 20 pixel, và đặt màu văn bản tiêu đề giống với màu nền HTML.

Cuối cùng, `text-shadow` áp dụng bóng cho nội dung văn bản của phần tử:

- Giá trị pixel đầu tiên đặt **độ dịch chuyển ngang** (horizontal offset) của bóng so với văn bản: khoảng cách nó di chuyển sang ngang.
- Giá trị pixel thứ hai đặt **độ dịch chuyển dọc** (vertical offset) của bóng so với văn bản: khoảng cách nó di chuyển xuống dưới.
- Giá trị pixel thứ ba đặt **bán kính mờ** (blur radius) của bóng. Giá trị lớn hơn tạo ra bóng mờ hơn.
- Giá trị thứ tư đặt màu cơ sở của bóng.

## Căn giữa hình ảnh

Cuối cùng, thêm quy tắc này:

```css
img {
  display: block;
  margin: 0 auto;
  max-width: 100%;
}
```

Tiếp theo, chúng ta căn giữa hình ảnh để trông đẹp hơn. Chúng ta có thể dùng cùng thủ thuật `margin: 0 auto` như đã làm với body, nhưng có những khác biệt đòi hỏi phải có cài đặt bổ sung để CSS hoạt động.

Phần tử {{htmlelement("body")}} là phần tử **khối** (block), có nghĩa là nó chiếm không gian trên trang và có thể nhận lề, khoảng đệm và các thuộc tính hộp khác. Các phần tử {{htmlelement("img")}} (hình ảnh), mặt khác, là phần tử **inline**: theo mặc định, chúng không nhận giá trị lề theo cùng cách phần tử khối. Để thủ thuật lề tự động hoạt động trên hình ảnh này, chúng ta phải cho nó hành vi ở cấp khối bằng cách sử dụng `display: block;`.

Cuối cùng, chúng ta đặt thuộc tính {{cssxref("max-width")}} thành `100%` để đảm bảo rằng nếu hình ảnh lớn hơn `width` được đặt cho body (600 pixel), nó sẽ bị giới hạn ở `600px` và không kéo rộng hơn.

> [!NOTE]
> Đừng quá lo lắng nếu bạn chưa hoàn toàn hiểu `display: block;` và sự khác biệt giữa phần tử khối và phần tử inline, hoặc `max-width: 100%;`. Chúng sẽ có ý nghĩa hơn khi bạn tiếp tục học CSS.

## Kết luận

Nếu bạn đã làm theo tất cả các hướng dẫn trong bài viết này, bạn sẽ có một trang trông tương tự như trang này:

![Logo Mozilla, được căn giữa, và một tiêu đề cùng các đoạn văn. Bây giờ nó trông đẹp với nền xanh lam cho toàn bộ trang và nền cam cho dải nội dung chính được căn giữa.](website-screenshot-final.png)

Bạn có thể [xem phiên bản của chúng tôi ở đây](https://mdn.github.io/beginner-html-site-styled/). Nếu bị mắc kẹt, bạn có thể so sánh công việc của mình với [mã ví dụ đã hoàn thành trên GitHub](https://github.com/mdn/beginner-html-site-styled/blob/main/styles/style.css).

Trong bài viết này, chúng ta mới chỉ tìm hiểu sơ lược về CSS. Bạn sẽ học được nhiều hơn trong mô-đun Core [Kiến thức cơ bản về CSS styling](/en-US/docs/Learn_web_development/Core/Styling_basics) sau này trong khóa học.

## Xem thêm

- [Learn HTML and CSS](https://scrimba.com/learn-html-and-css-c0p?via=mdn), Scrimba <sup>[_MDN learning partner_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup>
  - : Khóa học _Learn HTML and CSS_ của [Scrimba](https://scrimba.com?via=mdn) dạy bạn HTML và CSS thông qua việc xây dựng và triển khai năm dự án tuyệt vời, với các bài học và thử thách tương tác thú vị được giảng dạy bởi các giáo viên am hiểu.

{{PreviousMenuNext("Learn_web_development/Getting_started/Your_first_website/Creating_the_content", "Learn_web_development/Getting_started/Your_first_website/Adding_interactivity", "Learn_web_development/Getting_started/Your_first_website")}}
