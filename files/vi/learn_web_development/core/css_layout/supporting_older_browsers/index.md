---
title: Hỗ trợ các trình duyệt cũ
slug: Learn_web_development/Core/CSS_layout/Supporting_Older_Browsers
page-type: learn-module-chapter
browser-compat: css.properties.grid-template-columns
sidebar: learnsidebar
---

Những người truy cập trang web của bạn có thể bao gồm người dùng sử dụng các trình duyệt cũ hơn hoặc sử dụng các trình duyệt không hỗ trợ các tính năng CSS mà bạn đã triển khai. Đây là tình huống phổ biến trên web, nơi các tính năng mới liên tục được thêm vào CSS. Các trình duyệt khác nhau ở chỗ hỗ trợ các tính năng này vì các trình duyệt khác nhau có xu hướng ưu tiên triển khai các tính năng khác nhau. Bài viết này giải thích cách bạn với tư cách là nhà phát triển web có thể sử dụng các kỹ thuật web hiện đại để đảm bảo trang web của bạn vẫn có thể truy cập được với người dùng sử dụng công nghệ cũ hơn.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Kiến thức cơ bản về HTML (nghiên cứu
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content"
          >Giới thiệu về HTML</a
        >), và hiểu biết về cách CSS hoạt động (nghiên cứu
        <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">Kiến thức cơ bản về tạo kiểu CSS</a>.)
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Hiểu cách cung cấp hỗ trợ cho các bố cục trên các trình duyệt cũ
        có thể không hỗ trợ các tính năng bạn muốn sử dụng.
      </td>
    </tr>
  </tbody>
</table>

## Bối cảnh trình duyệt cho trang web của bạn là gì?

Mỗi trang web đều khác nhau về đối tượng mục tiêu. Trước khi quyết định cách tiếp cận, hãy tìm hiểu số lượng khách truy cập đến trang web của bạn bằng cách sử dụng các trình duyệt cũ. Điều này đơn giản nếu bạn đang thêm vào hoặc thay thế trang web hiện có, vì bạn có thể có phân tích cho biết công nghệ mà khách truy cập đang sử dụng. Nếu bạn không có phân tích hoặc đang ra mắt trang web hoàn toàn mới, thì các trang như [Statcounter](https://gs.statcounter.com/) có thể cung cấp số liệu thống kê liên quan, có thể được lọc theo vị trí.

Bạn cũng nên cân nhắc loại thiết bị và cách mọi người sử dụng trang web của bạn. Ví dụ, bạn có thể kỳ vọng cao hơn mức trung bình về việc sử dụng trang web trên thiết bị di động. Luôn ưu tiên khả năng tiếp cận và những người sử dụng công nghệ hỗ trợ; đối với một số trang web, điều này thậm chí có thể còn quan trọng hơn. Các nhà phát triển thường rất lo lắng về trải nghiệm của 1% người dùng, trong khi bỏ qua số lượng lớn hơn nhiều những người có nhu cầu về khả năng tiếp cận.

## Hỗ trợ cho các tính năng bạn muốn sử dụng là gì?

{{Compat}}

Bảng trên được bao gồm ở cuối mỗi trang tính năng trong phần "Khả năng tương thích trình duyệt". Sau khi xác định các trình duyệt mà khách truy cập trang web của bạn sử dụng, bạn có thể đánh giá bất kỳ công nghệ nào bạn muốn sử dụng dựa trên mức độ hỗ trợ của nó trên các trình duyệt và mức độ dễ dàng bạn có thể cung cấp giải pháp thay thế cho khách truy cập không có công nghệ đó.

Trên MDN, chúng ta cung cấp thông tin tương thích trình duyệt trên mỗi trang thuộc tính CSS. Thông tin tương thích này, được trình bày trong bảng, bao gồm danh sách các trình duyệt chính cùng với các phiên bản bắt đầu hỗ trợ thuộc tính. Tên trình duyệt chiếm các tiêu đề cột. Ví dụ, hãy xem bảng trên hoặc trang cho {{cssxref("grid-template-columns")}}, với sự chú ý đặc biệt đến giá trị `subgrid` (được hỗ trợ gần đây nhất) và `masonry` (thử nghiệm và không được hỗ trợ).

Các bảng tương thích trình duyệt này cung cấp thông tin về các trình duyệt nào tương thích với công nghệ bạn đang tìm kiếm và phiên bản từ đó trình duyệt bắt đầu hỗ trợ chức năng đó. Thông tin tương thích trình duyệt máy tính để bàn và điện thoại di động được hiển thị riêng biệt.

Một cách phổ biến khác để tìm hiểu mức độ hỗ trợ của một tính năng là trang web [Can I Use](https://caniuse.com/). Trang này liệt kê phần lớn các tính năng Nền tảng Web với thông tin về trạng thái hỗ trợ trình duyệt. Bạn có thể xem số liệu thống kê sử dụng theo vị trí — hữu ích nếu bạn làm việc trên trang web có người dùng chủ yếu ở một khu vực cụ thể trên thế giới. Bạn thậm chí có thể liên kết tài khoản Google Analytics để nhận phân tích dựa trên dữ liệu người dùng của bạn.

Hiểu công nghệ mà người dùng của bạn có do trình duyệt họ đang sử dụng và hỗ trợ trình duyệt chéo cho các tính năng bạn có thể muốn sử dụng trên trang web của mình, giúp bạn ở vị trí tốt để đưa ra tất cả các quyết định và biết cách tốt nhất để hỗ trợ tất cả người dùng.

## Hỗ trợ tính năng không có nghĩa là giao diện giống hệt nhau

Một trang web không thể trông giống hệt nhau trong tất cả các trình duyệt. Một số người dùng của bạn sẽ xem trang web trên điện thoại và những người khác trên màn hình máy tính để bàn lớn. Tương tự, một số người dùng của bạn sẽ có phiên bản trình duyệt cũ, và những người khác có trình duyệt mới nhất. Một số người dùng của bạn có thể nghe nội dung của bạn được đọc to cho họ bởi trình đọc màn hình, trong khi những người khác có thể cần phóng to trang để có thể đọc nó. Hỗ trợ tất cả mọi người có nghĩa là phục vụ một phiên bản nội dung của bạn được thiết kế phòng thủ, để nó trông tuyệt vời trên các trình duyệt hiện đại, nhưng vẫn có thể sử dụng ở mức cơ bản cho tất cả người dùng dù họ truy cập nội dung theo cách nào.

Mức độ hỗ trợ cơ bản đến từ cấu trúc nội dung của bạn tốt để luồng thông thường của trang của bạn có nghĩa. Đối với người dùng có gói dữ liệu hạn chế, trình duyệt của họ có thể không tải hình ảnh, phông chữ hoặc thậm chí CSS. Tuy nhiên, nội dung nên được trình bày theo cách có thể truy cập và đọc được ngay cả khi các phần tử này không được tải đầy đủ. Một tài liệu HTML có cấu trúc tốt nên luôn là điểm khởi đầu của bạn. Hãy tự hỏi: _nếu bạn xóa stylesheet, nội dung của bạn có còn có nghĩa không?_

Không có ý nghĩa thương mại khi dành thời gian cố gắng cung cấp cho mọi người trải nghiệm giống hệt nhau về trang web của bạn. Điều này là vì môi trường người dùng có thể thay đổi rộng rãi và nằm ngoài tầm kiểm soát của bạn. Có sự cân bằng bạn cần đạt được giữa trang HTML đơn giản và trang web đầy đủ tính năng. Việc kiểm tra chế độ xem thuần túy không có CSS của trang web của bạn rất hữu ích để đảm bảo trải nghiệm dự phòng của trang web của bạn có thể truy cập được. Dự phòng này có thể không bao giờ được xem bởi người sử dụng các trình duyệt rất cũ hoặc hạn chế, nhưng có thể được xem bởi đối tượng mục tiêu chính của bạn — người dùng các trình duyệt hiện đại — khi trình duyệt hoặc kết nối Internet của họ tạm thời bị lỗi. CSS đơn giản hóa việc tạo các dự phòng này. Do đó, tốt hơn là tập trung vào những gì bạn có thể kiểm soát, tức là dành thời gian để làm cho trang web của bạn [có thể truy cập](/en-US/docs/Web/Accessibility), từ đó phục vụ nhiều người dùng hơn.

## Tạo dự phòng trong CSS

Thông số kỹ thuật CSS chứa thông tin giải thích những gì trình duyệt làm khi hai tính năng tương tự, chẳng hạn như các phương pháp bố cục, được áp dụng cho cùng một mục. Ví dụ, chúng định nghĩa những gì xảy ra nếu một mục được float và cũng là mục lưới và một phần của vùng chứa lưới CSS. Cũng có định nghĩa về những gì xảy ra khi một phần tử có cả hai thuộc tính {{cssxref("margin-top")}} và {{cssxref("margin-block-start")}} được đặt.

Khi trình duyệt không nhận ra tính năng mới, nó loại bỏ khai báo như không hợp lệ [mà không ném lỗi](/en-US/docs/Web/CSS/Guides/Syntax/Error_handling#css_parser_errors). Vì trình duyệt loại bỏ các thuộc tính và giá trị CSS mà chúng không hỗ trợ, cả giá trị cũ và mới đều có thể cùng tồn tại trong cùng một ruleset. Chỉ cần đảm bảo khai báo giá trị cũ trước giá trị mới để khi được hỗ trợ, giá trị mới ghi đè giá trị cũ (dự phòng).

Ví dụ, hầu hết các trình duyệt hỗ trợ cú pháp hai giá trị của thuộc tính {{cssxref("display")}}. Nếu trình duyệt không hỗ trợ, nó sẽ sử dụng cú pháp một giá trị cũ hơn.

```css
.container {
  display: inline-flex;
  display: inline flex;
}
```

Tương tự, [xử lý lỗi](/en-US/docs/Web/CSS/Guides/Syntax/Error_handling#vendor_prefixes) này đảm bảo các cơ sở mã CSS cũ tiếp tục hoạt động ngay cả khi các tính năng {{glossary("Vendor_Prefix", "có tiền tố nhà cung cấp")}} kế thừa không còn được hỗ trợ. Mặc dù việc thêm tiền tố nhà cung cấp không còn phổ biến nữa, nếu bạn phải bao gồm thuộc tính hoặc giá trị có tiền tố nhà cung cấp, hãy đảm bảo khai báo giá trị có tiền tố trước giá trị tiêu chuẩn để khi được hỗ trợ, giá trị mới ghi đè giá trị dự phòng.

### Sử dụng các selector mới

Bao gồm các selector mới không được hỗ trợ trong tất cả trình duyệt cần được xử lý cẩn thận hơn. Nếu một selector trong danh sách selector phân cách bằng dấu phẩy [selector không hợp lệ](/en-US/docs/Learn_web_development/Extensions/Testing/HTML_and_CSS#selector_support), toàn bộ khối kiểu bị bỏ qua.

Nếu sử dụng [pseudo-elements](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) có tiền tố nhà cung cấp hoặc [pseudo-classes](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) mới mà trình duyệt có thể chưa hỗ trợ, hãy bao gồm các giá trị có tiền tố trong [danh sách selector tha thứ](/en-US/docs/Web/CSS/Reference/Selectors/Selector_list#forgiving_selector_list) bằng cách sử dụng {{cssxref(":is", ":is()")}} hoặc {{cssxref(":where", ":where()")}} để toàn bộ khối selector không bị [vô hiệu hóa và bỏ qua](/en-US/docs/Web/CSS/Reference/Selectors/Selector_list#invalid_selector_list).

```css
:is(:-prefix-mistake, :unsupported-pseudo),
.valid {
  font-family: sans-serif;
}
:-prefix-mistake,
:unsupported-pseudo,
.valid {
  color: red;
}
```

Trong ví dụ trên, nội dung `.valid` sẽ là `sans-serif` nhưng không phải `red`.

## Truy vấn tính năng

Truy vấn tính năng cho phép bạn kiểm tra xem trình duyệt có hỗ trợ một tính năng CSS cụ thể không. Điều này có nghĩa là bạn có thể viết một số CSS cho các trình duyệt không hỗ trợ một tính năng nhất định, sau đó kiểm tra xem trình duyệt có hỗ trợ và nếu có, đưa vào các tính năng mới phong phú.

Chúng ta có thể thêm truy vấn tính năng để kiểm tra hỗ trợ `subgrid` và cung cấp các kiểu dựa trên hỗ trợ đó:

```css
* {
  box-sizing: border-box;
}

.wrapper {
  background-color: palegoldenrod;
  padding: 10px;
  max-width: 400px;
  display: grid;
  grid-template-columns: repeat(3, 1fr);
}

.item {
  border-radius: 5px;
  background-color: rgb(207 232 220);
}

@supports (grid-template-rows: subgrid) {
  .wrapper {
    grid-template-rows: subgrid;
    gap: 10px;
    background-color: lightblue;
    text-align: center;
  }
}
```

```html
<div class="wrapper">
  <div class="item">Item One</div>
  <div class="item">Item Two</div>
  <div class="item">Item Three</div>
  <div class="item">Item Four</div>
  <div class="item">Item Five</div>
  <div class="item">Item Six</div>
</div>
```

{{ EmbedLiveSample('Feature_queries', '100%', '200') }}

Truy vấn tính năng được hỗ trợ trong tất cả các trình duyệt hiện đại. Viết CSS của bạn cho các tính năng được hỗ trợ đầy đủ trước, bên ngoài bất kỳ truy vấn tính năng nào. Sau khi trang web của bạn có thể sử dụng và truy cập được cho tất cả người dùng, hãy thêm các tính năng mới trong các khối truy vấn tính năng. Các trình duyệt hỗ trợ tính năng được truy vấn sau đó có thể hiển thị CSS mới hơn bên trong khối truy vấn tính năng. Sử dụng cách tiếp cận viết CSS được hỗ trợ tốt trước, sau đó cải thiện các tính năng dựa trên hỗ trợ.

## Kiểm tra các trình duyệt cũ hơn

Một cách là sử dụng công cụ kiểm tra trực tuyến như Sauce Labs, như được trình bày chi tiết trong mô-đun [Testing](/en-US/docs/Learn_web_development/Extensions/Testing).

## Tóm tắt

Bây giờ bạn đã có kiến thức để cung cấp CSS dự phòng cho các trình duyệt cũ và tự tin kiểm tra các tính năng mới. Bây giờ bạn nên tự tin sử dụng bất kỳ kỹ thuật mới nào có thể xuất hiện.

Bây giờ khi bạn đã làm việc qua các bài viết về bố cục CSS, đã đến lúc kiểm tra sự hiểu biết của bạn với bài đánh giá của chúng ta về mô-đun: [Hiểu bố cục cơ bản](/en-US/docs/Learn_web_development/Core/CSS_layout/Fundamental_Layout_Comprehension).

## Xem thêm

- Quy tắc at-rule {{cssxref("@supports")}}
- [At-rules CSS](/en-US/docs/Web/CSS/Guides/Syntax/At-rules)
- [Sử dụng truy vấn tính năng](/en-US/docs/Web/CSS/Guides/Conditional_rules/Using_feature_queries)
- Mô-đun [Quy tắc điều kiện CSS](/en-US/docs/Web/CSS/Guides/Conditional_rules)
