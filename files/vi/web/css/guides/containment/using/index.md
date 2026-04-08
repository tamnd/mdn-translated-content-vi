---
title: Using CSS containment
short-title: Using containment
slug: Web/CSS/Guides/Containment/Using
page-type: guide
sidebar: cssref
---

CSS containment cải thiện hiệu suất của các trang web bằng cách cho phép trình duyệt cô lập một subtree của trang khỏi phần còn lại của trang. Nếu trình duyệt biết rằng một phần của trang độc lập với phần còn lại của nội dung, việc render có thể được tối ưu hóa và hiệu suất được cải thiện.

Các thuộc tính {{cssxref("contain")}} và {{cssxref("content-visibility")}} cho phép các nhà phát triển thông báo cho user agents liệu một phần tử có nên render nội dung của nó hay không, và liệu nó có nên render nội dung của mình khi nó nằm ngoài màn hình hay không. User agent sau đó áp dụng containment cho các phần tử khi thích hợp, có khả năng trì hoãn layout và rendering cho đến khi cần thiết.

Hướng dẫn này mô tả các mục tiêu cơ bản của CSS containment và cách tận dụng `contain` và `content-visibility` để có trải nghiệm người dùng tốt hơn.

## Ví dụ cơ bản

Các trang web thường chứa nhiều phần về mặt logic độc lập với nhau. CSS containment cho phép chúng được coi là thực sự độc lập với nhau khi render.

Ví dụ, các blog thường chứa nhiều bài viết, mỗi bài có tiêu đề và nội dung, như trong markup dưới đây.

```html
<h1>My blog</h1>
<article>
  <h2>Heading of a nice article</h2>
  <p>Content here.</p>
</article>
<article>
  <h2>Another heading of another article</h2>
  <p>More content here.</p>
</article>
```

Với CSS, chúng ta áp dụng thuộc tính {{cssxref("contain")}} với giá trị `content` cho mỗi article. Giá trị `content` là viết tắt của `contain: layout paint style`:

```css
article {
  contain: content;
}
```

Về mặt logic, mỗi article độc lập với các article khác trên trang. Thông tin này thường được biết và có thể khá rõ ràng đối với nhà phát triển web tạo trang.
Tuy nhiên, trình duyệt không biết ý định của nội dung của bạn và không thể giả định rằng một article hoặc phần nội dung khác sẽ hoàn toàn tự chứa.

Thuộc tính này cung cấp một cách để giải thích điều này cho trình duyệt và cho nó phép rõ ràng để thực hiện các tối ưu hóa hiệu suất.
Nó cho trình duyệt biết rằng layout nội bộ của phần tử hoàn toàn tách biệt với phần còn lại của trang, và mọi thứ về phần tử đều được vẽ bên trong ranh giới của nó. Không có gì có thể overflow nhìn thấy được.

Bằng cách đặt `contain: content` trên mỗi `<article>` chúng ta đã chỉ ra điều này; chúng ta đã nói với trình duyệt rằng mỗi article là độc lập. Trình duyệt có thể sử dụng thông tin này để đưa ra quyết định về cách render mỗi `<article>` nội dung. Ví dụ, nó có thể không render các article nằm ngoài vùng có thể xem.

Khi các article bổ sung được thêm vào cuối trang, trình duyệt không cần tính toán lại layout hay repaint nội dung trước đó; nó cũng không cần chạm vào bất kỳ khu vực nào bên ngoài subtree của phần tử chứa. Tuy nhiên, nếu các thuộc tính box model phụ thuộc, trình duyệt sẽ cần tính toán lại layout và repaint. Ví dụ, nếu `<article>` được tạo kiểu sao cho kích thước của nó phụ thuộc vào nội dung của nó (ví dụ: với `height: auto`), thì trình duyệt sẽ cần tính đến sự thay đổi kích thước của nó.

## Các khái niệm và thuật ngữ chính

### Các giá trị `contain`

Có bốn loại containment: layout, paint, size, và style. Sử dụng thuộc tính {{cssxref("contain")}} để chỉ định loại hoặc các loại bạn muốn áp dụng cho một phần tử bằng cách bao gồm bất kỳ kết hợp nào của các loại này.

#### Layout containment

```css
article {
  contain: layout;
}
```

Layout thường được áp dụng trên toàn bộ tài liệu, có nghĩa là nếu bạn di chuyển một phần tử, toàn bộ tài liệu cần được coi như mọi thứ có thể đã di chuyển bất cứ đâu. Bằng cách sử dụng `contain: layout` bạn có thể nói với trình duyệt rằng nó chỉ cần kiểm tra phần tử này — mọi thứ bên trong phần tử đều thuộc phạm vi của phần tử đó và không ảnh hưởng đến phần còn lại của trang, với hộp chứa thiết lập một [formatting context](/en-US/docs/Web/CSS/Guides/Display/Formatting_contexts) độc lập.

