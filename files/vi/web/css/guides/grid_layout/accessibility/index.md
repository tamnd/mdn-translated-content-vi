---
title: Grid layout and accessibility
slug: Web/CSS/Guides/Grid_layout/Accessibility
page-type: guide
sidebar: cssref
---

HTML là tầng nội dung của một trang web, nơi chúng ta tạo ra các tài liệu ngữ nghĩa, có cấu trúc tốt. CSS là tầng trình bày; chúng ta áp dụng CSS để tạo ra, trong số những thứ khác, layout mong muốn cho nội dung. Các cấu trúc grid hai chiều được định nghĩa bằng [CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout).

Mặc dù HTML và CSS hiện đại được thiết kế để cho phép tạo nội dung và thiết kế ngữ nghĩa, dễ tiếp cận, nhưng vẫn có những cách _tạo ra_ vấn đề accessibility với grid. Bài viết này xem xét các vấn đề tiềm năng có thể phát sinh và cách tránh chúng.

## Sắp xếp lại nội dung trong CSS grid layout

Trong các hướng dẫn này, chúng ta đã thấy rằng CSS grid layout cho phép sắp xếp lại nội dung trang bằng cách định vị các mục sử dụng [line-based placement của grid template areas](/en-US/docs/Web/CSS/Guides/Grid_layout/Line-based_placement). Việc định vị này có thể thực hiện mà không cần xem xét vị trí của mục trong nguồn. Ngoài ra còn có thuộc tính {{cssxref("order")}}, có thể thay đổi cách các mục được tự động đặt. Thuộc tính {{cssxref("grid-auto-flow")}} có giá trị `dense`, có thể đưa các mục ra khỏi thứ tự DOM về mặt trực quan.

