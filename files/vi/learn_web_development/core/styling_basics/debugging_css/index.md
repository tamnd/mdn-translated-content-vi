---
title: Gỡ lỗi CSS
slug: Learn_web_development/Core/Styling_basics/Debugging_CSS
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Home_color_scheme_search", "Learn_web_development/Core/Text_styling", "Learn_web_development/Core/Styling_basics")}}

Đôi khi khi viết CSS bạn sẽ gặp vấn đề khi CSS của bạn dường như không làm những gì bạn mong đợi. Có thể bạn tin rằng một bộ chọn nhất định phải khớp với một phần tử, nhưng không có gì xảy ra, hoặc một hộp có kích thước khác với bạn mong đợi. Bài viết này sẽ cung cấp cho bạn hướng dẫn về cách gỡ lỗi vấn đề CSS, và chỉ cho bạn cách DevTools được bao gồm trong tất cả các trình duyệt hiện đại có thể giúp bạn tìm hiểu những gì đang xảy ra.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Basic_HTML_syntax"
          >Cú pháp HTML cơ bản</a
        >, kiến thức cơ bản về tạo kiểu CSS (được đề cập trong các bài học trước trong mô-đun này!)
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Sử dụng <a href="https://validator.w3.org/">HTML validator</a> để xem bạn có markup không hợp lệ nào trên trang gây ra vấn đề CSS không.</li>
          <li>Sử dụng <a href="https://jigsaw.w3.org/css-validator/">CSS validator</a> để kiểm tra mã CSS được định dạng kém.</li>
          <li>Sử dụng công cụ phát triển trình duyệt để kiểm tra CSS được áp dụng cho các phần tử HTML trên trang.</li>
          <li>Sửa đổi CSS được áp dụng để tìm hiểu những thay đổi nào cần thiết để đạt được những gì bạn muốn. Điều này bao gồm kích hoạt và vô hiệu hóa khai báo, sửa đổi giá trị, và thêm khai báo mới.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Cách truy cập DevTools trình duyệt

Bài viết [Công cụ phát triển trình duyệt là gì](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/What_are_browser_developer_tools) giải thích cách truy cập các công cụ trong các trình duyệt và nền tảng khác nhau. Mặc dù bạn có thể chọn chủ yếu phát triển trong một trình duyệt cụ thể, và do đó sẽ trở nên quen thuộc nhất với các công cụ được bao gồm trong trình duyệt đó, điều quan trọng là biết cách truy cập chúng trong các trình duyệt khác. Điều này sẽ giúp ích nếu bạn thấy kết xuất khác nhau giữa nhiều trình duyệt.

