---
title: CSS property value processing
short-title: Property value processing
slug: Web/CSS/Guides/Cascade/Property_value_processing
page-type: guide
sidebar: cssref
---

Đối với mỗi phần tử trong cây tài liệu, trình duyệt gán một giá trị cho mỗi thuộc tính CSS áp dụng cho phần tử đó. Giá trị rendered của mỗi thuộc tính CSS cho một phần tử hoặc box nhất định là kết quả của một phép tính dựa trên các định nghĩa stylesheet, inheritance, [cascade](/en-US/docs/Web/CSS/Guides/Cascade/Introduction), các phụ thuộc, chuyển đổi đơn vị và môi trường hiển thị. Hướng dẫn này cung cấp tổng quan về các bước xử lý áp dụng để định nghĩa cách mỗi CSS value cuối cùng được render, bằng cách khám phá các khái niệm chính như specified, computed, used và actual values.

## Giá trị thuộc tính

Mỗi style được áp dụng cho một phần tử hoặc pseudo-element đều dựa trên một khai báo CSS property duy nhất. Mỗi thuộc tính CSS chỉ có một giá trị. Giá trị được áp dụng được xác định bởi [cascaded values](#cascaded_value) của tất cả các khai báo của thuộc tính đó áp dụng cho phần tử hoặc pseudo-element đó, với giá trị duy nhất được áp dụng đến từ khai báo thuộc tính xếp hạng cao nhất trong [thứ tự sắp xếp cascade](/en-US/docs/Web/CSS/Guides/Cascade/Introduction#cascading_order) dựa trên [thuật toán cascade](/en-US/docs/Web/CSS/Guides/Cascade/Introduction).

Khi có nhiều [declared values](#declared_value), với nhiều khai báo, cung cấp cùng hoặc khác nhau giá trị thuộc tính cho cùng một phần tử, mỗi giá trị thuộc tính vẫn phải đến từ một cặp property name-value duy nhất vì chỉ có một giá trị được áp dụng từ mỗi thuộc tính, ngay cả khi giá trị là danh sách các giá trị phân cách bởi dấu phẩy.

Để xác định [declared value](#declared_value) nào được áp dụng, user agent thu thập và xử lý tất cả các styles từ các nguồn khác nhau, chẳng hạn như inline styles, và các stylesheet nội bộ và bên ngoài.

[Cascade](/en-US/docs/Web/CSS/Guides/Cascade/Introduction) xác định giá trị nào nên được áp dụng khi nhiều styles xung đột nhắm vào cùng một phần tử. [Thuật toán cascade](/en-US/docs/Web/CSS/Guides/Cascade/Introduction#cascading_order) định nghĩa cách user agent kết hợp các giá trị thuộc tính có nguồn gốc từ các nguồn, scopes và/hoặc [layers](/en-US/docs/Web/CSS/Guides/Cascade/Introduction#cascade_layers) khác nhau. Khi một selector khớp với một phần tử, [declared value](#declared_value) của thuộc tính từ [origin](/en-US/docs/Web/CSS/Guides/Cascade/Introduction#origin_types) có độ ưu tiên cao nhất được áp dụng, ngay cả khi selector từ [origin](/en-US/docs/Web/CSS/Guides/Cascade/Introduction#origin_types) hoặc [layers](/en-US/docs/Web/CSS/Guides/Cascade/Introduction#cascade_layers) có độ ưu tiên thấp hơn có [specificity](/en-US/docs/Web/CSS/Guides/Cascade/Specificity) cao hơn.

Một số thuộc tính kế thừa giá trị từ các phần tử cha của chúng trừ khi được ghi đè tường minh. [Inheritance](/en-US/docs/Web/CSS/Guides/Cascade/Inheritance) có thể xảy ra khi không có thông tin style nào tồn tại cho một thuộc tính cụ thể trên một phần tử. Nếu thuộc tính được kế thừa, giá trị được đặt thành [computed value](#computed_value) của phần tử cha. Nếu thuộc tính không được kế thừa, giá trị của nó được đặt thành [initial value](#initial_value) cho phần tử đó.

Sau khi áp dụng các quy tắc [cascading](#cascading) và các bước giá trị mặc định từng bước, trình duyệt đảm bảo bản trình bày trực quan khớp với CSS đã xử lý.

## Tổng quan về quá trình xử lý

Trước khi đi sâu vào các giai đoạn giá trị riêng lẻ, điều quan trọng là phải hiểu ba phase chính xảy ra trong quá trình xử lý giá trị; [filtering](#filtering), [cascading](#cascading) và [defaulting](#defaulting).

### Filtering

**Filtering** là quá trình xác định tất cả các khai báo áp dụng cho mỗi phần tử. Một khai báo chỉ áp dụng cho một phần tử nếu:

- Khai báo thuộc về một style sheet hiện đang áp dụng cho tài liệu này
- Bất kỳ [conditional rules](/en-US/docs/Web/CSS/Guides/Conditional_rules) nào (như {{cssxref("@media")}} hoặc {{cssxref("@supports")}}) chứa khai báo hiện đang đúng.
- Khai báo thuộc về style rule có selector khớp với phần tử
- Khai báo có cú pháp hợp lệ: tên thuộc tính được trình duyệt nhận ra và giá trị khớp với cú pháp mong đợi cho thuộc tính đó

Chỉ có các khai báo hợp lệ mới trở thành declared values. Các khai báo có tên thuộc tính hoặc giá trị không hợp lệ sẽ bị lọc ra theo [quy tắc xử lý lỗi CSS](/en-US/docs/Web/CSS/Guides/Syntax/Error_handling).

Trong ví dụ này, chỉ có các khai báo {{cssxref("font-size")}} và {{cssxref("font-weight")}} được xử lý. [CSS parser lọc ra lỗi](/en-US/docs/Web/CSS/Guides/Syntax/Error_handling#css_parser_errors), bỏ qua hoặc "filtering" ra khai báo có tên thuộc tính không hợp lệ:

```css
p {
  font-size: 1.25em;
  colr: blue;
  font-weight: bold;
}
```

Khi filtering hoàn tất, mỗi phần tử có không hoặc nhiều [declared values](#declared_value) cho mỗi thuộc tính CSS. Các declared values này là điểm khởi đầu cho giai đoạn xử lý [cascading](#cascading).

### Cascading

[Cascade](/en-US/docs/Web/CSS/Guides/Cascade/Introduction) giải quyết xung đột khi nhiều khai báo áp dụng cho cùng một thuộc tính trên cùng một phần tử. Cascade sắp xếp các khai báo bằng cách sử dụng thuật toán [thứ tự sắp xếp cascade](/en-US/docs/Web/CSS/Guides/Cascade/Introduction#cascading_order).

Ví dụ, cả hai khai báo {{cssxref("font-size")}} đều khớp với `<p class="large">CSS is fun!</p>`, nhưng khai báo thứ hai được áp dụng vì nó có [specificity](/en-US/docs/Web/CSS/Guides/Cascade/Specificity) cao hơn. Cả hai khai báo đều có author origin, nhưng selector thứ hai có specificity là `0-1-1` trong khi cái đầu tiên có `0-0-1`:

```css
p {
  font-size: 1em;
}

p.large {
  font-size: 1.5em;
}
```

Sau cascading, trình duyệt xác định [**cascaded value**](#cascaded_value) cho mỗi thuộc tính trên mỗi phần tử. Đây là giá trị được sử dụng trong giai đoạn xử lý tiếp theo; [defaulting](#defaulting).

### Defaulting

**Defaulting** đảm bảo mỗi thuộc tính trên mỗi phần tử đều có giá trị. Điều này liên quan đến việc áp dụng các giá trị thuộc tính mặc định khi không có khai báo CSS nào đặt tường minh giá trị thuộc tính đó.
Điều này bao gồm:

- Thiết lập **inherited values** cho [inherited properties](/en-US/docs/Web/CSS/Guides/Cascade/Inheritance#inherited_properties)
- Thiết lập **initial values** cho [non-inherited properties](/en-US/docs/Web/CSS/Guides/Cascade/Inheritance#non-inherited_properties)

Kết quả của defaulting, mọi thuộc tính đều được đảm bảo có [specified value](#specified_value).

Lưu ý rằng các từ khóa defaulting tường minh ({{cssxref("initial")}}, {{cssxref("inherit")}}, {{cssxref("unset")}}, {{cssxref("revert")}}, {{cssxref("revert-layer")}}) cũng được giải quyết thành các giá trị tương ứng của chúng để xác định [specified value](#specified_value).

## Các giai đoạn xử lý

Tất cả các phần tử là một phần của flattened element tree của tài liệu đều có các giá trị [declared](#declared_value), [cascaded](#cascaded_value), [specified](#specified_value), [computed](#computed_value), [used](#used_value) và [actual](#actual_value). Đối với một thuộc tính cụ thể, các giá trị này có thể giống hoặc khác nhau. Ví dụ, nếu codebase lớn của bạn bao gồm CSS `p { font-size: 1.25em; }` và HTML của bạn bao gồm `<p class="large">CSS is fun!</p>`, đoạn văn sẽ có kích thước bao nhiêu? Giá trị {{cssxref("font-size")}} trải qua một vài giai đoạn để đi từ giá trị `em` đã chỉ định đến giá trị `px` được render.

Các giai đoạn xử lý giá trị là [Declared value](#declared_value), [Cascaded value](#cascaded_value), [Specified value](#specified_value), [Computed value](#computed_value), [Used value](#used_value) và [Actual value](#actual_value). Các giá trị này được sử dụng để xác định [rendered value](#rendered_values) cuối cùng.

### Declared value

**Declared value** là bất kỳ giá trị có cú pháp hợp lệ nào từ một khai báo áp dụng cho một phần tử. Một phần tử có thể có không hoặc nhiều declared values cho mỗi thuộc tính. Những giá trị này đến từ stylesheets (author, user hoặc user-agent) và được xác định trong giai đoạn [filtering](#filtering).

Tiếp tục ví dụ của chúng ta, trong đó stylesheet của chúng ta bao gồm một lần xuất hiện của `p { font-size: 1.25em; }` và tài liệu liên kết đến stylesheet đó bao gồm `<p class="large">CSS is fun!</p>`, có thể có các khai báo `font-size` khác có thể áp dụng cho cùng một đoạn văn. User-agent stylesheet có thể đặt `font-size: 1em` cho tất cả các đoạn văn, trong khi một author declaration khác đặt `font-size: 2em` cho các phần tử có class "large":

```css
/* User agent styles */
p {
  font-size: 1em;
}

/* author styles */
p {
  font-size: 1.25em;
}

.large {
  font-size: 2em;
}
```

Có thể có nhiều khai báo `font-size` khác trong stylesheets của chúng ta, nhưng chỉ các khai báo có selector khớp với phần tử mới trở thành declared values. Trong ví dụ này, vì phần tử `<p>` của chúng ta có `class="large"`, cả ba khai báo đều là declared values cho phần tử này.

### Cascaded value

**Cascaded value** là declared value thắng trong [cascade](#cascading). Có nhiều nhất một cascaded value cho mỗi thuộc tính trên mỗi phần tử.

Từ các declared values của chúng ta, author styles thắng so với user agent styles. Trong cùng một origin, các style có specificity cao hơn thắng so với các style có specificity thấp hơn. Trong trường hợp này, cascaded value sẽ là `font-size: 2em`, từ author origin với specificity `0-1-1`:

```css
font-size: 2em;
```

Nếu không có declared values nào cho một thuộc tính, không có cascaded value, nghĩa là [specified value](#specified_value) cho thuộc tính đó được xác định bởi quá trình [defaulting](#defaulting).

### Specified value

**Specified value** là kết quả của quá trình [defaulting](#defaulting). Nó được đảm bảo tồn tại cho mỗi thuộc tính trên mỗi phần tử. Specified value được xác định như sau:

1. Nếu có [cascaded value](#cascaded_value), cascaded value là specified value.
2. Nếu _không có_ cascaded value và thuộc tính được [kế thừa](/en-US/docs/Web/CSS/Guides/Cascade/Inheritance), specified value là [computed value](#computed_value) của phần tử cha.
3. Nếu _không có_ cascaded value và thuộc tính _không_ được kế thừa, specified value là [initial value](#initial_value) của thuộc tính.

Trong ví dụ của chúng ta, vì chúng ta có [cascaded value](#cascaded_value) là `2em`, nó trở thành specified value:

```css
font-size: 2em;
```

Đối với các thuộc tính không có cascaded values, quá trình defaulting xác định giá trị. Ví dụ, nếu `color` không được chỉ định, `color` được kế thừa từ computed value của phần tử cha vì nó là inherited property. Nếu `margin` không được chỉ định, giá trị `initial` là `0` được sử dụng vì `margin` không phải là [inherited property](/en-US/docs/Web/CSS/Guides/Cascade/Inheritance#inherited_properties):

```css
color: inherit;
margin: 0;
```

#### Initial value

**Initial value** của một thuộc tính là giá trị mặc định như được liệt kê trong bảng định nghĩa của nó trong đặc tả. Initial value được sử dụng trong quá trình defaulting khi:

- Đối với [inherited properties](/en-US/docs/Web/CSS/Guides/Cascade/Inheritance#inherited_properties), initial value chỉ được sử dụng trên _phần tử gốc_, không có phần tử cha, khi không có cascaded value nào tồn tại.
- Đối với [non-inherited properties](/en-US/docs/Web/CSS/Guides/Cascade/Inheritance#non-inherited_properties), initial value được sử dụng trên _tất cả các phần tử_ khi không có cascaded value nào tồn tại.

Bạn có thể đặt tường minh initial value bằng cách sử dụng từ khóa {{cssxref("initial")}}.

> [!NOTE]
> Initial value có thể được tìm thấy trong phần formal syntax của mỗi trang tham chiếu thuộc tính CSS. Ví dụ, [initial value của `font-size` là `medium`](/en-US/docs/Web/CSS/Reference/Properties/font-size#formal_definition). Initial value không nên nhầm lẫn với giá trị được chỉ định bởi stylesheet của trình duyệt.

### Computed value

**Computed value** của một thuộc tính là giá trị được truyền từ cha đến con trong quá trình inheritance. Đây là kết quả sau khi giải quyết các thứ như relative units và custom properties thành các giá trị tuyệt đối, nhưng trước khi xem xét thông tin layout cụ thể.

Computed value được tính từ [specified value](#specified_value) bằng cách:

1. Xử lý các giá trị đặc biệt {{cssxref("inherit")}}, {{cssxref("initial")}}, {{cssxref("revert")}}, {{cssxref("revert-layer")}}, và {{cssxref("unset")}}.
2. Thực hiện tính toán cần thiết để đạt đến giá trị được mô tả trong dòng "Computed value" trong bảng định nghĩa của thuộc tính.

Tính toán cần thiết để đạt đến computed value của một thuộc tính thường bao gồm việc chuyển đổi các giá trị tương đối (chẳng hạn như những giá trị trong đơn vị `em` hoặc phần trăm) thành các giá trị tuyệt đối. Ví dụ, nếu một phần tử có specified values `font-size: 16px` và `padding-top: 2em`, thì computed value của `padding-top` là `32px` (gấp đôi cỡ chữ).

Tuy nhiên, đối với một số thuộc tính (những thuộc tính mà phần trăm tương đối với thứ gì đó có thể cần layout để xác định, chẳng hạn như `width`, `margin-right`, `text-indent` và `top`), các giá trị được chỉ định bằng phần trăm sẽ biến thành computed values bằng phần trăm. Ngoài ra, các số không có đơn vị được chỉ định trên thuộc tính `line-height` trở thành computed value, như đã chỉ định. Các giá trị tương đối còn lại trong computed value sẽ trở thành tuyệt đối khi [used value](#used_value) được xác định.

### Used value

**Used value** là giá trị của thuộc tính sau khi tất cả các tính toán đã được thực hiện trên [computed value](#computed_value) và nó đã được tinh chỉnh với các chi tiết layout cụ thể (ví dụ: phần trăm được giải quyết thành các giá trị pixel thực tế).

Mỗi thuộc tính CSS đều có used value. Used values của các kích thước (ví dụ: {{cssxref("width")}} hoặc {{cssxref("line-height")}}) tính bằng pixel. Used values của shorthand properties (ví dụ: {{cssxref("background")}}) nhất quán với các component properties của chúng (ví dụ: {{cssxref("background-color")}} hoặc {{cssxref("background-size")}}) và với {{cssxref("position")}} và {{cssxref("float")}}.

Used value cho {{cssxref("width")}} hoặc {{cssxref("inline-size")}} của một phần tử là giá trị pixel ngay cả khi specified value của thuộc tính được đặt bằng phần trăm hoặc giá trị từ khóa.

Nếu chúng ta có ba container với chiều rộng được đặt là `auto`, `50%` và `inherit`:

```html hidden
<div id="no-width">
  <p>No explicit width.</p>
  <p class="show-used-width">..</p>

  <div id="width-50">
    <p>Explicit width: 50%.</p>
    <p class="show-used-width">..</p>

    <div id="width-inherit">
      <p>Explicit width: inherit.</p>
      <p class="show-used-width">..</p>
    </div>
  </div>
</div>
```

```css
#no-width {
  width: auto;
}

#width-50 {
  width: 50%;
}

#width-inherit {
  width: inherit;
}

/* Make results easier to see */
div {
  border: 1px solid red;
  padding: 8px;
}
```

```js hidden
function updateUsedWidth(id) {
  const div = document.getElementById(id);
  const par = div.querySelector(".show-used-width");
  const wid = window.getComputedStyle(div)["width"];
  par.textContent = `Used width: ${wid}.`;
}

function updateAllUsedWidths() {
  updateUsedWidth("no-width");
  updateUsedWidth("width-50");
  updateUsedWidth("width-inherit");
}

updateAllUsedWidths();
window.addEventListener("resize", updateAllUsedWidths);
```

Trong khi ba specified values, `auto`, `50%` và `inherit`, là các từ khóa và giá trị {{cssxref("percentage")}}, việc lấy `width` bằng cách sử dụng `window.getComputedStyle(el)["width"];` trả về giá trị [absolute length](/en-US/docs/Web/CSS/Reference/Values/length#absolute_length_units) `px`:

{{ EmbedLiveSample('Example', '80%', 372) }}

Thay đổi kích thước cửa sổ hoặc xoay thiết bị di động của bạn để thay đổi kích thước và các used values.

## Rendered values

Rendered value được gọi là [actual value](#actual_value), trong khi giá trị được lấy thông qua script được gọi là [resolved value](#resolved_value).

### Actual value

**Actual value** của một thuộc tính là [used value](#used_value) của thuộc tính đó sau khi mọi xấp xỉ cần thiết đã được áp dụng. Đây là giá trị rendered cuối cùng như được triển khai bởi trình duyệt, bao gồm các điều chỉnh cho các quirks hoặc giới hạn rendering. Ví dụ, {{glossary("user agent")}} chỉ có thể render borders với chiều rộng pixel là số nguyên có thể làm tròn độ dày của border đến số nguyên gần nhất.

Tính toán bao gồm các bước sau:

1. Đầu tiên, [specified value](#specified_value) được xác định dựa trên kết quả của [cascading](/en-US/docs/Web/CSS/Guides/Cascade/Introduction), [inheritance](/en-US/docs/Web/CSS/Guides/Cascade/Inheritance), hoặc sử dụng [initial value](#initial_value).
2. Tiếp theo, [computed value](#computed_value) được tính theo đặc tả (ví dụ, một `span` với `position: absolute` sẽ có computed `display` của nó thay đổi thành `block`).
3. Sau đó, layout được tính toán, dẫn đến [used value](#used_value).
4. Cuối cùng, used value được biến đổi theo các giới hạn của môi trường cục bộ, dẫn đến actual value.

### Resolved value

**Resolved value** của một thuộc tính là giá trị sau khi áp dụng các active stylesheets và giải quyết bất kỳ tính toán cơ bản nào mà các giá trị đó có thể chứa. Phương thức {{domxref("Window.getComputedStyle", "getComputedStyle()")}} trả về một đối tượng {{domxref("CSSStyleDeclaration")}} live chứa các resolved values của tất cả các thuộc tính CSS được áp dụng cho một phần tử được chỉ định. Mỗi resolved value là hoặc là [computed value](#computed_value) hoặc [used value](#used_value), tùy thuộc vào thuộc tính.

Trong lịch sử, `getComputedStyle()` trả về computed value của một phần tử hoặc pseudo-element. Khi CSS phát triển, khái niệm "computed value" cũng thay đổi, nhưng các giá trị được trả về bởi `getComputedStyle()` phải giữ nguyên để đảm bảo tương thích ngược với các script đã triển khai. Những giá trị này là "resolved values".

Đối với hầu hết các thuộc tính, resolved value là computed value, nhưng đối với một vài legacy properties (bao gồm {{cssxref("width")}} và {{cssxref("height")}}), nó là used value. [Đặc tả CSSOM](https://drafts.csswg.org/cssom/#resolved_values) cung cấp chi tiết từng thuộc tính.

CSS 2.0 định nghĩa _computed value_ là bước cuối cùng trong tính toán của một thuộc tính. CSS 2.1 giới thiệu định nghĩa riêng biệt về "used value". Một phần tử sau đó có thể kế thừa tường minh chiều rộng/chiều cao của cha mình, có computed value là một phần trăm. Đối với các thuộc tính CSS không phụ thuộc vào layout (ví dụ: `display`, `font-size` hoặc `line-height`), computed values và used values là như nhau. Danh sách sau chứa các thuộc tính CSS 2.1 _phụ thuộc_ vào layout, và do đó có computed value và used value khác nhau (lấy từ [CSS 2.1 Changes: Specified, computed, and actual values](https://www.w3.org/TR/CSS2/changes.html#q21.36)):

- {{cssxref("background-position")}}
- {{cssxref("bottom")}}, {{cssxref("left")}}, {{cssxref("right")}}, {{cssxref("top")}}
- {{cssxref("height")}}, {{cssxref("width")}}
- {{cssxref("margin-bottom")}}, {{cssxref("margin-left")}}, {{cssxref("margin-right")}}, {{cssxref("margin-top")}}
- {{cssxref("min-height")}}, {{cssxref("min-width")}}
- {{cssxref("padding-bottom")}}, {{cssxref("padding-left")}}, {{cssxref("padding-right")}}, {{cssxref("padding-top")}}
- {{cssxref("text-indent")}}

## Xem thêm

- Các giá trị CSS để kiểm soát inheritance: {{cssxref("inherit")}}, {{cssxref("initial")}}, {{cssxref("revert")}}, {{cssxref("revert-layer")}}, và {{cssxref("unset")}}
- Module [CSS cascading and inheritance](/en-US/docs/Web/CSS/Guides/Cascade)
- Module [CSS syntax](/en-US/docs/Web/CSS/Guides/Syntax)
