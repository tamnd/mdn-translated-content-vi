---
title: Trình duyệt tải trang web như thế nào
slug: Learn_web_development/Getting_started/Web_standards/How_browsers_load_websites
page-type: tutorial-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Getting_started/Web_standards/The_web_standards_model", "Learn_web_development/Getting_started/Soft_skills", "Learn_web_development/Getting_started/Web_standards")}}

Trong bài viết trước, chúng ta đã xem qua [tổng quan về các công nghệ](/en-US/docs/Learn_web_development/Getting_started/Web_standards/The_web_standards_model#overview_of_modern_web_technologies) mà các trang web được xây dựng từ đó. Trong bài viết này, chúng ta đi qua quy trình mà các công nghệ đó được kết xuất — khi trình duyệt đã nhận được các tệp mã và các tài nguyên khác tạo nên một trang web (như đã trình bày trong [Web hoạt động như thế nào](/en-US/docs/Learn_web_development/Getting_started/Web_standards/How_the_web_works)), chúng được ghép lại như thế nào để tạo ra trải nghiệm hoàn chỉnh mà người dùng tương tác?

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc cơ bản với hệ điều hành máy tính, trình duyệt web và các công nghệ web.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu học tập:</th>
      <td>
        <ul>
          <li>Các loại tài nguyên khác nhau được trả về trong một phản hồi HTTP.</li>
          <li>Cách trình duyệt ghép các tệp tin khác nhau để kết xuất một trang web sau đó hiển thị cho người dùng.</li>
          <li>Tại sao trình duyệt đôi khi được coi là môi trường lập trình thù địch, nhưng cũng là môi trường lập trình tuyệt vời.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Những tệp tin nào được trả về trong các phản hồi HTTP?

Để tóm tắt [tổng quan về các công nghệ web](/en-US/docs/Learn_web_development/Getting_started/Web_standards/The_web_standards_model#overview_of_modern_web_technologies) mà chúng ta đã xem xét trong bài viết trước, các phản hồi HTTP (đối với các yêu cầu về một trang web) thường sẽ chứa một số loại tệp tin sau:

- Tệp HTML, xác định nội dung trang web và cấu trúc của nó.
- Tệp CSS, xác định thông tin về kiểu dáng và bố cục.
- Tệp JavaScript, xác định hành vi của các phần tương tác của trang web.
- Các tài nguyên đa phương tiện như hình ảnh, video, tệp âm thanh, [PDF](/en-US/docs/Glossary/PDF) và [SVG](/en-US/docs/Glossary/SVG), được nhúng vào trang web hoặc được hiển thị bởi trình duyệt theo cách khác.
- Các loại tệp tin khác mà trình duyệt không thể xử lý trực tiếp và do đó chuyển sang ứng dụng liên quan trên thiết bị để kết xuất, ví dụ tài liệu Word hoặc Pages, bản trình bày PowerPoint và tệp Open Office.

## Kết xuất trang web

Khi người dùng điều hướng đến một trang web mới (bằng cách nhấp vào liên kết hoặc nhập địa chỉ web vào thanh địa chỉ trình duyệt), một số yêu cầu HTTP được gửi đi và một số tệp tin được gửi lại trong các phản hồi HTTP. Các tệp tin nhận được trong các phản hồi này được xử lý bởi trình duyệt và ghép lại thành một trang web mà người dùng có thể tương tác. Quá trình ghép các phần lại thành một trang web này được gọi là **kết xuất** (rendering).

Các phần sau đây cung cấp giải thích tổng quan về cách trình duyệt kết xuất một trang web. Hãy nhớ rằng đây là mô tả đơn giản hóa, và các trình duyệt khác nhau sẽ xử lý quá trình theo những cách khác nhau. Tuy nhiên, điều này vẫn sẽ cho bạn ý tưởng về cách mọi thứ hoạt động.

## Xử lý HTML

Để bắt đầu, tệp HTML chứa nội dung trang web và xác định cấu trúc của nó được trình duyệt nhận và phân tích cú pháp (parse). Trình duyệt chuyển đổi nó thành cấu trúc dạng cây gọi là **cây DOM** (**Document Object Model** — Mô hình Đối tượng Tài liệu). DOM đại diện cho cấu trúc tài liệu HTML trong bộ nhớ máy tính. Lấy đoạn HTML cơ bản này làm ví dụ:

```html
<p>
  Let's use:
  <span>HTML</span>
  <span>CSS</span>
  <span>JavaScript</span>
</p>
```

Mỗi phần tử, thuộc tính và đoạn văn bản trong HTML trở thành một **nút DOM** (DOM node) trong cấu trúc cây. Các nút được xác định bởi mối quan hệ của chúng với các nút DOM khác. Một số phần tử là phần tử cha (parents) của các nút con (child nodes), và các nút con có anh chị em (siblings). Trình duyệt sẽ phân tích cú pháp HTML này và tạo ra cây DOM sau:

```plain
P
├─ "Let's use:"
├─ SPAN
|  └─ "HTML"
├─ SPAN
|  └─ "CSS"
└─ SPAN
    └─ "JavaScript"
```

Trong cây DOM này, nút tương ứng với phần tử `<p>` của chúng ta là phần tử cha. Các con của nó bao gồm một nút văn bản và ba nút tương ứng với các phần tử `<span>` của chúng ta. Các nút SPAN cũng là phần tử cha, với các nút văn bản là con của chúng. Khi trình duyệt kết xuất cây DOM này, nó sẽ trông như thế này:

{{EmbedLiveSample('Handling the HTML', '100%', 55)}}

```css hidden
p {
  margin: 0;
}
```

Một số phần tử HTML nhất định, khi được phân tích cú pháp, sẽ kích hoạt thêm các yêu cầu HTTP:

- Các phần tử {{htmlelement("link")}} tham chiếu đến các bảng kiểu [CSS](/en-US/docs/Learn_web_development/Core/Styling_basics) bên ngoài.
- Các phần tử {{htmlelement("script")}} tham chiếu đến các tệp [JavaScript](/en-US/docs/Learn_web_development/Core/Scripting) bên ngoài.
- Các phần tử như {{htmlelement("img")}}, {{htmlelement("video")}} và {{htmlelement("audio")}}, tham chiếu đến các tệp đa phương tiện bạn muốn nhúng vào trang web.

## Phân tích cú pháp CSS và kết xuất trang

Tiếp theo, CSS được xử lý.

1. Trình duyệt phân tích cú pháp CSS được tìm thấy trên trang (được bao gồm trong tệp HTML hoặc được lấy từ các bảng kiểu bên ngoài), và sắp xếp các quy tắc kiểu dáng CSS khác nhau vào các "nhóm" (buckets) khác nhau dựa trên phần tử HTML nào (được đại diện trong DOM dưới dạng các mục được gọi là **nút**) mà chúng sẽ được áp dụng. Sau đó trình duyệt gắn các kiểu dáng vào các phần tử khác nhau khi cần (bước trung gian này được gọi là cây kết xuất — render tree).
2. Cây kết xuất được bố cục theo cấu trúc mà nó sẽ xuất hiện sau khi các quy tắc đã được áp dụng. Điều này bao gồm bất kỳ hình ảnh và các tệp đa phương tiện khác sẽ được nhúng vào trang.
3. Hiển thị trực quan của trang được hiển thị trên màn hình (giai đoạn này được gọi là vẽ — painting).

Sơ đồ sau đây cung cấp một hình ảnh trực quan về quy trình chúng ta đã nói đến cho đến nay:

![Tổng quan quy trình kết xuất](rendering.svg)

Quay lại ví dụ của chúng ta, giả sử CSS sau được tìm thấy trong tệp HTML:

```html hidden
<p>
  Let's use:
  <span>HTML</span>
  <span>CSS</span>
  <span>JavaScript</span>
</p>
```

```css
span {
  border: 1px solid black;
  background-color: lime;
}
```

Quy tắc duy nhất có trong CSS có bộ chọn `span`, vì vậy trình duyệt có thể sắp xếp CSS rất nhanh! Nó áp dụng quy tắc đó cho từng trong số ba nút SPAN trong cây DOM, tạo cho chúng đường viền đen và nền xanh lá cây, sau đó vẽ biểu diễn trực quan cuối cùng lên màn hình.

Đầu ra được cập nhật như sau:

{{EmbedLiveSample('Parsing the CSS, and rendering the page', '100%', 90)}}

## Xử lý JavaScript

Sau khi CSS đã được xử lý, bất kỳ JavaScript nào được tìm thấy trên trang (được bao gồm trong tệp HTML hoặc được lấy từ các tệp script bên ngoài) đều được phân tích cú pháp, thông dịch, biên dịch và thực thi. Điều này xảy ra vào một thời điểm nào đó trước khi quá trình kết xuất trang cuối cùng hoàn thành — dù sao thì, một số JavaScript có thể ảnh hưởng đến quá trình kết xuất, ví dụ bằng cách thêm các nút vào DOM hoặc sửa đổi các nút hiện có.

Quay lại ví dụ của chúng ta, giả sử JavaScript sau được tìm thấy trong tệp HTML:

```html hidden
<p>
  Let's use:
  <span>HTML</span>
  <span>CSS</span>
  <span>JavaScript</span>
</p>
```

```css hidden
span {
  border: 1px solid black;
  background-color: lime;
}
```

```js
const spans = document.querySelectorAll("span");
spans.forEach((span) => {
  const reversedText = span.textContent.split("").reverse().join("");
  span.textContent = reversedText;
});
```

Bạn không cần phải hiểu chính xác cách JavaScript này hoạt động, nhưng ở cấp độ tổng quan, nó tìm mọi nút SPAN trong DOM và đảo ngược thứ tự các ký tự trong các nút văn bản con của chúng.

Đầu ra cuối cùng như sau:

{{EmbedLiveSample('Handling the JavaScript', '100%', 90)}}

## Còn những bước kết xuất nào khác?

Trong quá trình kết xuất trang còn xảy ra nhiều thứ khác, nhưng chúng ta sẽ không thảo luận tất cả ở đây. Một sự kiện đáng chú ý đáng đề cập là cây khả năng tiếp cận (accessibility tree) được xây dựng, dựa trên DOM, để các công nghệ hỗ trợ (ví dụ trình đọc màn hình) có thể kết nối vào, giúp những người không thể nhìn thấy nội dung được kết xuất có thể tương tác với nó.

Bạn sẽ tìm hiểu thêm về điều này sau, trong mô-đun [Khả năng tiếp cận](/en-US/docs/Learn_web_development/Core/Accessibility) của chúng ta.

## Trình duyệt: một môi trường lập trình thù địch _và_ tuyệt vời

Phát triển web front-end đôi khi có thể gây bực bội, và một số người coi trình duyệt là môi trường lập trình thù địch. Điều này là vì, không giống như các môi trường lập trình khác, khó hơn nhiều để đảm bảo về môi trường mà mã của bạn sẽ chạy trên đó. Bạn không thể biết trước tất cả các tổ hợp khác nhau về hệ điều hành, trình duyệt, ngôn ngữ, vị trí, kết nối mạng, CPU, GPU, bộ nhớ, thời lượng pin, v.v., mà người dùng của bạn sẽ có, vì vậy bạn không thể đảm bảo trải nghiệm người dùng hoàn hảo cho tất cả họ.

Các trình duyệt hiện đại có xu hướng triển khai các tiêu chuẩn web khá nhất quán, nhưng vẫn còn rất nhiều sự không chắc chắn cần giải quyết. Là một nhà phát triển web, bạn sẽ cần chấp nhận sự không chắc chắn đó, lập trình một cách phòng thủ và thận trọng với các tính năng bạn sử dụng. Điều này phụ thuộc vào việc tuân thủ [các thực hành tốt nhất](/en-US/docs/Learn_web_development/Getting_started/Web_standards/The_web_standards_model#web_best_practices) được nêu trong bài viết trước.

Mặt tích cực, web cũng là một môi trường lập trình tuyệt vời, vì nhiều lý do.

- Đầu tiên, nó được thiết kế với khả năng tiếp cận phổ quát. Trạng thái cơ bản của web có thể tiếp cận và có thể liên kết. Một số điều cơ bản này khó đạt được hơn trong các môi trường khác.
- Phân phối ứng dụng qua web đơn giản và mạnh mẽ. Bạn không cần đưa người dùng qua một quy trình cài đặt phức tạp: bạn chỉ cần hướng họ đến một địa chỉ web và họ sẵn sàng.
- Cập nhật ứng dụng thường đơn giản. Trong nhiều trường hợp, khách truy cập có thể thấy các phiên bản mới của ứng dụng khi họ tải lại tab trình duyệt của mình. Bạn không cần lo lắng về việc yêu cầu khách truy cập thường xuyên tải xuống và cài đặt các bản cập nhật phần mềm.
- Cộng đồng web rất sôi động và hữu ích. Như chúng ta thảo luận sau này trong bài viết [Nghiên cứu và học tập](/en-US/docs/Learn_web_development/Getting_started/Soft_skills/Research_and_learning), có rất nhiều nơi bạn có thể đến để nhờ giúp đỡ, và các tài nguyên tuyệt vời có sẵn để học hỏi.

## Xem thêm

- [Khi nào và cách báo cáo lỗi trình duyệt](/en-US/docs/Learn_web_development/Howto/Web_mechanics/File_browser_bugs)
  - : Nếu điều gì đó không hoạt động như mong đợi trong trình duyệt, đó có thể là lỗi của trình duyệt. Bài viết này giải thích cách xác định xem đó có phải là lỗi hay không, và cách nộp báo cáo lỗi nếu đúng như vậy.

{{PreviousMenuNext("Learn_web_development/Getting_started/Web_standards/The_web_standards_model", "Learn_web_development/Getting_started/Soft_skills", "Learn_web_development/Getting_started/Web_standards")}}