Trong bài học này, chúng ta sẽ xem xét một số tính năng hữu ích của Firefox DevTools để làm việc với CSS. Để làm điều đó, tôi sẽ sử dụng [một tệp ví dụ](https://mdn.github.io/css-examples/learn/inspecting/inspecting.html). Tải tệp này trong tab mới nếu bạn muốn theo dõi, và mở DevTools của bạn như được mô tả trong bài viết được liên kết ở trên.

## DOM so với xem nguồn

Điều có thể gây nhầm lẫn cho những người mới bắt đầu với DevTools là sự khác biệt giữa những gì bạn thấy khi [xem nguồn](https://firefox-source-docs.mozilla.org/devtools-user/view_source/index.html) của trang web, hoặc nhìn vào tệp HTML bạn đặt trên máy chủ, và những gì bạn có thể thấy trong [HTML Pane](https://firefox-source-docs.mozilla.org/devtools-user/page_inspector/ui_tour/index.html#html-pane) của DevTools. Mặc dù nó trông khá giống với những gì bạn có thể thấy qua View Source nhưng có một số khác biệt.

Trong DOM được hiển thị, trình duyệt có thể đã chuẩn hóa HTML, ví dụ bằng cách sửa một số HTML được viết kém cho bạn. Nếu bạn đóng một phần tử không đúng, chẳng hạn bằng cách mở `<h2>` nhưng đóng bằng `</h3>`, trình duyệt sẽ tìm ra bạn đang muốn làm gì và HTML trong DOM sẽ đóng đúng `<h2>` đang mở bằng `</h2>`. DOM cũng sẽ hiển thị bất kỳ thay đổi nào được thực hiện bởi JavaScript.

Ngược lại, View Source là mã nguồn HTML được lưu trữ trên máy chủ. [Cây HTML](https://firefox-source-docs.mozilla.org/devtools-user/page_inspector/how_to/examine_and_edit_html/index.html#html-tree) trong DevTools của bạn hiển thị chính xác những gì trình duyệt đang hiển thị vào bất kỳ thời điểm nào, vì vậy nó cung cấp cho bạn cái nhìn sâu sắc về những gì thực sự đang xảy ra.

## Kiểm tra CSS được áp dụng

Chọn một phần tử trên trang của bạn, bằng cách nhấp chuột phải/ctrl vào nó và chọn _Kiểm tra_, hoặc chọn nó từ cây HTML ở phía trái của màn hình DevTools. Hãy thử chọn phần tử với lớp `box1`; đây là phần tử đầu tiên trên trang có hộp đường viền được vẽ xung quanh nó.

![Trang ví dụ cho hướng dẫn này với DevTools mở.](inspecting1.png)

Nếu bạn nhìn vào [Rules view](https://firefox-source-docs.mozilla.org/devtools-user/page_inspector/ui_tour/index.html#rules-view) ở bên phải HTML của bạn, bạn sẽ thấy các thuộc tính CSS và giá trị được áp dụng cho phần tử đó. Bạn sẽ thấy các quy tắc được áp dụng trực tiếp cho lớp `box1` và cũng CSS đang được kế thừa bởi hộp từ các tổ tiên của nó, trong trường hợp này từ `<body>`. Điều này hữu ích nếu bạn thấy một số CSS đang được áp dụng mà bạn không mong đợi. Có thể nó đang được kế thừa từ phần tử cha và bạn cần thêm quy tắc để ghi đè nó trong ngữ cảnh của phần tử này.

Cũng hữu ích là khả năng mở rộng các thuộc tính viết tắt. Trong ví dụ của chúng ta, `margin` viết tắt được sử dụng.

**Nhấp vào mũi tên nhỏ để mở rộng chế độ xem, hiển thị các thuộc tính dài tay khác nhau và giá trị của chúng.**

**Bạn có thể bật và tắt các giá trị trong Rules view khi bảng đó đang hoạt động — nếu bạn di con trỏ chuột lên nó, các hộp kiểm sẽ xuất hiện. Bỏ chọn hộp kiểm của quy tắc, ví dụ `border-radius`, và CSS sẽ ngừng áp dụng.**

Bạn có thể sử dụng điều này để thực hiện so sánh A/B, quyết định xem thứ gì đó trông đẹp hơn với quy tắc được áp dụng hay không, và cũng để giúp gỡ lỗi nó — ví dụ, nếu bố cục đang bị sai và bạn đang cố tìm hiểu thuộc tính nào đang gây ra vấn đề.

## Chỉnh sửa giá trị

Ngoài việc bật và tắt thuộc tính, bạn có thể chỉnh sửa giá trị của chúng. Có thể bạn muốn xem màu khác trông đẹp hơn không, hoặc muốn điều chỉnh kích thước của thứ gì đó? DevTools có thể tiết kiệm cho bạn rất nhiều thời gian chỉnh sửa stylesheet và tải lại trang.

**Với `box1` được chọn, nhấp vào mẫu màu (hình tròn màu nhỏ) hiển thị màu được áp dụng cho đường viền. Bộ chọn màu sẽ mở ra và bạn có thể thử một số màu khác nhau; chúng sẽ cập nhật theo thời gian thực trên trang. Theo cách tương tự, bạn có thể thay đổi chiều rộng hoặc kiểu của đường viền.**

![Bảng Styles DevTools với bộ chọn màu mở.](inspecting2-color-picker.png)

## Thêm thuộc tính mới

Bạn có thể thêm thuộc tính bằng DevTools. Có thể bạn đã nhận ra rằng bạn không muốn hộp của mình kế thừa kích thước phông chữ của phần tử `<body>`, và muốn đặt kích thước cụ thể riêng của nó? Bạn có thể thử điều này trong DevTools trước khi thêm nó vào tệp CSS của mình.

**Bạn có thể nhấp vào dấu ngoặc nhọn đóng trong quy tắc để bắt đầu nhập khai báo mới vào nó, tại đó bạn có thể bắt đầu nhập thuộc tính mới và DevTools sẽ hiển thị cho bạn danh sách tự động hoàn thành các thuộc tính phù hợp. Sau khi chọn `font-size`, nhập giá trị bạn muốn thử. Bạn cũng có thể nhấp vào nút + để thêm quy tắc bổ sung với cùng bộ chọn, và thêm các quy tắc mới của bạn ở đó.**

![Bảng DevTools, thêm thuộc tính mới vào quy tắc, với tự động hoàn thành cho font- mở](inspecting3-font-size.png)

> [!NOTE]
> Ngoài ra còn có các tính năng hữu ích khác trong Rules view, ví dụ các khai báo có giá trị không hợp lệ bị gạch chân. Bạn có thể tìm hiểu thêm tại [Examine and edit CSS](https://firefox-source-docs.mozilla.org/devtools-user/page_inspector/how_to/examine_and_edit_css/index.html).

## Hiểu mô hình hộp

Trong các bài học trước, chúng ta đã thảo luận về [mô hình hộp](/en-US/docs/Learn_web_development/Core/Styling_basics/Box_model), và thực tế là chúng ta có mô hình hộp thay thế thay đổi cách tính kích thước các phần tử dựa trên kích thước bạn cung cấp cho chúng, cộng với phần đệm và đường viền. DevTools thực sự có thể giúp bạn hiểu cách kích thước của một phần tử được tính toán.

[Layout view](https://firefox-source-docs.mozilla.org/devtools-user/page_inspector/ui_tour/index.html#layout-view) hiển thị cho bạn sơ đồ mô hình hộp trên phần tử được chọn, cùng với mô tả về các thuộc tính và giá trị thay đổi cách phần tử được bố cục. Điều này bao gồm mô tả về các thuộc tính bạn có thể không sử dụng một cách rõ ràng trên phần tử, nhưng có giá trị ban đầu được đặt.

Trong bảng này, một trong các thuộc tính chi tiết là thuộc tính `box-sizing`, điều khiển mô hình hộp nào mà phần tử sử dụng.

**So sánh hai hộp với các lớp `box1` và `box2`. Cả hai đều có cùng chiều rộng được áp dụng (400px), tuy nhiên `box1` trông rộng hơn về mặt hình ảnh. Bạn có thể thấy trong bảng bố cục rằng nó đang sử dụng `content-box`. Đây là giá trị lấy kích thước bạn cung cấp cho phần tử và sau đó thêm phần đệm và chiều rộng đường viền.**

Phần tử có lớp `box2` đang sử dụng `border-box`, vì vậy ở đây phần đệm và đường viền được trừ từ kích thước bạn đã cung cấp cho phần tử. Điều này có nghĩa là không gian chiếm dụng trên trang bởi hộp là kích thước chính xác mà bạn đã chỉ định — trong trường hợp của chúng ta `width: 400px`.

![Phần Layout của DevTools](inspecting4-box-model.png)

> [!NOTE]
> Tìm hiểu thêm trong [Examining and Inspecting the Box Model](https://firefox-source-docs.mozilla.org/devtools-user/page_inspector/how_to/examine_and_edit_the_box_model/index.html).

## Giải quyết vấn đề độ đặc hiệu

Đôi khi trong quá trình phát triển, nhưng đặc biệt khi bạn cần chỉnh sửa CSS trên trang web hiện có, bạn sẽ thấy mình gặp khó khăn khi làm cho một số CSS áp dụng. Dù bạn làm gì, phần tử chỉ không muốn nhận CSS. Điều thường xảy ra ở đây là một bộ chọn cụ thể hơn đang ghi đè các thay đổi của bạn, và ở đây DevTools thực sự sẽ giúp bạn.

Trong tệp ví dụ của chúng ta có hai từ đã được bọc trong một phần tử `<em>`. Một đang hiển thị màu cam và một màu hồng đậm. Trong CSS chúng ta đã áp dụng:

```css
em {
  color: hotpink;
  font-weight: bold;
}
```

Nhưng ở trên trong stylesheet có một quy tắc với bộ chọn `.special`:

```css
.special {
  color: orange;
}
```

Như bạn sẽ nhớ từ bài học về [xử lý xung đột](/en-US/docs/Learn_web_development/Core/Styling_basics/Handling_conflicts) nơi chúng ta đã thảo luận về độ đặc hiệu, bộ chọn lớp cụ thể hơn bộ chọn phần tử, vì vậy đây là giá trị được áp dụng. DevTools có thể giúp bạn tìm những vấn đề như vậy, đặc biệt nếu thông tin bị chôn vùi ở đâu đó trong một stylesheet khổng lồ.

**Kiểm tra `<em>` với lớp `.special` và DevTools sẽ hiển thị cho bạn rằng màu cam là màu được áp dụng, và cũng rằng thuộc tính `color` được áp dụng cho `<em>` bị gạch chân. Bây giờ bạn có thể thấy rằng bộ chọn lớp đang ghi đè bộ chọn phần tử.**

![Chọn một em và xem DevTools để xem cái gì đang ghi đè màu.](inspecting5-specificity.png)

## Gỡ lỗi vấn đề trong CSS

DevTools có thể là trợ giúp rất lớn khi giải quyết các vấn đề CSS, vì vậy khi bạn thấy mình trong tình huống CSS không hoạt động như bạn mong đợi, làm thế nào bạn nên giải quyết nó? Các bước sau đây sẽ giúp.

### Lùi lại từ vấn đề

Bất kỳ vấn đề lập trình nào cũng có thể gây bực bội, đặc biệt là các vấn đề CSS vì bạn thường không nhận được thông báo lỗi để tìm kiếm trực tuyến để giúp tìm giải pháp. Nếu bạn đang cảm thấy bực bội, hãy thoát khỏi vấn đề một lúc — đi dạo, lấy đồ uống, trò chuyện với đồng nghiệp, hoặc làm việc gì khác một lúc. Đôi khi giải pháp xuất hiện một cách kỳ diệu khi bạn ngừng suy nghĩ về vấn đề, và ngay cả khi không, làm việc với nó khi cảm thấy được làm mới sẽ dễ dàng hơn nhiều.

### Bạn có HTML và CSS hợp lệ không?

Các trình duyệt mong đợi CSS và HTML của bạn được viết đúng, tuy nhiên các trình duyệt cũng rất linh hoạt và sẽ cố gắng hết sức để hiển thị các trang web của bạn ngay cả khi bạn có lỗi trong markup hoặc stylesheet. Nếu bạn có lỗi trong mã, trình duyệt cần đoán bạn muốn gì, và nó có thể đưa ra quyết định khác với những gì bạn có trong đầu. Ngoài ra, hai trình duyệt khác nhau có thể đối phó với vấn đề theo hai cách khác nhau. Vì vậy, bước đầu tiên tốt là chạy HTML và CSS của bạn qua validator, để tìm và sửa bất kỳ lỗi nào.

- [CSS Validator](https://jigsaw.w3.org/css-validator/)
- [HTML validator](https://validator.w3.org/)

### Thuộc tính và giá trị có được hỗ trợ bởi trình duyệt bạn đang kiểm tra không?

Các trình duyệt bỏ qua CSS mà họ không hiểu. Nếu thuộc tính hoặc giá trị bạn đang sử dụng không được hỗ trợ bởi trình duyệt bạn đang kiểm tra, thì không có gì sẽ bị hỏng, nhưng CSS đó sẽ không được áp dụng. DevTools thường sẽ làm nổi bật các thuộc tính và giá trị không được hỗ trợ theo một cách nào đó. Trong ảnh chụp màn hình bên dưới, trình duyệt không hỗ trợ giá trị subgrid của {{cssxref("grid-template-columns")}}.

![Hình ảnh DevTools trình duyệt với grid-template-columns: subgrid bị gạch chân vì giá trị subgrid không được hỗ trợ.](no-support.png)

Bạn cũng có thể xem các bảng tương thích Trình duyệt ở cuối mỗi trang thuộc tính trên MDN. Chúng hiển thị hỗ trợ trình duyệt cho thuộc tính đó, thường được chia nhỏ nếu có hỗ trợ cho một số cách sử dụng thuộc tính và không có ở các cách khác. [Xem bảng tương thích cho thuộc tính `grid-template-columns`](/en-US/docs/Web/CSS/Reference/Properties/grid-template-columns#browser_compatibility).

### Có thứ gì khác đang ghi đè CSS của bạn không?

Đây là nơi thông tin bạn đã học về độ đặc hiệu sẽ trở nên rất hữu ích. Nếu bạn có thứ gì đó cụ thể hơn đang ghi đè những gì bạn đang cố làm, bạn có thể bước vào trò chơi rất bực bội khi cố tìm hiểu đó là gì. Tuy nhiên, như mô tả ở trên, DevTools sẽ cho bạn thấy CSS nào đang áp dụng và bạn có thể tìm ra cách làm cho bộ chọn mới cụ thể đủ để ghi đè nó.

### Tạo một trường hợp kiểm tra thu gọn của vấn đề

Nếu vấn đề không được giải quyết bằng các bước trên, thì bạn sẽ cần điều tra thêm. Điều tốt nhất cần làm lúc này là tạo ra thứ được gọi là trường hợp kiểm tra thu gọn. Khả năng "thu gọn một vấn đề" là kỹ năng thực sự hữu ích. Nó sẽ giúp bạn tìm ra vấn đề trong mã của mình và của đồng nghiệp, và cũng sẽ cho phép bạn báo cáo lỗi và yêu cầu giúp đỡ hiệu quả hơn.

Trường hợp kiểm tra thu gọn là ví dụ mã thể hiện vấn đề theo cách đơn giản nhất có thể, với nội dung và tạo kiểu xung quanh không liên quan được loại bỏ. Điều này thường có nghĩa là lấy mã có vấn đề ra khỏi bố cục của bạn để tạo một ví dụ nhỏ chỉ hiển thị mã hoặc tính năng đó.

Để tạo trường hợp kiểm tra thu gọn:

1. Nếu markup của bạn được tạo động — ví dụ qua CMS — hãy tạo phiên bản tĩnh của đầu ra hiển thị vấn đề. Trang web chia sẻ mã như [CodePen](https://codepen.io/) hữu ích để lưu trữ các trường hợp kiểm tra thu gọn, vì sau đó chúng có thể truy cập trực tuyến và bạn có thể dễ dàng chia sẻ chúng với đồng nghiệp. Bạn có thể bắt đầu bằng cách View Source trên trang và sao chép HTML vào CodePen, sau đó lấy bất kỳ CSS và JavaScript liên quan nào và bao gồm nó. Sau đó, bạn có thể kiểm tra xem vấn đề có còn hiển thị không.
2. Nếu loại bỏ JavaScript không làm cho vấn đề biến mất, đừng bao gồm JavaScript. Nếu loại bỏ JavaScript _làm cho_ vấn đề biến mất, thì hãy loại bỏ càng nhiều JavaScript càng tốt, giữ lại bất cứ thứ gì gây ra vấn đề.
3. Loại bỏ bất kỳ HTML nào không góp phần vào vấn đề. Loại bỏ các thành phần hoặc thậm chí các phần tử chính của bố cục. Một lần nữa, cố gắng xuống đến lượng mã nhỏ nhất vẫn hiển thị vấn đề.
4. Loại bỏ bất kỳ CSS nào không ảnh hưởng đến vấn đề.

Trong quá trình làm điều này, bạn có thể khám phá nguyên nhân của vấn đề, hoặc ít nhất có thể bật và tắt nó bằng cách loại bỏ điều gì đó cụ thể. Đáng để thêm một số nhận xét vào mã của bạn khi bạn khám phá mọi thứ. Nếu bạn cần yêu cầu giúp đỡ, chúng sẽ cho người giúp bạn thấy những gì bạn đã thử. Điều này có thể đủ để cung cấp cho bạn đủ thông tin để tìm kiếm các vấn đề và cách giải quyết có thể.

Nếu bạn vẫn gặp khó khăn trong việc sửa vấn đề, thì có trường hợp kiểm tra thu gọn cho bạn thứ gì đó để yêu cầu giúp đỡ, bằng cách đăng lên diễn đàn, hoặc cho đồng nghiệp xem. Bạn có nhiều khả năng nhận được sự giúp đỡ hơn nếu bạn có thể chứng minh rằng bạn đã thực hiện công việc thu gọn vấn đề và xác định chính xác nơi nó xảy ra, trước khi yêu cầu giúp đỡ. Một nhà phát triển có kinh nghiệm hơn có thể nhanh chóng phát hiện ra vấn đề và chỉ cho bạn đúng hướng, và ngay cả khi không, trường hợp kiểm tra thu gọn của bạn sẽ cho phép họ xem nhanh và hy vọng có thể đưa ra ít nhất một số trợ giúp.

Trong trường hợp vấn đề của bạn thực sự là lỗi trong trình duyệt, thì trường hợp kiểm tra thu gọn cũng có thể được sử dụng để gửi báo cáo lỗi với nhà cung cấp trình duyệt liên quan (ví dụ, trên [bugzilla site](https://bugzilla.mozilla.org/) của Mozilla).

Khi bạn trở nên có kinh nghiệm hơn với CSS, bạn sẽ thấy rằng bạn trở nên nhanh hơn trong việc tìm ra vấn đề. Tuy nhiên, ngay cả những người có kinh nghiệm nhất trong chúng ta đôi khi cũng thấy mình tự hỏi điều gì đang xảy ra. Thực hiện cách tiếp cận có phương pháp, tạo trường hợp kiểm tra thu gọn, và giải thích vấn đề cho người khác thường sẽ dẫn đến việc tìm ra giải pháp.

## Tóm tắt

Vậy là xong: giới thiệu về gỡ lỗi CSS, sẽ cung cấp cho bạn một số kỹ năng hữu ích để dựa vào khi bạn bắt đầu gỡ lỗi CSS và các loại mã khác sau này trong sự nghiệp của bạn.

Đó là tất cả các bài học trong mô-đun này. Để kết thúc, chúng ta sẽ kiểm tra kiến thức của bạn về các chủ đề được đề cập với một loạt thử thách.

## Xem thêm

- [Firefox > Examine and edit CSS](https://firefox-source-docs.mozilla.org/devtools-user/page_inspector/how_to/examine_and_edit_css/index.html), Firefox Source Docs
- [Chrome > View and change CSS](https://developer.chrome.com/docs/devtools/css/), developer.chrome.com

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Home_color_scheme_search", "Learn_web_development/Core/Text_styling", "Learn_web_development/Core/Styling_basics")}}
