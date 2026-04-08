---
title: Introduction to the CSS cascade
short-title: Introduction
slug: Web/CSS/Guides/Cascade/Introduction
page-type: guide
spec-urls: https://drafts.csswg.org/css-cascade/
sidebar: cssref
---

**Cascade** là một thuật toán định nghĩa cách user agent kết hợp các giá trị thuộc tính có nguồn gốc từ các nguồn khác nhau. Cascade định nghĩa origin và layer nào được ưu tiên khi các khai báo trong nhiều hơn một [origin](#origin_types), [cascade layer](/en-US/docs/Web/CSS/Reference/At-rules/@layer), hoặc block {{CSSxRef("@scope")}} đặt giá trị cho một thuộc tính trên một phần tử.

Cascade nằm ở cốt lõi của CSS, như được nhấn mạnh bởi tên gọi: _**Cascading**_ Style Sheets. Khi một [selector](/en-US/docs/Web/CSS/Guides/Selectors) khớp với một phần tử, giá trị thuộc tính từ origin có độ ưu tiên cao nhất sẽ được áp dụng, ngay cả khi selector từ origin hoặc layer có độ ưu tiên thấp hơn có [specificity](/en-US/docs/Web/CSS/Guides/Cascade/Specificity) cao hơn.

Bài viết này giải thích cascade là gì và thứ tự mà các [khai báo](/en-US/docs/Web/API/CSSStyleDeclaration) {{Glossary("CSS")}} được cascade, bao gồm cascade layers và kiểu origin. Hiểu về độ ưu tiên của origin là chìa khóa để hiểu cascade.

## Các kiểu origin

Nhiệm vụ của thuật toán CSS cascade là chọn các khai báo CSS để xác định các giá trị đúng cho các thuộc tính CSS. Các khai báo CSS đến từ các kiểu origin khác nhau: **[User-agent stylesheets](#user-agent_stylesheets)**, **[Author stylesheets](#author_stylesheets)**, và **[User stylesheets](#user_stylesheets)**.

Mặc dù các stylesheet đến từ các origin khác nhau này và có thể nằm trong các [layer](/en-US/docs/Web/CSS/Reference/At-rules/@layer) khác nhau trong mỗi origin này, chúng chồng lên nhau về phạm vi mặc định; để làm cho điều này hoạt động, thuật toán cascade định nghĩa cách chúng tương tác. Trước khi đề cập đến các tương tác, chúng ta sẽ định nghĩa một số thuật ngữ chính trong các phần tiếp theo.

### User-agent stylesheets

User-agent, hay trình duyệt, có các stylesheet cơ bản cung cấp style mặc định cho bất kỳ tài liệu nào. Các stylesheet này được gọi là **user-agent stylesheets**. Hầu hết các trình duyệt sử dụng các stylesheet thực tế cho mục đích này, trong khi một số trình duyệt khác mô phỏng chúng bằng code. Kết quả cuối cùng là như nhau.

Một số trình duyệt cho phép người dùng chỉnh sửa user-agent stylesheet, nhưng điều này hiếm gặp và không thể kiểm soát được.

Mặc dù một số ràng buộc về user-agent stylesheet được đặt ra bởi thông số HTML, các trình duyệt có nhiều quyền tự do: điều đó có nghĩa là một số khác biệt tồn tại giữa các trình duyệt. Để đơn giản hóa quá trình phát triển, các web developer có thể sử dụng CSS reset stylesheet, chẳng hạn như [normalize.css](https://github.com/necolas/normalize.css), đặt các giá trị thuộc tính phổ biến về trạng thái đã biết cho tất cả các trình duyệt trước khi bắt đầu thực hiện các thay đổi phù hợp với nhu cầu cụ thể của họ.

Trừ khi user-agent stylesheet bao gồm [`!important`](/en-US/docs/Web/CSS/Guides/Cascade/Specificity#the_!important_exception) bên cạnh một thuộc tính, làm cho nó "important", các style được khai báo bởi author styles, bao gồm cả reset stylesheet, sẽ được ưu tiên hơn user-agent styles, bất kể specificity của selector liên quan.

### Author stylesheets

**Author stylesheets** là loại stylesheet phổ biến nhất; đây là các style được viết bởi các web developer. Các style này có thể reset user-agent styles, như đã lưu ý ở trên, và định nghĩa các style cho thiết kế của một trang web hoặc ứng dụng nhất định. Tác giả, hay web developer, định nghĩa các style cho tài liệu bằng cách sử dụng một hoặc nhiều stylesheet được liên kết hoặc import, các block {{HTMLElement('style')}}, và inline styles được định nghĩa bằng thuộc tính [`style`](/en-US/docs/Web/HTML/Reference/Global_attributes/style). Các author styles này định nghĩa giao diện và cảm giác của website — theme của nó.

### User stylesheets

Trong hầu hết các trình duyệt, người dùng (hay người đọc) của website có thể chọn ghi đè các style bằng cách sử dụng **user stylesheet** tùy chỉnh được thiết kế để điều chỉnh trải nghiệm theo mong muốn của người dùng. Tùy thuộc vào user agent, [user styles có thể được cấu hình](https://www.thoughtco.com/user-style-sheet-3469931) trực tiếp hoặc được thêm qua các tiện ích mở rộng trình duyệt.

### Cascade layers

Thứ tự cascade dựa trên kiểu origin. Cascade trong mỗi kiểu origin dựa trên thứ tự khai báo của [cascade layers](/en-US/docs/Web/CSS/Reference/At-rules/@layer) trong kiểu đó. Đối với tất cả origins — user-agent, author hoặc user — các style có thể được khai báo trong hoặc ngoài các named hoặc anonymous layer. Khi được khai báo bằng cách sử dụng [`layer`, `layer()`](/en-US/docs/Web/CSS/Reference/At-rules/@import) hoặc {{cssxref("@layer")}}, các style được đặt vào named layer đã chỉ định, hoặc vào anonymous layer nếu không có tên nào được cung cấp. Các style được khai báo ngoài layer được coi là một phần của anonymous last declared layer.

Hãy xem xét kiểu origin cascading trước khi đi sâu vào cascade layers trong mỗi kiểu origin.

## Thứ tự cascading

Thuật toán cascading xác định cách tìm giá trị để áp dụng cho mỗi thuộc tính của mỗi phần tử tài liệu. Các bước sau áp dụng cho thuật toán cascading:

1. **Relevance**: Đầu tiên nó lọc tất cả các quy tắc từ các nguồn khác nhau để chỉ giữ lại các quy tắc áp dụng cho một phần tử nhất định. Điều đó có nghĩa là các quy tắc có selector khớp với phần tử nhất định và là một phần của at-rule `media` thích hợp.
2. **Origin và importance**: Sau đó nó sắp xếp các quy tắc này theo tầm quan trọng của chúng, tức là, liệu chúng có theo sau `!important` hay không, và theo origin của chúng. Bỏ qua layers tạm thời, thứ tự cascade như sau:

   | Thứ tự ưu tiên (thấp đến cao) | Origin                  | Importance   |
   | ----------------------------- | ----------------------- | ------------ |
   | 1                             | user-agent (browser)    | normal       |
   | 2                             | user                    | normal       |
   | 3                             | author (developer)      | normal       |
   | 4                             | CSS keyframe animations |              |
   | 5                             | author (developer)      | `!important` |
   | 6                             | user                    | `!important` |
   | 7                             | user-agent (browser)    | `!important` |
   | 8                             | CSS transitions         |              |

3. **Specificity**: Trong trường hợp bằng nhau về origin, [specificity](/en-US/docs/Web/CSS/Guides/Cascade/Specificity) của một quy tắc được xem xét để chọn một giá trị hay giá trị khác. Specificity của các selector được so sánh, và khai báo có specificity cao nhất sẽ thắng.
4. **Scoping proximity**: Khi hai selector trong origin layer có độ ưu tiên có cùng specificity, giá trị thuộc tính trong các quy tắc có scope với số bước nhỏ nhất lên DOM hierarchy đến scope root sẽ thắng. Xem [Cách giải quyết xung đột `@scope`](/en-US/docs/Web/CSS/Reference/At-rules/@scope#how_scope_conflicts_are_resolved) để biết thêm chi tiết và ví dụ.
5. **Thứ tự xuất hiện**: Trong origin có độ ưu tiên, nếu có các giá trị cạnh tranh cho một thuộc tính nằm trong style block khớp với selector có specificity và scoping proximity bằng nhau, khai báo cuối cùng trong thứ tự style sẽ được áp dụng.

Cascade theo thứ tự tăng dần, nghĩa là:

- Animations được ưu tiên hơn các giá trị thông thường, dù được khai báo trong user, author hay user-agent styles.
- Important values được ưu tiên hơn animations, dù được khai báo trong user, author hay user-agent styles.
- Transitions được ưu tiên hơn important values.

> [!NOTE]
> **Transitions và animations**
>
> Các giá trị thuộc tính được đặt bởi animation {{cssxref('@keyframes')}} quan trọng hơn tất cả các normal styles (những cái không có [`!important`](/en-US/docs/Web/CSS/Guides/Cascade/Specificity#the_!important_exception) được đặt).
>
> Các giá trị thuộc tính đang được đặt trong {{cssxref('transition')}} được ưu tiên hơn tất cả các giá trị khác được đặt, kể cả những giá trị được đánh dấu bằng `!important`.

Thuật toán cascade được áp dụng _trước_ thuật toán specificity, nghĩa là nếu `:root p { color: red;}` được khai báo trong user stylesheet (hàng 2) và một `p {color: blue;}` ít specific hơn nằm trong author stylesheet (hàng 3), các đoạn văn sẽ có màu xanh lam.

## Ví dụ cơ bản

Trước khi xem xét sâu hơn cách cascade layers ảnh hưởng đến cascade, hãy xem một ví dụ liên quan đến nhiều nguồn CSS từ các origin khác nhau và thực hiện qua các bước của thuật toán cascade:

Ở đây chúng ta có một user agent stylesheet, hai author stylesheet và một user stylesheet, không có inline styles nào trong HTML:

**User-agent CSS:**

```css
li {
  margin-left: 10px;
}
```

**Author CSS 1:**

```css
li {
  margin-left: 0;
} /* This is a reset */
```

**Author CSS 2:**

```css
@media screen {
  li {
    margin-left: 3px;
  }
}

@media print {
  li {
    margin-left: 1px;
  }
}

@layer namedLayer {
  li {
    margin-left: 5px;
  }
}
```

**User CSS:**

```css
.specific {
  margin-left: 1em;
}
```

**HTML:**

```html
<ul>
  <li class="specific">1<sup>st</sup></li>
  <li>2<sup>nd</sup></li>
</ul>
```

Trong trường hợp này, các khai báo bên trong các quy tắc `li` và `.specific` nên được áp dụng.

Một lần nữa, có năm bước trong thuật toán cascade, theo thứ tự:

1. Relevance
2. Origin và importance
3. Specificity
4. Scoping proximity
5. Thứ tự xuất hiện

`1px` là dành cho print media. Do thiếu _relevance_ dựa trên media type của nó, nó bị loại khỏi xem xét.

Không có khai báo nào được đánh dấu là `!important`, vì vậy thứ tự ưu tiên là author stylesheets trên user stylesheets trên user-agent stylesheet. Dựa trên _origin và importance_, `1em` từ user stylesheet và `10px` từ user-agent stylesheet bị loại khỏi xem xét.

Lưu ý rằng mặc dù user style trên `.specific` của `1em` có specificity cao hơn, nó là một khai báo thông thường trong user stylesheet. Do đó, nó có độ ưu tiên thấp hơn bất kỳ author styles nào, và bị loại bởi bước origin và importance của thuật toán trước khi specificity thậm chí còn được tính đến.

Có ba khai báo trong author stylesheets:

```css
li {
  margin-left: 0;
} /* from author css 1 */
```

```css
@media screen {
  li {
    margin-left: 3px;
  }
}
```

```css
@layer namedLayer {
  li {
    margin-left: 5px;
  }
}
```

Cái cuối cùng, `5px` là một phần của cascade layer. Các khai báo thông thường trong layers có độ ưu tiên thấp hơn các normal styles không nằm trong layer trong cùng kiểu origin. Điều này cũng bị loại bởi bước 2 của thuật toán, _origin và importance_.

Điều này để lại `0` và `3px`, cả hai đều có cùng selector, do đó cùng _specificity_. Không có cái nào nằm trong block `@scope`, vì vậy scoping proximity cũng không phát huy tác dụng trong ví dụ này.

Sau đó chúng ta xem xét _thứ tự xuất hiện_. Cái thứ hai, cái cuối cùng trong hai unlayered author styles, thắng.

```css
margin-left: 3px;
```

> [!NOTE]
> Khai báo được định nghĩa trong user CSS, mặc dù nó có thể có specificity cao hơn, không được chọn vì thuật toán cascade _origin và importance_ được áp dụng trước thuật toán _specificity_. Khai báo được định nghĩa trong một cascade layer, dù có thể xuất hiện sau hơn trong code, cũng sẽ không được ưu tiên vì các normal styles trong cascade layers có độ ưu tiên thấp hơn các normal unlayered styles. _Thứ tự xuất hiện_ chỉ có ý nghĩa khi cả origin, importance và specificity đều bằng nhau.

## Author styles: inline styles, layers và precedence

[Bảng trong Cascading order](#cascading_order) cung cấp tổng quan về thứ tự ưu tiên. Bảng tóm tắt các kiểu origin user-agent, user và author trong hai dòng mỗi kiểu với "origin type - normal" và "origin type - !important". Độ ưu tiên trong mỗi kiểu origin phức tạp hơn. Các style có thể được chứa trong layers trong kiểu origin của chúng, và với author styles, còn có vấn đề về nơi inline styles nằm trong thứ tự cascade.

Thứ tự trong đó các layer được khai báo quan trọng trong việc xác định độ ưu tiên. Các normal styles trong một layer được ưu tiên hơn các styles được khai báo trong các layer trước đó; với các normal styles được khai báo bên ngoài bất kỳ layer nào được ưu tiên hơn các normal layered styles bất kể specificity.

Trong ví dụ này, tác giả đã sử dụng quy tắc {{CSSXref('@import')}} của CSS để import năm stylesheet bên ngoài trong phần tử thông tin {{HTMLElement('style')}}.

```html
<style>
  @import "unlayeredStyles.css";
  @import "AStyles.css" layer(A);
  @import "moreUnlayeredStyles.css";
  @import "BStyles.css" layer(B);
  @import "CStyles.css" layer(C);
  p {
    color: red;
    padding: 1em !important;
  }
</style>
```

và sau đó trong phần body của tài liệu chúng ta có inline styles:

```html
<p style="line-height: 1.6em; text-decoration: overline !important;">Hello</p>
```

Trong khối code CSS ở trên, ba cascade layer được đặt tên là "A", "B" và "C", được tạo theo thứ tự đó. Ba stylesheet được import trực tiếp vào các layer và hai cái được import mà không tạo hoặc được gán vào layer.
"All unlayered styles" trong danh sách bên dưới (normal author style precedence - thứ tự 4) bao gồm các style từ hai stylesheet này và các khối CSS style không có layer bổ sung. Ngoài ra, có hai inline styles, một khai báo `line-height` thông thường và một khai báo `text-decoration` important:

| Thứ tự ưu tiên (thấp đến cao) | Author style         | Importance   |
| ----------------------------- | -------------------- | ------------ |
| 1                             | A - first layer      | normal       |
| 2                             | B - second layer     | normal       |
| 3                             | C - last layer       | normal       |
| 4                             | All unlayered styles | normal       |
| 5                             | inline `style`       | normal       |
| 6                             | animations           |              |
| 7                             | All unlayered styles | `!important` |
| 8                             | C - last layer       | `!important` |
| 9                             | B - second layer     | `!important` |
| 10                            | A - first layer      | `!important` |
| 11                            | inline `style`       | `!important` |
| 12                            | transitions          |              |

Trong tất cả các kiểu origin, normal styles chứa trong layers có độ ưu tiên thấp nhất. Trong ví dụ của chúng ta, các normal styles liên quan đến layer được khai báo đầu tiên (A) có độ ưu tiên thấp hơn các normal styles trong layer được khai báo thứ hai (B), thấp hơn các normal styles trong layer được khai báo thứ ba (C). Các layered styles này có độ ưu tiên thấp hơn tất cả các normal unlayered styles, bao gồm normal styles từ `unlayeredStyles.css`, `moreUnlayeredStyles.css`, và `color` của `p` trong chính `<style>` đó.

Nếu bất kỳ layered styles nào trong A, B hoặc C có selector với specificity cao hơn khớp với một phần tử, tương tự như `:root body p { color: black; }`, thì không quan trọng. Những khai báo đó bị loại khỏi xem xét vì _origin_; normal layered styles có độ ưu tiên thấp hơn normal unlayered styles. Tuy nhiên, nếu selector cụ thể hơn `:root body p { color: black; }` được tìm thấy trong `unlayeredStyles.css`, vì cả _origin và importance_ đều có cùng độ ưu tiên, _specificity_ sẽ có nghĩa là khai báo black cụ thể hơn sẽ thắng.

Thứ tự ưu tiên của layer bị đảo ngược đối với các style được khai báo là `!important`. Các important declarations tìm thấy trong một layer được ưu tiên hơn các important declarations tìm thấy bên ngoài layer. Các important declarations tìm thấy trong layer đầu tiên (A) được ưu tiên hơn các important declarations tìm thấy trong layer B, thấp hơn layer C, thấp hơn các important declarations ngoài layer.

### Inline styles

Chỉ liên quan đến author styles là inline styles, được khai báo bằng thuộc tính `style`. Các normal inline styles được ưu tiên hơn bất kỳ normal author styles nào khác, bất kể specificity của selector. Nếu `line-height: 2;` được khai báo trong block selector `:root body p` trong bất kỳ năm stylesheet được import nào, line height vẫn sẽ là `1.6`. Các normal inline styles không được ưu tiên hơn các thuộc tính được animated hoặc transitioned.

Các important inline styles được ưu tiên hơn tất cả các author styles khác, bất kể chúng có important, inline hay layered không. Các important inline styles cũng được ưu tiên hơn các animated properties, nhưng không phải các transitioned properties. Ba thứ có thể ghi đè important inline style:

- Một important user style.
- Một important user agent style.
- Một transitioned property.

### Importance và layers

Thứ tự ưu tiên kiểu origin bị đảo ngược đối với các important styles. Các important styles được khai báo bên ngoài bất kỳ cascade layer nào có độ ưu tiên thấp hơn những styles được khai báo như một phần của layer. Các important styles đến sớm trong các layer được ưu tiên hơn các important styles được khai báo trong các cascade layer tiếp theo.

Lấy ví dụ CSS sau:

```css
p {
  color: red;
}

@layer B {
  :root p {
    color: blue;
  }
}
```

Mặc dù red được khai báo đầu tiên và có selector ít specific hơn, vì unlayered CSS được ưu tiên hơn layered CSS, đoạn văn sẽ có màu đỏ. Nếu chúng ta đã bao gồm một inline style trên đoạn văn đặt nó thành màu khác, chẳng hạn như `<p style="color: black">`, đoạn văn sẽ có màu đen.

Khi chúng ta thêm `!important` vào đoạn CSS này, thứ tự ưu tiên bị đảo ngược trong stylesheet:

```css
p {
  color: red !important;
}

@layer B {
  :root p {
    color: blue !important;
  }
}
```

Bây giờ đoạn văn sẽ có màu xanh lam. `!important` trong layer được khai báo sớm nhất được ưu tiên hơn các layer tiếp theo và các unlayered important declarations. Nếu inline style chứa `!important`, chẳng hạn như `<p style="color: black !important">`, đoạn văn sẽ có màu đen. Inline importance được ưu tiên hơn tất cả các `!important` declarations được khai báo bởi author khác, bất kể specificity.

> [!NOTE]
> Cờ `!important` đảo ngược độ ưu tiên của cascade layers. Vì lý do này, hãy cố gắng không sử dụng `!important` để ghi đè external styles. Thay vào đó, hãy sử dụng {{cssxref("@import")}} cùng với từ khóa `layer` hoặc hàm `layer()` để import các external stylesheet (từ frameworks, widget stylesheets, libraries, v.v.) vào các layer. Import stylesheets vào layer như khai báo đầu tiên trong CSS của bạn sẽ giảm độ ưu tiên của chúng, và các author-defined layers, được định nghĩa sau trong CSS của bạn, sẽ có độ ưu tiên cao hơn. Cờ `!important` chỉ nên được sử dụng hạn chế, nếu có, để bảo vệ các required styles chống lại các ghi đè sau này, trong layer được khai báo đầu tiên.

Các styles đang được transitioned được ưu tiên hơn tất cả các important styles, bất kể ai hoặc cách chúng được khai báo.

## Thứ tự cascade đầy đủ

Bây giờ chúng ta hiểu rõ hơn về độ ưu tiên của kiểu origin và cascade layer, chúng ta nhận ra bảng trong [Cascading order](#cascading_order) có thể được biểu diễn chính xác hơn bằng bảng sau:

<table>
<thead>
  <tr><th>Thứ tự ưu tiên <br/>(thấp đến cao)</th><th>Style Origin</th><th>Importance</th></tr>
</thead>
<tbody>
  <tr><td rowspan="3">1</td><td>user-agent - first declared layer</td><td rowspan="3">normal</td></tr>
  <tr><td>user-agent - last declared layer</td></tr>
  <tr><td>user-agent - unlayered styles</td></tr>
  <tr><td rowspan="3">2</td><td>user - first declared layer</td><td rowspan="3">normal</td></tr>
  <tr><td>user - last declared layer</td></tr>
  <tr><td>user - unlayered styles</td></tr>
  <tr><td rowspan="4">3</td><td>author - first declared layer</td><td rowspan="4">normal</td></tr>
  <tr><td>author - last declared layer</td></tr>
  <tr><td>author - unlayered styles</td></tr>
  <tr><td>inline <code>style</code></td></tr>
  <tr><td>4</td><td>animations</td><td></td></tr>
  <tr><td rowspan="4">5</td><td>author - unlayered styles</td><td rowspan="4"><code>!important</code></td></tr>
  <tr><td>author - last declared layer</td></tr>
  <tr><td>author - first declared layer</td></tr>
  <tr><td>inline <code>style</code></td></tr>
  <tr><td rowspan="3">6</td><td>user - unlayered styles</td><td rowspan="3"><code>!important</td></tr>
  <tr><td>user - last declared layer</td></tr>
  <tr><td>user - first declared layer</td></tr>
  <tr><td rowspan="3">7</td><td>user-agent - unlayered styles</td><td rowspan="3"><code>!important</code></td></tr>
  <tr><td>user-agent - last declared layer</td></tr>
  <tr><td>user-agent - first declared layer</td></tr>
  <tr><td>8</td><td>transitions</td><td></td></tr>
</tbody>
</table>

## Các entity CSS nào tham gia vào cascade

Chỉ có các khai báo CSS property/value pair tham gia vào cascade. Các CSS at-rule descriptor không tham gia vào cascade và các thuộc tính presentational HTML không phải là một phần của cascade.

### At-rules

Các CSS [at-rules](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) chứa các entity khác ngoài khai báo, chẳng hạn như quy tắc {{ cssxref("@font-face")}} chứa _descriptors_, không tham gia vào cascade.

Đối với hầu hết các phần, các thuộc tính và descriptor được định nghĩa trong at-rules không tham gia vào cascade. Chỉ các at-rules như một toàn thể mới tham gia vào cascade. Ví dụ, trong quy tắc `@font-face`, tên font được xác định bởi các [`font-family`](/en-US/docs/Web/CSS/Reference/At-rules/@font-face/font-family) descriptors. Nếu nhiều quy tắc `@font-face` với cùng descriptor được định nghĩa, chỉ `@font-face` phù hợp nhất, như một toàn thể, được xem xét. Nếu nhiều hơn một cái phù hợp giống nhau, toàn bộ `@font-face` declarations được so sánh bằng cách sử dụng các bước 1, 2 và 4 của thuật toán (không có specificity khi nói đến at-rules).

Trong khi các khai báo chứa trong hầu hết at-rules — chẳng hạn như những cái trong {{cssxref("@media")}}, {{cssxref("@document")}}, hoặc {{cssxref("@supports")}} — tham gia vào cascade, at-rule có thể làm cho toàn bộ selector không liên quan, như chúng ta đã thấy với print style trong [ví dụ cơ bản](#basic_example).

Các khai báo trong {{cssxref("@keyframes")}} không tham gia vào cascade. Như với `@font-face`, chỉ `@keyframes` như một toàn thể được chọn thông qua thuật toán cascade. [Thứ tự ưu tiên của animation được mô tả bên dưới](#css_animations_and_the_cascade).

Khi nói đến {{cssxref("@import")}}, bản thân `@import` không tham gia vào cascade, nhưng tất cả các styles được import đều tham gia. Nếu `@import` định nghĩa một [named hoặc anonymous layer](/en-US/docs/Web/CSS/Reference/At-rules/@layer), nội dung của stylesheet được import sẽ được đặt vào layer đã chỉ định. Tất cả CSS khác được import bằng `@import` được coi là last declared layer. Điều này đã được thảo luận ở trên.

Cuối cùng, {{cssxref("@charset")}} tuân theo các thuật toán cụ thể và không bị ảnh hưởng bởi thuật toán cascade.

### Presentational attributes

Presentational attributes là các thuộc tính trong tài liệu nguồn có thể ảnh hưởng đến styling. Ví dụ, khi được bao gồm, thuộc tính `align` đã bị deprecated thiết lập căn chỉnh trên một số phần tử HTML và thuộc tính `fill` định nghĩa màu được sử dụng để tô màu SVG shapes và văn bản và định nghĩa trạng thái cuối cùng cho SVG animations. Mặc dù chúng là author styles, presentational attributes không tham gia vào cascade.

Nếu HTML presentation attribute được user agent hỗ trợ, các presentational attributes hợp lệ được bao gồm trong HTML và SVG, chẳng hạn như các thuộc tính [`align`](/en-US/docs/Web/HTML/Reference/Elements/img#align) hoặc [`fill`](/en-US/docs/Web/SVG/Reference/Attribute/fill), được dịch sang các quy tắc CSS tương ứng (tất cả SVG presentation attributes được hỗ trợ như CSS properties) và được chèn vào author stylesheet trước bất kỳ style nào khác với specificity bằng `0`.

Presentational attributes không thể được khai báo là `!important`.

## CSS animations và cascade

[CSS animations](/en-US/docs/Web/CSS/Guides/Animations), sử dụng {{cssxref("@keyframes")}} at-rules, định nghĩa các animation giữa các trạng thái. `@keyframes` không cascade, nghĩa là tại bất kỳ thời điểm nào CSS chỉ lấy giá trị từ một tập `@keyframes` duy nhất và không bao giờ kết hợp nhiều tập. Nếu nhiều tập `@keyframes` được định nghĩa với cùng tên animation, tập được định nghĩa cuối cùng trong origin và layer có độ ưu tiên cao nhất sẽ được sử dụng. Các `@keyframes` khác bị bỏ qua, ngay cả khi chúng animate các thuộc tính khác nhau.

```css
p {
  animation: infinite 5s alternate repeatedName;
}

@keyframes repeatedName {
  from {
    font-size: 1rem;
  }
  to {
    font-size: 3rem;
  }
}

@layer A {
  @keyframes repeatedName {
    from {
      background-color: yellow;
    }
    to {
      background-color: orange;
    }
  }
}

@layer B {
  @keyframes repeatedName {
    from {
      color: white;
    }
    to {
      color: black;
    }
  }
}
```

Trong ví dụ này, có ba khai báo animation riêng biệt được đặt tên là `repeatedName`. Khi `animation: infinite 5s alternate repeatedName` được áp dụng cho đoạn văn, chỉ một animation được áp dụng: keyframe animation được định nghĩa trong unlayered CSS được ưu tiên hơn các layered keyframe animation declarations dựa trên thứ tự ưu tiên origin và layer. Trong ví dụ này, chỉ cỡ chữ của phần tử sẽ được animate.

> [!NOTE]
> Không có important animations, vì các khai báo thuộc tính trong block {{cssxref('@keyframes')}} chứa `!important` như một phần của giá trị sẽ bị bỏ qua.

## Reset styles

Sau khi nội dung của bạn đã thay đổi xong các styles, nó có thể thấy mình trong tình huống cần khôi phục chúng về trạng thái đã biết. Điều này có thể xảy ra trong trường hợp animations, thay đổi theme, v.v. Thuộc tính CSS {{cssxref("all")}} cho phép bạn nhanh chóng đặt (gần như) mọi thứ trong CSS về trạng thái đã biết.

`all` cho phép bạn ngay lập tức khôi phục tất cả các thuộc tính về bất kỳ trạng thái ban đầu (mặc định) nào của chúng, trạng thái được kế thừa từ cấp độ trước của cascade, một origin cụ thể (user-agent stylesheet, author stylesheet, hoặc user stylesheet), hoặc thậm chí xóa các giá trị của các thuộc tính hoàn toàn.

## Đặc tả

{{Specifications}}

## Xem thêm

- [Module CSS cascading and inheritance](/en-US/docs/Web/CSS/Guides/Cascade)
- [Học: Xử lý xung đột](/en-US/docs/Learn_web_development/Core/Styling_basics/Handling_conflicts)
- [Học: Cascade layers](/en-US/docs/Learn_web_development/Core/Styling_basics/Cascade_layers)
- [Cú pháp CSS](/en-US/docs/Web/CSS/Guides/Syntax/Introduction)
- [Specificity](/en-US/docs/Web/CSS/Guides/Cascade/Specificity)
- [Inheritance](/en-US/docs/Web/CSS/Guides/Cascade/Inheritance)
- [At-rules](/en-US/docs/Web/CSS/Guides/Syntax/At-rules)
- Giá trị: [initial](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#initial_value), [computed](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#computed_value), [used](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#used_value), và [actual](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#actual_value)
