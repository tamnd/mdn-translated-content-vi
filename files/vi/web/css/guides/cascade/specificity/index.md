---
title: Specificity
slug: Web/CSS/Guides/Cascade/Specificity
page-type: guide
spec-urls: https://drafts.csswg.org/selectors/#specificity-rules
sidebar: cssref
---

**Specificity** là thuật toán được trình duyệt sử dụng để xác định [khai báo CSS](/en-US/docs/Learn_web_development/Core/Styling_basics/What_is_CSS#css_syntax_basics) phù hợp nhất với một phần tử, từ đó xác định giá trị thuộc tính cần áp dụng cho phần tử đó. Thuật toán specificity tính toán trọng số của một [CSS selector](/en-US/docs/Web/CSS/Reference#selectors) để xác định quy tắc nào trong số các khai báo CSS cạnh tranh được áp dụng cho một phần tử.

> [!NOTE]
> Trình duyệt xem xét specificity **sau** khi xác định [nguồn gốc cascade và tầm quan trọng](/en-US/docs/Web/CSS/Guides/Cascade/Introduction). Nói cách khác, đối với các khai báo thuộc tính cạnh tranh, specificity chỉ có liên quan và được so sánh giữa các selector từ một [nguồn gốc cascade và layer](/en-US/docs/Web/CSS/Reference/At-rules/@layer) có quyền ưu tiên cho thuộc tính. [Scoping proximity](/en-US/docs/Web/CSS/Reference/At-rules/@scope#how_scope_conflicts_are_resolved) và thứ tự xuất hiện trở nên liên quan khi specificities của các khai báo cạnh tranh trong cascade layer có quyền ưu tiên bằng nhau.

## Specificity được tính như thế nào?

Specificity là thuật toán tính trọng số được áp dụng cho một khai báo CSS đã cho. Trọng số được xác định bởi số lượng [selector của từng danh mục trọng số](#danh_mục_trọng_số_selector) trong selector khớp với phần tử (hoặc pseudo-element). Nếu có hai hoặc nhiều khai báo cung cấp các giá trị thuộc tính khác nhau cho cùng một phần tử, giá trị khai báo trong khối style có selector khớp với trọng số thuật toán lớn nhất sẽ được áp dụng.

Thuật toán specificity về cơ bản là một giá trị ba cột của ba danh mục hoặc trọng số - ID, CLASS và TYPE - tương ứng với ba loại selector. Giá trị đại diện cho số lượng thành phần selector trong mỗi danh mục trọng số và được viết là _ID - CLASS - TYPE_. Ba cột được tạo ra bằng cách đếm số thành phần selector cho mỗi danh mục trọng số selector trong các selector khớp với phần tử.

### Danh mục trọng số selector

Các danh mục trọng số selector được liệt kê ở đây theo thứ tự specificity giảm dần:

- Cột ID
  - : Chỉ bao gồm [ID selector](/en-US/docs/Web/CSS/Reference/Selectors/ID_selectors), chẳng hạn như `#example`. Đối với mỗi ID trong một selector khớp, thêm 1-0-0 vào giá trị trọng số.
- Cột CLASS
  - : Bao gồm [class selector](/en-US/docs/Web/CSS/Reference/Selectors/Class_selectors), chẳng hạn như `.myClass`, attribute selector như `[type="radio"]` và `[lang|="fr"]`, và pseudo-class, chẳng hạn như `:hover`, `:nth-of-type(3n)` và `:required`. Đối với mỗi class, attribute selector hoặc pseudo-class trong một selector khớp, thêm 0-1-0 vào giá trị trọng số.
- Cột TYPE
  - : Bao gồm [type selector](/en-US/docs/Web/CSS/Reference/Selectors/Type_selectors), chẳng hạn như `p`, `h1` và `td`, và pseudo-element như `::before`, `::placeholder` và tất cả các selector khác với ký hiệu hai dấu hai chấm. Đối với mỗi type hoặc pseudo-element trong một selector khớp, thêm 0-0-1 vào giá trị trọng số.
- Không có giá trị
  - : Universal selector ({{CSSxRef("Universal_selectors", "*")}}) và pseudo-class {{cssxref(":where()")}} cùng các tham số của nó không được tính khi tính trọng số nên giá trị của chúng là 0-0-0, nhưng chúng vẫn khớp các phần tử. Các selector này không ảnh hưởng đến giá trị trọng số specificity.

Các combinator, chẳng hạn như {{CSSxRef("Next-sibling_combinator", "+")}}, {{CSSxRef("Child_combinator", "&gt;")}}, {{CSSxRef("Subsequent-sibling_combinator", "~")}}, [" "](/en-US/docs/Web/CSS/Reference/Selectors/Descendant_combinator) và {{CSSxRef("Column_combinator", "||")}}, có thể làm cho một selector cụ thể hơn trong những gì được chọn nhưng chúng không thêm bất kỳ giá trị nào vào trọng số specificity.

Combinator lồng nhau `&` không thêm trọng số specificity, nhưng các quy tắc lồng nhau thì có. Về specificity và chức năng, lồng nhau rất giống với pseudo-class {{cssxref(":is()")}}.

Giống như lồng nhau, các pseudo-class {{cssxref(":is()")}}, {{cssxref(":has()")}} và phủ định ({{cssxref(":not()")}}) bản thân không thêm trọng số nào. Tuy nhiên, các tham số trong các selector này thì có. Trọng số specificity của mỗi cái đến từ tham số selector trong danh sách selector có specificity cao nhất. Tương tự, với các selector lồng nhau, trọng số specificity được thêm bởi thành phần selector lồng nhau là selector trong danh sách selector lồng nhau phân tách bằng dấu phẩy có specificity cao nhất.

[Các ngoại lệ của `:not()`, `:is()`, `:has()` và CSS nesting](#ngoại_lệ_của_is_not_has_và_css_nesting) được thảo luận bên dưới.

#### Selector khớp

Trọng số specificity đến từ selector khớp. Lấy CSS selector này với ba selector phân tách bằng dấu phẩy làm ví dụ:

```css
[type="password"],
input:focus,
:root #myApp input:required {
  color: blue;
}
```

Selector `[type="password"]` trong danh sách selector trên, với trọng số specificity là `0-1-0`, áp dụng khai báo `color: blue` cho tất cả các loại input password.

Tất cả các input, bất kể loại, khi nhận focus, khớp với selector thứ hai trong danh sách, `input:focus`, với trọng số specificity là `0-1-1`; trọng số này được tạo thành từ pseudo-class `:focus` (0-1-0) và type `input` (0-0-1). Nếu input password có focus, nó sẽ khớp với `input:focus`, và trọng số specificity cho khai báo style `color: blue` sẽ là `0-1-1`. Khi password đó không có focus, trọng số specificity vẫn là `0-1-0`.

Specificity cho input bắt buộc lồng trong phần tử có attribute `id="myApp"` là `1-2-1`, dựa trên một ID, hai pseudo-class và một loại phần tử.

Nếu loại input password với `required` được lồng trong phần tử có `id="myApp"` được đặt, trọng số specificity sẽ là `1-2-1`, dựa trên một ID, hai pseudo-class và một loại phần tử, dù nó có focus hay không. Tại sao trọng số specificity là `1-2-1` thay vì `0-1-1` hoặc `0-1-0` trong trường hợp này? Vì trọng số specificity đến từ selector khớp với trọng số specificity lớn nhất. Trọng số được xác định bằng cách so sánh các giá trị trong ba cột, từ trái sang phải.

```css
[type="password"] {
  /* 0-1-0 */
}
input:focus {
  /* 0-1-1 */
}
:root #myApp input:required {
  /* 1-2-1 */
}
```

### So sánh ba cột

Khi các giá trị specificity của các selector liên quan được xác định, số lượng thành phần selector trong mỗi cột được so sánh, từ trái sang phải.

```css
#myElement {
  color: green; /* 1-0-0  - WINS!! */
}
.bodyClass .sectionClass .parentClass [id="myElement"] {
  color: yellow; /* 0-4-0 */
}
```

Cột đầu tiên là giá trị của thành phần _ID_, là số lượng ID trong mỗi selector. Các số trong cột _ID_ của các selector cạnh tranh được so sánh. Selector có giá trị lớn hơn trong cột _ID_ thắng bất kể giá trị trong các cột khác là gì. Trong ví dụ trên, mặc dù selector màu vàng có nhiều thành phần hơn về tổng thể, chỉ có giá trị của cột đầu tiên mới quan trọng.

Nếu số trong cột _ID_ của các selector cạnh tranh giống nhau, thì cột tiếp theo, _CLASS_, được so sánh, như được hiển thị bên dưới.

```css
#myElement {
  color: yellow; /* 1-0-0 */
}
#myApp [id="myElement"] {
  color: green; /* 1-1-0  - WINS!! */
}
```

Cột _CLASS_ là số lượng tên class, attribute selector và pseudo-class trong selector. Khi giá trị cột _ID_ giống nhau, selector có giá trị lớn hơn trong cột _CLASS_ thắng, bất kể giá trị trong cột _TYPE_. Điều này được hiển thị trong ví dụ bên dưới.

```css
:root input {
  color: green; /* 0-1-1 - WINS because CLASS column is greater */
}
html body main input {
  color: yellow; /* 0-0-4 */
}
```

Nếu các số trong cột _CLASS_ và _ID_ trong các selector cạnh tranh giống nhau, cột _TYPE_ trở nên liên quan. Cột _TYPE_ là số lượng loại phần tử và pseudo-element trong selector. Khi hai cột đầu có cùng giá trị, selector có số lớn hơn trong cột _TYPE_ thắng.

Nếu các selector cạnh tranh có cùng giá trị trong cả ba cột, quy tắc gần nhất áp dụng, trong đó style được khai báo cuối cùng có quyền ưu tiên.

```css
input.myClass {
  color: yellow; /* 0-1-1 */
}
:root input {
  color: green; /* 0-1-1 WINS because it comes later */
}
```

### Ngoại lệ của `:is()`, `:not()`, `:has()` và CSS nesting

Pseudo-class matches-any {{cssxref(":is()")}}, pseudo-class relational {{cssxref(":has()")}} và pseudo-class phủ định {{cssxref(":not()")}} _không_ được coi là pseudo-class trong tính toán trọng số specificity. Bản thân chúng không thêm bất kỳ trọng số nào vào phương trình specificity. Tuy nhiên, các tham số selector được truyền vào trong ngoặc đơn pseudo-class là một phần của thuật toán specificity; trọng số của pseudo-class matches-any và phủ định trong tính toán giá trị specificity là trọng số của [trọng số](#danh_mục_trọng_số_selector) của tham số.

```css
p {
  /* 0-0-1 */
}
:is(p) {
  /* 0-0-1 */
}

h2:nth-last-of-type(n + 2) {
  /* 0-1-1 */
}
h2:has(~ h2) {
  /* 0-0-2 */
}

div.outer p {
  /* 0-1-2 */
}
div:not(.inner) p {
  /* 0-1-2 */
}
```

Lưu ý rằng trong cặp CSS trên, trọng số specificity do các pseudo-class `:is()`, `:has()` và `:not()` cung cấp là giá trị của tham số selector, không phải của pseudo-class.

Cả ba pseudo-class này đều chấp nhận danh sách selector phức tạp, một danh sách các selector phân tách bằng dấu phẩy, làm tham số. Tính năng này có thể được sử dụng để tăng specificity của một selector:

```css
:is(p, #fakeId) {
  /* 1-0-0 */
}
h1:has(+ h2, > #fakeId) {
  /* 1-0-1 */
}
p:not(#fakeId) {
  /* 1-0-1 */
}
div:not(.inner, #fakeId) p {
  /* 1-0-2 */
}
```

Trong khối mã CSS trên, chúng ta đã bao gồm `#fakeId` trong các selector. `#fakeId` này thêm `1-0-0` vào trọng số specificity của mỗi đoạn văn.

Khi tạo danh sách selector phức tạp với [CSS nesting](/en-US/docs/Web/CSS/Guides/Nesting), điều này hoạt động chính xác theo cùng cách như pseudo-class `:is()`.

```css
p,
#fakeId {
  span {
    /* 1-0-1 */
  }
}
```

Trong khối mã trên, selector phức tạp `p, #fakeId`, specificity được lấy từ `#fakeId` và cả `span`, vì vậy điều này tạo ra specificity là `1-0-1` cho cả `p span` và `#fakeId span`. Đây là specificity tương đương như selector `:is(p, #fakeId) span`.

Nhìn chung, bạn muốn giữ specificity ở mức tối thiểu, nhưng nếu bạn cần tăng specificity của một phần tử vì lý do cụ thể, ba pseudo-class này có thể giúp ích.

```css
a:not(#fakeId#fakeId#fakeID) {
  color: blue; /* 3-0-1 */
}
```

Trong ví dụ này, tất cả các liên kết sẽ có màu xanh, trừ khi bị ghi đè bởi khai báo liên kết với 3 hoặc nhiều ID hơn, giá trị màu khớp với `a` bao gồm [cờ `!important`](#ngoại_lệ_!important), hoặc nếu liên kết có khai báo màu [inline style](#inline_styles). Nếu bạn sử dụng kỹ thuật như vậy, hãy thêm bình luận để giải thích tại sao cần đến hack này.

### Inline styles

Inline style được thêm vào phần tử (ví dụ: `style="font-weight: bold;"`) luôn ghi đè bất kỳ style thông thường nào trong stylesheet của tác giả, và do đó có thể được coi là có specificity cao nhất. Hãy nghĩ về inline styles như có trọng số specificity là `1-0-0-0`.

Cách duy nhất để ghi đè inline styles là bằng cách sử dụng `!important`.

Nhiều framework và thư viện JavaScript thêm inline styles. Sử dụng `!important` với một selector rất cụ thể, chẳng hạn như attribute selector sử dụng inline style, là một cách để ghi đè các inline styles này.

```html
<p style="color: purple">…</p>
```

```css
p[style*="purple"] {
  color: rebeccapurple !important;
}
```

Hãy đảm bảo bao gồm bình luận với mỗi lần sử dụng cờ important để người bảo trì mã hiểu tại sao anti-pattern CSS được sử dụng.

### Ngoại lệ `!important`

Các khai báo CSS được đánh dấu là important ghi đè bất kỳ khai báo nào khác trong cùng cascade layer và nguồn gốc. Mặc dù về mặt kỹ thuật, [`!important`](/en-US/docs/Web/CSS/Reference/Values/important) không liên quan gì đến specificity, nhưng nó tương tác trực tiếp với specificity và cascade. Nó đảo ngược thứ tự [cascade](/en-US/docs/Web/CSS/Guides/Cascade/Introduction) của stylesheets.

Nếu các khai báo từ cùng nguồn gốc và cascade layer xung đột và một giá trị thuộc tính có cờ `!important` được đặt, khai báo important được áp dụng bất kể specificity. Khi các khai báo xung đột từ cùng nguồn gốc và cascade layer với cờ `!important` được áp dụng cho cùng một phần tử, khai báo với specificity lớn hơn được áp dụng.

Sử dụng `!important` để ghi đè specificity được coi là **thực hành xấu** và nên tránh cho mục đích này. Hiểu và sử dụng hiệu quả specificity và cascade có thể loại bỏ bất kỳ nhu cầu nào về cờ `!important`.

Thay vì sử dụng `!important` để ghi đè CSS ngoại lai (từ các thư viện bên ngoài như Bootstrap hoặc normalize.css), hãy import script bên thứ ba trực tiếp vào [cascade layer](/en-US/docs/Web/CSS/Reference/At-rules/@layer). Nếu bạn phải sử dụng `!important` trong CSS, hãy bình luận cách sử dụng để người bảo trì mã trong tương lai biết tại sao khai báo được đánh dấu là important và biết không ghi đè nó. Nhưng chắc chắn, đừng sử dụng `!important` khi viết plugin hoặc framework mà các nhà phát triển khác sẽ cần tích hợp mà không thể kiểm soát.

### Ngoại lệ `:where()`

Pseudo-class điều chỉnh specificity {{cssxref(":where()")}} luôn có specificity của nó được thay thế bằng zero, `0-0-0`. Nó cho phép tạo CSS selector rất cụ thể trong phần tử được nhắm mục tiêu mà không tăng specificity.

Khi tạo CSS bên thứ ba để các nhà phát triển không có quyền truy cập chỉnh sửa CSS của bạn sử dụng, người ta coi việc tạo CSS với specificity thấp nhất có thể là thực hành tốt. Ví dụ, nếu theme của bạn bao gồm CSS sau:

```css
:where(#defaultTheme) a {
  /* 0-0-1 */
  color: red;
}
```

Thì nhà phát triển triển khai widget có thể dễ dàng ghi đè màu liên kết chỉ bằng cách sử dụng type selector.

```css
footer a {
  /* 0-0-2 */
  color: blue;
}
```

### Cách khối `@scope` ảnh hưởng đến specificity

Bao gồm một ruleset bên trong khối {{cssxref("@scope")}} không ảnh hưởng đến specificity của selector, bất kể các selector được sử dụng bên trong [scope root và limit](/en-US/docs/Web/CSS/Reference/At-rules/@scope#syntax).
Tuy nhiên, nếu bạn quyết định thêm rõ ràng pseudo-class {{cssxref(":scope")}}, bạn cần tính đến nó khi tính specificity.
`:scope`, như tất cả các pseudo-class thông thường, có specificity là 0-1-0. Ví dụ:

```css
@scope (.article-body) {
  /* :scope img has a specificity of 0-1-0 + 0-0-1 = 0-1-1 */
  :scope img {
  }
}
```

Xem [Specificity trong `@scope`](/en-US/docs/Web/CSS/Reference/At-rules/@scope#specificity_in_scope) để biết thêm thông tin.

## Mẹo xử lý các vấn đề về specificity

Thay vì sử dụng `!important`, hãy cân nhắc sử dụng cascade layer và sử dụng specificity trọng số thấp trong toàn bộ CSS để các style có thể dễ dàng bị ghi đè bằng các quy tắc cụ thể hơn một chút. Sử dụng HTML ngữ nghĩa giúp cung cấp các điểm neo để áp dụng style.

### Làm selector cụ thể với và không thêm specificity

Bằng cách chỉ ra phần tài liệu bạn đang tạo kiểu trước phần tử bạn đang chọn, quy tắc trở nên cụ thể hơn. Tùy thuộc vào cách bạn thêm nó, bạn có thể thêm một ít, nhiều, hoặc không có specificity, như được hiển thị bên dưới:

```html
<main id="myContent">
  <h1>Text</h1>
</main>
```

```css
#myContent h1 {
  color: green; /* 1-0-1 */
}
[id="myContent"] h1 {
  color: yellow; /* 0-1-1 */
}
:where(#myContent) h1 {
  color: blue; /* 0-0-1 */
}
```

Bất kể thứ tự, tiêu đề sẽ có màu xanh lá vì quy tắc đó cụ thể nhất.

#### Giảm specificity ID

Specificity dựa trên dạng của selector. Bao gồm `id` của phần tử như attribute selector thay vì id selector là một cách tốt để làm phần tử cụ thể hơn mà không thêm quá nhiều specificity. Trong ví dụ trước, selector `[id="myContent"]` được tính là attribute selector để xác định specificity của selector, mặc dù nó chọn một ID.

Bạn cũng có thể bao gồm `id` hoặc bất kỳ phần nào của selector như tham số trong pseudo-class điều chỉnh specificity `:where()` nếu bạn cần làm selector cụ thể hơn nhưng không muốn thêm bất kỳ specificity nào.

### Tăng specificity bằng cách nhân đôi selector

Như một trường hợp đặc biệt để tăng specificity, bạn có thể nhân đôi trọng số từ cột _CLASS_ hoặc _ID_. Nhân đôi id, class, pseudo-class hoặc attribute selector trong một compound selector sẽ tăng specificity khi ghi đè các selector rất cụ thể mà bạn không thể kiểm soát.

```css
#myId#myId#myId span {
  /* 3-0-1 */
}
.myClass.myClass.myClass span {
  /* 0-3-1 */
}
```

Hãy sử dụng điều này một cách tiết kiệm, nếu có. Nếu sử dụng nhân đôi selector, luôn bình luận CSS của bạn.

Bằng cách sử dụng `:is()` và `:not()` (và cả `:has()`), bạn có thể tăng specificity ngay cả khi không thể thêm `id` vào phần tử cha:

```css
:not(#fakeID#fakeId#fakeID) span {
  /* 3-0-1 */
}
:is(#fakeID#fakeId#fakeID, span) {
  /* 3-0-0 */
}
```

### Ưu tiên hơn CSS bên thứ ba

Tận dụng cascade layer là cách tiêu chuẩn để cho phép một tập hợp style có quyền ưu tiên hơn tập hợp style khác; cascade layer cho phép điều này mà không cần sử dụng specificity! Các style tác giả thông thường (không quan trọng) được import vào cascade layer có quyền ưu tiên thấp hơn các style tác giả không có layer.

Nếu style đến từ stylesheet mà bạn không thể chỉnh sửa hoặc không hiểu và bạn cần ghi đè style, một chiến lược là import các style bạn không kiểm soát vào cascade layer. Các style trong các layer được khai báo sau có quyền ưu tiên, với các style không có layer có quyền ưu tiên hơn tất cả các style có layer từ cùng nguồn gốc.

```css
@import "TW.css" layer();
p,
p * {
  font-size: 1rem;
}
```

Trong ví dụ trên, tất cả văn bản đoạn, bao gồm nội dung lồng nhau, sẽ là `1rem` bất kể có bao nhiêu tên class các đoạn có khớp với stylesheet TW.

### Tránh và ghi đè `!important`

Cách tiếp cận tốt nhất là không sử dụng `!important`. Các giải thích trên về specificity sẽ hữu ích trong việc tránh sử dụng cờ này và loại bỏ nó hoàn toàn khi gặp.

Để loại bỏ nhận thức cần thiết của `!important`, bạn có thể thực hiện một trong những điều sau:

- Tăng specificity của selector của khai báo `!important` trước đó để nó lớn hơn các khai báo khác
- Cho nó cùng specificity và đặt nó sau khai báo mà nó nhằm ghi đè
- Giảm specificity của selector bạn đang cố gắng ghi đè.

Tất cả các phương pháp này được đề cập trong các phần trước.

Nếu bạn không thể loại bỏ cờ `!important` khỏi stylesheet của tác giả, giải pháp duy nhất để ghi đè các style important là sử dụng `!important`. Tạo [cascade layer](/en-US/docs/Web/CSS/Reference/At-rules/@layer) của các khai báo ghi đè important là giải pháp tuyệt vời. Hai cách để làm điều này bao gồm:

#### Phương pháp 1

1. Tạo một stylesheet riêng biệt ngắn chỉ chứa các khai báo important ghi đè cụ thể bất kỳ khai báo important nào bạn không thể loại bỏ.
2. Import stylesheet này như import đầu tiên trong CSS bằng `layer()`, bao gồm câu lệnh `@import`, trước khi liên kết đến các stylesheet khác. Điều này để đảm bảo rằng các ghi đè important được import như layer đầu tiên.

```css
@import "importantOverrides.css" layer();
```

#### Phương pháp 2

1. Ở đầu khai báo stylesheet của bạn, tạo cascade layer được đặt tên, như thế này:

   ```css
   @layer importantOverrides;
   ```

2. Mỗi khi bạn cần ghi đè khai báo important, hãy khai báo nó trong layer được đặt tên. Chỉ khai báo các quy tắc important trong layer.

   ```css
   [id="myElement"] p {
     /* normal styles here */
   }
   @layer importantOverrides {
     [id="myElement"] p {
       /* important style here */
     }
   }
   ```

Specificity của selector của style important trong layer có thể thấp, miễn là nó khớp với phần tử bạn đang cố gắng ghi đè. Các layer thông thường nên được khai báo bên ngoài layer vì các style có layer có quyền ưu tiên thấp hơn các style không có layer.

### Bỏ qua proximity trong cây

Sự gần gũi của một phần tử với các phần tử khác được tham chiếu trong một selector đã cho không có tác động đến specificity.

```css
body h1 {
  color: green;
}

html h1 {
  color: purple;
}
```

Các phần tử `<h1>` sẽ có màu tím vì khi các khai báo có cùng specificity, selector được khai báo cuối cùng có quyền ưu tiên.

### Phần tử được nhắm mục tiêu trực tiếp vs. style kế thừa

Các style cho phần tử được nhắm mục tiêu trực tiếp sẽ luôn có quyền ưu tiên hơn các style kế thừa, bất kể specificity của quy tắc kế thừa. Với CSS và HTML sau:

```css
#parent {
  color: green;
}

h1 {
  color: purple;
}
```

```html
<html lang="en">
  <body id="parent">
    <h1>Here is a title!</h1>
  </body>
</html>
```

`h1` sẽ có màu tím vì selector `h1` nhắm mục tiêu phần tử cụ thể, trong khi màu xanh lá được kế thừa từ khai báo `#parent`.

## Ví dụ

Trong CSS sau, chúng ta có ba selector nhắm mục tiêu các phần tử {{HTMLElement('input')}} để đặt màu. Đối với một input đã cho, trọng số specificity của khai báo màu có quyền ưu tiên là selector khớp có trọng số lớn nhất:

```css
#myElement input.myClass {
  color: red;
} /* 1-1-1 */
input[type="password"]:required {
  color: blue;
} /* 0-2-1 */
html body main input {
  color: green;
} /* 0-0-4 */
```

Nếu tất cả các selector trên nhắm mục tiêu cùng một input, input sẽ có màu đỏ, vì khai báo đầu tiên có giá trị cao nhất trong cột _ID_.

Selector cuối cùng có bốn thành phần _TYPE_. Mặc dù nó có giá trị số nguyên cao nhất, bất kể có bao nhiêu phần tử và pseudo-element được bao gồm, ngay cả khi có 150, các thành phần TYPE không bao giờ có quyền ưu tiên hơn các thành phần _CLASS_. Các giá trị cột được so sánh bắt đầu từ trái sang phải khi giá trị cột bằng nhau.

Nếu chúng ta đã chuyển đổi id selector trong mã ví dụ trên thành attribute selector, hai selector đầu tiên sẽ có cùng specificity, như được hiển thị bên dưới:

```css
[id="myElement"] input.myClass {
  color: red;
} /* 0-2-1 */
input[type="password"]:required {
  color: blue;
} /* 0-2-1 */
```

Khi nhiều khai báo có specificity bằng nhau, khai báo cuối cùng được tìm thấy trong CSS được áp dụng cho phần tử. Nếu cả hai selector khớp cùng một {{HTMLElement('input')}}, màu sẽ là xanh.

## Ghi chú bổ sung

Một vài điều cần nhớ về specificity:

1. Specificity chỉ áp dụng khi cùng một phần tử được nhắm mục tiêu bởi nhiều khai báo trong cùng cascade layer hoặc nguồn gốc. Specificity chỉ quan trọng đối với các khai báo có cùng tầm quan trọng và cùng nguồn gốc và [cascade layer](/en-US/docs/Web/CSS/Reference/At-rules/@layer). Nếu các selector khớp ở các nguồn gốc khác nhau, [cascade](/en-US/docs/Web/CSS/Guides/Cascade/Introduction) xác định khai báo nào có quyền ưu tiên.

2. Khi hai selector trong cùng cascade layer và nguồn gốc có cùng specificity, scoping proximity sau đó được tính toán; ruleset có scoping proximity thấp nhất thắng. Xem [Cách xung đột `@scope` được giải quyết](/en-US/docs/Web/CSS/Reference/At-rules/@scope#how_scope_conflicts_are_resolved) để biết thêm chi tiết và ví dụ.

3. Nếu scoping proximity cũng giống nhau cho cả hai selector, thứ tự nguồn sau đó được xem xét. Khi mọi thứ khác bằng nhau, selector cuối cùng thắng.

4. Theo quy tắc CSS, [các phần tử được nhắm mục tiêu trực tiếp](#phần_tử_được_nhắm_mục_tiêu_trực_tiếp_vs._style_kế_thừa) sẽ luôn có quyền ưu tiên hơn các quy tắc mà một phần tử kế thừa từ tổ tiên của nó.

5. [Proximity của các phần tử](#bỏ_qua_proximity_trong_cây) trong cây tài liệu không có tác động đến specificity.

## Đặc tả

{{Specifications}}

## Xem thêm

- Mô-đun [CSS cascading and inheritance](/en-US/docs/Web/CSS/Guides/Cascade)
- [Học: Xử lý xung đột](/en-US/docs/Learn_web_development/Core/Styling_basics/Handling_conflicts#specificity_2)
- [Học: Cascade layers](/en-US/docs/Learn_web_development/Core/Styling_basics/Cascade_layers)
- Mô-đun [CSS syntax](/en-US/docs/Web/CSS/Guides/Syntax)
- [Giới thiệu về cú pháp CSS: khai báo, ruleset và câu lệnh](/en-US/docs/Web/CSS/Guides/Syntax/Introduction)
- [Xử lý lỗi CSS](/en-US/docs/Web/CSS/Guides/Syntax/Error_handling)
- [At-rules](/en-US/docs/Web/CSS/Guides/Syntax/At-rules)
- [Inheritance](/en-US/docs/Web/CSS/Guides/Cascade/Inheritance)
- Giá trị: [initial](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#initial_value), [computed](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#computed_value), [used](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#used_value) và [actual](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#actual_value)
- [Cú pháp định nghĩa giá trị](/en-US/docs/Web/CSS/Guides/Values_and_units/Value_definition_syntax)
- Mô-đun [CSS nesting](/en-US/docs/Web/CSS/Guides/Nesting)
- [Specificity Calculator](https://specificity.keegan.st/) bởi Keegan Street: Website tương tác để kiểm tra và hiểu các quy tắc CSS của bạn
- [SpeciFISHity](https://specifishity.com/) trên specifishity.com: Cách vui để học về CSS specificity
- [Bài tập _ID-CLASS-TYPE_](https://estelle.github.io/CSS/selectors/exercises/specificity.html): Bài kiểm tra specificity bởi Estelle Weyl
