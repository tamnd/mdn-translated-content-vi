---
title: Tổ chức CSS của bạn
slug: Learn_web_development/Core/Styling_basics/Organizing
page-type: learn-module-chapter
sidebar: learnsidebar
---

Khi bạn bắt đầu làm việc trên các stylesheet lớn hơn và các dự án lớn, bạn sẽ phát hiện ra rằng việc duy trì tệp CSS khổng lồ có thể là một thách thức. Trong bài viết này, chúng ta sẽ xem xét ngắn gọn một số thực hành tốt nhất để viết CSS của bạn để nó dễ dàng bảo trì, và một số giải pháp bạn sẽ thấy được người khác sử dụng để giúp cải thiện khả năng bảo trì.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <a
          href="/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Installing_software"
          >Phần mềm cơ bản được cài đặt</a
        >, kiến thức cơ bản về
        <a
          href="/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Dealing_with_files"
          >làm việc với tệp</a
        >, kiến thức cơ bản về HTML (học qua
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content"
          >Giới thiệu về HTML</a
        >), và ý tưởng về cách CSS hoạt động (học qua
        <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">Kiến thức cơ bản về tạo kiểu CSS</a>.)
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Học một số mẹo và thực hành tốt nhất để tổ chức stylesheet, và
        tìm hiểu về một số quy ước đặt tên và công cụ được sử dụng phổ biến
        để giúp tổ chức CSS và làm việc nhóm.
      </td>
    </tr>
  </tbody>
</table>

## Mẹo để giữ CSS của bạn gọn gàng

Đây là một số gợi ý chung về cách giữ stylesheet của bạn được tổ chức và gọn gàng.

### Dự án của bạn có hướng dẫn kiểu lập trình không?

Nếu bạn đang làm việc với nhóm trên dự án hiện có, điều đầu tiên cần kiểm tra là liệu dự án có hướng dẫn kiểu hiện có cho CSS không. Hướng dẫn kiểu nhóm luôn phải thắng hơn sở thích cá nhân của bạn. Thường không có cách đúng hay sai để làm mọi thứ, nhưng sự nhất quán là quan trọng.

Ví dụ, hãy xem [hướng dẫn CSS cho các ví dụ mã MDN](/en-US/docs/MDN/Writing_guidelines/Code_style_guide/CSS).

### Giữ nhất quán

Nếu bạn được đặt quy tắc cho dự án hoặc đang làm việc một mình, thì điều quan trọng nhất cần làm là giữ mọi thứ nhất quán. Sự nhất quán có thể được áp dụng theo nhiều cách, chẳng hạn như sử dụng cùng quy ước đặt tên cho các lớp, chọn một phương pháp mô tả màu sắc, hoặc duy trì định dạng nhất quán. (Ví dụ, bạn sẽ sử dụng tab hay dấu cách để thụt lề mã? Nếu dấu cách, bao nhiêu dấu cách?)

Có một bộ quy tắc bạn luôn tuân theo làm giảm lượng gánh nặng tinh thần cần thiết khi viết CSS, vì một số quyết định đã được thực hiện sẵn.

### Định dạng CSS dễ đọc

Có một số cách bạn sẽ thấy CSS được định dạng. Một số nhà phát triển đặt tất cả các quy tắc lên một dòng, như thế này:

```css-nolint
.box {background-color: #567895; }
h2 {background-color: black; color: white; }
```

Các nhà phát triển khác thích đặt mọi thứ lên dòng mới:

```css
.box {
  background-color: #567895;
}

h2 {
  background-color: black;
  color: white;
}
```

CSS không quan tâm bạn sử dụng cái nào. Cá nhân chúng tôi thấy dễ đọc hơn khi có mỗi cặp thuộc tính và giá trị trên một dòng mới.

### Ghi chú CSS của bạn

Thêm ghi chú vào CSS của bạn sẽ giúp bất kỳ nhà phát triển nào trong tương lai làm việc với tệp CSS của bạn, nhưng cũng sẽ giúp bạn khi bạn quay lại dự án sau một thời gian nghỉ.

```css
/* This is a CSS comment
It can be broken onto multiple lines. */
```

Một mẹo hay là thêm một khối ghi chú giữa các phần logic trong stylesheet của bạn, để giúp định vị các phần khác nhau nhanh chóng khi quét qua, hoặc thậm chí để cung cấp cho bạn thứ gì đó để tìm kiếm để nhảy ngay vào phần đó của CSS. Nếu bạn sử dụng chuỗi không xuất hiện trong mã, bạn có thể nhảy từ phần này sang phần khác bằng cách tìm kiếm nó — bên dưới chúng ta đã sử dụng `||`.

```css
/* || General styles */

/* … */

/* || Typography */

/* … */

/* || Header and Main Navigation */

/* … */
```

Bạn không cần phải ghi chú mọi thứ trong CSS, vì phần lớn sẽ tự giải thích. Những gì bạn nên ghi chú là những điều bạn đã đưa ra quyết định cụ thể vì một lý do.

Bạn có thể đã sử dụng thuộc tính CSS theo cách cụ thể để giải quyết sự không tương thích của trình duyệt cũ, ví dụ:

```css
.box {
  background-color: red; /* fallback for older browsers that don't support gradients */
  background-image: linear-gradient(to right, red, #aa0000);
}
```

Có thể bạn đã theo một hướng dẫn để đạt được điều gì đó, và CSS không tự giải thích hoặc nhận ra được lắm. Trong trường hợp đó, bạn có thể thêm URL của hướng dẫn vào ghi chú. Bạn sẽ cảm ơn chính mình khi bạn quay lại dự án này sau một năm hoặc lâu hơn và có thể nhớ mờ nhạt rằng có một hướng dẫn tuyệt vời về điều đó, nhưng không thể nhớ nó từ đâu.

### Tạo các phần logic trong stylesheet của bạn

Đây là ý tưởng tốt khi có tất cả các kiểu chung đầu tiên trong stylesheet. Điều này có nghĩa là tất cả các kiểu thường áp dụng trừ khi bạn làm điều gì đó đặc biệt với phần tử đó. Bạn thường sẽ có các quy tắc được thiết lập cho:

- `body`
- `p`
- `h1`, `h2`, `h3`, `h4`, `h5`
- `ul` và `ol`
- Các thuộc tính `table`
- Liên kết

Trong phần này của stylesheet, chúng ta cung cấp tạo kiểu mặc định cho kiểu chữ trên trang, thiết lập kiểu mặc định cho bảng dữ liệu và danh sách, v.v.

```css
/* || GENERAL STYLES */

body {
  /* … */
}

h1,
h2,
h3,
h4 {
  /* … */
}

ul {
  /* … */
}

blockquote {
  /* … */
}
```

Sau phần này, chúng ta có thể xác định một vài lớp tiện ích, ví dụ, lớp xóa kiểu danh sách mặc định cho các danh sách chúng ta sẽ hiển thị dưới dạng flex items hoặc theo cách nào đó khác. Nếu bạn có một vài lựa chọn tạo kiểu mà bạn biết bạn sẽ muốn áp dụng cho nhiều phần tử khác nhau, chúng có thể được đặt trong phần này.

```css
/* || UTILITIES */

.no-bullets {
  list-style: none;
  margin: 0;
  padding: 0;
}

/* … */
```

Sau đó chúng ta có thể thêm mọi thứ được sử dụng trên toàn trang. Đó có thể là những thứ như bố cục trang cơ bản, header, kiểu điều hướng, v.v.

```css
/* SITEWIDE */

.main-nav {
  /* … */
}

.logo {
  /* … */
}
```

Cuối cùng, chúng ta sẽ bao gồm CSS cho các thứ cụ thể, được phân chia theo ngữ cảnh, trang, hoặc thậm chí thành phần mà chúng được sử dụng.

```css
/* || STORE PAGES */

.product-listing {
  /* … */
}

.product-box {
  /* … */
}
```

Bằng cách sắp xếp mọi thứ theo cách này, chúng ta ít nhất có ý tưởng về phần nào của stylesheet chúng ta sẽ tìm kiếm thứ gì đó chúng ta muốn thay đổi.

### Tránh các bộ chọn quá cụ thể

Nếu bạn tạo các bộ chọn rất cụ thể, bạn thường sẽ thấy rằng bạn cần phải sao chép các đoạn CSS để áp dụng cùng quy tắc cho một phần tử khác. Ví dụ, bạn có thể có thứ gì đó như bộ chọn bên dưới, áp dụng quy tắc cho một `<p>` có lớp `box` bên trong `<article>` có lớp `main`.

```css
article.main p.box {
  border: 1px solid #cccccc;
}
```

Nếu sau đó bạn muốn áp dụng cùng quy tắc cho thứ gì đó bên ngoài `main`, hoặc cho thứ gì đó khác ngoài `<p>`, bạn sẽ phải thêm bộ chọn khác vào các quy tắc này hoặc tạo một bộ quy tắc mới hoàn toàn. Thay vào đó, bạn có thể sử dụng bộ chọn `.box` để áp dụng quy tắc cho bất kỳ phần tử nào có lớp `box`:

```css
.box {
  border: 1px solid #cccccc;
}
```

Sẽ có những lúc làm cho thứ gì đó cụ thể hơn là có ý nghĩa; tuy nhiên, điều này thường là ngoại lệ hơn là thực hành thông thường.

### Chia các stylesheet lớn thành nhiều cái nhỏ hơn

Trong các trường hợp bạn có các kiểu rất khác nhau cho các phần khác biệt của trang, bạn có thể muốn có một stylesheet bao gồm tất cả các quy tắc toàn cục, cũng như một số stylesheet nhỏ hơn bao gồm các quy tắc cụ thể cần thiết cho những phần đó. Bạn có thể liên kết đến nhiều stylesheet từ một trang, và các quy tắc bình thường của cascade áp dụng, với các quy tắc trong stylesheet được liên kết sau đến sau các quy tắc trong stylesheet được liên kết trước.

Ví dụ, chúng ta có thể có một cửa hàng trực tuyến như một phần của trang, với nhiều CSS chỉ được sử dụng để tạo kiểu danh sách sản phẩm và biểu mẫu cần thiết cho cửa hàng. Sẽ có ý nghĩa khi có những thứ đó trong một stylesheet khác, chỉ được liên kết trên các trang cửa hàng.

Điều này có thể làm cho CSS của bạn dễ tổ chức hơn, và cũng có nghĩa là nếu nhiều người đang làm việc trên CSS, bạn sẽ có ít tình huống hơn khi hai người cần làm việc trên cùng stylesheet cùng một lúc, dẫn đến xung đột trong kiểm soát nguồn.

## Các công cụ khác có thể giúp ích

CSS không có nhiều tổ chức tích hợp sẵn; do đó, mức độ nhất quán trong CSS của bạn sẽ phần lớn phụ thuộc vào bạn. Cộng đồng web đã phát triển nhiều công cụ và cách tiếp cận khác nhau có thể giúp bạn quản lý các dự án CSS lớn hơn. Vì bạn có thể sẽ gặp những trợ giúp này khi làm việc với người khác, và vì chúng thường hữu ích nói chung, chúng ta đã bao gồm một hướng dẫn ngắn về một số trong số đó.

### Phương pháp luận CSS

Thay vì cần phải tự nghĩ ra các quy tắc viết CSS, bạn có thể hưởng lợi từ việc áp dụng một trong những cách tiếp cận đã được cộng đồng thiết kế và thử nghiệm trên nhiều dự án. Những phương pháp luận này về cơ bản là hướng dẫn lập trình CSS thực hiện cách tiếp cận rất có cấu trúc để viết và tổ chức CSS. Thông thường chúng có xu hướng hiển thị CSS dài dòng hơn bạn có thể viết nếu bạn viết và tối ưu hóa mỗi bộ chọn cho một bộ quy tắc tùy chỉnh cho dự án đó.

Tuy nhiên, bạn có được rất nhiều cấu trúc bằng cách áp dụng một. Vì nhiều hệ thống trong số này được sử dụng rộng rãi, các nhà phát triển khác có nhiều khả năng hiểu cách tiếp cận bạn đang sử dụng và có thể viết CSS của riêng họ theo cùng cách, thay vì phải tự tìm hiểu phương pháp luận cá nhân của bạn từ đầu.

#### OOCSS

Hầu hết các cách tiếp cận bạn sẽ gặp đều mang ơn khái niệm CSS Hướng đối tượng (OOCSS), một cách tiếp cận được phổ biến bởi [công việc của Nicole Sullivan](https://github.com/stubbornella/oocss/wiki). Ý tưởng cơ bản của OOCSS là tách CSS của bạn thành các đối tượng có thể tái sử dụng, có thể được sử dụng ở bất kỳ đâu bạn cần trên trang của mình. Ví dụ tiêu chuẩn của OOCSS là mẫu được mô tả là [Đối tượng Media](/en-US/docs/Web/CSS/How_to/Layout_cookbook/Media_objects). Đây là mẫu với hình ảnh, video hoặc phần tử khác kích thước cố định ở một bên, và nội dung linh hoạt ở bên kia. Đây là mẫu chúng ta thấy khắp nơi trên các trang web cho bình luận, danh sách, v.v.

Nếu bạn không thực hiện cách tiếp cận OOCSS, bạn có thể tạo CSS tùy chỉnh cho các vị trí khác nhau mà mẫu này được sử dụng, ví dụ, bằng cách tạo hai lớp, một gọi là `comment` với một loạt quy tắc cho các phần thành phần, và một gọi là `list-item` với hầu như cùng quy tắc như lớp `comment` ngoại trừ một số khác biệt nhỏ. Sự khác biệt giữa hai thành phần này là list-item có đường viền dưới cùng, và hình ảnh trong bình luận có đường viền trong khi hình ảnh list-item thì không.

```css
.comment {
  display: grid;
  grid-template-columns: 1fr 3fr;
}

.comment img {
  border: 1px solid grey;
}

.comment .content {
  font-size: 0.8rem;
}

.list-item {
  display: grid;
  grid-template-columns: 1fr 3fr;
  border-bottom: 1px solid grey;
}

.list-item .content {
  font-size: 0.8rem;
}
```

Trong OOCSS, bạn sẽ tạo một mẫu có tên `media` có tất cả CSS chung cho cả hai mẫu — lớp cơ sở cho những thứ thường có hình dạng của đối tượng media. Sau đó chúng ta sẽ thêm lớp bổ sung để xử lý những khác biệt nhỏ đó, từ đó mở rộng tạo kiểu đó theo những cách cụ thể.

```css
.media {
  display: grid;
  grid-template-columns: 1fr 3fr;
}

.media .content {
  font-size: 0.8rem;
}

.comment img {
  border: 1px solid grey;
}

.list-item {
  border-bottom: 1px solid grey;
}
```

Trong HTML của bạn, bình luận sẽ cần cả lớp `media` và `comment` được áp dụng:

```html
<div class="media comment">
  <img src="" alt="" />
  <div class="content"></div>
</div>
```

List-item sẽ có `media` và `list-item` được áp dụng:

```html
<ul>
  <li class="media list-item">
    <img src="" alt="" />
    <div class="content"></div>
  </li>
</ul>
```

Công việc mà Nicole Sullivan đã làm trong việc mô tả cách tiếp cận này và thúc đẩy nó có nghĩa là ngay cả những người không nghiêm túc theo dõi cách tiếp cận OOCSS ngày nay thường sẽ tái sử dụng CSS theo cách này — nó đã đi vào hiểu biết của chúng ta như một cách tốt để tiếp cận mọi thứ nói chung.

#### BEM

BEM là viết tắt của Block Element Modifier (Khối Phần tử Biến thể). Trong BEM, khối là một thực thể độc lập như nút, menu, hoặc logo. Phần tử là thứ gì đó như mục danh sách hoặc tiêu đề được gắn với khối mà nó ở trong. Biến thể là cờ trên khối hoặc phần tử thay đổi tạo kiểu hoặc hành vi. Bạn sẽ có thể nhận ra mã sử dụng BEM do việc sử dụng rộng rãi các dấu gạch ngang và gạch dưới trong các lớp CSS. Ví dụ, hãy xem các lớp được áp dụng cho HTML này từ trang về [Quy ước đặt tên BEM](https://getbem.com/naming/):

```html
<form class="form form--theme-xmas form--simple">
  <label class="label form__label" for="inputId"></label>
  <input class="form__input" type="text" id="inputId" />

  <input
    class="form__submit form__submit--disabled"
    type="submit"
    value="Submit" />
</form>
```

Các lớp bổ sung tương tự như những lớp được sử dụng trong ví dụ OOCSS; tuy nhiên, chúng sử dụng các quy ước đặt tên nghiêm ngặt của BEM.

BEM được sử dụng rộng rãi trong các dự án web lớn hơn và nhiều người viết CSS của họ theo cách này. Có khả năng bạn sẽ gặp các ví dụ, ngay cả trong các hướng dẫn, sử dụng cú pháp BEM, mà không đề cập tại sao CSS được cấu trúc như vậy.

Đọc thêm về hệ thống này [BEM 101](https://css-tricks.com/bem-101/) trên CSS Tricks.

#### Các hệ thống phổ biến khác

Có một số lượng lớn các hệ thống này đang được sử dụng. Các cách tiếp cận phổ biến khác bao gồm [Scalable and Modular Architecture for CSS (SMACSS)](https://smacss.com/), được tạo bởi Jonathan Snook, [ITCSS](https://itcss.io/) từ Harry Roberts, và [Atomizer CSS (ACSS)](https://acss-io.github.io/atomizer/), ban đầu được tạo bởi Yahoo!. Nếu bạn gặp một dự án sử dụng một trong những cách tiếp cận này, thì lợi thế là bạn sẽ có thể tìm kiếm và tìm nhiều bài viết và hướng dẫn để giúp bạn hiểu cách lập trình theo cùng phong cách.

Nhược điểm của việc sử dụng hệ thống như vậy là chúng có thể có vẻ quá phức tạp, đặc biệt đối với các dự án nhỏ hơn.

### Hệ thống build cho CSS

Một cách khác để tổ chức CSS là tận dụng một số công cụ có sẵn cho các nhà phát triển front-end, cho phép bạn thực hiện cách tiếp cận có tính lập trình hơn để viết CSS. Có một số công cụ, chúng ta gọi là _pre-processors_ và _post-processors_. Pre-processor chạy qua các tệp thô của bạn và biến chúng thành stylesheet, trong khi post-processor lấy stylesheet đã hoàn chỉnh của bạn và làm điều gì đó với nó — có thể là tối ưu hóa nó để tải nhanh hơn.

Sử dụng bất kỳ công cụ nào trong số này sẽ yêu cầu môi trường phát triển của bạn có thể chạy các script thực hiện việc xử lý trước và sau. Nhiều trình soạn thảo mã có thể làm điều này cho bạn, hoặc bạn có thể cài đặt các công cụ dòng lệnh để giúp đỡ.

Pre-processor phổ biến nhất là [Sass](https://sass-lang.com/). Đây không phải là hướng dẫn Sass, vì vậy tôi sẽ giải thích ngắn gọn một vài điều Sass có thể làm, thực sự hữu ích về mặt tổ chức ngay cả khi bạn không sử dụng bất kỳ tính năng Sass nào khác. Nếu bạn muốn học nhiều hơn về Sass, hãy bắt đầu với bài viết [Sass basics](https://sass-lang.com/guide/), sau đó chuyển sang tài liệu khác của họ.

#### Định nghĩa biến

CSS hiện có [thuộc tính tùy chỉnh](/en-US/docs/Web/CSS/Guides/Cascading_variables/Using_custom_properties) gốc, làm cho tính năng này ngày càng ít quan trọng hơn. Tuy nhiên, một trong những lý do bạn có thể sử dụng Sass là có thể định nghĩa tất cả các màu và phông chữ được sử dụng trong dự án như các cài đặt, sau đó sử dụng biến đó trong dự án. Điều này có nghĩa là nếu bạn nhận ra bạn đã sử dụng sai sắc xanh, bạn chỉ cần thay đổi nó ở một nơi.

Nếu chúng ta tạo một biến có tên `$base-color`, như trong dòng đầu tiên bên dưới, chúng ta sau đó có thể sử dụng nó trong stylesheet bất cứ đâu cần màu đó.

```scss
$base-color: #c6538c;

.alert {
  border: 1px solid $base-color;
}
```

Khi được biên dịch thành CSS, bạn sẽ có được CSS sau trong stylesheet cuối cùng.

```css
.alert {
  border: 1px solid #c6538c;
}
```

#### Biên dịch các stylesheet thành phần

Tôi đã đề cập ở trên rằng một cách để tổ chức CSS là chia nhỏ các stylesheet thành các stylesheet nhỏ hơn. Khi sử dụng Sass, bạn có thể đưa điều này lên một cấp độ khác và có nhiều stylesheet rất nhỏ — thậm chí đi xa đến việc có một stylesheet riêng cho mỗi thành phần. Bằng cách sử dụng chức năng được bao gồm trong Sass (partials), chúng có thể được biên dịch cùng nhau thành một hoặc một số lượng nhỏ stylesheet để thực sự liên kết vào trang web của bạn.

Vì vậy, ví dụ, với [partials](https://sass-lang.com/documentation/at-rules/use/#partials), bạn có thể có một số tệp kiểu bên trong thư mục, ví dụ `foundation/_code.scss`, `foundation/_lists.scss`, `foundation/_footer.scss`, `foundation/_links.scss`, v.v. Sau đó bạn có thể sử dụng quy tắc Sass `@use` để tải chúng vào các stylesheet khác:

```scss
// foundation/_index.scss
@use "code";
@use "lists";
@use "footer";
@use "links";
```

Nếu các partial được tải vào tệp index, như ngụ ý ở trên, bạn có thể tải toàn bộ thư mục đó vào một stylesheet khác trong một lần:

```scss
// style.scss
@use "foundation";
```

> [!NOTE]
> Một cách đơn giản để thử Sass là sử dụng [CodePen](https://codepen.io/) — bạn có thể bật Sass cho CSS của mình trong Settings của Pen, và CodePen sau đó sẽ chạy trình phân tích Sass cho bạn để bạn có thể xem trang web kết quả với CSS thông thường được áp dụng. Đôi khi bạn sẽ thấy các hướng dẫn CSS đã sử dụng Sass thay vì CSS thuần trong các bản demo CodePen của họ, vì vậy sẽ tiện khi biết một chút về nó.

#### Xử lý sau để tối ưu hóa

Nếu bạn lo ngại về việc thêm kích thước vào stylesheet của bạn, ví dụ, bằng cách thêm nhiều ghi chú và khoảng trắng bổ sung, thì một bước xử lý sau có thể là tối ưu hóa CSS bằng cách loại bỏ bất cứ điều gì không cần thiết trong phiên bản sản xuất. Một ví dụ về giải pháp post-processor để làm điều này là [cssnano](https://cssnano.github.io/cssnano/).