Ngoài ra:

- {{cssxref("float")}} layout sẽ được thực hiện độc lập bên trong phần tử được chỉ định.
- Margins sẽ không collapse qua layout containment boundary.
- Layout container là một [containing block](/en-US/docs/Web/CSS/Guides/Display/Containing_block) cho các phần tử con được positioned `absolute` và `fixed`.
- Hộp chứa tạo một [stacking context](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context), do đó {{cssxref("z-index")}} có thể được sử dụng.

> [!NOTE]
> Các giá trị `style` và `layout` của `contain` được tự động áp dụng khi sử dụng các thuộc tính {{cssxref("container-type")}} và {{cssxref("container-name")}}.

#### Paint containment

```css
article {
  contain: paint;
}
```

Paint containment về cơ bản clip hộp đến padding edge của [principal box](/en-US/docs/Web/CSS/Guides/Display/Visual_formatting_model#the_principal_box). Không có overflow nhìn thấy được. Các lưu ý bổ sung tương tự cũng đúng với `paint` containment như `layout` containment (xem ở trên).

Một ưu điểm khác là nếu phần tử được áp dụng containment nằm ngoài màn hình, trình duyệt không cần paint các phần tử con của nó — chúng cũng nằm ngoài màn hình vì chúng được chứa hoàn toàn bởi hộp đó.

#### Size containment

```css
article {
  contain: size;
}
```

Size containment không mang lại nhiều tối ưu hóa hiệu suất khi được sử dụng đơn lẻ. Tuy nhiên, size containment có nghĩa là kích thước của các phần tử con của phần tử có size containment không thể ảnh hưởng đến kích thước của chính phần tử đó — kích thước của nó được tính toán như thể nó không có phần tử con.

Nếu bạn đặt `contain: size` trên một phần tử, bạn cần chỉ định kích thước của phần tử bằng cách sử dụng {{cssxref("contain-intrinsic-size")}}, hoặc các longhand properties {{cssxref("contain-intrinsic-width")}} và {{cssxref("contain-intrinsic-height")}}, theo thứ tự đó. Nếu không có kích thước nào được đặt, phần tử có nguy cơ bị kích thước zero trong hầu hết các trường hợp.

```css
article {
  contain: size;
  contain-intrinsic-size: 100vw auto none;
}
```

#### Style containment

```css
article {
  contain: style;
}
```

Mặc dù có tên như vậy, style containment không cung cấp scoped styles như bạn sẽ nhận được với [Shadow DOM](/en-US/docs/Web/API/Web_components/Using_shadow_DOM) hoặc {{cssxref("@scope")}}.
Trường hợp sử dụng chính cho giá trị `style` là ngăn các tình huống trong đó một [CSS counter](/en-US/docs/Web/CSS/Guides/Counter_styles/Using_counters) có thể bị thay đổi trong một phần tử, điều này có thể ảnh hưởng đến phần còn lại của tree.

Sử dụng `contain: style` đảm bảo các thuộc tính {{cssxref("counter-increment")}} và {{cssxref("counter-set")}} tạo ra các counters mới được giới hạn trong phạm vi subtree đó.

Bạn có thể bao gồm nhiều hơn một loại containment bằng cách bao gồm nhiều giá trị được phân tách bằng dấu cách, chẳng hạn như `contain: layout paint` hoặc bằng cách sử dụng một trong hai [giá trị đặc biệt](#special_values).

#### Giá trị đặc biệt

Có hai giá trị đặc biệt của `contain` là viết tắt cho ba loại đầu tiên hoặc tất cả bốn loại containment:

- `content`
- `strict`

Chúng ta đã gặp cái đầu tiên trong ví dụ ở trên. Sử dụng `contain: content` bật `layout`, `paint`, và `style` containment. Vì nó bỏ qua `size`, đây là giá trị an toàn để áp dụng rộng rãi.

Khai báo `contain: strict`, hoạt động giống như khai báo `contain: size layout paint style` (bao gồm bốn giá trị được phân tách bằng dấu cách), cung cấp containment nhiều nhất. Nó rủi ro hơn khi sử dụng vì nó áp dụng `size` containment; rủi ro tồn tại là một hộp có thể bị kích thước zero do phụ thuộc vào kích thước của các phần tử con của nó.

Để loại bỏ rủi ro này, hãy luôn đặt kích thước khi sử dụng `strict`:

```css
article {
  contain: strict;
  contain-intrinsic-size: 80vw auto none;
}
```

Đoạn trên tương đương với:

```css
article {
  contain: size layout paint style;
  contain-intrinsic-size: 80vw auto none;
}
```

### `content-visibility`

Khi bạn có nhiều nội dung sẽ được hưởng lợi từ containment nặng mà thường nằm ngoài màn hình — ví dụ nếu tất cả các bài đăng blog của bạn có thể xem được trên trang chủ blog như một blog cuộn vô tận — `content-visibility: auto` có thể được sử dụng để áp dụng tất cả các containments cùng một lúc.

Thuộc tính {{cssxref("content-visibility")}} kiểm soát liệu một phần tử có render nội dung của nó hay không, cùng với việc buộc một tập hợp containments mạnh, cho phép user agents bỏ qua các phần lớn công việc layout và rendering cho đến khi cần thiết. Nó cho phép user agent bỏ qua công việc rendering của phần tử (bao gồm layout và painting) cho đến khi cần thiết — điều này làm cho quá trình tải trang ban đầu nhanh hơn nhiều.

Các giá trị có thể của nó là:

- `visible`: Hành vi mặc định — nội dung của phần tử được layout và render như bình thường.
- `hidden`: Phần tử [bỏ qua nội dung của nó](#skips_its_contents). Nội dung bị bỏ qua sẽ không thể truy cập được bởi các tính năng user agent như find-in-page, điều hướng tab-order, v.v., cũng không thể chọn hoặc focusable.
- `auto`: Phần tử bật layout containment, style containment, và paint containment, như thể `contain: content` được đặt. Nếu phần tử không [liên quan đến người dùng](#relevant_to_the_user), nó cũng bỏ qua nội dung của mình. Không giống như `hidden`, nội dung bị bỏ qua vẫn có thể được sử dụng cho các tương tác người dùng, vẫn có thể focusable, selectable, trong tab order thông thường, và có thể tìm kiếm trong nội dung.

### Liên quan đến người dùng

User-agents có khái niệm về nội dung [liên quan đến người dùng](https://drafts.csswg.org/css-contain/#relevant-to-the-user). Một phần tử trở nên "liên quan đến người dùng" nếu bất kỳ điều nào sau đây là đúng:

- Phần tử xuất hiện trong viewport, hoặc một khoảng margin do user-agent định nghĩa xung quanh viewport (50% kích thước viewport, để cung cấp cho ứng dụng thời gian chuẩn bị khi khả năng hiển thị phần tử thay đổi).
- Phần tử hoặc nội dung của nó nhận focus.
- Phần tử hoặc nội dung của nó được chọn, ví dụ bằng cách kéo qua văn bản bằng con trỏ chuột hoặc bằng một số thao tác highlight khác.
- Phần tử hoặc nội dung của nó được đặt trong {{glossary("top layer")}}.

Khi `content-visibility: auto` được đặt, và trình duyệt xác định rằng nội dung liên quan đến người dùng, trình duyệt sẽ render nội dung đó.

### Bỏ qua nội dung của nó

Khi bạn đặt `content-visibility: hidden` trên một phần tử, bạn đang nói với trình duyệt rằng nó không liên quan đến người dùng, và do đó [nội dung của nó nên bị bỏ qua](https://drafts.csswg.org/css-contain/#skips-its-contents) và không được render. Điều này giúp cải thiện hiệu suất.

Trình duyệt cũng sẽ bỏ qua nội dung của phần tử khi `content-visibility: auto` được đặt trên nó, và trình duyệt xác định rằng nội dung của nó _không_ liên quan đến người dùng.

Khi một phần tử bỏ qua nội dung của nó:

- Nó có layout, style, paint, và size containment được bật.
- Nội dung của nó không được paint, như thể {{cssxref("visibility", "visibility: hidden")}} được đặt trên nó.
- Nội dung của nó không nhận pointer events, như thể {{cssxref("pointer-events", "pointer-events: none")}} được đặt trên nó.

Điều này xảy ra trong cả hai trường hợp được đề cập ở trên, nhưng với `content-visibility: auto` nội dung có thể được tìm kiếm, nhận focus, và nói chung chuyển từ không liên quan sang liên quan. Điều này không phải là trường hợp với `content-visibility: hidden`.

> [!NOTE]
> Để animate chuyển đổi từ `content-visibility: hidden` sang một giá trị visible, bạn sẽ cần đặt {{cssxref("transition-behavior", "transition-behavior:&nbsp;allow-discrete")}} và các kiểu dáng {{cssxref("@starting-style")}}. Xem [transitioning `display` và `content-visibility`](/en-US/docs/Web/CSS/Guides/Transitions/Using#transitioning_display_and_content-visibility) để tìm hiểu thêm.

## Xem thêm

- [CSS containment module](/en-US/docs/Web/CSS/Guides/Containment)
- [Learn: CSS performance optimization](/en-US/docs/Learn_web_development/Extensions/Performance/CSS)
- [CSS container queries](/en-US/docs/Web/CSS/Guides/Containment/Container_queries)
- [An Introduction to CSS Containment](https://blogs.igalia.com/mrego/2019/01/11/an-introduction-to-css-containment/) via Igalia.com (2019)
- Sự kiện {{domxref("element/contentvisibilityautostatechange_event", "contentvisibilityautostatechange")}}
