---
title: Gỡ lỗi HTML
slug: Learn_web_development/Core/Structuring_content/Debugging_HTML
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/Forms_challenge", "Learn_web_development/Core/Styling_basics", "Learn_web_development/Core/Structuring_content")}}

Viết HTML thì tốt thôi, nhưng nếu có gì đó không ổn, và bạn không thể tìm ra lỗi trong mã ở đâu thì sao? Bài viết này sẽ giới thiệu cho bạn một số công cụ có thể giúp bạn tìm và sửa lỗi trong HTML.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc cơ bản với HTML, như đã được đề cập trong
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Basic_HTML_syntax"
          >Cú pháp HTML cơ bản</a
        >. Ngữ nghĩa ở cấp độ văn bản như <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Headings_and_paragraphs"
          >tiêu đề và đoạn văn</a
        > và <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Lists"
          >danh sách</a
        >. <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Structuring_documents"
          >HTML cấu trúc</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Kiến thức nền tảng quan trọng về gỡ lỗi HTML</li>
          <li>Sử dụng trình kiểm tra DOM trong DevTools của trình duyệt để tìm hiểu sâu hơn về mã HTML của bạn.</li>
          <li>Khám phá các loại lỗi HTML phổ biến.</li>
          <li>Sử dụng <a href="https://validator.w3.org/">trình xác thực HTML</a> để phát hiện lỗi HTML.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Gỡ lỗi không đáng sợ