Đặc tả CSS grid layout bao gồm phần [Reordering and Accessibility](https://drafts.csswg.org/css-grid/#order-accessibility). Phần giới thiệu của phần đó trình bày chi tiết những gì trình duyệt nên làm khi nội dung được sắp xếp lại trực quan bằng grid layout:

> Grid layout cung cấp cho các tác giả quyền hạn lớn trong việc sắp xếp lại tài liệu. Tuy nhiên, đây không phải là sự thay thế cho việc sắp xếp đúng thứ tự nguồn tài liệu. Thuộc tính `order` và grid placement không ảnh hưởng đến thứ tự trong các phương tiện phi trực quan (chẳng hạn như giọng nói). Tương tự, sắp xếp lại các grid item trực quan không ảnh hưởng đến thứ tự duyệt mặc định của các chế độ điều hướng tuần tự (chẳng hạn như chu kỳ qua các liên kết, xem ví dụ [`tabindex`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex)).

Nếu bạn sắp xếp lại các thứ trực quan bằng grid layout, điều đó sẽ không thay đổi cách các mục được đọc bởi screen reader hay user agent chuyển văn bản thành giọng nói. Ngoài ra, việc sắp xếp lại sẽ không thay đổi thứ tự tab. Điều này có nghĩa là người điều hướng bằng bàn phím có thể đang tab qua các liên kết trên trang của bạn và đột nhiên thấy mình nhảy từ đầu đến cuối tài liệu do một mục được sắp xếp lại là mục tiếp theo trong thứ tự tab.

Đặc tả cảnh báo các tác giả (thuật ngữ của CSSWG cho các nhà phát triển web) không nên thực hiện việc sắp xếp lại này.

> Các tác giả chỉ được sử dụng `order` và các thuộc tính grid-placement cho việc sắp xếp lại trực quan, không phải logic, của nội dung. Các style sheet sử dụng các tính năng này để thực hiện sắp xếp lại logic là không tuân thủ.

Điều này có nghĩa gì trong thực tế khi thiết kế với grid layout?

### Sắp xếp lại trực quan, không phải logic

Bất cứ khi nào bạn sắp xếp lại mọi thứ với grid layout – hoặc với flexbox – bạn chỉ thực hiện _sắp xếp lại trực quan_. Nguồn cơ bản là thứ kiểm soát những thứ như chuyển văn bản thành giọng nói, và thứ tự tab của tài liệu. Chúng ta có thể thấy cách thức hoạt động của điều này qua một ví dụ.

Trong ví dụ này, chúng ta có một grid chứa năm mục, mỗi mục chứa một liên kết. Các mục được đặt với các thuộc tính line-based placement. Chúng ta đã định vị hộp 1 trên hàng thứ hai của grid nên nó xuất hiện trực quan như mục thứ tư trong danh sách. Nếu chúng ta điều hướng qua các liên kết bằng phím tab, thứ tự tab vẫn bắt đầu với hộp 1, vì nó đứng đầu tiên trong nguồn.

```css hidden
* {
  box-sizing: border-box;
}

.wrapper {
  border: 2px solid #f76707;
  border-radius: 5px;
  background-color: #fff4e6;
}

.wrapper > div {
  border: 2px solid #ffa94d;
  border-radius: 5px;
  background-color: #ffd8a8;
  padding: 1em;
  color: #d9480f;
}
```

```css
.wrapper {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-auto-rows: 100px;
}

.box1 {
  grid-column: 1;
  grid-row: 2;
}
```

```html
<div class="wrapper">
  <div class="box box1"><a href="">One</a></div>
  <div class="box box2"><a href="">Two</a></div>
  <div class="box box3"><a href="">Three</a></div>
  <div class="box box4"><a href="">Four</a></div>
  <div class="box box5"><a href="">Five</a></div>
</div>
```

{{ EmbedLiveSample('Visual_not_logical_re-ordering', '500', '230') }}

Đặc tả nói rằng trong trường hợp này, nếu hộp 1 thực sự có ý nghĩa logic ở vị trí đó, chúng ta nên quay lại nguồn HTML và thực hiện thay đổi ở đó thay vì sắp xếp lại bằng grid layout. Đây là ý nghĩa của sắp xếp lại trực quan so với logic; sắp xếp lại logic quan trọng đối với ý nghĩa và cấu trúc của tài liệu và chúng ta cần đảm bảo rằng chúng ta duy trì cấu trúc đó.

## Chúng ta nên tiếp cận accessibility như thế nào với grid layout?

Từ đặc tả, chúng ta biết rằng cần đảm bảo tài liệu của mình duy trì thứ tự logic của nội dung. Làm thế nào chúng ta nên tiếp cận phát triển để đảm bảo rằng chúng ta duy trì accessibility cho những người dùng khác nhau và các cách họ tương tác với các trang của chúng ta?

- Bắt đầu với một tài liệu có cấu trúc và dễ tiếp cận
  - : Một grid layout nên có nghĩa là chúng ta không cần thay đổi nguồn tài liệu để có được layout mong muốn. Do đó, điểm khởi đầu của trang phải là một tài liệu nguồn có cấu trúc tốt và dễ tiếp cận. Điều này thường sẽ cung cấp cho bạn một cấu trúc tốt cho _các thiết bị màn hình nhỏ nhất của bạn_. Nếu người dùng đang cuộn qua một tài liệu dài trên điện thoại, các ưu tiên cho người dùng đó thường phản ánh những gì nên là ưu tiên trong nguồn.
- Tạo một grid responsive và có trách nhiệm
  - : Với cấu trúc tài liệu vững chắc được định nghĩa trong HTML, bạn có thể sử dụng CSS để thêm layout lên trên. Bạn có thể sẽ sử dụng [media queries](/en-US/docs/Web/CSS/Guides/Media_queries) để thực hiện các thay đổi cho các kích thước màn hình và thiết bị khác nhau, bao gồm tạo thêm cột cho màn hình lớn hơn. Grid có thể rất hữu ích ở đây. Ví dụ, các phần tử được giảm ưu tiên trong thứ tự nguồn mobile có thể được chuyển vào sidebar trong layout desktop. Điều quan trọng ở đây là tiếp tục kiểm tra. Một bài kiểm tra tốt là _tab xung quanh tài liệu_. Thứ tự có còn hợp lý không? Kiểm tra xem bạn có bị nhảy từ đầu đến cuối layout theo cách kỳ lạ không. Đó là dấu hiệu bạn cần giải quyết điều gì đó về layout.
- Quay lại nguồn
  - : Nếu bất cứ lúc nào trong quá trình thiết kế bạn thấy mình sử dụng grid để di chuyển vị trí của một phần tử, hãy xem xét liệu bạn có nên quay lại tài liệu và thực hiện thay đổi theo thứ tự logic không. Điều tốt đẹp về việc sử dụng CSS grid layout là bạn có thể di chuyển một mục trong nguồn để khớp với thứ tự logic mà không cần thực hiện các thay đổi lớn đối với layout. Trách nhiệm thuộc về chúng ta với tư cách là nhà phát triển để nhớ quay lại nguồn và cập nhật nó để duy trì thứ tự logic.

## Grid và nguy cơ làm phẳng markup

Một vấn đề khác cần lưu ý trong CSS grid layout và ở mức độ thấp hơn trong CSS flexbox, là sự cám dỗ _làm phẳng_ markup. Như chúng ta đã khám phá, để một mục trở thành grid item, nó cần là con trực tiếp của grid container. Do đó, nơi bạn có phần tử {{HTMLElement("ul")}} bên trong grid container, _chính_ `ul` đó trở thành grid item – các phần tử con {{HTMLElement("li")}} thì không.

Giá trị [`subgrid`](/en-US/docs/Web/CSS/Guides/Grid_layout/Subgrid) của `grid-template-columns` và `grid-template-rows` giải quyết vấn đề này. Nó cho phép grid được kế thừa bởi các grid item và truyền xuống cây. Ngoài ra, đặt `display: contents` trên một grid item làm cho các phần tử con của phần tử đó trở thành grid item. Nếu bạn đặt một mục thành `display: contents`, hộp mà nó thường tạo ra sẽ biến mất và các hộp của các phần tử con xuất hiện như thể chúng đã tăng lên một cấp.

Bắt đầu với một tài liệu có cấu trúc tốt là một cách rất tốt để tránh các vấn đề accessibility.

## Xem thêm

- [Flexbox & the keyboard navigation disconnect](https://tink.uk/flexbox-the-keyboard-navigation-disconnect/) and [(Human After All): Accessibility remix video](https://www.youtube.com/watch?v=spxT2CmHoPk) via Léonie Watson (2016)
- [Grid, content re-ordering and accessibility](https://css-tricks.com/grid-content-re-ordering-and-accessibility/) via CSS-tricks (2019)
- [`display: contents` is not a CSS reset](https://adrianroselli.com/2018/05/display-contents-is-not-a-css-reset.html) via Adrian Roselli (2024)