Khi viết mã, mọi thứ đều ổn, cho đến khoảnh khắc đáng sợ khi xảy ra lỗi — bạn đã làm gì đó sai, vì vậy mã của bạn không hoạt động — hoặc là không hoạt động chút nào, hoặc không hoạt động đúng như bạn muốn. Ví dụ, phần sau đây hiển thị lỗi được báo cáo khi cố gắng {{glossary("compile")}} một chương trình đơn giản được viết bằng ngôn ngữ [Rust](https://rust-lang.org/).

![Cửa sổ console hiển thị kết quả khi cố gắng biên dịch một chương trình Rust với dấu ngoặc kép bị thiếu xung quanh một chuỗi trong câu lệnh print. Thông báo lỗi được báo cáo là error: unterminated double quote string.](error-message.png)

Ở đây, thông báo lỗi tương đối dễ hiểu — "unterminated double quote string" (chuỗi ngoặc kép chưa đóng). Nếu bạn nhìn vào danh sách, bạn có thể thấy rõ tại sao `println!(Hello, world!");` có thể bị thiếu một dấu ngoặc kép. Tuy nhiên, các thông báo lỗi có thể nhanh chóng trở nên phức tạp hơn và khó hiểu hơn khi các chương trình trở nên lớn hơn, và ngay cả các trường hợp đơn giản cũng có thể trông hơi đáng sợ với người không biết gì về Rust.

Tuy nhiên, gỡ lỗi không nhất thiết phải đáng sợ — chìa khóa để thoải mái với việc viết và gỡ lỗi bất kỳ mã nào là sự quen thuộc với cả ngôn ngữ lẫn các công cụ liên quan.

## HTML và gỡ lỗi

HTML không phức tạp để hiểu như Rust. HTML không được biên dịch sang dạng khác trước khi phân tích cú pháp (nó được _diễn giải_, không phải _biên dịch_). Và cú pháp {{glossary("element")}} của HTML được cho là dễ hiểu hơn nhiều so với "ngôn ngữ lập trình thực sự" như Rust, {{glossary("JavaScript")}}, hoặc {{glossary("Python")}}.

Cách các trình duyệt phân tích cú pháp HTML **linh hoạt** hơn nhiều so với cách hầu hết các ngôn ngữ lập trình được phân tích cú pháp, điều này vừa là điều tốt vừa là điều xấu.

Nhưng trước hết, chúng ta có nghĩa là gì khi nói linh hoạt? Nhìn chung, khi bạn làm gì đó sai trong mã, có hai loại lỗi chính mà bạn sẽ gặp phải:

- **Lỗi cú pháp**: Đây là lỗi đánh máy trong mã khiến chương trình không chạy, giống như lỗi Rust được hiển thị trước đó. Những lỗi này thường dễ sửa miễn là bạn quen thuộc với cú pháp của ngôn ngữ và biết thông báo lỗi có nghĩa là gì.
- **Lỗi logic**: Đây là những lỗi mà cú pháp thực sự đúng, nhưng mã không thực hiện những gì bạn muốn, có nghĩa là chương trình chạy không chính xác. Những lỗi này thường khó sửa hơn lỗi cú pháp, vì không có thông báo lỗi nào hướng dẫn bạn đến nguồn gốc của lỗi.

Bản thân HTML không bị lỗi cú pháp vì các trình duyệt phân tích cú pháp nó một cách linh hoạt, có nghĩa là trang vẫn hiển thị ngay cả khi có lỗi cú pháp trong mã nguồn. Các trình duyệt có các quy tắc được tích hợp sẵn để mô tả cách diễn giải đánh dấu HTML được viết không chính xác (thường được gọi là đánh dấu **không hợp lệ** hoặc **không có cấu trúc tốt**), tự động chuyển đổi nó thành một số đánh dấu hợp lệ.

Ví dụ, đoạn HTML sau chứa các phần tử được lồng không chính xác:

```html example-bad
<p>I didn't expect to find the <em>next-door neighbor's <strong>cat</em></strong> here!</p>
```

Thẻ đóng `</strong>` phải đứng trước thẻ đóng `</em>`, nhưng không phải như vậy — nó đứng sau thẻ đóng `</em>`.

Nếu bạn tải HTML này vào trình duyệt rồi nhìn vào [DOM được hiển thị](/en-US/docs/Learn_web_development/Getting_started/Web_standards/How_browsers_load_websites#handling_html), bạn sẽ thấy rằng việc lồng đã được trình duyệt sửa:

```html example-good
<p>
  I didn't expect to find the
  <em>next-door neighbor's <strong>cat</strong></em> here!
</p>
```

Vậy tại sao điều này vừa tốt vừa xấu? Trong trường hợp này, trình duyệt đã tạo ra kết quả mong muốn, nhưng như bạn sẽ thấy [ở phần sau](#your_turn_studying_html_using_the_dom_inspector), điều này không phải lúc nào cũng xảy ra như vậy. Bạn luôn nhận được _thứ gì đó_ đang chạy, nhưng trình duyệt không phải lúc nào cũng làm đúng, điều này có thể gây ra vấn đề. Tốt hơn là viết đánh dấu chính xác ngay từ đầu.

> [!NOTE]
> HTML được phân tích cú pháp một cách linh hoạt vì khi web lần đầu được tạo ra, người ta đã quyết định rằng việc xuất bản nội dung quan trọng hơn là đảm bảo cú pháp hoàn toàn chính xác. Web có lẽ không phổ biến như ngày nay nếu nó đã nghiêm ngặt hơn ngay từ đầu.

Vậy làm thế nào để bạn tìm lỗi đánh dấu? Sau này, chúng tôi sẽ chỉ cho bạn cách tìm lỗi trong HTML bằng công cụ gọi là [trình xác thực HTML](#html_validation), nhưng trước tiên chúng tôi sẽ chỉ cho bạn cách kiểm tra HTML của mình thủ công bằng **trình kiểm tra DOM**, và sau đó khám phá những loại lỗi đánh dấu bạn có thể đang tìm kiếm, và cách trình duyệt có thể diễn giải những lỗi đó.

## Sử dụng trình kiểm tra DOM

Tất cả các trình duyệt hiện đại đều có một bộ [công cụ dành cho nhà phát triển](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/What_are_browser_developer_tools) (devtools) được tích hợp vào chúng, cung cấp một bộ chức năng để kiểm tra trang web được tải trong tab hiện tại. Những công cụ này có thể hiển thị cho bạn HTML nào được hiển thị trong trang, CSS nào được áp dụng cho mỗi nút DOM, JavaScript nào đang chạy trong trang, và nhiều hơn nữa. Chúng cũng cho phép bạn chỉnh sửa mã đang chạy và xem hiệu ứng trực tiếp trên trang.

Bạn có thể mở devtools theo cách tương tự trong mỗi trình duyệt — xem [Cách mở devtools trong trình duyệt của bạn](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/What_are_browser_developer_tools#how_to_open_the_devtools_in_your_browser) để tìm hiểu cách thực hiện.

Đối với bài viết này, chức năng devtools duy nhất liên quan là **trình kiểm tra DOM**, hiển thị DOM HTML hiện đang được hiển thị và cho phép bạn chỉnh sửa nó. Hãy xem xét điều này ngay bây giờ:

1. Mở devtools trong trình duyệt của bạn.
2. Mở trình kiểm tra DOM. Nó ở cùng một nơi trong mỗi trình duyệt — tab đầu tiên trong devtools ở đầu hàng. Trong Firefox nó được gán nhãn _Inspector_, trong khi trong Safari, Edge và Chrome nó được gán nhãn _Elements_. Tab này sẽ được chọn theo mặc định khi bạn lần đầu mở devtools, nhưng hãy chọn nó nếu không phải như vậy.
3. Kiểm tra cấu trúc cây DOM được hiển thị trong tab, và lưu ý cách bạn có thể nhấp vào các mũi tên mở rộng nhỏ ở đầu mỗi nút DOM để mở rộng và thu gọn chúng và tiết lộ các nút con của chúng. Bạn cũng có thể sử dụng phím mũi tên lên và xuống để di chuyển lên và xuống các nút, và phím mũi tên phải và trái để mở rộng và thu gọn các nút.
4. Cũng hãy thử di chuột qua các nút (hoặc chọn chúng bằng phím mũi tên) và lưu ý cách phần tử hiện đang di chuột qua (hoặc được chọn) được làm nổi bật trong khung nhìn.
5. Bạn cũng có thể chỉnh sửa DOM được hiển thị. Chúng tôi sẽ không sử dụng chức năng chỉnh sửa trong bài viết này, nhưng hãy dành thời gian tra cứu cách thực hiện nếu bạn tò mò.

## Thực hành: Nghiên cứu HTML bằng trình kiểm tra DOM

Trong phần này, bạn sẽ nghiên cứu một số mã bằng trình kiểm tra DOM và xem cách trình duyệt xử lý các lỗi đánh dấu phổ biến.

1. Đầu tiên, hãy lưu danh sách tệp HTML sau dưới dạng `debug-example.html`, ở đâu đó trên máy tính cục bộ của bạn. Bản demo này được viết cố ý với một số lỗi tích hợp để chúng ta khám phá.

   ```html-nolint
   <!doctype html>
   <html lang="en-US">
     <head>
       <meta charset="utf-8">
       <title>HTML debugging examples</title>
     </head>

     <body>
       <h1>HTML debugging examples</h1>
       <p>What causes errors in HTML?
       <ul>
         <li>Unclosed elements: If an element is <strong>not closed properly,then its effect can spread to areas you didn't intend
         <li>Badly nested elements: Nesting elements properly is also very important for code behaving correctly. <strong>strong <em>strong emphasized?</strong> what is this?</em>
         <li>Unclosed attributes: Another common source of HTML problems. Let's look at an example: <a href="https://www.mozilla.org/>link to Mozilla homepage</a>
       </ul>
     </body>
   </html>
   ```

2. Tiếp theo, mở nó trong trình duyệt. Bạn sẽ thấy điều gì đó như thế này:![Một tài liệu HTML đơn giản với tiêu đề HTML debugging examples, và một số thông tin về các lỗi HTML phổ biến, như các phần tử chưa đóng, các phần tử được lồng không đúng cách và các thuộc tính chưa đóng.](badly-formed-html.png)
3. Điều này ngay lập tức không trông hay lắm; hãy xem xét mã nguồn để xem chúng ta có thể tìm ra nguyên nhân không (chỉ hiển thị nội dung body):

   ```html
   <h1>HTML debugging examples</h1>

   <p>What causes errors in HTML?

   <ul>
     <li>Unclosed elements: If an element is <strong>not closed properly,
         then its effect can spread to areas you didn't intend

     <li>Badly nested elements: Nesting elements properly is also very important
         for code behaving correctly. <strong>strong <em>strong emphasized?</strong>
         what is this?</em>

     <li>Unclosed attributes: Another common source of HTML problems. Let's
         look at an example: <a href="https://www.mozilla.org/>link to Mozilla
         homepage</a>
   </ul>
   ```

4. Hãy xem xét các vấn đề:
   - Các phần tử {{htmlelement("p","đoạn văn")}} và {{htmlelement("li","mục danh sách")}} không có thẻ đóng. Nhìn vào hình ảnh trên, điều này dường như không ảnh hưởng quá xấu đến việc hiển thị đánh dấu, vì dễ dàng suy ra nơi một phần tử nên kết thúc và phần tử khác nên bắt đầu.
   - Phần tử {{htmlelement("strong")}} đầu tiên không có thẻ đóng. Đây là vấn đề hơn một chút, vì không dễ biết phần tử này nên kết thúc ở đâu. Trên thực tế, toàn bộ phần còn lại của văn bản đã được hiển thị in đậm.
   - Phần này được lồng không đúng cách: `<strong>strong <em>strong emphasized?</strong> what is this?</em>`. Không dễ biết điều này đã được diễn giải như thế nào do vấn đề trước đó.
   - Giá trị thuộc tính [`href`](/en-US/docs/Web/HTML/Reference/Elements/a#href) thiếu dấu ngoặc kép đóng. Điều này dường như đã gây ra vấn đề lớn nhất — liên kết hoàn toàn không được hiển thị.

5. Bây giờ hãy kiểm tra DOM được hiển thị, trái ngược với mã nguồn. Để thực hiện điều này, hãy mở trình kiểm tra DOM của trình duyệt. Bạn sẽ thấy một biểu diễn của đánh dấu được hiển thị: ![Trình kiểm tra HTML trong Firefox, với đoạn văn của ví dụ được làm nổi bật, hiển thị văn bản "What causes errors in HTML?" Ở đây bạn có thể thấy rằng phần tử đoạn văn đã được trình duyệt đóng.](html-inspector.png)
6. Hãy xem cách trình duyệt đã cố gắng sửa các lỗi HTML của chúng ta (chúng tôi đã xem xét trong Firefox; các trình duyệt hiện đại khác _nên_ cho kết quả tương tự):
   - Các đoạn văn và mục danh sách đã được thêm thẻ đóng.
   - Không rõ phần tử `<strong>` đầu tiên nên được đóng ở đâu, vì vậy trình duyệt đã bọc mỗi khối văn bản riêng biệt trong phần tử `<strong>` của riêng nó, tất cả xuống đến cuối tài liệu!
   - Việc lồng không chính xác đã được trình duyệt sửa như được hiển thị ở đây:

     ```html
     <strong>
       strong
       <em>strong emphasized?</em>
     </strong>
     <em> what is this?</em>
     ```

   - Liên kết thiếu dấu ngoặc kép đã bị xóa hoàn toàn. Mục danh sách cuối cùng trông như thế này:

     ```html
     <li>
       <strong>
         Unclosed attributes: Another common source of HTML problems. Let's look
         at an example:
       </strong>
     </li>
     ```

## Xác thực HTML

Bạn có thể thấy từ ví dụ trên rằng bạn thực sự muốn đảm bảo HTML của mình có cấu trúc tốt! Nhưng làm thế nào? Trong một ví dụ nhỏ như ví dụ trên, dễ dàng tìm kiếm qua các dòng và tìm lỗi, nhưng còn một tài liệu HTML lớn, phức tạp thì sao?

Công cụ dành cho công việc này là [Dịch vụ Xác thực Đánh dấu](https://validator.w3.org/) (hay **trình xác thực HTML**), được W3C tạo ra và duy trì (bạn đã tìm hiểu về điều này trong [Mô hình chuẩn web](/en-US/docs/Learn_web_development/Getting_started/Web_standards/The_web_standards_model)). Trình xác thực nhận một tài liệu HTML làm đầu vào, duyệt qua nó và cung cấp cho bạn một báo cáo cho biết những gì sai với HTML của bạn.

![Trang chủ trình xác thực HTML](validator.png)

Để chỉ định HTML cần xác thực, bạn có thể cung cấp địa chỉ web, tải lên tệp HTML, hoặc nhập trực tiếp một số mã HTML.

## Xác thực một tài liệu HTML

Trong tác vụ này, chúng tôi sẽ yêu cầu bạn thử trình xác thực HTML. Bạn sẽ xác thực [tài liệu mẫu](https://github.com/mdn/learning-area/blob/main/html/introduction-to-html/debugging-html/debug-example.html) và xem kết quả được trả về. Ví dụ này chứa cùng HTML mà bạn đã nghiên cứu với trình kiểm tra DOM trước đó.

1. Đầu tiên, hãy tải [Dịch vụ Xác thực Đánh dấu](https://validator.w3.org/) vào tab trình duyệt mới, nếu nó chưa mở.
2. Chuyển sang tab [Validate by Direct Input](https://validator.w3.org/#validate_by_input).
3. Sao chép tất cả mã của tài liệu mẫu (không chỉ phần body) và dán vào vùng văn bản lớn được hiển thị trong Dịch vụ Xác thực Đánh dấu.
4. Nhấn nút _Check_.

Thao tác này sẽ cung cấp cho bạn danh sách lỗi và thông tin khác.

![Danh sách kết quả xác thực HTML từ dịch vụ xác thực đánh dấu W3C](validation-results.png)

### Giải thích các thông báo lỗi

Các thông báo lỗi thường hữu ích, nhưng đôi khi chúng không dễ hiểu. Với một chút thực hành, bạn có thể tìm ra cách giải thích những thông báo này để sửa mã. Hãy xem qua các thông báo lỗi và xem chúng có nghĩa là gì. Bạn sẽ thấy rằng mỗi thông báo đều đi kèm với số dòng và cột để giúp bạn dễ dàng xác định vị trí lỗi.

- "End tag `li` implied, but there were open elements" (2 trường hợp): Những thông báo này chỉ ra rằng có một phần tử đang mở cần được đóng. Thẻ kết thúc được ngụ ý, nhưng thực tế không có ở đó. Thông tin dòng/cột trỏ đến dòng đầu tiên sau dòng nơi thẻ đóng thực sự nên ở đó, nhưng đây là manh mối đủ tốt để thấy những gì sai.
- "Unclosed element `strong`": Điều này dễ hiểu hơn — một phần tử {{htmlelement("strong")}} chưa được đóng, và thông tin dòng/cột trỏ ngay đến nơi nó ở.
- "End tag `strong` violates nesting rules": Điều này chỉ ra các phần tử được lồng không chính xác, và thông tin dòng/cột chỉ ra nơi chúng ở.
- "End of file reached when inside an attribute value. Ignoring tag": Cái này khá khó hiểu; nó đề cập đến thực tế là có một giá trị thuộc tính không được định dạng đúng cách ở đâu đó, có thể gần cuối tệp vì phần cuối của tệp xuất hiện bên trong giá trị thuộc tính. Thực tế là trình duyệt không hiển thị liên kết sẽ cho chúng ta biết manh mối tốt về phần tử nào bị lỗi.
- "End of file seen and there were open elements": Điều này hơi mơ hồ, nhưng về cơ bản đề cập đến thực tế là có các phần tử mở cần được đóng đúng cách. Số dòng trỏ đến vài dòng cuối của tệp, và thông báo lỗi này đi kèm với một dòng mã chỉ ra một ví dụ về phần tử mở:

  ```plain
  example: <a href="https://www.mozilla.org/>link to Mozilla homepage</a> ↩ </ul>↩ </body>↩</html>
  ```

  > [!NOTE]
  > Một thuộc tính thiếu dấu ngoặc kép đóng có thể dẫn đến một phần tử mở vì phần còn lại của tài liệu được diễn giải là nội dung của thuộc tính.

- "Unclosed element `ul`": Điều này không hữu ích lắm, vì phần tử {{htmlelement("ul")}} _được_ đóng đúng cách. Lỗi này xảy ra vì phần tử {{htmlelement("a")}} không được đóng, do thiếu dấu ngoặc kép đóng.

Nếu bạn không thể tìm ra ý nghĩa của mỗi thông báo lỗi, đừng lo lắng về điều đó. Một chiến lược tốt là sửa một vài lỗi mỗi lần, sau đó xác thực lại HTML của bạn sau mỗi tập hợp sửa chữa để hiển thị những lỗi còn lại. Đôi khi, việc sửa một lỗi trước đó cũng sẽ loại bỏ các thông báo lỗi khác — nhiều lỗi thường có thể được gây ra bởi một vấn đề duy nhất, theo hiệu ứng domino.

Bạn sẽ biết khi tất cả các lỗi của bạn được sửa khi bạn thấy một biểu ngữ màu xanh lá nhỏ xinh báo rằng không có lỗi nào để báo cáo. Tại thời điểm viết bài, nó nói "Document checking completed. No errors or warnings to show."

## Tóm tắt

Vậy là đây, phần giới thiệu về gỡ lỗi HTML, sẽ cung cấp cho bạn một số kỹ năng hữu ích để dựa vào khi gỡ lỗi HTML, mà còn cả mã CSS và JavaScript sau này trong khóa học. Đây cũng đánh dấu kết thúc của mô-đun _Cấu trúc nội dung với HTML_.

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/Forms_challenge", "Learn_web_development/Core/Styling_basics", "Learn_web_development/Core/Structuring_content")}}
